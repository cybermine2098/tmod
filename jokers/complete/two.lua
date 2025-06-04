return{
        key = 'joker72', 
    loc_txt = {
        name = 'Two', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:green}^2{} Mult'
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
    pos = {x = 6, y = 6},
    soul_pos = {x = 6, y = 7},
    config = { extra = { 
        Emult = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Emult}}
    end,
    calculate = function(self,card,context) 
        if context.joker_main then
            return {
                card = card,
                Emult_mod = card.ability.extra.Emult,
                message = '^' .. card.ability.extra.Emult,
                color = G.C.MULT
            }
        end
    end
}