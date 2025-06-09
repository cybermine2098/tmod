return{
    key = 'joker75',
    loc_txt = {
        name = 'Announcer',
        text = {
            'If {C:attention}poker hand{}',
            'contains a {C:attention}Flush{} of',
            '{V:1}#2#s{} then make',
            'each scored card',
            '{C:attention}Polychrome{} and {C:attention}Lucky{}',

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
    pos = {x = 9, y = 6},
    soul_pos = {x = 9, y = 7},
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.vremade_ancient_card or {}).suit or 'Spades'
        return { vars = { localize('Flush','poker_hands'), localize(suit, 'suits_singular'), colours = { G.C.SUITS[suit] } } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands['Flush']) or next(context.poker_hands['Straight Flush']) or next(context.poker_hands['Flush House']) or next(context.poker_hands['Flush Five'])) then
            local suits = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_suit(G.GAME.current_round.vremade_ancient_card.suit, nil, true) then
                    suits[#suits + 1] = scored_card
                    scored_card:set_ability('m_lucky', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:set_edition('e_polychrome', nil, true)
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #suits > 0 then
                return {
                    message = 'Wow!',
                    colour = G.C.Mult
                }
            end
        end
    end,
    local function reset_vremade_ancient_card()
        G.GAME.current_round.vremade_ancient_card = G.GAME.current_round.vremade_ancient_card or { suit = 'Spades' }
        local ancient_suits = {}
        for k, v in ipairs({ 'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
            if v ~= G.GAME.current_round.vremade_ancient_card.suit then ancient_suits[#ancient_suits + 1] = v end
        end
        local ancient_card = pseudorandom_element(ancient_suits, pseudoseed('vremade_ancient' .. G.GAME.round_resets.ante))
        G.GAME.current_round.vremade_ancient_card.suit = ancient_card
    end,
    function SMODS.current_mod.reset_game_globals(run_start)
        reset_vremade_ancient_card()
    end
}
