return{
    key = 'joker76',
    loc_txt = {
        name = 'Root Two', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Played {C:attention}4s{} and {C:attention}9s',
            'give {X:red,C:white} X1.5 {} Mult when scored'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 4, y = 7},
    config = { extra = {
        Xmult = 1.5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 4 or context.other_card:get_id() == 9) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
}