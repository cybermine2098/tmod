return{
    key = 'joker14',
    loc_txt = {
        name = 'Barf Bag',
        text = {
            'For every {C:attention}10{} cards of a',
            'specific suit discarded,',
            'you will get a corresponding',
            'buff relating to that suit.',
            '{s:0.8}({}{X:mult,C:white,s:0.8}x2{}{s:0.8} for {}{C:hearts,s:0.8}hearts{}{s:0.8}, {}{C:chips,s:0.8}+100{}{s:0.8} chips{} {s:0.8}for {}{C:spades,s:0.8}spades{}{s:0.8}, {}',
            '{}{C:money,s:0.8}$10{}{s:0.8} dollars end{}{s:0.8} of round cash for {}{C:diamonds,s:0.8}diamonds{}{s:0.8},{}',
            '{s:0.8}and {}{C:mult,s:0.8}+30{}{s:0.8} Mult for {}{C:clubs,s:0.8}clubs{}{s:0.8}.){}',
            'This buff will wear off over',
            'the course of {C:attention}10 played{} hands.',
            '{C:inactive}(Currently {C:mult}+30{}{C:inactive} Mult)'
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 1},
    config = { extra = {
        
    }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.mult}}
    end,
    calculate = function(self,card,context) --calculation later

    end
}