return{
    key = 'joker64',
    loc_txt = {
        name = 'Gelatin',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 6},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
}