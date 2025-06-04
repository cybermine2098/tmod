return{
    key = 'joker59',
    loc_txt = {
        name = 'TV',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
}