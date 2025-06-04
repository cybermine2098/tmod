return{
    key = 'joker25',
    loc_txt = {
        name = 'Marker',
        text = {
            ''
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
    pos = {x = 1, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                 if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            return {
                dollars = _tally
            }
        end
    end
}