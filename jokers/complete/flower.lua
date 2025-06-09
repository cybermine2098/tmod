return{
    key = 'joker45',
    loc_txt = {
        name = 'Flower',
        text = {
            'This Joker gives {C:chips}+#2#{}',
            'chips at the {C:attention}end{} of',
            'each round',
            '{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips){}'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 2},
    config = { extra = {
        chips = 0, chips_mod = 25
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.chips, center.ability.extra.chips_mod}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
            return {
                card = card,
                message = 'Upgrade!',
                color = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                card = card,
                chip_mod = card.ability.extra.chips,
                message = '+' .. card.ability.extra.chips,
                color = G.C.CHIPS
            }
        end
    end
}