return{
    key = 'joker66',
    loc_txt = {
        name = 'Dora', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'This Joker gains {X:mult,C:white}X#2#{}',
            'Mult whenever a {C:attention}Stone{}',
            '{C:attention}Card{} is triggered',
            '{C:green}#4# in #5#{} chance to destroy',
            'said {C:attention}card{}, adding {X:mult,C:white}X#3#{}',
            'Mult to the amount this',
            'Joker gains per triggered',
            '{C:attention}Stone Card{}',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    atlas = 'Jokers',
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 4, y = 6},
    config = { extra = {
        Xmult = 1, Xmult_mod = 0.05, Xmult_mod_mod = 0.05, odds = 5
    }
    },
    loc_vars = function(self,info_queue,center)
        return { 
           vars = { 
                center.ability.extra.Xmult, 
                center.ability.extra.Xmult_mod,
                center.ability.extra.Xmult_mod_mod,
                (G.GAME and G.GAME.probabilities.normal or 1),
                center.ability.extra.odds
           }
      }
    end,
    calculate = function(self,card,context)
        if self.debuff then return nil end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                        message_card = card
                }
            end
        end
        if context.destroy_card and context.cardarea == G.play and not context.blueprint then
            if SMODS.has_enhancement(context.destroy_card, 'm_stone') then
                if context.destroy_card and (pseudorandom('vremade_8_ball') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                    card.ability.extra.Xmult_mod = card.ability.extra.Xmult_mod + card.ability.extra.Xmult_mod_mod
                    return {
                        message = 'Eaten!',
                        colour = G.C.BROWN,
                        remove = true
                    }
                end
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