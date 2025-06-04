return{
    key = 'joker3',
    loc_txt = {
        name = 'Cake',
        text = {
            '{C:blue}+75{} Chips.',
            'If {C:attention}Pillow{} is held,',
            '{C:purple}Cake{} will die and gain',
            '{C:red}+3{} Mult.',
            '{C:inactive}(Currently {C:mult}+0{}{C:inactive} Mult)'
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
    pos = {x = 1, y = 0},
    config = { extra = {
        chips = 75, mult = 0, mult_mod = 3
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.chips}, {center.ability.extra.mult}, {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --ADD THE MOD FOR CALCULATING THE MULT LATER
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