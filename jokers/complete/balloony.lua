return{
    key = 'joker2',
    loc_txt = {
        name = 'Balloony', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:red}+8{} Mult'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 0},
    config = { extra = {
        mult = 8
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
            card = card,
            mult_mod = card.ability.extra.mult,
            message = '+' .. card.ability.extra.mult .. ' Mult',
            color = G.C.MULT
            }
        end
    end
}