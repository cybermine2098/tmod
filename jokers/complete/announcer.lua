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
    reset_game_globals = function(run_start)
        require("libs/reset_vremade_ancient").reset_vremade_ancient_card()
    end
}
