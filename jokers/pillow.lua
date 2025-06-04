return{
    key = 'joker6',
    loc_txt = {
        name = 'Pillow', --DONE THIS JOKER IS DONE LOOK HERE THIS JOKER IS DONE OK THANK YOU FOR READING IT NOW SINCE ITS SO LONG ITS NOTICABLE.
        text = {
            'When {C:attention}Blind{} is selected,',
            'destroy Joker to the right',
            'and permanently add {C:chips}Chips{}',
            'based on the Jokers rarity',
            '{s:0.8,C:blue}+20{}{s:0.8} for {}{s:0.8,C:common}common{}{s:0.8}, {}{s:0.8,C:blue}+40{}{s:0.8} for {}{s:0.8,C:uncommon}uncommon{}{s:0.8},{}',
            '{s:0.8,C:blue}+100{}{s:0.8} for {}{s:0.8,C:rare}rare{}{s:0.8}, and {}{s:0.8,C:blue}+1000{}{s:0.8} for {}{s:0.8,C:legendary}legendary{}{s:0.8}.{}',
            '{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips)'
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
    pos = {x = 3, y = 5},
    config = { extra = {
        chips = 0
    }
    },
    loc_vars = function(self,info_queue,card)
        return {vars = {card.ability.extra.chips}}
    end,
    calculate = function(self,card,context) --calculation later
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                for i, isjokercake in ipairs(G.jokers.cards) do
                    if G.jokers.cards[i].config.center.loc_txt ~= nil then
                        if G.jokers.cards[i].config.center.loc_txt.name == 'Cake' then
                            sliced_card = G.jokers.cards[i]
                            break
                        end
                    end
                end
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                if sliced_card.config.center.rarity == 1 or sliced_card.config.center.rarity == "Common" then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.chips = card.ability.extra.chips + 20
                            card:juice_up(0.8, 0.8)
                            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound('slice1', 0.96 + math.random() * 0.08)
                            return true
                        end
                    }))
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + 20 } },
                        colour = G.C.CHIPS,
                        no_juice = true
                    }
                end
                if G.jokers.cards[my_pos + 1].config.center.rarity == 2 or G.jokers.cards[my_pos + 1].config.center.rarity == "Uncommon" then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.chips = card.ability.extra.chips + 40
                            card:juice_up(0.8, 0.8)
                            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound('slice1', 0.96 + math.random() * 0.08)
                            return true
                        end
                    }))
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + 40 } },
                        colour = G.C.CHIPS,
                        no_juice = true
                    }
                end
                if G.jokers.cards[my_pos + 1].config.center.rarity == 3 or G.jokers.cards[my_pos + 1].config.center.rarity == "Rare" then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.chips = card.ability.extra.chips + 100
                            card:juice_up(0.8, 0.8)
                            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound('slice1', 0.96 + math.random() * 0.08)
                            return true
                        end
                    }))
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + 100 } },
                        colour = G.C.CHIPS,
                        no_juice = true
                    }
                end
                if G.jokers.cards[my_pos + 1].config.center.rarity == 4 or G.jokers.cards[my_pos + 1].config.center.rarity == "Legendary" then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.joker_buffer = 0
                            card.ability.extra.chips = card.ability.extra.chips + 1000
                            card:juice_up(0.8, 0.8)
                            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound('slice1', 0.96 + math.random() * 0.08)
                            return true
                        end
                    }))
                    return {
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips + 1000 } },
                        colour = G.C.CHIPS,
                        no_juice = true
                    }
                end
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}