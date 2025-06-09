return{
    key = 'joker23',
    loc_txt = {
        name = 'Roboty', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Retrigger',
            "each played {C:attention}10{}"
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
    pos = {x = 1, y = 2},
    config = { extra = {
        repetitions = 1
    }
    },
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 10 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}