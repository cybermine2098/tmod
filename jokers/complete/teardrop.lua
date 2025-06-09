return{
    key = 'joker39',
    loc_txt = {
        name = 'Teardrop',
        text = {
            'If {C:attention}poker hand{} is a',
            '{C:attention}Five of a Kind{} that',
            'contains a {C:clubs}Club{}, create',
            'a random {C:spectral}Spectral{} card',
            '{C:inactive}(Must have room){}'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 2},
    config = { extra = { poker_hand = 'Five of a Kind', suit = 'Clubs' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { localize(card.ability.extra.poker_hand, 'poker_hands'), localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.poker_hand]) and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local has_club = false
            for _ , playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_suit('Clubs', nil, true) then
                    has_club = true
                    break
                end
            end
            if has_club then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Spectral',
                            key_append = 'vremade_seance'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end
}