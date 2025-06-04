return{
    key = 'joker8',
    loc_txt = {
        name = 'Taco',
        text = {
            '{C:red}+10{} Mult and {C:blue}+50{} Chips for',
            'each empty {C:attention}Joker{} slot',
            '{s:0.8}Taco excluded{}',
            '{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult and {C:chips}+#1#{}{C:inactive} Chips)'
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
    pos = {x = 2, y = 5},
    config = { extra = {
        chips = 0, chip_mod = 50, mult = 0, mult_mod = 10
    }
    },
    loc_vars = function(self, info_queue, center)
        return { 
           vars = { 
                G.jokers and math.max(0, ((G.jokers.config.card_limit - #G.jokers.cards) * 50) + (#SMODS.find_card("j_vremade_stencil", true)) * 50) or 50, 
                G.jokers and math.max(0, ((G.jokers.config.card_limit - #G.jokers.cards) * 10) + (#SMODS.find_card("j_vremade_stencil", true)) * 10) or 10 
           }
      }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = math.max(0,
                    ((G.jokers.config.card_limit - #G.jokers.cards)*50) + (#SMODS.find_card("j_vremade_stencil", true)*50)),
                mult = math.max(0,
                    ((G.jokers.config.card_limit - #G.jokers.cards)*10) + (#SMODS.find_card("j_vremade_stencil", true)*10))
            }
        end
    end
}