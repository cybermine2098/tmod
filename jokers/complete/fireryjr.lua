return{
    key = 'joker30',
    loc_txt = {
        name = 'Firey Jr.', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'If first played hand',
            'contains {C:attention}5{} cards,',
            'this Joker gains {C:chips}+20{} Chips',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
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
    pos = {x = 8, y = 2},
    config = { extra = {
        chips = 0, chip_mod = 20
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chip_mod}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 5 then
            return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card.ability.extra.chips = card.ability.extra.chips +
                                            card.ability.extra.chip_mod
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips +
                                        card.ability.extra.chip_mod } }
                                    }, card
                                )
                                return true
                            end
                        }))
                    end
                }
            end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}