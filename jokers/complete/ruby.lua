return{
    key = 'joker62',
    loc_txt = {
        name = 'Ruby',
        text = {
            'When {C:attention}Blind{} is selected',
            '{C:green}#9# in #10#{} chance that',
            'this Joker either gains',
            'between {C:attention}+10{} or {C:attention}+30{} {C:mult}Mult{}',
            'or {C:chips}Chips{} or between',
            '{C:attention}+1{} or {C:attention}+3{} {X:mult,C:white}Xmult{} or {C:money}end{}',
            '{C:money}of round cash{}',
            '{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} mult, {}{C:chips}+#2#{}{C:inactive} chips,{}',
            '{X:mult,C:white}X#3#{C:inactive} Mult, and {C:money}$#4#{}{C:inactive}){}'
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
        mult = 0, chips = 0, Xmult = 1, dollars = 0, mult_mod = 10, chips_mod = 10, Xmult_mod = 1, increase = 1, odds = 3
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.Xmult, center.ability.extra.dollars, center.ability.extra.mult_mod, center.ability.extra.chips_mod, center.ability.extra.Xmult_mod, center.ability.extra.increase, (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds }}
    end,
    calculate = function(self,card,context)
        if context.setting_blind and (pseudorandom('vremade_8_ball') < G.GAME.probabilities.normal / card.ability.extra.odds) then
            local ruby_num = math.random(1, 4)
            local ruby_random = math.random(1, 3)
            if ruby_num == 1 then
                local ruby_mult = ruby_random * 10
                card.ability.extra.mult_mod = ruby_mult
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    card = card,
                    message = '+' .. card.ability.extra.mult_mod .. ' mult',
                    color = G.C.MULT
                }
            end
            if ruby_num == 2 then
                local ruby_chips = ruby_random * 10
                card.ability.extra.chips_mod = ruby_chips
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                return {
                    card = card,
                    message = '+' .. card.ability.extra.chips_mod .. ' chips',
                    color = G.C.CHIPS
                }
            end
            if ruby_num == 3 then
                card.ability.extra.Xmult_mod = ruby_random
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                return {
                    card = card,
                    message = '+' .. card.ability.extra.Xmult_mod .. ' Xmult',
                    color = G.C.MULT
                }
            end
            if ruby_num == 4 then
                card.ability.extra.increase = ruby_random
                card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.increase
                return {
                    card = card,
                    message = '+' .. card.ability.extra.increase .. ' dollars',
                    color = G.C.MONEY
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                Xmult = card.ability.extra.Xmult
            }
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