return{
    key = 'joker5',
    loc_txt = {
        name = 'Bottle', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {C:red}+5{} Mult',
            'and {C:blue}+25{} Chips for every',
            '{C:attention}Glass Card{} that is destroyed',
            '{C:inactive}(Currently {C:mult}+#4#{}{C:inactive} Mult and {C:chips}+#2#{}{C:inactive} Chips)'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 0},
    config = { extra = {
        chips = 0, chip_mod = 25, mult = 0, mult_mod = 5
    }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return { vars = { card.ability.extra.chip_mod, card.ability.extra.chips, card.ability.extra.mult_mod, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
                        local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end 
            if glass_cards > 0 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card.ability.extra.chips = card.ability.extra.chips +
                                            card.ability.extra.chip_mod * glass_cards
                                        card.ability.extra.mult = card.ability.extra.mult +
                                            card.ability.extra.mult_mod * glass_cards
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips +
                                        card.ability.extra.chip_mod * glass_cards } }
                                    }, card)
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult +
                                        card.ability.extra.mult_mod * glass_cards } }
                                    }, card
                                )
                                return true
                            end
                        }))
                    end
                }
            end
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.chips = card.ability.extra.chips +
                    card.ability.extra.chip_mod * glass_cards
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
                }
            end
            if glass_cards > 0 then
                card.ability.extra.mult = card.ability.extra.mult +
                    card.ability.extra.mult_mod * glass_cards
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult}}
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end
    end
}