return{
    key = 'joker50',
    loc_txt = {
        name = 'Firey', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            "If {C:attention}first discard{} of round",
            "has only {C:attention}1{} card, destroy",
            "it and gain {C:mult}+5 Mult",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
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
    pos = {x = 4, y = 1},
    config = { extra = { mult = 0, mult_mod = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and not context.blueprint and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card.ability.extra.mult = card.ability.extra.mult +
                                            card.ability.extra.mult_mod
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult +
                                        card.ability.extra.mult_mod } }
                                    }, card
                                )
                                return true
                            end
                        }))
                    end,
                remove = true
                }
            end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}