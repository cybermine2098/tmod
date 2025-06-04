return{
    key = 'joker19',
    loc_txt = {
        name = 'Bracelety', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:mult}+12 {}Mult if played hand contains',
            'a {C:attention}Three of a Kind{}, and',
            'an additional {X:red,C:white}X4 {} Mult if',
            '{C:attention}Ice Cube {}is held'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 1},
    config = { extra = {
        mult = 12, Xmult = 4, type = 'Three of a Kind'
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands')}}
    end,
    calculate = function(self,card,context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            local has_icy = false
            for i, isjokericy in ipairs(G.jokers.cards) do
                if G.jokers.cards[i].config.center.loc_txt ~= nil then
                    if G.jokers.cards[i].config.center.loc_txt.name == 'Ice Cube' then
                        has_icy = true
                        break
                    end
                end
            end
            if has_icy then
                return {
                    mult = card.ability.extra.mult,
                    Xmult = card.ability.extra.Xmult
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}