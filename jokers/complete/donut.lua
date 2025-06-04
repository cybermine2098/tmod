return{
    key = 'joker67',
    loc_txt = {
        name = 'Donut', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Played {C:attention}10s {}give',
            '{X:red,C:white}X2 {} Mult when scored, and',
            '{X:red,C:white}X20 {} Mult if {C:purple}Four {}and {C:purple}X {}are held'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 7},
    config = { extra = {
        Xmult = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 10 then
                local has4 = false
                local hasX = false
                for i, jokers in ipairs(G.jokers.cards) do
                    if G.jokers.cards[i].config.center.loc_txt ~= nil then
                        if G.jokers.cards[i].config.center.loc_txt.name == 'Four' then
                            has4 = true
                        end
                        if G.jokers.cards[i].config.center.loc_txt.name == 'X' then
                            hasX = true
                        end
                    end
                end
                if hasX and has4 then
                    return {
                        Xmult = card.ability.extra.Xmult * 10
                    }
                else
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    end
}