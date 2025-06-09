return{
    key = 'joker42',
    loc_txt = {
        name = 'Tennis Ball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'If first played hand',
            'is a {C:attention}High Card{}, a',
            'random {C:attention}seal{} is',
            'applied to that card'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 4, y = 2},
    calculate = function(self,card,context) --calculation later
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            tennis_card = context.full_hand[1]
            tennis_card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'vremade_certificate_seal' }))
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                mult = card.ability.extra.mult
            }
        end
    end
}