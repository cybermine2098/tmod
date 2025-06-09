return{
    key = 'joker11',
    loc_txt = {
        name = '8 Ball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Each played {C:attention}8{} gives',
            '{C:mult}+8{} Mult and {C:chips}+8{} Chips',
            'when scored'
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
    pos = {x = 9, y = 0},
    config = { extra = {
        chips = 8, mult = 8
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}, {center.ability.extra.chips}}
    end,
    calculate = function(self,card,context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 8 then
            return {
                card = card,
                chip_mod = card.ability.extra.chips,
                message = '+' .. card.ability.extra.chips,
                color = G.C.CHIPS,
                mult = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult,
                color = G.C.MULT
            }
        end
    end
}