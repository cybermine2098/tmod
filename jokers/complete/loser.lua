return{
    key = 'joker28',
    loc_txt = {
        name = 'Loser', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'When all other Joker',
            'slots are filled this',
            'Joker gains {X:mult,C:white}X3{} Mult'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 6, y = 3},
    config = { extra = {
        Xmult = 3
    }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if #G.jokers.cards == G.jokers.config.card_limit and context.joker_main then
            return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult,
            color = G.C.MULT 
            }
        end
    end
}