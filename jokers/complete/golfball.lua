return{
     key = 'joker55',
    loc_txt = {
        name = 'Golf Ball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Retrigger each',
            'played {C:attention}Glass Card'
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
    pos = {x = 4, y = 0},
    config = { extra = {
        repetitions = 1
    }
    },
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_glass') then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}