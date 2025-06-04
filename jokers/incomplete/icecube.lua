return{
    key = 'joker51',
    loc_txt = {
        name = 'Ice Cube',
        text = {
            ''
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
    pos = {x = 9, y = 4},
    config = { extra = {
        hands = 2, odds = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.hands, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
    end,
    calculate = function(self,card,context) --calculation later

    end
}