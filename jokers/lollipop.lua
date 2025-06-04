return{
    key = 'joker7',
    loc_txt = {
        name = 'Lollipop', 
        text = {
            'If played hand contains',
            '{C:attention}two different{} scoring suits,',
            'earn {C:money}$5{}'
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
    pos = {x = 5, y = 0},
    config = { extra = {
        dollars = 5
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.dollars, localize('Spades', 'suits_plural'), localize('Clubs', 'suits_plural'), localize('Hearts', 'suits_plural'), localize('Diamonds', 'suits_plural')}}
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            local unique_suits = 0
            local num_hearts = 0
            local num_clubs = 0
            local num_spades = 0
            local num_diamonds = 0
            for _ , playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_suit('Clubs') then
                    num_clubs = num_clubs + 1
                end
                if playing_card:is_suit('Spades') then
                    num_spades = num_spades + 1
                end
                if playing_card:is_suit('Diamonds') then
                    num_diamonds = num_diamonds + 1
                end
                if playing_card:is_suit('Hearts') then
                    num_hearts = num_hearts + 1
                end
            end
            if num_hearts > 0 then
                unique_suits = unique_suits + 1
            end
            if num_diamonds > 0 then
                unique_suits = unique_suits + 1
            end
            if num_clubs > 0 then
                unique_suits = unique_suits + 1
            end
            if num_spades > 0 then
                unique_suits = unique_suits + 1
            end
            if unique_suits > 1 then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}