return{
    key = 'joker3',
    loc_txt = {
        name = 'Cake',
        text = {
            '{C:blue}+50{} Chips',
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 1, y = 0},
    config = { extra = {
        chips = 50
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
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