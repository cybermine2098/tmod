local M = {}

function M.reset_vremade_ancient_card()
    G.GAME.current_round.vremade_ancient_card = G.GAME.current_round.vremade_ancient_card or { suit = 'Spades' }
    local ancient_suits = {}
    for k, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
        if v ~= G.GAME.current_round.vremade_ancient_card.suit then ancient_suits[#ancient_suits + 1] = v end
    end
    local ancient_card = pseudorandom_element(ancient_suits, pseudoseed('vremade_ancient' .. G.GAME.round_resets.ante))
    G.GAME.current_round.vremade_ancient_card.suit = ancient_card
end

return M
