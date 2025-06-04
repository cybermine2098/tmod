return{
key = 'joker18',
    loc_txt = {
        name = 'Robot Flower', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gives a',
            'random mult between',
            '{X:mult,C:white}X0.5{} and {X:mult,C:white}X2.5{}'
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
    pos = {x = 6, y = 1},
    config = { extra = { max = 2.5, min = 0.5 } },

    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        local value = card.ability.extra.min
        while value <= card.ability.extra.max + 1e-9 do 
            r_mults[#r_mults + 1] = string.format("%.1f", value)
            value = value + 0.1
        end
        return r_mults
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local min10 = card.ability.extra.min * 10
            local max10 = card.ability.extra.max * 10
            local randomInt = pseudorandom('vremade_misprint', math.floor(min10), math.floor(max10))
            return { Xmult = randomInt / 10 }
        end
    end
}