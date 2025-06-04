return{
    key = 'joker12',
    loc_txt = {
        name = 'Foldy', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Any scored {C:attention}non-enhanced{}',
            'card gives {C:mult}+3{} Mult'
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
    pos = {x = 0, y = 1},
    config = { extra = {
        mult = 3, key = 'c_base'
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'c_base') then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}