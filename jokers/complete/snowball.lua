return{
    key = 'joker40',
    loc_txt = {
        name = 'Snowball',
        text = {
            'Create 2 negative {C:tarot}Tarot{}',
            'cards if poker hand',
            'contains an {C:attention}Ace{} and',
            'a {C:attention}Straight Flush{}'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 8, y = 3},
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Straight Flush"]) then
            local ace_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 14 then
                    ace_check = true
                    break
                end
            end
            if ace_check then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'vremade_superposition',
                            edition = 'e_negative'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'vremade_superposition',
                            edition = 'e_negative'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = '+2 Tarot',
                    colour = G.C.SECONDARY_SET.Tarot,
                }
            end
        end
    end
}