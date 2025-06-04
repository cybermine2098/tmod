
  SMODS.Joker{
    
 }
  SMODS.Joker{
    
 }
  SMODS.Joker{
    key = 'joker17',
    loc_txt = {
        name = 'Gaty', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {C:mult}+1{} Mult',
            'if played hand contains',
            'a {C:attention}Pair{}',
            '{C:inactive}(Currently {C:red}+#3#{}{C:inactive} Mult)'
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
    pos = {x = 5, y = 1},
    config = { extra = {
        mult_mod = 1, mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult_gain,localize('Pair','poker_hands'),card.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and not context.blueprint and (next(context.poker_hands['Pair']) or next(context.poker_hands['Two Pair']) or next(context.poker_hands['Full House']) or next(context.poker_hands['Three of a Kind']) or next(context.poker_hands['Four of a Kind']) or next(context.poker_hands['Five of a Kind'])) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker18',
    loc_txt = {
        name = 'Robot Flower', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gives a',
            'random mult between',
            '{X:mult,C:white}X0.5{} and {X:mult,C:white}X2.5{}'
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
    pos = {x = 6, y = 1},
    config = { extra = { max = 2.5, min = 0.5 } },

    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        local value = card.ability.extra.min
        while value <= card.ability.extra.max + 1e-9 do 
            r_mults[#r_mults + 1] = string.format("%.1f", value)
            value = value + 0.1
        end
        return r_mults
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local min10 = card.ability.extra.min * 10
            local max10 = card.ability.extra.max * 10
            local randomInt = pseudorandom('vremade_misprint', math.floor(min10), math.floor(max10))
            return { Xmult = randomInt / 10 }
        end
    end
 }
  SMODS.Joker{
    key = 'joker19',
    loc_txt = {
        name = 'Bracelety', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:mult}+12 {}Mult if played hand contains',
            'a {C:attention}Three of a Kind{}, and',
            'an additional {X:red,C:white}X4 {} Mult if',
            '{C:attention}Ice Cube {}is held'
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
    pos = {x = 7, y = 1},
    config = { extra = {
        mult = 12, Xmult = 4, type = 'Three of a Kind'
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands')}}
    end,
    calculate = function(self,card,context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            local has_icy = false
            for i, isjokericy in ipairs(G.jokers.cards) do
                if G.jokers.cards[i].config.center.loc_txt ~= nil then
                    if G.jokers.cards[i].config.center.loc_txt.name == 'Ice Cube' then
                        has_icy = true
                        break
                    end
                end
            end
            if has_icy then
                return {
                    mult = card.ability.extra.mult,
                    Xmult = card.ability.extra.Xmult
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker20',
    loc_txt = {
        name = 'Cloudy', 
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
    pos = {x = 8, y = 1},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker21',
    loc_txt = {
        name = 'Saw', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Sell this card to halve',
            'the {C:attention}chips{} required to',
            'pass the current {C:attention}Boss Blind'
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
    pos = {x = 9, y = 1},
    config = { extra = {
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.selling_self then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                G.GAME.blind.chips = G.GAME.blind.chips / 2
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.GAME.blind:wiggle()
            end
        end
    end
 }
  SMODS.Joker{
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
  SMODS.Joker{
    key = 'joker23',
    loc_txt = {
        name = 'Roboty', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Retrigger',
            "each played {C:attention}10{}"
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
    pos = {x = 1, y = 2},
    config = { extra = {
        repetitions = 1
    }
    },
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 10 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker24',
    loc_txt = {
        name = 'Remote',
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
    pos = {x = 3, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
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
  SMODS.Joker{
    key = 'joker26',
    loc_txt = {
        name = 'Basketball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gives {C:money}#2#{}',
            'dollars at the end of',
            'round for every {C:attention}5 times{}',
            'your most played hand',
            'has been played',
            '{C:inactive}(Currently {C:money}$#1#{}{C:inactive} Dollars)'
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
    pos = {x = 7, y = 5},
    config = {extra = { dollars = 0, increase = 2 }},
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.dollars, center.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                 if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            local multiple5s = 0
            local maxhands = 1
            local placeholder = multiple5s
            if maxhands > 0 then
                multiple5s = math.floor(_tally / 5)
                card.ability.extra.dollars = card.ability.extra.increase * multiple5s
                if multiple5s ~= placeholder then
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MONEY
                    }
                end
                placeholder = multiple5s
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
    local shmell = 0
        if card.ability.extra.dollars == 0 then
            shmell = shmell + 1
        else
            return card.ability.extra.dollars
        end
    end
 }
  SMODS.Joker{
    key = 'joker27',
    loc_txt = {
        name = 'Stapy',
        text = {
            '{C:green}#2# in 2 {}chance to',
            'convert the {C:attention}highest{} ranked card in',
            'played hand into a {C:attention}Bonus Card'
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
    pos = {x = 7, y = 3},
    config = { extra = {
        odds = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.odds, (G.GAME and G.GAME.probabilities.normal or 1)}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            local temp_Mult, temp_ID = 2, 2
            local raised_card = nil
            for i = 1, #context.scoring_hand do
                if temp_ID <= context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then
                    temp_Mult = context.scoring_hand[i].base.nominal
                    temp_ID = context.scoring_hand[i].base.id
                    raised_card = context.scoring_hand[i]
                end
            end
            if math.random() < G.GAME.probabilities.normal / card.ability.extra.odds then
                if raised_card == context.other_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            return true
                        end
                    }))
                    if not SMODS.has_enhancement(raised_card, 'm_bonus') then
                        raised_card:set_ability('m_bonus', true)
                        return {
                            message = 'Bonus!'
                        }
                    else
                        return {
                            message = 'Already Bonus!'
                        }
                    end
                end
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker28',
    loc_txt = {
        name = 'Loser', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'When all other Joker',
            'slots are filled this',
            'Joker gains {X:mult,C:white}X3{} Mult'
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
    pos = {x = 6, y = 3},
    config = { extra = {
        Xmult = 3
    }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if #G.jokers.cards == G.jokers.config.card_limit and context.joker_main then
            return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult,
            color = G.C.MULT 
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker29',
    loc_txt = {
        name = 'Lightning', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {C:mult}+#1#{} Mult',
            'per {C:attention}consecutive{} hand',
            'played with exactly {C:attention}5{}',
            'cards in it',
            'resets if a hand with',
            'less than 5 cards is played',
            '{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)'
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
    pos = {x = 7, y = 2},
    config = { extra = {
        mult_mod = 1, mult = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {
            vars = {
                card.ability.extra.mult_mod, 
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and not context.blueprint then
            local less = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if #context.full_hand < 5 then
                    less = true
                    break
                end
            end
            if less then
                local last_mult = card.ability.extra.mult
                card.ability.extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('k_reset')
                    }
                end
            else
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end
        end
        if context.joker_main then
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED,
                mult = card.ability.extra.mult
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker30',
    loc_txt = {
        name = 'Firey Jr.', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'If first played hand',
            'contains {C:attention}5{} cards,',
            'this Joker gains {C:chips}+20{} Chips',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
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
    pos = {x = 8, y = 2},
    config = { extra = {
        chips = 0, chip_mod = 20
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chip_mod}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 5 then
            return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card.ability.extra.chips = card.ability.extra.chips +
                                            card.ability.extra.chip_mod
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips +
                                        card.ability.extra.chip_mod } }
                                    }, card
                                )
                                return true
                            end
                        }))
                    end
                }
            end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker31',
    loc_txt = {
        name = 'Bell',
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
    pos = {x = 9, y = 2},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)

    end
 }
  SMODS.Joker{
    key = 'joker32',
    loc_txt = {
        name = 'Price Tag',
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
    pos = {x = 5, y = 3},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker33',
    loc_txt = {
        name = 'Tree',
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
    pos = {x = 4, y = 3},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker34',
    loc_txt = {
        name = 'Naily',
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
    pos = {x = 2, y = 3},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker35',
    loc_txt = {
        name = 'Liy',
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
    pos = {x = 3, y = 3},
    config = { extra = {
        mult = 6, chips = 18, Xmult = 3, every = 4, loyalty_remaining = 4
    }
    },
    loc_vars = function(self,info_queue,center)
        return {
            vars = {
                center.ability.extra.mult,
                center.ability.extra.chips, 
                center.ability.extra.Xmult,
                center.ability.extra.every,
                localize { type = 'variable', key = (card.ability.extra.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { card.ability.extra.loyalty_remaining } }
            }
        }
    end,
    calculate = function(self, card, context)

    end
 }
  SMODS.Joker{
    key = 'joker36',
    loc_txt = {
        name = 'Blocky',
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
    pos = {x = 1, y = 3},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker37',
    loc_txt = {
        name = 'David', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Aw seriously!'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 3},
    config = { extra = {
        slots = 2, rounds = 6
    }
    },
    loc_vars = function(self,info_queue,card)
            return {
                vars = {card.ability.extra.slots, card.ability.extra.rounds}
            }
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds == 0 then
                G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                card.config.center.loc_txt.text = { 'testing testing 123' }
                return {
                    message = ('+2 Joker Slots'),
                    colour = G.C.RED
                }
            end
        end
    end 
 }
  SMODS.Joker{
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
    end,
 }
  SMODS.Joker{
    key = 'joker39',
    loc_txt = {
        name = 'Teardrop',
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
    pos = {x = 5, y = 2},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker40',
    loc_txt = {
        name = 'Snowball',
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
    pos = {x = 8, y = 3},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker41',
    loc_txt = {
        name = 'Eraser', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:attention}Destroys{} all cards held in hand',
            'at the end of each {C:attention}Blind'
        }
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 3},
    config = { extra = {

    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context)
        if context.end_of_round then
            for _, playing_card in ipairs(G.hand.cards) do
                SMODS.destroy_cards(playing_card)
            end
        end
    end
 }
  SMODS.Joker{
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
    cost = 9,
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
  SMODS.Joker{
    key = 'joker43',
    loc_txt = {
        name = 'Woody',
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
    pos = {x = 3, y = 2},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker44',
    loc_txt = {
        name = 'Purple Face',
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
    pos = {x = 2, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker45',
    loc_txt = {
        name = 'Flower',
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
    pos = {x = 2, y = 2},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker46',
    loc_txt = {
        name = 'Profily',
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
    pos = {x = 0, y = 2},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker47',
    loc_txt = {
        name = 'Pen',
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
    pos = {x = 5, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker48',
    loc_txt = {
        name = 'Coiny',
        text = {
            'Gives {X:mult,C:white}X#1#{} Mult',
            'for each{C:red} Heart Card',
            '{s:0.7}(only real ones will get this){}',
            'in your {C:attention}full deck{}',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)'
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
    pos = {x = 6, y = 4},
    config = { extra = { 
        Xmult = 0.1
    }
    },
    loc_vars = function(self,info_queue,center)
        local heart_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Hearts') then heart_tally = heart_tally + 1 end
            end
        end
        return { vars = { center.ability.extra.Xmult, 1 + center.ability.extra.Xmult * heart_tally } }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local heart_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Hearts') then heart_tally = heart_tally + 1 end
            end
            return {
                Xmult = 1 + card.ability.extra.Xmult * heart_tally,
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:is_suit('Hearts') then
                return true
            end
        end
        return false
    end
 }
  SMODS.Joker{
    key = 'joker49',
    loc_txt = {
        name = 'Pin',
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
    pos = {x = 7, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker50',
    loc_txt = {
        name = 'Firey', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            "If {C:attention}first discard{} of round",
            "has only {C:attention}1{} card, destroy",
            "it and gain {C:mult}+5 Mult",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
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
    pos = {x = 4, y = 1},
    config = { extra = { mult = 0, mult_mod = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and not context.blueprint and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
            return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        card.ability.extra.mult = card.ability.extra.mult +
                                            card.ability.extra.mult_mod
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect(
                                    {
                                        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult +
                                        card.ability.extra.mult_mod } }
                                    }, card
                                )
                                return true
                            end
                        }))
                    end,
                remove = true
                }
            end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
 }
  SMODS.Joker{
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
  SMODS.Joker{
    key = 'joker52',
    loc_txt = {
        name = 'Spongy',
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
    pos = {x = 0, y = 5},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker53',
    loc_txt = {
        name = 'Pencil',
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
    pos = {x = 1, y = 5},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker54',
    loc_txt = {
        name = 'Needle', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'When {C:attention}Blind{} is selected,',
            '{C:green}1 in 4{} chance to gain',
            '{C:blue}+3{} Hands and {C:attention}Steel Cards',
            'grant {X:red,C:white} X1.25 {} Mult when scored'
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
    pos = {x = 6, y = 0},
    config = { extra = {
        hands = 3, Xmult = 1.25
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.hands, card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind then
            local needlehands = math.random(1,4)
            if needlehands == 1 then
                return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_hands_played(card.ability.extra.hands)
                            SMODS.calculate_effect(
                                { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                                context.blueprint_card or card)
                            return true
                        end
                    }))
                end
                }
            end 
        end
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
 }
 SMODS.Joker{
    key = 'joker55',
    loc_txt = {
        name = 'Golf Ball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Retrigger each',
            'played {C:attention}Glass Card'
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
    pos = {x = 4, y = 0},
    config = { extra = {
        repetitions = 1
    }
    },
    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_glass') then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker56',
    loc_txt = {
        name = 'Match',
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
    pos = {x = 4, y = 5},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker57',
    loc_txt = {
        name = 'Bubble', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains',
            '{X:mult,C:white}X#2#{} Mult at the {C:attention}end{}',
            'of every round',
            '{C:green}#3# in #4#{} chance this',
            'card is destroyed',
            'at end of round,',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)'
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
    pos = {x = 5, y = 5},
    config = { extra = {
        Xmult = 1, Xmult_mod = 2, odds = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        return { 
           vars = { 
                center.ability.extra.Xmult, 
                center.ability.extra.Xmult_mod,
                (G.GAME and G.GAME.probabilities.normal or 1),
                center.ability.extra.odds 
           }
      }
    end,
    calculate = function(self,card,context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('vremade_gros_michel') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_extinct_ex')
                }
            else
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    message_card = card
                }
            end
        end
        if context.joker_main then
            return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult .. ' Mult',
            color = G.C.MULT
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker58',
    loc_txt = {
        name = 'Leafy',
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
    pos = {x = 6, y = 5},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker76',
    loc_txt = {
        name = 'Root Two', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Played {C:attention}4s{} and {C:attention}9s',
            'give {X:red,C:white} X1.5 {} Mult when scored'
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
    pos = {x = 4, y = 7},
    config = { extra = {
        Xmult = 1.5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play and
            (context.other_card:get_id() == 4 or context.other_card:get_id() == 9) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker59',
    loc_txt = {
        name = 'TV',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 4},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker60',
    loc_txt = {
        name = 'Evil Leafy',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 8, y = 5},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker61',
    loc_txt = {
        name = 'Yellow Face',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 5},
    config = { extra = {
        discount = 25
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.discount}}
    end,
    calculate = function(self,card,context) --calculation later
    local sellpercent = 25
        if context.selling_self then
            sellpercent = 0
            G.E_MANAGER:add_event(Event({func = function()
            G.GAME.discount_percent = sellpercent
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
        else
            G.E_MANAGER:add_event(Event({func = function()
            G.GAME.discount_percent = sellpercent
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true end }))
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            sellpercent = 25
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_coupon'))
                            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end)
                    }))
                end,
                message = 'coupon!'
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker62',
    loc_txt = {
        name = 'Ruby',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 6},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker63',
    loc_txt = {
        name = 'Puffball', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Disables effect of',
            'every {C:attention}Boss Blind{}',
            'that debuffs cards'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 1, y = 6},
    config = { extra = {

    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later 
        if context.setting_blind and not context.blueprint and context.blind.boss then
            if G.GAME.blind.name == 'The Pillar' or G.GAME.blind.name == 'Verdant Leaf' or G.GAME.blind.name == 'The Club' or G.GAME.blind.name == 'The Goad' or G.GAME.blind.name == 'The Window' or G.GAME.blind.name == 'The Plant' or G.GAME.blind.name == 'The Head' then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.GAME.blind:disable()
                                        play_sound('timpani')
                                        delay(0.4)
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            if G.GAME.blind.name == 'The Pillar' or G.GAME.blind.name == 'Verdant Leaf' or G.GAME.blind.name == 'The Club' or G.GAME.blind.name == 'The Goad' or G.GAME.blind.name == 'The Window' or G.GAME.blind.name == 'The Plant' or G.GAME.blind.name == 'The Head' then
                G.GAME.blind:disable()
                play_sound('timpani')
                SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker64',
    loc_txt = {
        name = 'Gelatin',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 6},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker65',
    loc_txt = {
        name = 'Fries',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 6},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker66',
    loc_txt = {
        name = 'Dora', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains',
            '{X:mult,C:white}X#2#{} Mult when each',
            'played {C:attention}Stone Card{}',
            'is scored',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 4, y = 6},
    config = { extra = {
        Xmult = 1, Xmult_mod = 0.2
    }
    },
    loc_vars = function(self,info_queue,center)
        return { 
           vars = { 
                center.ability.extra.Xmult, 
                center.ability.extra.Xmult_mod 
           }
      }
    end,
    calculate = function(self,card,context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
                }
            end
        end 
        if context.joker_main then
            return {
            card = card,
            Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult .. ' Mult',
            color = G.C.MULT
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker67',
    loc_txt = {
        name = 'Donut', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Played {C:attention}10s {}give',
            '{X:red,C:white}X2 {} Mult when scored, and',
            '{X:red,C:white}X20 {} Mult if {C:purple}Four {}and {C:purple}X {}are held'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 7},
    config = { extra = {
        Xmult = 2
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 10 then
                local has4 = false
                local hasX = false
                for i, jokers in ipairs(G.jokers.cards) do
                    if G.jokers.cards[i].config.center.loc_txt ~= nil then
                        if G.jokers.cards[i].config.center.loc_txt.name == 'Four' then
                            has4 = true
                        end
                        if G.jokers.cards[i].config.center.loc_txt.name == 'X' then
                            hasX = true
                        end
                    end
                end
                if hasX and has4 then
                    return {
                        Xmult = card.ability.extra.Xmult * 10
                    }
                else
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
    end
 }
  SMODS.Joker{
    key = 'joker68',
    loc_txt = {
        name = 'Nickel',
        text = {
            'Gives {C:chips}+#1#{} Chips',
            'for each{C:spade} Spade Card',
            'in your {C:attention}full deck{}',
            '{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)'
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
    pos = {x = 1, y = 7},
    config = { extra = { 
        chips = 75
    }
    },
    loc_vars = function(self,info_queue,center)
        local spade_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Spades') then spade_tally = spade_tally + 1 end
            end
        end
        return { vars = { center.ability.extra.chips, center.ability.extra.chips * spade_tally } }
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local spade_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:is_suit('Spades') then spade_tally = spade_tally + 1 end
            end
            return {
                chips = card.ability.extra.chips * spade_tally,
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card:is_suit('Spades') then
                return true
            end
        end
        return false
    end
 }
  SMODS.Joker{
    key = 'joker69',
    loc_txt = {
        name = 'Book',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 7},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker70',
    loc_txt = {
        name = 'Bomby',
        text = {
            ''
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 7},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker71',
    loc_txt = {
        name = 'One',
        text = {
            ''
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
    pos = {x = 5, y = 6},
    soul_pos = {x = 5, y = 7},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
  SMODS.Joker{
    key = 'joker72', 
    loc_txt = {
        name = 'Two', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            '{C:green}^2{} Mult'
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
    pos = {x = 6, y = 6},
    soul_pos = {x = 6, y = 7},
    config = { extra = { 
        Emult = 2
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Emult}}
    end,
    calculate = function(self,card,context) 
        if context.joker_main then
            return {
                card = card,
                Emult_mod = card.ability.extra.Emult,
                message = '^' .. card.ability.extra.Emult,
                color = G.C.MULT
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker73',
    loc_txt = {
        name = 'Four', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {X:mult,C:white}X0.4{} Mult',
            'if played hand has',
            'exactly {C:attention}4{} cards',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
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
    pos = {x = 8, y = 6},
    soul_pos = {x = 8, y = 7},
    config = { extra = {
        Xmult_mod = 0.4, Xmult = 1
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function(self,card,context) 
        if context.before and context.main_eval and not context.blueprint and #context.full_hand == 4 then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker74',
    loc_txt = {
        name = 'X', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'Gives a {C:attention}random{}',
            'multiplier between',
            '{X:mult,C:white}x5{} and {X:mult,C:white}x30{} Mult'
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
    pos = {x = 7, y = 6},
    soul_pos = {x = 7, y = 7},
    config = { extra = { max = 30, min = 5 } },
    loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
    end,
    calculate = function(self, card, context) 
        if context.joker_main then
            return {
                Xmult = pseudorandom('vremade_misprint', card.ability.extra.min, card.ability.extra.max)
            }
        end
    end
 }
  SMODS.Joker{
    key = 'joker75',
    loc_txt = {
        name = 'Announcer',
        text = {
            ''
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
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
 }
