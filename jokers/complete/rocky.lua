return{
    key = 'joker38',
    loc_txt = {
        name = 'Rocky', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:green}#1# in #2#{} chance',
            'when {C:attention}Blind{} is selected,',
            'add a random {C:attention}playing{}',
            '{C:attention}card{} with a random',
            '{C:attention}seal{}, {C:attention}edition{} and,',
            '{C:attention}enhancement{} to your hand'
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
    pos = {x = 6, y = 2},
    config = { extra = { odds = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and (pseudorandom('vremade_8_ball') < G.GAME.probabilities.normal / card.ability.extra.odds) then
            local rocky_edi = math.random(1,4)
            local rocky_enhan = math.random(1,9)
            local rocky_seal = math.random(1,5)
            local edition = ('e_base')
            local enhancement = ('m_base')
            if rocky_edi == 1 then
                edition = ('e_base')
            end
            if rocky_edi == 2 then
                edition = ('e_foil')
            end
            if rocky_edi == 3 then
                edition = ('e_holo')
            end
            if rocky_edi == 4 then
                edition = ('e_polychrome')
            end
            if rocky_enhan == 1 then
                enhancement = ('c_base')
            end
            if rocky_enhan == 2 then
                enhancement = ('m_steel')
            end
            if rocky_enhan == 3 then
                enhancement = ('m_stone')
            end
            if rocky_enhan == 4 then
                enhancement = ('m_gold')
            end
            if rocky_enhan == 5 then
                enhancement = ('m_lucky')
            end
            if rocky_enhan == 6 then
                enhancement = ('m_glass')
            end
            if rocky_enhan == 7 then
                enhancement = ('m_wild')
            end
            if rocky_enhan == 8 then
                enhancement = ('m_mult')
            end
            if rocky_enhan == 9 then
                enhancement = ('m_bonus')
            end
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('vremade_certificate')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            if rocky_seal > 1 then 
                _card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'vremade_certificate_seal' }))
            end
            _card:set_edition(edition, true)
            _card:set_ability(enhancement, true)
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(_card)
                            _card:start_materialize()
                            G.GAME.blind:debuff_card(_card)
                            G.hand:sort()
                            if context.blueprint_card then
                                context.blueprint_card:juice_up()
                            else
                                card:juice_up()
                            end
                            return true
                        end
                    }))
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                end
            }
        end
    end
}