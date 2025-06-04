return{
    key = 'joker74',
    loc_txt = {
        name = 'X', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Gives a {C:attention}random{}',
            'multiplier between',
            '{X:mult,C:white}x5{} and {X:mult,C:white}x30{} Mult'
        }
    },
    atlas = 'Jokers',
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 6},
    soul_pos = {x = 7, y = 7},
    config = { extra = { max = 30, min = 5 } },
    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
    end,
    calculate = function(self, card, context) 
        if context.joker_main then
            return {
                Xmult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
            }
        end
    end
}