return{
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
    cost = 8,
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