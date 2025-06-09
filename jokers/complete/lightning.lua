return{
    key = 'joker29',
    loc_txt = {
        name = 'Lightning', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {C:mult}+#1#{} Mult',
            'per {C:attention}consecutive{} hand',
            'played with exactly {C:attention}5{}',
            'cards in it',
            'resets if a hand with',
            'less than 5 cards is played',
            '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 2},
    config = { extra = {
        mult_mod = 1, mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.mult_mod, 
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and not context.blueprint then
            local less = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if #context.full_hand < 5 then
                    less = true
                    break
                end
            end
            if less then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end
        end
        if context.joker_main then
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                mult = card.ability.extra.mult
            }
        end
    end
}