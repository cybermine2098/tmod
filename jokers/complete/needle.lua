return{
    key = 'joker54',
    loc_txt = {
        name = 'Needle', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'When {C:attention}Blind{} is selected,',
            '{C:green}1 in 4{} chance to gain',
            '{C:blue}+3{} Hands and {C:attention}Steel Cards',
            'grant {X:red,C:white} X1.25 {} Mult when scored'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 6, y = 0},
    config = { extra = {
        hands = 3, Xmult = 1.25
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.hands, card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            local needlehands = math.random(1,4)
            if needlehands == 1 then
                return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_hands_played(card.ability.extra.hands)
                            SMODS.calculate_effect(
                                { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                                context.blueprint_card or card)
                            return true
                        end
                    }))
                end
                }
            end 
        end
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
}