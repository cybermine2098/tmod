return{
     key = 'joker35',
    loc_txt = {
        name = 'Liy',
        text = {
            ''
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
    pos = {x = 3, y = 3},
    config = { extra = {
        mult = 6, chips = 18, Xmult = 3, every = 4, loyalty_remaining = 4
    }
    },
    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.mult,
                center.ability.extra.chips, 
                center.ability.extra.Xmult,
                center.ability.extra.every,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
            }
        }
    end,
    calculate = function(self, card, context)

    end
}