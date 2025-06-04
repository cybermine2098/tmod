return{
    key = 'joker22',
    loc_txt = {
        name = 'Black Hole', 
        text = {
            'Zeros all {C:attention}listed',
            '{C:green,E:1,S:1.1}probabilities{} for {C:attention}card abilities',
            '{C:inactive}(ex: {C:green}1 in 4{C:inactive} -> {C:green}0 in 4{C:inactive})'
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
    pos = {x = 4, y = 4},
    add_to_deck = function(self, card, from_debuff)
        G.GAME.backupprobabilities = {}
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.backupprobabilities[k] =  G.GAME.probabilities[k]
            G.GAME.probabilities[k] = v * 0
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = G.GAME.probabilities[k] + G.GAME.backupprobabilities[k]
        end
    end
}