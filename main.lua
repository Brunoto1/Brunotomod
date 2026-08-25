SMODS.Atlas{
    key = 'Jokers', --atlas key
    path = 'Jokers.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 142, --width of one card
    py = 190 -- height of one card
}
SMODS.Joker{
    key = 'brunoto', --joker key
    loc_txt = { -- local text
        name = 'Brunoto',
        text = {
          '{X:mult,C:white}X#1#{} Mult'
        },
        --[[unlock = {
            'Be {C:rare}cool{}',
        }]]
    },
    atlas = 'Jokers', --atlas' key
    rarity = 3, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 12, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
    pools = { ["Brunotomodaddition"] = true },
    config = { 
      extra = {
        Xmult = 10 --configurable value
      }
    },
    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == 'brunoto_loves_you' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end
    end,
}
SMODS.Atlas{
    key = 'Pelo', --atlas key
    path = 'Pelo.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = "pelo",
    config = {
        extra = {
            chips0 = 9
        }
    },
    loc_txt = {
        ['name'] = 'Pelo',
        ['text'] = {
            [1] = '{C:blue}+9{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Pelo',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                chips = 9,
                message = ":D"
            }
        end
    end
}

SMODS.Atlas{
    key = 'Adobe Animate', --atlas key
    path = 'Adobe Animate.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 142, --width of one card
    py = 142 -- height of one card
}
SMODS.Joker{
    key = "adobeanimate",
    config = {
        extra = {
            mult0 = 10,
            odds = 29
        }
    },
    loc_txt = {
        ['name'] = 'Adobe Animate',
        ['text'] = {
            [1] = 'Gives {C:rare}+10{} Mult Or {C:red}game crash.{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 99 * 1, 
        h = 96 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Adobe Animate',
    pools = { ["Brunotomodaddition"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 12, card.ability.extra.odds, 'j_modprefix_adobeanimate') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = 10
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_33e8c3e4', 12, card.ability.extra.odds, 'j_modprefix_adobeanimate', false) then
                            love.event.quit()
                            
                        end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Atlas{
    key = 'Ninenine Deck', --atlas key
    path = 'Ninenine Deck.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 96 -- height of one card
}
SMODS.Back {
    key = 'ninenine_deck',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 99,
            shop_slots0 = 99,
            repetitions = 10
        },
    },
    loc_txt = {
        name = 'Ninenine Deck',
        text = {
            [1] = '{C:attention}ninenine ninenine ninenine ninenine{}',
            [2] = '{This deck is impossible to be honest.}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'Ninenine Deck',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = 99
                return true
            end
        }))
        G.GAME.starting_params.dollars = 99
        G.GAME.win_ante = 99
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    local current_shop_slots = (G.GAME.modifiers.shop_size or 0)
                    local target_shop_slots = 99
                    local difference = target_shop_slots - current_shop_slots
                    change_shop_size(difference)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 99
                        G.GAME.current_round.reroll_cost = math.max(0,
                        G.GAME.current_round.reroll_cost + 99)
                        return true
                    end
                }))
                ,
                colour = G.C.BLUE
            }
            ,
            func = function()
                for i = 1, 10 do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('timpani')
                            local new_joker = SMODS.add_card({ set = 'Joker', key = 'brunotomod_brunoto' })
                            if new_joker then
                                new_joker:set_edition("e_foil", true)
                            end
                            return true
                        end
                    }))
                    
                end
                return true
            end
        }
    end
}
SMODS.Atlas{
    key = 'Tf2 engineer', --atlas key
    path = 'Tf2 engineer.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 142, --width of one card
    py = 190 -- height of one card
}
SMODS.Joker{
    key = "tf2engineer",
    config = {
        extra = {
            xmult0 = 20,
            xchips0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'tf2 engineer',
        ['text'] = {
            [1] = '{X:red,C:white}X20{} Mult And {X:blue,C:white}X20{} Chips.',
            [2] = 'Dont even talk about bob',
            [3] = 'the {X:edition,C:white}builder{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Tf2 engineer',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 20,
                extra = {
                    x_chips = 20,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}
SMODS.Shader({ key = 'gold', path = 'gold.fs' })
SMODS.Edition {
    key = 'gold',
    shader = 'gold',
    in_shop = true,
    extra_cost = 5,
    apply_to_float = false,
    sound = { sound = "polychrome1", per = 1.2, vol = 0.4 },
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Gold',
        label = 'Gold',
        text = {
            [1] = '{C:blue}57{} Chips {X:mult,C:white}53{} XMult'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
}
SMODS.Atlas{
    key = 'Bsoda Seal', --atlas key
    path = 'Bsoda Seal.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 120, --width of one card
    py = 120 -- height of one card
}
SMODS.Seal {
    key = 'bsoda',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips0 = 5
        }
    },
    badge_colour = HEX('009dff'),
    loc_txt = {
        name = 'Bsoda',
        label = 'Bsoda',
        text = {
            [1] = '{C:blue}+5{} Chips'
        }
    },
    atlas = 'Bsoda Seal',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.calculate_effect({message = "*SPRAY*"}, card)
                    return true
                end,
            }))
            return {
                chips = 5
            }
        end
    end
}
SMODS.Atlas{
    key = 'Bsoda Lover', --atlas key
    path = 'Bsoda Lover.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = "bsodalover",
    config = {
        extra = {
            chips0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Bsoda Lover',
        ['text'] = {
            [1] = '{C:blue}+7{} Bsoda'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Bsoda Lover',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 7
            }
        end
    end
}
--shoutout Yahiamice for these lines of codes!!!!

G.C.BRUNOTOGREEN = HEX("00FF00")
G.C.BRUNOTOORANGE = HEX("FFAC1C")
G.C.mid_flash = 0
G.C.vort_time = 7
G.C.vort_speed = 0.4

local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	G.SPLASH_BACK:define_draw_steps({
			{
				shader = "splash",
				send = {
					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
           			{name = 'vort_speed', val = G.C.vort_speed},
            		{name = 'colour_1', ref_table = G.C, ref_value = 'BRUNOTOGREEN'},
            		{name = 'colour_2', ref_table = G.C, ref_value = 'BRUNOTOORANGE'},
            		{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
				},
			},
		})
	return ret
end
--yahiamice code end:( to my code that sucks ass >:(
SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 666,
    py = 432,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 68,
    py = 68,
    atlas_table = "ASSET_ATLAS"
})
SMODS.ConsumableType{
    key = 'WineXDConsumableType', --consumable type key

    collection_rows = {4,5}, --amount of cards in one page
    primary_colour = G.C.GOLD, --first color
    secondary_colour = G.C.DARK_EDITION, --second color
    loc_txt = {
        collection = 'WineXD', --name displayed in collection
        name = 'WineXD', --name displayed in badge
        undiscovered = {
            name = 'Not Discovered WineXD Card', --undiscovered name
            text = {'wine is not making videos.'} --undiscovered text
        }
    },
    shop_rate = 1, --rate in shop out of 100
}
SMODS.UndiscoveredSprite{
    key = 'WineXDConsumableType', --must be the same key as the consumabletype
    atlas = 'Zarpado',
    pos = {x = 0, y = 0}
}
SMODS.Atlas{
        key = 'Zarpado', --atlas key
    path = 'Zarpado.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 96 -- height of one card
}
SMODS.Consumable {
    key = 'Zarpado',
    set = 'WineXDConsumableType',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Zarpado',
        text = {
            [1] = 'Disables Boss blinds.',
            [2] = '',
            [3] = '',
            [4] = '{s:4.9}*ZARPADO*{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Zarpado',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind:disable()
                    play_sound('timpani')
                    return true
                end
            }))
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "*Zarpada*", colour = G.C.GOLD})
        end
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
        key = 'Squares', --atlas key
    path = 'Squares.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = "squaressquaressquares",
    config = {
        extra = {
            chips0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Squares Squares Squares',
        ['text'] = {
            [1] = 'Do you like Squares I do!',
            [2] = '{C:blue}+4{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Squares',
    pools = { ["modprefix_brunotomod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 4
            }
        end
    end
}
SMODS.Atlas{
        key = 'Jesus Cat', --atlas key
    path = 'Jesus Cat.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Jesus Cat.
    key = "jesuscat",
    config = {
        extra = {
            chips0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Jesus Cat.',
        ['text'] = {
            [1] = '{C:blue}+10{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jesus Cat',
    pools = { ["Cat"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 10
            }
        end
    end
}
SMODS.Atlas{
        key = 'Food Bowl', --atlas key
    path = 'Food Bowl.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{
    key = "foodbowl",
    config = {
        extra = {
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Food Bowl',
        ['text'] = {
            [1] = 'Gives {C:red}+20{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Food Bowl',
    pools = { ["Cat"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 20
            }
        end
    end                    
}
SMODS.ConsumableType{
    key = 'CrashCardsConsumableType', --consumable type key

    collection_rows = {4,5}, --amount of cards in one page
    primary_colour = G.C.BRUNOTOGREEN, --first color
    secondary_colour = G.C.DARK_EDITION, --second color
    loc_txt = {
        collection = 'Crash Cards', --name displayed in collection
        name = 'Crash Cards', --name displayed in badge
        undiscovered = {
            name = 'Crash Cards', --undiscovered name
            text = {'it will not crash.'} --undiscovered text
        }
    },
    shop_rate = 1, --rate in shop out of 100
}
SMODS.Atlas{
        key = 'Crash', --atlas key
    path = 'Crash.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'crash',
    set = 'CrashCardsConsumableType',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Crash',
        text = {
            [1] = 'Thank me later...'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Crash',
    use = function(self, card, area, copier)
        local used_card = copier or card
        love.event.quit()
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
        key = 'Lamin', --atlas key
    path = 'Lamin.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'lamine',
    set = 'WineXDConsumableType',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            dollars0 = 10   
        } 
    },
    loc_txt = {
        name = 'Lamine',
        text = {
            [1] = 'Gives {C:attention}+10{} Dollars'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Lamin',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + 10
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "hehehe uuuuuuuy", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Shader({ key = 'laminated', path = 'laminated.fs' })
SMODS.Edition {
    key = 'laminaded',
    shader = 'laminated',
    config = {
        extra = {
            chips0 = 10
        }
    },
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Laminaded',
        label = 'Laminaded',
        text = {
            [1] = '{C:inactive}made by SMODS!{}',
            [2] = '{C:blue}+10{} Chips'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = 10
            }
        end
    end
}
SMODS.Shader({ key = 'sepia', path = 'sepia.fs' })
SMODS.Edition {
    key = 'sepia',
    shader = 'sepia',
    config = {
        extra = {
            xmult0 = 9
        }
    },
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Sepia',
        label = 'Sepia',
        text = {
            [1] = 'Gives {X:mult,C:white}X9{} XMult'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                Xmult = 9
            }
        end
    end
}
SMODS.Shader({ key = 'ionized', path = 'ionized.fs' })
SMODS.Edition {
    key = 'infrared',
    shader = 'ionized',
    in_shop = false,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Infrared',
        label = 'Infrared',
        text = {
            [1] = 'Cool.',
            [2] = '{C:red}+14{} Mult'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
}
SMODS.Atlas{
    key = 'Peppino', --atlas key
    path = 'Peppino.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ 
    key = "peppino",
    config = {
        extra = {
            xchips0 = 20,
            xmult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Peppino',
        ['text'] = {
            [1] = '{C:blue}X20{} Chips {C:red}X20{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Peppino',
    pools = { ["Brunotomodaddition"] = true },
    soul_pos = {
        x = 0,
        y = 0
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 20,
                extra = {
                    Xmult = 20
                }
            }
        end
    end
}
SMODS.Atlas{
    key = 'Burnt Card', --atlas key
    path = 'Burnt Card.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Enhancement {
    key = 'burntcard',
    pos = { x = 0, y = 0 },
    config = {
        bonus = -4
    },
    loc_txt = {
        name = 'Burnt Card',
        text = {
            [1] = '{C:red}-4{} Chips'
        }
    },
    atlas = 'Burnt Card',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5
}
SMODS.Atlas{
    key = 'Orejitas', --atlas key
    path = 'Orejitas.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'orejitas',
    set = 'WineXDConsumableType',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Orejitas',
        text = {
            [1] = 'Spawns A- {C:attention}food~{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Orejitas',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_brunotomod_foodbowl' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        return {
            message = "Uyyyyyyyyyyy Comida."
        }
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = 'Nublado', --atlas key
    path = 'Nublado.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'nublado',
    set = 'WineXDConsumableType',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Nublado',
        text = {
            [1] = 'Spawns {C:attention}Jesus Cat.{} (Rest In Peace.)'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Nublado',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_brunotomod_jesuscat' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = 'Sausage', --atlas key
    path = 'Sausage.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Sausage
    key = "sausage",
    config = {
        extra = {
            mult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Sausage',
        ['text'] = {
            [1] = 'Gives {C:red}+2{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Sausage',
    pools = { ["modprefix_brunotomod_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 2
            }
        end
    end
}
SMODS.Atlas{
    key = 'PeloSombra', --atlas key
    path = 'PeloSombra.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'pelosombra',
    set = 'WineXDConsumableType',

    pos = { x = 0, y = 0 },

    loc_txt = {
        name = 'PeloSombra',
        text = {
            [1] = 'QUE NO SOY NEGRO SOY {C:uncommon}VERDE!!!!!!!!!!!!{}',
            [2] = 'Has a {C:red}3 in 20{} chance to spawn a {C:attention}Penis{} Joker',
            [3] = 'Otherwise spawns a {C:attention}Sausage{} Joker'
        }
    },

    cost = 3,

    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,

    atlas = 'PeloSombra',

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,

            func = function()
                play_sound('timpani')

                if #G.jokers.cards + G.GAME.joker_buffer
                    < G.jokers.config.card_limit then

                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                    -- 3 in 20 chance
                    local roll = math.random(1, 20)

                    local joker_key

                    if roll <= 3 then
                        -- PEEEEEEEEENE
                        joker_key = 'j_brunotomod_penis'
                    else
                        -- Normal sausage
                        joker_key = 'j_brunotomod_sausage'
                    end

                    local new_joker = SMODS.add_card({
                        set = 'Joker',
                        key = joker_key
                    })

                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                end

                used_card:juice_up(0.3, 0.5)

                return true
            end
        }))

        delay(0.6)

        return {
            message = "PEEEEEEEEEEEEEENE!!!!!!!!"
        }
    end,

    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = 'Wet Cat Food', --atlas key
    path = 'Wet Cat Food.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Wet Cat Food
    key = "wetcatfood",
    config = {
        extra = {
            mult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Wet Cat Food',
        ['text'] = {
            [1] = '{C:rare}+4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Wet Cat Food',
    pools = { ["Cat"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 4
            }
        end
    end
}
SMODS.Atlas{
    key = 'Glungus', --atlas key
    path = 'Glungus.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 498, --width of one card
    py = 498 -- height of one card
}
SMODS.Joker{ --Glungus
    key = "glungus",
    config = {
        extra = {
            xmult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Glungus',
        ['text'] = {
            [1] = '{X:red,C:white}X20{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 75 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Glungus',
    pools = { ["Cat"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 20
            }
        end
    end
}
SMODS.Atlas{
    key = 'PeloOveja', --atlas key
    path = 'PeloOveja.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable {
    key = 'pelooveja',
    set = 'WineXDConsumableType',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'PeloOveja',
        text = {
            [1] = 'Spawns- AH NOT AGAIN {C:attention}Latitas De Carne~{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'PeloOveja',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_brunotomod_wetcatfood' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        return {
            message = "Latitas De Carne!!!!!!!!!!!!!!!!!!!"
        }
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = 'Gambling Deck', --atlas key
    path = 'Gambling Deck.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Back {
    key = 'gambling_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Gambling Deck',
        text = {
            [1] = '{C:blue}LETS GO GAMBLING!!!!!!{}',
            [2] = 'everythings random'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'Gambling Deck',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'random_enhance')
                    v:set_ability(enhancement)
                    local seal_pool = {'Gold', 'Red', 'Blue', 'Purple'}
                    local random_seal = pseudorandom_element(seal_pool, 'random_seal')
                    v:set_seal(random_seal, nil, true)
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative','e_brunotomod_gold','e_brunotomod_laminaded','e_brunotomod_sepia','e_brunotomod_infrared'}, 'random edition')
                    v:set_edition(edition, true, true)
                    local _suit = pseudorandom_element(SMODS.Suits, 'random_suit')
                    assert(SMODS.change_base(v, _suit.key))
                    local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                    assert(SMODS.change_base(v, nil, _rank.key))
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        for i = 1, 4 do
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    play_sound('timpani')
                    local sets = {'Tarot', 'Planet', 'Spectral', 'WineXDConsumableType'}
                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                    SMODS.add_card({ set = random_set, 
                    })
                    return true
                end
            }))
        end
        return {
            func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                        local tag = Tag(selected_tag)
                        if tag.name == "Orbital Tag" then
                            local _poker_hands = {}
                            for k, v in pairs(G.GAME.hands) do
                                if v.visible then
                                    _poker_hands[#_poker_hands + 1] = k
                                end
                            end
                            tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                        end
                        tag:set_ability()
                        add_tag(tag)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
                return true
            end,
            message = "Created Tag!"
        }
    end
}
SMODS.Atlas{
    key = 'cantaloupe', --atlas key
    path = 'cantaloupe.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 96 -- height of one card
}
SMODS.Joker{ --Cantaloupe
    key = "cantaloupe",
    config = {
        extra = {
            mult0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Cantaloupe',
        ['text'] = {
            [1] = '{C:red}+10{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'cantaloupe',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 10
            }
        end
    end
}
SMODS.Atlas{
    key = 'Crash Gamble', --atlas key
    path = 'Crash Gamble.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 142, --width of one card
    py = 190 -- height of one card
}
SMODS.Consumable {
    key = 'crashgamble',
    set = 'CrashCardsConsumableType',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            odds = 1   
        } 
    },
    loc_txt = {
        name = 'Crash Gamble',
        text = {
            [1] = '{C:uncommon}1000 In 1 Chance To{}',
            [2] = '{C:red}CRASH{} Your {C:uncommon}Game.{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'Crash Gamble',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if SMODS.pseudorandom_probability(card, 'group_0_5c2fa6cc', 1000, card.ability.extra.odds, 'j_modprefix_crashgamble', false) then
            love.event.quit()
            
        end
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = 'Water Bucket', --atlas key
    path = 'Water Bucket.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Water Bucket
    key = "waterbucket",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Water Bucket',
        ['text'] = {
            [1] = 'If A {C:attention}2{} Is Held In Hand Will',
            [2] = 'Convert To A {C:blue}Wet Card{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Water Bucket',
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 2 then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_brunotomod_wetcard)
                    end,
                    message = "*SPLASH*!"
                }
            end
        end
    end
}
SMODS.Atlas{
    key = 'Wet Card', --atlas key
    path = 'Wet Card.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Enhancement {
    key = 'wetcard',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 30
    },
    loc_txt = {
        name = 'Wet Card',
        text = {
            [1] = '{C:blue}+9{} Chips'
        }
    },
    atlas = 'Wet Card',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5
}
SMODS.Atlas{
    key = 'Nonsense', --atlas key
    path = 'Nonsense.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Nonsense
    key = "nonsense",
    config = {
        extra = {
            chips0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Nonsense',
        ['text'] = {
            [1] = '{C:blue}So Basically{}',
            [2] = '{C:blue}+10{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Nonsense',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 10
            }
        end
    end
}
SMODS.Atlas{
    key = 'Television', --atlas key
    path = 'Television.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 96 -- height of one card
}
SMODS.Joker{ --Television
    key = "television",
    config = {
        extra = {
            chips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Television',
        ['text'] = {
            [1] = '{C:blue}+3{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Television',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 3,
                message = "Party!!!!!!!!!!!!!"
            }
        end
    end
}
SMODS.Atlas{
    key = '21 Kid', --atlas key
    path = '21 Kid.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --21 Kid
    key = "_21kid",
    config = {
        extra = {
            chips0 = 21
        }
    },
    loc_txt = {
        ['name'] = '21 Kid',
        ['text'] = {
            [1] = '{C:blue}+21{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = '21 Kid',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 21
            }
        end
    end
}
SMODS.Atlas{
    key = 'Monke', --atlas key
    path = 'Monke.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Monke
    key = "monke",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Monke',
        ['text'] = {
            [1] = 'When Any Card Is Scored',
            [2] = 'Swaps {C:red}Chips{} And {C:blue}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Monke',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                swap = true,
                message = "Swaped!"
            }
        end
    end
}
SMODS.Atlas{
    key = 'Magito', --atlas key
    path = 'Magito.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Magito
    key = "magito",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Magito',
        ['text'] = {
            [1] = 'Oh! Es Sierto! Ya No {C:red}Exploto!{}',
            [2] = 'If a {C:hearts}6{} Is Played,',
            [3] = 'Joker {C:mult}Explodes{}.',
            [4] = 'Gives {X:mult,C:white}X6{} Mult',
            [5] = '',
            [6] = '',
            [7] = '',
            [8] = '{s:10}KABOOM{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Magito',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 6 then
                        count = count + 1
                    end
                end
                return count == #context.scoring_hand
            end)() then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:shatter({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "*explota*", colour = G.C.RED})
                end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 1.5,
                message = "Ya No Exploto!"
            }
        end
    end
}
SMODS.Atlas{
    key = 'GLaDOS', --atlas key
    path = 'GLaDOS.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --GLaDOS
    key = "glados",
    config = {
        extra = {
            xmult0 = 40
        }
    },
    loc_txt = {
        ['name'] = 'GLaDOS',
        ['text'] = {
            [1] = '{X:mult,C:white}X40{} XMult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'GLaDOS',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 40
            }
        end
    end
}
SMODS.Atlas{
    key = 'SPACE', --atlas key
    path = 'SPACE.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --SPACE
    key = "space",
    config = {
        extra = {
            joker_slots0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'SPACE',
        ['text'] = {
            [1] = 'SPACE SPACE Needs More SPACE',
            [2] = 'When {C:uncommon}Sold{} Gives {X:attention,C:white}SPACE{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'SPACE',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Here You Go :)", colour = G.C.BLUE})
                    G.jokers.config.card_limit = 100
                    return true
                end
            }
        end
    end
}
SMODS.Atlas{
    key = 'GreenPrint', --atlas key
    path = 'GreenPrint.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Greenprint
    key = "greenprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Greenprint',
        ['text'] = {
            [1] = 'Copies ability of ',
            [2] = '{C:attention}Joker{} to the Left'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'GreenPrint',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}
SMODS.Atlas{
    key = 'Handy Joker', --atlas key
    path = 'Handy Joker.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Handy Joker
    key = "handyjoker",
    config = {
        extra = {
            hands0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Handy Joker',
        ['text'] = {
            [1] = 'Adds {C:blue}+3{} Hands When {C:blue}Blind{}',
            [2] = 'Is Selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Handy Joker',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 3
                    ease_hands_played(3)
                    
                    return true
                end
            }
        end
    end
}
SMODS.Atlas{
    key = 'Lazy Joker', --atlas key
    path = 'Lazy Joker.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Lazy Joker
    key = "lazyjoker",
    config = {
        extra = {
            chips0 = 10,
            mult0 = 5,
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Lazy Joker',
        ['text'] = {
            [1] = 'cba gonna make a good sprite then',
            [2] = '{C:white,X:blue}10Chips{} {X:red,C:white}5Mult{}',
            [3] = 'End of round {X:attention,C:white}3money{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Lazy Joker',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 10,
                extra = {
                    mult = 5
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 4
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(4), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}
SMODS.Atlas{
    key = 'Beautiful Drawing',
    path = 'Beautiful Drawing.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "Beautiful Drawing",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Beautiful Drawing',
        ['text'] = {
            [1] = 'If A {C:attention}9{} Is Played Gets {C:chips}+12{} Chips',
            [2] = '{C:inactive}(Currently {C:chips}+#1#{}{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Beautiful Drawing',
    pools = { ["Brunotomodaddition"] = true },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)

        if context.individual
        and context.cardarea == G.play
        and not context.blueprint then

            if context.other_card:get_id() == 9 then

                card.ability.extra.chips =
                    card.ability.extra.chips + 12

                card_eval_status_text(
                    card,
                    'extra',
                    nil,
                    nil,
                    nil,
                    {
                        message = "+12",
                        colour = G.C.CHIPS
                    }
                )
            end
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
SMODS.Atlas{
    key = 'Windows', --atlas key
    path = 'Windows.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Joker{ --Windows
    key = "windows",
    config = {
        extra = {
            mult0 = 89
        }
    },
    loc_txt = {
        ['name'] = 'Windows',
        ['text'] = {
            [1] = '{C:inactive}(only works on windows){}',
            [2] = '{C:mult}+89{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Windows',
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if love.system.getOS() == "Windows" then
                return {
                    mult = 89
                }
            end
        end
    end
}
SMODS.Atlas{
    key = 'Strange House',
    path = 'Strange House.png',
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "strangehouse",

    config = {
        extra = {
            base_xmult = 3,
            gain = 0.5,
            current = 3
        }
    },
    loc_txt = {
        ['name'] = 'Strange House',
        ['text'] = {
            [1] = '{C:inactive}strange... something is wrong{}',
            [2] = 'Gains {X:mult,C:white}+X#1#{} Mult per hand played',
            [3] = 'Currently {X:mult,C:white}X#2#{} Mult',
            [4] = '{C:attention}Rarely goes completely unstable...{}'
        }
    },

    pos = { x = 0, y = 0 },

    cost = 10,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Strange House',
    pools = { ["Brunotomodaddition"] = true },

    loc_vars = function(self, info_queue, center)
        local e = center.ability.extra or {}
        return {
            vars = {
                e.gain or 0.5,
                e.current or 3
            }
        }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Safety
        e.base_xmult = e.base_xmult or 3
        e.gain = e.gain or 0.5
        e.current = e.current or e.base_xmult

        -- Gain power every hand played
        if context.before and context.main_eval then
            e.current = e.current + e.gain
        end

        -- Apply effect when scoring
        if context.joker_main and context.scoring_hand then

            -- ULTRA RARE BREAK (2%)
            if math.random() < 0.02 then
                return { xmult = 100 }
            end

            local result = {
                xmult = e.current
            }

            -- Secondary surge (8%)
            if math.random() < 0.08 then
                result.xmult = e.current * 5
            end

            return result
        end

        -- Reset after blind
        if context.end_of_round then
            e.current = e.base_xmult
        end
    end
}
SMODS.Atlas{
    key = "chatgpt",
    path = "chatgpt.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "chatgpt",
    loc_txt = {
        name = "ChatGPT",
        text = {
            "Adapts to your playstyle:",
            "{C:mult}+#1# Mult{} if Pair",
            "{C:chips}+#2# Chips{} if Straight",
            "{C:money}+$#3#{} if Flush",
            "{C:mult}+#4# Mult{} if Two Pair",
            "{C:attention}Next round:{}",
            "{C:mult}+#5# Mult{}, {C:chips}+#6# Chips{}, {C:money}+$#7#{}, {C:mult}+#8# Mult{}",
            "{C:inactive}(updates after each Blind){}"
        }
    },
    atlas = "chatgpt",
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = {x = 0, y = 0},
    pools = { ["Brunotomodaddition"] = true },    

    config = {
        extra = {
            mult = 8,
            chips = 100,
            money = 5,
            mult2 = 12,

            next_mult = 10,
            next_chips = 120,
            next_money = 6,
            next_mult2 = 15
        }
    },

    loc_vars = function(self, info_queue, center)
        local extra = center.ability.extra or {}

        return {
            vars = {
                extra.mult or 0,
                extra.chips or 0,
                extra.money or 0,
                extra.mult2 or 0,

                extra.next_mult or 0,
                extra.next_chips or 0,
                extra.next_money or 0,
                extra.next_mult2 or 0
            }
        }
    end,

    calculate = function(self, card, context)

        -- Safety (kill me this part took so long)
        local e = card.ability.extra
        e.mult = e.mult or 8
        e.chips = e.chips or 100
        e.money = e.money or 5
        e.mult2 = e.mult2 or 12

        e.next_mult = e.next_mult or 10
        e.next_chips = e.next_chips or 120
        e.next_money = e.next_money or 6
        e.next_mult2 = e.next_mult2 or 15

        -- Apply effects ONLY on scoring
        if context.joker_main and context.scoring_hand then

            if context.poker_hands["Two Pair"] then
                return { mult = e.mult2 }
            end

            if context.poker_hands["Pair"] then
                return { mult = e.mult }
            end

            if context.poker_hands["Straight"] then
                return { chips = e.chips }
            end

            if context.poker_hands["Flush"] then
                return { dollars = e.money }
            end
        end

        -- End of blind logic
        if context.end_of_round then

            -- Apply preview → current
            e.mult = e.next_mult
            e.chips = e.next_chips
            e.money = e.next_money
            e.mult2 = e.next_mult2

            -- Generate NEW preview
            e.next_mult = math.random(4, 15)
            e.next_chips = math.random(50, 200)
            e.next_money = math.random(2, 10)
            e.next_mult2 = math.random(10, 20)
        end
    end
}
SMODS.Atlas{
    key = "Lights Out",
    path = "Lights Out.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "lights_out",
    atlas = "Lights Out",

    loc_txt = {
        name = "Lights Out",
        text = {
            "If played hand is the same as last:",
            "{C:mult}+#1# Xmult{}",
            "If different:",
            "{C:red}-#2# Mult{}",
            "{C:inactive}(First hand is free){}",
            "{C:inactive}(Resets after each Blind){}"
        }
    },

    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pools = { ["Brunotomodaddition"] = true },
    pos = {x = 0, y = 0},

    config = {
        extra = {
            xmult = 2,
            penalty = 5,
            last_hand = nil
        }
    },

    loc_vars = function(self, info_queue, center)
        local e = center.ability.extra or {}
        return {
            vars = {
                e.xmult or 2,
                e.penalty or 5
            }
        }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        e.xmult = e.xmult or 2
        e.penalty = e.penalty or 5

        if context.joker_main and context.scoring_hand then
            local current_hand = nil

            for hand, v in pairs(context.poker_hands) do
                if v then
                    current_hand = hand
                    break
                end
            end

            if current_hand then
                if not e.last_hand then
                    e.last_hand = current_hand
                    return
                end

                if e.last_hand == current_hand then
                    return { xmult = e.xmult }
                else
                    e.last_hand = current_hand
                    return { mult = -e.penalty }
                end
            end
        end

        if context.end_of_round then
            e.last_hand = nil
        end
    end
}
SMODS.Atlas{
    key = "Animate Joker",
    path = "Animate Joker.png",
    px = 235,
    py = 315
}
SMODS.Joker{
    key = "animatejoker",
    atlas = "Animate Joker",

    loc_txt = {
        name = "Animate Joker",
        text = {
            "Replays your last scoring hand",
            "Gives {C:mult}+#1# Mult{} based on it",
            "{C:inactive}(Stores previous hand){}"
        }
    },

    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    pools = { ["Brunotomodaddition"] = true },
    pos = {x = 0, y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },

    config = {
        extra = {
            last_hand = nil,
            mult = 12
        }
    },

    loc_vars = function(self, info_queue, center)
        local e = center.ability.extra or {}
        return {
            vars = {
                e.mult or 12
            }
        }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        -- Safety
        e.mult = e.mult or 12

        if context.joker_main and context.scoring_hand then

            local current = context.scoring_name

            local result = {}

            -- Replay last hand
            if e.last_hand then
                result.mult = e.mult
            end

            -- Store current hand
            e.last_hand = current

            return result
        end

        -- Reset after blind (optional)
        if context.end_of_round then
            e.last_hand = nil
        end
    end
}
-- Cat joker pool
SMODS.ObjectType({
	key = "Cat",
	default = "j_brunotomod_jesuscat",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
		self:inject_card(G.P_CENTERS.j_lucky_cat)
	end,
})

SMODS.ObjectType({
    key = "Brunotomodaddition",
    default = "j_brunotomod_brunoto",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        -- insert base game food jokers
    end,
})
SMODS.ObjectType({
    key = "Dog",
    default = "j_brunotomod_doge",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        -- insert base game food jokers
    end,
})
SMODS.Atlas{
    key = "Inked Card",
    path = "Inked Card.png",
    px = 71,
    py = 95
}
SMODS.Enhancement {
    key = 'inkedcard',
    pos = { x = 0, y = 0 },
    config = {
        mult = 4,
        bonus = 30
    },
    loc_txt = {
        name = 'Inked Card',
        text = {
            [1] = '{C:mult}+6{} Mult {C:chips}+7{} Chips'
        }
    },
    atlas = 'Inked Card',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5
}
SMODS.Atlas{
    key = "Doge",
    path = "Doge.png",
    px = 71,
    py = 95
}
SMODS.Joker{ --Doge
    key = "doge",
    config = {
        extra = {
            mult0 = 41
        }
    },
    loc_txt = {
        ['name'] = 'Doge',
        ['text'] = {
            [1] = '{C:mult}+41{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Doge',
    pools = { ["Dog"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 41
            }
        end
    end
}
SMODS.Atlas{
    key = "Borja",
    path = "Borja.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "borja",
    config = {
        extra = {
            chips0 = 87,
            chips = 53
        }
    },
    loc_txt = {
        ['name'] = 'Borja',
        ['text'] = {
            [1] = '{C:chips}+87{} Chips And',
            [2] = '{C:mult}+53{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Borja',
    pools = { ["Dog"] = true, ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 87,
                extra = {
                    chips = 53,
                    colour = G.C.CHIPS
                }
            }
        end
    end
}
SMODS.Atlas {
    key = "Larry",
    path = "Larry.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "larry",

    loc_txt = {
        name = "Larry",
        text = {
            "Randomly rearranges your Jokers",
            "while scoring",
            "Gains {C:mult}+5{} Mult each hand",
            "Every round he causes trouble",
            "After {C:attention}4{} rounds he loses {C:attention}Eternal{}",
            "{C:inactive}He was not invited.{}"
        }
    },

    atlas = "Larry",
    pos = {x = 0, y = 0},

    cost = 9,
    rarity = 3,

    pools = {
        ["Cat"] = true,
        ["Brunotomodaddition"] = true
    },

    config = {
        extra = {
            mult = 0,
            rounds_left = 4
        }
    },

    -- Starts Eternal
    add_to_deck = function(self, card, from_debuff)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)

        -- Shuffle Jokers before scoring
        if context.before then
            if #G.jokers.cards > 1 then
                G.jokers:shuffle()

                return {
                    message = "Larry..."
                }
            end
        end

        -- Gain +5 Mult every hand
        if context.joker_main then
            card.ability.extra.mult = card.ability.extra.mult + 5

            return {
                mult = card.ability.extra.mult
            }
        end

        -- End of round
        if context.end_of_round
        and context.cardarea == G.jokers
        and not context.blueprint
        and not context.repetition then

            card.ability.extra.rounds_left =
                card.ability.extra.rounds_left - 1

            -- Larry causes trouble every round
            if #G.jokers.cards > 1 then
                G.jokers:shuffle()
            end

            ease_dollars(-5)

            -- After 4 rounds, remove Eternal
            if card.ability.extra.rounds_left <= 0 then
                card:set_eternal(false)

                return {
                    message = "wait i was joking I WAS JOKING DUDE PLEASE DONT."
                }
            else
                return {
                    message = tostring(card.ability.extra.rounds_left)
                }
            end
        end
    end
}
SMODS.Atlas {
    key = "Cheese Joker",
    path = "Cheese Joker.png", -- put this in assets/1x and/or 2x
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "cheese_joker",
    loc_txt = {
        name = "Cheese",
        text = {
            "Gives {C:mult}+10{} Mult"
        }
    },
    atlas = "Cheese Joker",
    pos = {x = 0, y = 0},
    cost = 3,
    rarity = 1,
    pools = { ["Joker"] = true, ["Brunotomodaddition"] = true },

    in_pool = function()
        return true
    end,

    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = 10 }
        end
    end
}
SMODS.Atlas {
    key = "Overclocker",
    path = "Overclocker.png", -- put this in assets/1x and/or 2x
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "overclocker",

    loc_txt = {
        name = "Overclocker",
        text = {
            "Retrigger a random Joker",
            "1 in 3 chance to disable it",
            "{C:inactive}Too much power...{}"
        }
    },

    atlas = "Overclocker",
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then

            local jokers = G.jokers.cards
            if #jokers <= 1 then return end

            local target = pseudorandom_element(jokers, pseudoseed("overclock"))

            if target and target ~= card then

                -- 1/3 chance to break it
                if pseudorandom(pseudoseed("overclock_break")) < 0.33 then
                    target:set_debuff(true)

                    return {
                        message = "OVERLOAD"
                    }
                end

                return {
                    message = "OVERCLOCK",
                    repetitions = 1,
                    card = target
                }
            end
        end
    end
}
SMODS.Atlas { 
    key = "rabbitstvparty",
    path = "rabbitstvparty.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "rabbidstvparty",

    loc_txt = {
        name = "Rabbids TV Party",
        text = {
            "Each hand triggers a random effect",
            "BWAHHHH!!!"
        }
    },

    atlas = "rabbitstvparty",
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then

            local roll = pseudorandom(pseudoseed("rabbids"))

            if roll < 0.2 then
                return { message = "BWAHH!", multiplier = 2 }
            elseif roll < 0.4 then
                return { message = "BWAHH!", chips = 75 }
            elseif roll < 0.6 then
                return { message = "BWAHH!", dollars = 5 }
            elseif roll < 0.8 then
                return {
                    message = "CHANNEL SWITCH!",
                    repetitions = 1
                }
            else
                -- troll effect
                local target = pseudorandom_element(G.jokers.cards, pseudoseed("rabbids_debuff"))
                if target then
                    target:set_debuff(true)
                    return { message = "Blah?" }
                end
            end

        end
    end
}
SMODS.Atlas { 
    key = "ena1",
    path = "ena1.png", -- ORIGINAL ENA sprite
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "ena1",

    loc_txt = {
        name = "ENA",
        text = {
            "Alternates between effects each hand",
            "Happy... Sad..."
        }
    },

    atlas = "ena1",
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    config = { state = 0 }, -- 0 = happy, 1 = sad

    calculate = function(self, card, context)
        if context.joker_main then

            if card.ability.state == 0 then
                -- 🟡 HAPPY
                card.ability.state = 1
                return {
                    message = "Ahh.. Auction Day!",
                    multiplier = 2
                }

            else
                -- 🔵 SAD / GLITCH
                card.ability.state = 0

                local roll = pseudorandom(pseudoseed("ena1"))

                if roll < 0.5 then
                    return {
                        message = "I Wanna go home..",
                        chips = 60
                    }
                else
                    local target = pseudorandom_element(G.jokers.cards, pseudoseed("ena1_debuff"))
                    if target then
                        target:set_debuff(true)
                        return {
                            message = "&B=678A8g)%yi(sjfi)iA&E0!U1RUUUNRAPUIENASADFS6(P938Q080T&%#$u)432Q68T28T678i6tei"
                        }
                    end
                end
            end

        end
    end
}
SMODS.Atlas { 
    key = "ena2",
    path = "ena2.png", -- DREAM BBQ sprite
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "ena2",

    loc_txt = {
        name = "ENA (Dream BBQ)",
        text = {
            "Alternates between Meanie and Salesman",
            "Make a deal..."
        }
    },

    atlas = "ena2",
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 4,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    config = { state = 0 }, -- 0 = Meanie, 1 = Salesman

    calculate = function(self, card, context)
        if context.joker_main then

            if card.ability.state == 0 then
                -- 😡 MEANIE (aggressive / risky)
                card.ability.state = 1

                local target = pseudorandom_element(G.jokers.cards, pseudoseed("ena2_meanie"))

                if target then
                    target:set_debuff(true)
                end

                return {
                    message = "YOU'RE NOT FOOLING ANYONE FRAUD!",
                    multiplier = 3
                }

            else
                -- 💼 SALESMAN (value / economy)
                card.ability.state = 0

                return {
                    message = "hmm thats infaccurate",
                    dollars = 8
                }
            end

        end
    end
}
SMODS.Atlas { 
    key = "Lobotomy",
    path = "Lobotomy.png", -- put this in assets/1x and/or 2x
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "lobotomy",
    loc_txt = {
        name = "Lobotomy",
        text = {
            "{X:mult,C:white}X4{} Mult",
            "Disables a random Joker",
            "[random meme]"
        }
    },

    atlas = "Lobotomy",
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then

            local jokers = G.jokers.cards

            -- make sure there is another joker to disable
            if #jokers > 1 then
                local valid_targets = {}

                for i = 1, #jokers do
                    if jokers[i] ~= card then
                        valid_targets[#valid_targets + 1] = jokers[i]
                    end
                end

                if #valid_targets > 0 then
                    local target = pseudorandom_element(
                        valid_targets,
                        pseudoseed("lobotomy_target")
                    )

                    if target then
                        target:set_debuff(true)
                    end
                end
            end

            return {
                Xmult = 4,
                message = "[MEME JUMPSCARE]"
            }
        end
    end
}
SMODS.Atlas { 
    key = "SuperBooglet",
    path = "SuperBooglet.png",
    px = 71,
    py = 96
}
SMODS.Joker {
    key = "superbooglet",

    loc_txt = {
        name = "SuperBooglet",
        text = {
            "{X:mult,C:white}X3{} Mult",
            "Boss Blinds have +50% Chips",
            "{C:mult}Lap 3{} is {X:mult,C:white}TORTURE{}"
        }
    },
    atlas = "SuperBooglet",
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,
    config = { applied = false },

calculate = function(self, card, context)

    -- main effect
    if context.joker_main then
        return {
            Xmult = 3
        }
    end

    -- ONLY trigger on Boss Blind end
    if context.end_of_round and not context.repetition then
        if G.GAME.blind and G.GAME.blind.boss then
            return {
                message = "GEEET FU- [boom.]"
            }
        end
    end
end
}
SMODS.Atlas { 
    key = "pizzaface",
    path = "pizzaface.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "pizzaface",

    loc_txt = {
        name = "PizzaFace",
        text = {
            "{X:mult,C:white}X2{} Mult",
            "Random Joker becomes Debuffed each hand",
            "{C:uncommon}SuperBooglet{} is always Debuffed",
            "IT'S PIZZA TIME"
        }
    },

    atlas = "pizzaface",
    pos = {x = 0, y = 0},
    cost = 6,
    rarity = 3,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)

        if context.joker_main then

            local jokers = G.jokers.cards

            -- Random debuff each hand
            if #jokers > 1 then
                local target = pseudorandom_element(jokers, pseudoseed("pizzaface"))

                if target and target ~= card then
                    target:set_debuff(true)
                end
            end

            -- Hard counter SuperBooglet
            for _, j in ipairs(jokers) do
                if j.config.center.key == "j_brunotomod_superbooglet" then
                    j:set_debuff(true)
                end
            end

            return {
                Xmult = 2,
                message = "IT'S PIZZA TIME"
            }
        end

        -- End of blind flavor
        if context.end_of_round and not context.repetition then
            return {
                message = "RUN."
            }
        end
    end
}
SMODS.Atlas { 
    key = "catlover",
    path = "catlover.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "catlover",

    loc_txt = {
        name = "Cat Lover",
        text = {
            "{C:red}+#1#{} Mult for every other",
            "{C:attention}Cat Joker{} you have",
            "{C:inactive}(Currently {C:red}+#2#{} {C:inactive}Mult){}"
        }
    },

    atlas = "catlover",
    pos = {x = 0, y = 0},

    rarity = 1,
    cost = 4,
    pools = { ["Brunotomodaddition"] = true },

    unlocked = true,
    discovered = true,

    config = { extra = { mult = 3, multtotal = 0 }},

    -- Fixes UI values (#1# and #2#)
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.multtotal
            }
        }
    end,

    calculate = function(self, card, context)

        -- ALWAYS recalculate (this is the key fix)
        local catcount = 0

        for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card 
            and joker.config 
            and joker.config.center 
            and joker.config.center.pools 
            and joker.config.center.pools["Cat"] then

                catcount = catcount + 1
            end
        end

        card.ability.extra.multtotal = catcount * card.ability.extra.mult

        -- Only apply mult during scoring
        if context.joker_main and card.ability.extra.multtotal > 0 then
            return {
                message = "+" .. card.ability.extra.multtotal,
                mult = card.ability.extra.multtotal,
                colour = G.C.RED
            }
        end
    end
}
SMODS.Atlas { 
    key = "straycat",
    path = "straycat.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "straycat",

    loc_txt = {
        name = "Stray Cat",
        text = {
            "Gains {C:red}+1{} Mult permanently",
            "when a {C:attention}Cat Joker{} is obtained",
            "{C:inactive}Becomes your best friend when bought{}",
            "{C:inactive}(Currently {C:red}+#1#{} {C:inactive}Mult){}"
        }
    },
    atlas = "straycat",
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 5,
    pools = {
        ["Brunotomodaddition"] = true, ["Cat"] = true 
    },
    unlocked = true,
    discovered = true,
    eternal_compat = true,
    config = {
        extra = {
            mult = 0,
            last_cat_count = 0
        }
    },

    -- Make Eternal automatically
    add_to_deck = function(self, card, from_debuff)
        if card.set_eternal then
            card:set_eternal(true)
        else
            card.ability.eternal = true
        end
    end,

    -- UI vars
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)

        local cat_count = 0

        -- Count Cat Jokers
        for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card
            and joker.config
            and joker.config.center
            and joker.config.center.pools
            and joker.config.center.pools["Cat"] then

                cat_count = cat_count + 1
            end
        end

        -- Detect NEW Cat Joker obtained
        if cat_count > card.ability.extra.last_cat_count then

            local gained =
                cat_count - card.ability.extra.last_cat_count

            card.ability.extra.mult =
                card.ability.extra.mult + gained

            card.ability.extra.last_cat_count = cat_count

            return {
                message = "purr...",
                message = "Meow!",
                colour = G.C.RED
            }
        end

        -- Update stored count
        card.ability.extra.last_cat_count = cat_count

        -- Apply Mult during scoring
        if context.joker_main
        and card.ability.extra.mult > 0 then

            return {
                mult = card.ability.extra.mult,
                message = "+" .. card.ability.extra.mult
            }
        end
    end
}
SMODS.Atlas { 
    key = "deksy",
    path = "deksy.png",
    px = 168,
    py = 300
}
SMODS.Joker{
    key = "deksy",

    loc_txt = {
        name = "Deksy the Barking Cat",
        text = {
            "Retrigger all played cards",
            "if played hand contains",
            "a {C:attention}Pair{}",
            "{C:inactive}WOOF WOOF!{}"
        }
    },

    atlas = "deksy",
    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 6,

    pools = {
            ["Brunotomodaddition"] = true, ["Cat"] = true
    },

    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)

        -- Retrigger played cards
        if context.repetition
        and context.cardarea == G.play then

            local ranks = {}

            -- Count ranks in played hand
            for _, playing_card in ipairs(context.scoring_hand or {}) do

                local rank = playing_card:get_id()

                ranks[rank] = (ranks[rank] or 0) + 1
            end

            -- Detect Pair
            for _, amount in pairs(ranks) do

                if amount >= 2 then
                    return {
                        repetitions = 1,
                        message = "WOOF!"
                    }
                end
            end
        end

        -- Random bark flavor
        if context.joker_main then

            if pseudorandom(pseudoseed("deksy_bark")) < 0.25 then
                return {
                    message = "BARK BARK",
                    colour = G.C.ORANGE
                }
            end
        end
    end
}
SMODS.Atlas { 
    key = "nightcat",
    path = "nightcat.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "nightcat",
    loc_txt = {
        name = "Night Cat",
        text = {
            "{X:red,C:white}X#1#{} Mult during",
            "{C:attention}Boss Blinds{}",
            "Retrigger all {C:attention}Cat Jokers{}",
            "during Boss Blinds",
            "{C:inactive}HISSSSSSS{}"
        }
    },
    atlas = "nightcat",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 9,
    pools = {
            ["Brunotomodaddition"] = true, ["Cat"] = true
    },
    unlocked = true,
    discovered = true,
    config = {
        extra = {
            Xmult = 3
        }
    },

    -- UI variable
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)

        -- XMult during Boss Blind
        if context.joker_main
        and G.GAME.blind
        and G.GAME.blind.boss then

            return {
                Xmult = card.ability.extra.Xmult,
                message = "HISSSSS",
                colour = G.C.RED
            }
        end

        -- Retrigger Cat Jokers during Boss Blind
        if context.retrigger_joker_check
        and G.GAME.blind
        and G.GAME.blind.boss then

            for _, joker in ipairs(G.jokers.cards) do

                if joker ~= card
                and joker.config
                and joker.config.center
                and joker.config.center.pools
                and joker.config.center.pools["Cat"] then

                    return {
                        repetitions = 1,
                        message = "MEOW",
                        colour = G.C.PURPLE
                    }
                end
            end
        end
    end
}
SMODS.Atlas { 
    key = "corruptedjoker",
    path = "corruptedjoker.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "corruptedjoker",
    loc_txt = {
        name = "Corrupted Joker",
        text = {
            "Copies the ability of a",
            "random {C:attention}Joker{} every round"
        }
    },
    atlas = "corruptedjoker",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 8,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,
    config = {
        extra = {
            copied = nil,
            copied_key = "None"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.copied_key
            }
        }
    end,

    calculate = function(self, card, context)

        -- Pick random Joker at start of round
        if context.setting_blind then

            local available_jokers = {}

            for _, joker in ipairs(G.jokers.cards) do

                if joker ~= card then
                    table.insert(available_jokers, joker)
                end
            end

            if #available_jokers > 0 then

                local chosen =
                    pseudorandom_element(
                        available_jokers,
                        pseudoseed("corruptedjoker")
                    )

                card.ability.extra.copied = chosen
                card.ability.extra.copied_key =
                    chosen.config.center.key

                return {
                    message = "cannot_find_message_from_[no_directory_found!]",
                    colour = G.C.PURPLE
                }
            end
        end

        -- Copy ability
        if card.ability.extra.copied
        and card.ability.extra.copied ~= card
        and card.ability.extra.copied.config
        and card.ability.extra.copied.config.center
        and card.ability.extra.copied.config.center.calculate then

            return card.ability.extra.copied.config.center.calculate(
                card.ability.extra.copied.config.center,
                card.ability.extra.copied,
                context
            )
        end

        -- Random glitch message
        if context.joker_main then

            local glitch_messages = {
                "???.lua",
                "sdg3"
            }

            if pseudorandom(
                pseudoseed("corrupted_message")
            ) < 0.2 then

                return {
                    message = pseudorandom_element(
                        glitch_messages,
                        pseudoseed("glitch_pick")
                    ),
                    colour = G.C.PURPLE
                }
            end
        end
    end
}
SMODS.Atlas { 
    key = "cornerchair",
    path = "cornerchair.png",
    px = 284,
    py = 380
}
SMODS.Joker{
    key = "cornerchair",
    loc_txt = {
        name = "Corner Chair",
        text = {
            "This Joker gains {C:red}+#1#{} Mult for",
            "every {C:attention}King{} held in hand when",
            "only {C:attention}Queens{} and {C:attention}Jacks{} are scored",
            "{C:inactive}(Currently {C:red}+#2#{} {C:inactive}Mult){}",
            "{C:inactive}(idea by{} {C:uncommon}Dissing-a-pear{}{C:inactive}){}"
        }
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },

    atlas = "cornerchair",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 8,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,
    config = {
        extra = {
            mult_gain = 3,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)

        -- Gain Mult condition
        if context.before
        and context.scoring_hand then

            local only_qj = true
            local kings_held = 0

            -- Check scored cards
            for _, scored_card in ipairs(context.scoring_hand) do

                local id = scored_card:get_id()

                if id ~= 11 and id ~= 12 then
                    only_qj = false
                end
            end

            -- Count Kings held in hand
            if only_qj then

                for _, held_card in ipairs(G.hand.cards) do

                    if not SMODS.in_scoring(held_card, context.scoring_hand)
                    and held_card:get_id() == 13 then

                        kings_held = kings_held + 1
                    end
                end

                if kings_held > 0 then

                    local gain =
                        kings_held *
                        card.ability.extra.mult_gain

                    card.ability.extra.mult =
                        card.ability.extra.mult + gain

                    return {
                        message = "Cornered.",
                        colour = G.C.RED
                    }
                end
            end
        end

        -- Give Mult
        if context.joker_main
        and card.ability.extra.mult > 0 then

            return {
                mult = card.ability.extra.mult,
                message = "+" .. card.ability.extra.mult,
                colour = G.C.RED
            }
        end
    end
}
SMODS.Atlas { 
    key = "amenbreak",
    path = "amenbreak.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "amenbreak",
    loc_txt = {
        name = "Amen Break",
        text = {
            "Retrigger all played cards",
            "{C:attention}1{} additional time if scoring",
            "hand contains a {C:attention}Straight{}",
            "{C:inactive}breakcore gaming{}"
        }
    },
    atlas = "amenbreak",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 8,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,
    config = {
        extra = {}
    },

    calculate = function(self, card, context)

        -- Retrigger cards in Straight hands
        if context.repetition
        and context.cardarea == G.play then

            local is_straight = next(context.poker_hands["Straight"])

            if is_straight then

                return {
                    repetitions = 1,
                    message = "[breakcore]",
                    colour = G.C.BLUE
                }
            end
        end
    end
}
SMODS.Atlas { 
    key = "drivinginmycar",
    path = "drivinginmycar.png",
    px = 255,
    py = 255
}
SMODS.Joker{
    key = "drivinginmycar",

    loc_txt = {
        name = "Driving In My Car",
        text = {
            "Gains {X:mult,C:white}X#1#{} Mult every time",
            "a {C:attention}Straight{} is played",
            "Has a {C:red}1 in 10{} chance to",
            "self destruct after scoring",
            "{C:inactive}(Currently {C:red}+#2#{} {C:inactive}Mult){}"
        }
    },
        display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    atlas = "drivinginmycar",
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 7,
    pools = { ["Brunotomodaddition"] = true },
    unlocked = true,
    discovered = true,
    config = {
        extra = {
            xmult_gain = 0.1,
            xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)

        -- Gain XMult on Straight
        if context.before
        and context.scoring_name == "Straight" then

            card.ability.extra.xmult =
                card.ability.extra.xmult +
                card.ability.extra.xmult_gain

            return {
                message = "VROOOOM",
                colour = G.C.RED
            }
        end

        -- Give XMult
        if context.joker_main
        and card.ability.extra.xmult > 1 then

            return {
                Xmult = card.ability.extra.xmult,
                message = "SKRRRT",
                colour = G.C.MULT
            }
        end

        -- Random destruction
        if context.after
        and not context.blueprint then

            if pseudorandom("drivinginmycar") < 0.1 then

                G.E_MANAGER:add_event(Event({
                    func = function()

                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true

                        G.jokers:remove_card(card)
                        card:remove()

                        return true
                    end
                }))

                return {
                    message = "*crash*",
                    colour = G.C.RED
                }
            end
        end
    end
}
SMODS.Atlas {
    key = "oopygoopy",
    path = "oopygoopy.png",
    px = 259,
    py = 194
}
SMODS.Joker{
    key = "oopygoopy",
    loc_txt = {
        name = "Oopy Goopy",
        text = {
            "Played {C:attention}6s{} and {C:attention}9s{}",
            "give {C:red}+#1#{} Mult",
            "Retrigger scored {C:attention}6s{}",
            "{C:inactive}goopy mode activated{}"
        }
    },

    display_size = {
        w = 71 * 1,
        h = 75 * 1
    },

    atlas = "oopygoopy",
    rarity = 2,
    cost = 6,
    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            mult = 9
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)

        -- Give Mult to 6s and 9s
        if context.individual
        and context.cardarea == G.play then

            local id = context.other_card:get_id()

            if id == 6 or id == 9 then
                return {
                    mult = card.ability.extra.mult,
                    message = "GOOPY",
                    colour = G.C.RED
                }
            end
        end

        -- Retrigger scored 6s
        if context.repetition
        and context.cardarea == G.play then

            if context.other_card:get_id() == 6 then
                return {
                    repetitions = 1,
                    message = "OOPY",
                    colour = G.C.BLUE
                }
            end
        end
    end
}
SMODS.Atlas {
    key = "rigbythekitty",
    path = "rigbythekitty.png",
    px = 1000,
    py = 563
}
SMODS.Joker{
    key = "rigbythekitty",
    loc_txt = {
        name = "Rigby The Kitty",
        text = {
            "Played cards with",
            "{C:attention}Cat Jokers{} give",
            "{X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult){}"
        }
    },
    display_size = {
        w = 71 * 1,
        h = 75 * 1
    },
    atlas = "rigbythekitty",
    rarity = 2,
    cost = 6,
    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            xmult_gain = 0.25,
            xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)

        if context.before and not context.blueprint then

            local cat_jokers = 0

            for i = 1, #G.jokers.cards do
                local other = G.jokers.cards[i]

                if other.config.center.pools
                and other.config.center.pools["Cat"] then
                    cat_jokers = cat_jokers + 1
                end
            end

            if cat_jokers > 1 then
                card.ability.extra.xmult =
                    card.ability.extra.xmult +
                    (card.ability.extra.xmult_gain * (cat_jokers - 1))

                return {
                    message = "Meow!",
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.xmult,
                message = "X" .. card.ability.extra.xmult,
                colour = G.C.MULT
            }
        end
    end
}
SMODS.Atlas {
    key = "sylvester",
    path = "sylvester.png",
    px = 95,
    py = 84
}
SMODS.Joker{
    key = "sylvester",
    config = {
        extra = {
            xmult0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Sylvester',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X4{} Mult',
            [2] = '{C:attention}IF{}',
            [3] = 'A {C:attention}10{} Is Played.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 75 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'sylvester',
    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 10 then
                return {
                    Xmult = 4
                }
            end
        end
    end
}
SMODS.Atlas {
    key = "metro1",
    path = "metro1.png",
    px = 69,
    py = 93
}

SMODS.Joker{
    key = "metro1",

    loc_txt = {
        name = "Metro De Santiago (Linea 1)",
        text = {
            "{X:mult,C:white}X#1#{} Mult",
            "{C:green}#2# in #3#{} chance",
            "for the train to {C:red}burn{}",
            "and lose {C:money}$24{}",
            "{C:green}#4# in #5#{} chance",
            "for a {C:red}crash{}",
            "and lose {C:money}$48{}"
        }
    },

    display_size = {
        w = 71 * 1,
        h = 95 * 1
    },

    atlas = "metro1",
    rarity = 3,
    cost = 8,
    pools = { ["Brunotomodaddition"] = true, ["Chile"] = true },
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 34,
            burn_odds = 1,
            burn_total = 12,
            crash_odds = 1,
            crash_total = 24
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.burn_odds,
                card.ability.extra.burn_total,
                card.ability.extra.crash_odds,
                card.ability.extra.crash_total
            }
        }
    end,

    calculate = function(self, card, context)

        if context.joker_main then

            -- CRASH
            if pseudorandom('metro_crash') <
            (card.ability.extra.crash_odds /
            card.ability.extra.crash_total) then

                ease_dollars(-48)

                return {
                    message = "SIGMA SIGMA!",
                    colour = G.C.RED
                }
            end

            -- FIRE
            if pseudorandom('metro_fire') <
            (card.ability.extra.burn_odds /
            card.ability.extra.burn_total) then

                ease_dollars(-24)

                return {
                    message = "10-17-1! REPITO 10-17-1!",
                    colour = G.C.RED
                }
            end

            -- SUCCESS
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = "Los Dominicos.",
                colour = G.C.MULT
            }
        end
    end
}
SMODS.ObjectType({
    key = "Chile",
    default = "j_reserved_parking",
    cards = { "j_reserved_parking" },
    inject = function(self)
        SMODS.ObjectType.inject(self)
        -- insert base game food jokers
    end,
})
SMODS.Atlas{
    key = "Nikita",
    path = "Nikita.png",
    px = 1152,
    py = 1536
}

SMODS.Joker{
    key = "nikita",
    loc_txt = {
        name = "Nikita",
        text = {
            "After scoring,",
            "{C:green}1 in 4{} chance to gain",
            "{X:mult,C:white}X#1#{} Mult",
            "{C:inactive}(ZOOM ZIMM BOOOOL ZOOM){}"
        }
    },

    display_size = {
        w = 71 * 1,
        h = 97 * 1
    },
    atlas = "Nikita",
    rarity = 2,
    cost = 6,
    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },
    unlocked = true,
    discovered = true,
    pos = {x = 0, y = 0},

    config = {
        extra = {
            Xmult = 7
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and pseudorandom('nikita') < 0.25 then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = "ZOOM!",
                colour = G.C.MULT
            }
        end
    end
}
SMODS.Atlas{
    key = "Terremoto",
    path = "Terremoto.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "terremoto",
    config = {
        extra = {
            dollars0 = 54
        }
    },
    loc_txt = {
        ['name'] = 'Terremoto',
        ['text'] = {
            [1] = '{C:inactive}(you can never forget drinking this with a Empanada!){}',
            [2] = 'Gives {C:attention}$54{} Dollars.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Terremoto',
    pools = { ["Brunotomodaddition"] = true, ["Chile"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 54
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(54), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}
SMODS.Atlas{
    key = "Empanada",
    path = "Empanada.png",
    px = 71,
    py = 95
}
SMODS.Joker{ 
    key = "empanada",
    config = {
        extra = {
            chips0 = 23,
            mult0 = 12
        }
    },
    loc_txt = {
        ['name'] = 'Empanada',
        ['text'] = {
            [1] = '{C:red}12{} Mult Else {C:blue}23{} Chips IF',
            [2] = 'You Have {C:attention}Terremoto{} Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Empanada',
    pools = { ["Brunotomodaddition"] = true, ["Chile"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_brunotomod_terremoto" then 
                        return true
                    end
                end
            end)() then
                return {
                    chips = 23
                }
            else
                return {
                    mult = 12
                }
            end
        end
    end
}
SMODS.ConsumableType{
    key = 'MemeConsumableType', --consumable type key

    collection_rows = {4,5}, --amount of cards in one page
    primary_colour = G.C.GOLD, --first color
    secondary_colour = G.C.DARK_EDITION, --second color
    loc_txt = {
        collection = 'Meme', --name displayed in collection
        name = 'Meme', --name displayed in badge
        undiscovered = {
            name = 'Not Discovered Meme Card', --undiscovered name
            text = {'this is not moment for a meme card.'} --undiscovered text
        }
    },
    shop_rate = 1, --rate in shop out of 100
}
SMODS.Atlas{
    key = 'Nyan Cat',
    path = 'Nyan Cat.png',
    px = 71,
    py = 56
}

SMODS.Joker{
    key = "nyan_cat",

    config = {
        extra = {
            chips_per_cat = 20
        }
    },

    loc_txt = {
        ['name'] = 'Nyan Cat',
        ['text'] = {
            [1] = 'Gives {C:chips}+20{} Chips',
            [2] = 'for every {C:attention}Cat Joker{} owned'
        }
    },

    pos = {
        x = 0,
        y = 0
    },

    display_size = {
        w = 71,
        h = 95
    },

    cost = 6,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = 'Nyan Cat',

    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },

    calculate = function(self, card, context)

        if context.joker_main then

            local cat_count = 0

            for _, v in ipairs(G.jokers.cards) do

                if v ~= card and v.config.center.pools and v.config.center.pools["Cat"] then
                    cat_count = cat_count + 1
                end

            end

            return {
                chips = cat_count * card.ability.extra.chips_per_cat
            }
        end
    end
}
SMODS.Atlas{
    key = 'rainbowconsumablememe',
    path = 'rainbowconsumablememe.png',
    px = 71,
    py = 95
}

SMODS.Consumable{
    key = 'rainbow',
    set = 'MemeConsumableType',

    pos = { x = 0, y = 0 },

    loc_txt = {
        name = 'Rainbow',
        text = {
            [1] = 'Spawns {C:attention}Nyan Cat{}',
            [2] = 'Levels up the',
            [3] = '{C:attention}Most Played Hand{} by 5'
        }
    },

    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,

    atlas = 'rainbowconsumablememe',

    use = function(self, card, area, copier)

        local used_card = copier or card

        -- Spawn Nyan Cat
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()

                play_sound('timpani')

                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then

                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                    SMODS.add_card({
                        set = 'Joker',
                        key = 'j_brunotomod_nyan_cat'
                    })

                    G.GAME.joker_buffer = 0
                end

                used_card:juice_up(0.3, 0.5)

                return true
            end
        }))

        -- Find most-played hand
        local temp_played = 0
        local temp_order = math.huge
        local target_hand = 'High Card'

        for hand, value in pairs(G.GAME.hands) do

            if value.visible then

                if value.played > temp_played then

                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand

                elseif value.played == temp_played then

                    if value.order < temp_order then

                        temp_order = value.order
                        target_hand = hand

                    end
                end
            end
        end

        -- Level up the hand
        G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.2,
    func = function()
        play_sound('tarot1')
        card:juice_up(0.8, 0.5)
        G.TAROT_INTERRUPT_PULSE = true
        return true
    end
}))
update_hand_text(
    {sound = 'button', volume = 0.7, pitch = 0.9, delay = 0},
    {level = '+5'}
)

delay(1.3)

level_up_hand(card, target_hand, true, 5)
update_hand_text(
    {sound = 'button', volume = 0.7, pitch = 1.1, delay = 0},
    {
        handname = localize(target_hand, 'poker_hands'),
        chips = G.GAME.hands[target_hand].chips,
        mult = G.GAME.hands[target_hand].mult,
        level = G.GAME.hands[target_hand].level
    }
)
G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.9,
    func = function()
        G.TAROT_INTERRUPT_PULSE = nil
        return true
    end
}))

        return {
            message = "RAINBOOOOOOOOOOOWS",
            colour = G.C.SECONDARY_SET.Planet
        }
    end,

    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = "animatic",
    path = "Animatic.png",
    px = 71,
    py = 96
}

SMODS.Joker{
    key = "animatic",

    loc_txt = {
        name = "Animatic",
        text = {
            [1] = "{C:mult}+25{} Mult",
            [2] = "Scored cards have a",
            [3] = "{C:green}1 in 10{} chance",
            [4] = "to retrigger"
        }
    },

    config = {
        extra = {
            odds = 10,
            mult = 25
        }
    },

    pos = {x = 0, y = 0},

    cost = 8,
    rarity = 3,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "animatic",

    pools = {["Brunotomodaddition"] = true},

    calculate = function(self, card, context)

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.repetition and context.cardarea == G.play then
            if pseudorandom('animatic') < (1 / card.ability.extra.odds) then
                return {
                    repetitions = 1,
                    message = "YAY!"
                }
            end
        end
    end
}
SMODS.Atlas{
    key = "jerma985",
    path = "jerma985.png",
    px = 299,
    py = 168
}

SMODS.Joker{
    key = "jerma985",

    loc_txt = {
        name = "Jerma985",
        text = {
            [1] = "If a {C:attention}9{}, {C:attention}8{} or {C:attention}5{}",
            [2] = "is played, give {C:mult}+9{} Mult"
        }
    },

    display_size = {
        w = 71,
        h = 95
    },

    pos = { x = 0, y = 0 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "jerma985",
    pools = {
        ["Brunotomodaddition"] = true
    },

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and context.other_card then

            local id = context.other_card:get_id()

            if id == 9 or id == 8 or id == 5 then
                return {
                    mult = 9
                }
            end

        end

    end
}
SMODS.Atlas{
    key = "Moai",
    path = "Moai.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "moai",

    config = {
        extra = {
            mult = 0
        }
    },

    loc_txt = {
        name = "Moai",
        text = {
            [1] = "Gains {C:mult}+10{} Mult",
            [2] = "when a {C:attention}Stone Card{} is scored",
            [3] = "{C:inactive}(Currently +#1# Mult){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    pos = {
        x = 0,
        y = 0
    },

    display_size = {
        w = 71,
        h = 95
    },

    cost = 6,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "Moai",

    pools = {
        ["Brunotomodaddition"] = true
    },

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and context.other_card then

            if SMODS.has_enhancement(context.other_card, "m_stone") then

                card.ability.extra.mult = card.ability.extra.mult + 10

                return {
                    message = "🗿"
                }
            end

        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

    end
}
SMODS.Atlas{
    key = "sun",
    path = "sun.png",
    px = 126,
    py = 186
}

SMODS.Consumable{
    key = "sun",
    set = "Planet",

    atlas = "sun",
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "Sun",
        text = {
            [1] = "Levels up",
            [2] = "{C:attention}Three of a Kind{}",
            [3] = "by {C:attention}3{} levels"
        }
    },

    cost = 3,

    unlocked = true,
    discovered = true,

    use = function(self, card, area, copier)

        local hand = "Three of a Kind"

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))

        update_hand_text(
            {delay = 0},
            {mult = '+', StatusText = true}
        )

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))

        update_hand_text(
            {delay = 0},
            {chips = '+', StatusText = true}
        )

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))

        update_hand_text(
            {sound = 'button', volume = 0.7, pitch = 0.9, delay = 0},
            {level = '+1'}
        )

        delay(1.3)

        level_up_hand(card, hand, true, 1)

        update_hand_text(
            {sound = 'button', volume = 0.7, pitch = 1.1, delay = 0},
            {
                handname = localize(hand, 'poker_hands'),
                chips = G.GAME.hands[hand].chips,
                mult = G.GAME.hands[hand].mult,
                level = G.GAME.hands[hand].level
            }
        )

        delay(1.3)

G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.2,
    func = function()
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1 },
            {
                handname = '',
                chips = '0',
                mult = '0',
                level = ''
            }
        )
        return true
    end
}))
        return {
            message = "🌞",
            colour = G.C.SECONDARY_SET.Planet
        }
    end,

    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = "banana",
    path = "banana.png",
    px = 63,
    py = 93
}
SMODS.Consumable{
    key = "banana",
    set = "Tarot",

    atlas = "banana",
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "The Banana",
        text = {
            [1] = "Enhances up to",
            [2] = "{C:attention}2 selected cards{}",
            [3] = "into {C:attention}Banana Cards{}"
        }
    },
    display_size = {
        w = 71,
        h = 95
    },
    cost = 3,

    unlocked = true,
    discovered = true,

    config = {
        max_highlighted = 2
    },

    can_use = function(self, card)
        return #G.hand.highlighted >= 1
            and #G.hand.highlighted <= 2
    end,

    use = function(self, card, area, copier)

        for _, v in ipairs(G.hand.highlighted) do
            v:set_ability(G.P_CENTERS.m_brunotomod_bananatakeover)
        end

    end
}
-- code borrowed (& modified) from NeatoJokers by LauraOnline!!

local creditspage = {
    "Brunoto1",
    "(mod author, 100% of the work and playtesting.)",
    "",
    "Yahiamice",
    "(he inspired me to do this!!!!! and some of his code is borrowed.)"
}

SMODS.current_mod.extra_tabs = function()
    local scale = 0.5

    return {
        {
            label = "Credits",
            tab_definition_function = function()
                return {
                    n = G.UIT.ROOT,
                    config = {
                        align = "cm",
                        padding = 0.05,
                        colour = G.C.CLEAR,
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "By Brunoto1",
                                        shadow = false,
                                        scale = scale * 2,
                                        colour = G.C.BRUNOTOGREEN
                                    }
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0.1,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "Some code and assets by",
                                        shadow = false,
                                        scale = scale * 0.8,
                                        colour = G.C.INACTIVE
                                    }
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "Yahiamice",
                                        shadow = false,
                                        scale = scale,
                                        colour = G.C.YAHIPURPLE
                                    }
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0.2,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "Playtested by",
                                        shadow = false,
                                        scale = scale * 0.8,
                                        colour = G.C.INACTIVE
                                    }
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "me :)",
                                        shadow = false,
                                        scale = scale,
                                        colour = G.C.CHIPS
                                    }         
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "Special Thanks To:",
                                        shadow = false,
                                        scale = scale,
                                        colour = G.C.INACTIVE
                                                                            }
                                }
                            }
                        },

                        {
                            n = G.UIT.R,
                            config = {
                                padding = 0,
                                align = "cm"
                            },
                            nodes = {
                                {
                                    n = G.UIT.T,
                                    config = {
                                        text = "YOU!",
                                        shadow = false,
                                        scale = scale * 1,
                                        colour = G.C.MONEY
                                    }
                                }
                            }
                        }
                    }
                }
            end
        }
    }

end
--this is just for the credits.
G.C.YAHIPURPLE = HEX("d342fe")
--smart code end
SMODS.Atlas{
    key = "moon",
    path = "moon.png",
    px = 71,
    py = 96
}

SMODS.Joker{
    key = "moon",

    config = {
        extra = {
            xmult = 1
        }
    },

    loc_txt = {
        name = "Moon",
        text = {
            [1] = "Gives {X:mult,C:white}X#1#{} Mult",
            [2] = "for each other",
            [3] = "{C:attention}Cat Joker{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    pos = {
        x = 0,
        y = 0
    },

    display_size = {
        w = 71,
        h = 96
    },

    cost = 7,
    rarity = 3,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "moon",

    pools = {
        ["Brunotomodaddition"] = true,
        ["Cat"] = true
    },

    calculate = function(self, card, context)

        local cat_count = 0

        for _, v in ipairs(G.jokers.cards) do
            if v ~= card and v.config.center.pools and v.config.center.pools["Cat"] then
                cat_count = cat_count + 1
            end
        end

        card.ability.extra.xmult = 1 + (0.5 * cat_count)

        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult,
                message = "moon"
            }
        end
    end
}
SMODS.Atlas{
    key = "suspiciouscat",
    path = "suspiciouscat.png",
    px = 71,
    py = 96
}

SMODS.Joker{
    key = "suspiciouscat",

    loc_txt = {
        name = "Suspicious Cat",
        text = {
            [1] = "Gives {X:mult,C:white}X1.5{} Mult",
            [2] = "if your scoring hand",
            [3] = "contains exactly {C:attention}1 Ace{}"
        }
    },

    pos = {
        x = 0,
        y = 0
    },

    display_size = {
        w = 71,
        h = 95
    },

    cost = 5,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "suspiciouscat",

    pools = {
        ["Brunotomodaddition"] = true,
        ["Cat"] = true
    },

    calculate = function(self, card, context)

        if context.joker_main then

            local ace_count = 0

            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == 14 then
                    ace_count = ace_count + 1
                end
            end

            if ace_count == 1 then
                return {
                    Xmult = 1.5,
                    message = "what u doing"
                }
            end

        end
    end
}
SMODS.Atlas{
    key = "catjokerboosterpacks1",
    path = "catjokerboosterpacks1.png",
    px = 71,
    py = 95
}
SMODS.Booster {
    key = 'catjokersboosterpack1',
    loc_txt = {
        name = "Cat Jokers Booster Packs!!!!!",
        text = {
            [1] = 'Haves {C:blue}7{} {C:attention}Cat Jokers{} And You',
            [2] = 'Can Choose {C:hearts}1.{}'
        },
        group_name = "Adopt One Of These Cats."
    },
    config = { extra = 7, choose = 1 },
    atlas = "catjokerboosterpacks1",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Cat",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "brunotomod_cat_jokers_booster_pack_1"
        }
    end,
ease_background_colour = function(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.BRUNOTOGREEN)

    ease_background_colour{
        new_colour = G.C.YAHIPURPLE,
        special_colour = G.C.BRUNOTOORANGE,
        contrast = 2
    }
end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
--new colors just dropped
G.C.BRUNOTOWATERMELONGREEN = HEX("06d6a0")
G.C.BRUNOTOWATERMELONYELLOW = HEX("ffd166")
SMODS.Atlas{
    key = "bananatakeover",
    path = "bananatakeover.png",
    px = 71,
    py = 95
}
SMODS.Enhancement {
    key = 'bananatakeover',
    pos = { x = 0, y = 0 },
    config = {
        mult = 4
    },
    loc_txt = {
        name = 'Banana Takeover',
        text = {
            [1] = 'If card is held in hand a random Joker is',
            [2] = 'Converted into {C:attention}banana.{} {C:red}+10{} Mult if Played.'
        }
    },
    atlas = 'bananatakeover',
    any_suit = false,
    replace_base_card = true,
    no_rank = false,
    no_suit = true,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            local destructable_jokers = {}
            for i, joker in ipairs(G.jokers.cards) do
                if not joker.ability.eternal and not joker.getting_sliced then
                    table.insert(destructable_jokers, joker)
                end
            end
            local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker_enhanced')) or nil
            
            if target_joker then
                target_joker.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                        return true
                    end
                }))
            end
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_gros_michel' })
                        if joker_card then
                            
                            
                        end
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
            return {
                message = "Destroyed Joker!",
                extra = {
                    message = created_joker and localize('k_plus_joker') or nil,
                    colour = G.C.BLUE
                }
            }
        end
    end
}
SMODS.Atlas{
key = "homeworkjoker",
path = "homeworkjoker.png",
px = 71,
py = 95
}
SMODS.Joker{
key = "homework",
loc_txt = {
    name = "Homework",
    text = {
        "If played hand contains a",
        "{C:attention}10{}, gain {C:mult}+4{} Mult",
        "If played hand contains a",
        "{C:attention}3{}, gain {C:chips}+2{} Chips"
    }
},
atlas = "homeworkjoker",
pos = {x = 0, y = 0},
rarity = 1,
cost = 4,
unlocked = true,
discovered = true,
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
pools = { ["Brunotomodaddition"] = true },

calculate = function(self, card, context)

    if context.joker_main then

        local mult = 0
        local chips = 0

        for _, played_card in ipairs(context.scoring_hand) do

            if played_card:get_id() == 10 then
                mult = mult + 4
            end

            if played_card:get_id() == 3 then
                chips = chips + 2
            end

        end

        return {
            mult = mult,
            chips = chips
        }
    end
end
}
SMODS.Atlas{
key = "ratatingaming",
path = "ratatingaming.png",
px = 71,
py = 71
}
SMODS.Joker{
key = "ratatin_gaming",
loc_txt = {
    name = "Ratatin Gaming",
    text = {
        "Gains {C:mult}+2{} Mult",
        "whenever a hand is played",
        "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult){}"
    }
},
atlas = "ratatingaming",
pos = {x = 0, y = 0},
rarity = 1,
cost = 4,
unlocked = true,
discovered = true,
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
pools = { ["Brunotomodaddition"] = true },

config = {
    extra = {
        mult = 0
    }
},

loc_vars = function(self, info_queue, card)
    return {
        vars = {
            card.ability.extra.mult
        }
    }
end,

calculate = function(self, card, context)

    if context.before then
        card.ability.extra.mult =
            card.ability.extra.mult + 2

        return {
            message = "Upgrade!"
        }
    end

    if context.joker_main then
        return {
            mult = card.ability.extra.mult
        }
    end
end
}
SMODS.Atlas{
key = "spadespectral",
path = "spadespectral.png",
px = 63,
py = 93
}
SMODS.Consumable {
    key = 'spadessignal',
    set = 'Spectral',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Spades Signal',
        text = {
            [1] = 'Turns {C:attention}EVERY.{} card in deck',
            [2] = 'Into {C:spades}Spades{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'spadespectral',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        local _suit = Spades
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, nil, _suit))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
        return {
            message = "*signal*"
        }
    end,
    can_use = function(self, card)
        return true
    end
}
SMODS.Atlas{
    key = "catjokerboosterpacks2",
    path = "catjokerboosterpacks2.png",
    px = 71,
    py = 95
}
SMODS.Booster {
    key = 'catjokersboosterpack2',
    loc_txt = {
        name = "Cat Jokers Booster Packs!!!!!",
        text = {
            [1] = 'Haves {C:blue}7{} {C:attention}Cat Jokers{} And You',
            [2] = 'Can Choose {C:hearts}3.{}'
        },
        group_name = "Adopt One Of These Cats."
    },
    config = { extra = 7, choose = 3 },
    atlas = "catjokerboosterpacks2",
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Cat",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "brunotomod_cat_jokers_booster_pack_2"
        }
    end,
ease_background_colour = function(self)
    ease_colour(G.C.DYN_UI.MAIN, G.C.BRUNOTOORANGE)

    ease_background_colour{
        new_colour = G.C.YAHIPURPLE,
        special_colour = G.C.BRUNOTOGREEN,
        contrast = 2
    }
end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
-- Food joker pool
SMODS.ObjectType({
	key = "Food",
	default = "j_brunotomod_burger",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.Atlas{
    key = "burger",
    path = "burger.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "burger",
    loc_txt = {
        name = "Burger",
        text = {
            "{C:mult}+5{} Mult before first bite",
            "{C:chips}+3{} Chips after first bite",
            "{C:money}+$1{} before last bite",
            "Gets eaten after {C:attention}3{} rounds"
        }
    },

    config = {
        extra = {
            bites = 3
        }
    },

    atlas = "burger",
    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 5,

    unlocked = true,
    discovered = true,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    pools = {
        ["Food"] = true,
        ["Brunotomodaddition"] = true
    },

    calculate = function(self, card, context)

        -- Effects
        if context.joker_main then

            if card.ability.extra.bites == 3 then
                return {
                    mult = 5
                }

            elseif card.ability.extra.bites == 2 then
                return {
                    chips = 3
                }

            elseif card.ability.extra.bites == 1 then
                return {
                    dollars = 1
                }
            end
        end

        -- Eating
        if context.end_of_round
        and context.cardarea == G.jokers
        and not context.blueprint
        and not context.repetition then

            card.ability.extra.bites =
                card.ability.extra.bites - 1

            if card.ability.extra.bites <= 0 then

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = "Eaten!"
                }
            end

            return {
                message = "Yum!"
            }
        end
    end
}
SMODS.Atlas{
    key = "brunotomodboosterpack1",
    path = "brunotomodboosterpack1.png",
    px = 71,
    py = 95
}
SMODS.Booster {
    key = 'brunotomod_booster_pack',
    loc_txt = {
        name = "Brunotomod Booster Pack!",
        text = {
            [1] = '{C:red}5{} {C:uncommon}Brunotomod{} Jokers',
            [2] = 'Choose {C:money}3.{}'
        },
        group_name = "Brunotomod Booster Pack!!!"
    },
    config = { extra = 5, choose = 2 },
    atlas = "brunotomodboosterpack1",
    pos = { x = 0, y = 0 },
    kind = 'Brunotomod',
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Brunotomodaddition",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "brunotomod_booster_pack_1"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.YAHIPURPLE)
        ease_background_colour({ new_colour = G.C.BRUNOTOORANGE, special_colour = G.C.BRUNOTOGREEN, contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
SMODS.Shader({ key = 'evil', path = 'evil.fs' })
SMODS.Edition{
    key = "evil",

    unlocked = true,
    discovered = true,

    shader = "evil",

    loc_txt = {
        name = "Evil",
        label = "Evil",
        text = {
            "{C:mult}-20{} Mult",
            "Lose {C:money}$3{}",
            "at end of round."
        }
    },

    config = {
        mult = -20
    },

    in_shop = true,
    weight = 2,
    extra_cost = -2,

    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,

    calculate = function(self, card, context)
        if context.end_of_round
        and context.cardarea == G.jokers
        and not context.blueprint
        and not context.repetition then
            ease_dollars(-3)

            return {
                message = "Evil."
            }
        end
    end
}
SMODS.Achievement{
    key = "ach_damedane",

    atlas = "brunotoawards",

    loc_txt = {
        name = "Dame Da Ne",
        description = {
            "Create 10",
            "Negative Jokers",
            "using Dame Dane",
            "in a single run."
        }
    },

    unlock_condition = function(self, args)
        if args.type == "damedane" then
            return args.count >= 10
        end
        return false
    end
}
SMODS.Atlas{
    key = "damedane",
    path = "damedane.png",
    px = 71,
    py = 96
}

SMODS.Joker{
    key = "damedane",

    unlocked = true,
    discovered = true,

    loc_txt = {
        name = "Dame Dane",
        text = {
            "After defeating",
            "a {C:attention}Boss Blind{},",
            "create a random",
            "{C:dark_edition}Negative{} Joker.",
            "{C:inactive}Dame da ne...{}"
        }
    },

    atlas = "damedane",
    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 5,

    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    pools = {
        ["Brunotomodaddition"] = true
    },

    calculate = function(self, card, context)

        if context.end_of_round
        and context.cardarea == G.jokers
        and not context.blueprint
        and not context.repetition
        and G.GAME.blind
        and G.GAME.blind.boss then

            local joker = SMODS.add_card{
                set = "Joker",
                area = G.jokers
            }

            if joker then
                joker:set_edition("e_negative", true)
            end

            G.GAME.damedane_negatives = (G.GAME.damedane_negatives or 0) + 1

            check_for_unlock({
            type = "ach_damedane",
            count = G.GAME.damedane_negatives
          })
            return {
                message = "Dame da ne..."
            }
        end
    end
}
SMODS.Atlas{
    key = "brunotoawards",
    path = "brunotoawards.png",
    px = 170,
    py = 213
}
SMODS.Atlas{
key = "randomcat",
path = "randomcat.png",
px = 106,
py = 183
}
SMODS.Joker{
key = "randomcat",
loc_txt = {
    name = "Random Cat",
    text = {
        "maw"
    }
},

config = {
    extra = {
        mode = 1
    }
},
    display_size = {
        w = 71 * 1, 
        h = 97 * 1
    },
atlas = "randomcat",
pos = {x = 0, y = 0},

rarity = 2,
cost = 5,

unlocked = true,
discovered = true,

blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,

pools = {
    ["Cat"] = true,
    ["Brunotomodaddition"] = true
},

calculate = function(self, card, context)

    if context.end_of_round
    and not context.blueprint
    and not context.repetition then

        card.ability.extra.mode =
            math.floor(pseudorandom("randomcat") * 4) + 1

        if pseudorandom("randomcat_eat") < 0.5 then

            local victims = {}

            for _, v in ipairs(G.jokers.cards) do
                if v ~= card then
                    victims[#victims + 1] = v
                end
            end

            for _, v in ipairs(G.consumeables.cards) do
                victims[#victims + 1] = v
            end

            for _, v in ipairs(G.playing_cards) do
                victims[#victims + 1] = v
            end

            if #victims > 0 then

                local victim =
                    pseudorandom_element(
                        victims,
                        pseudoseed("randomcat_eat")
                    )

                victim:start_dissolve()

                card.ability.extra.mode = 1

                return {
                    message = "MAW!"
                }
            end
        end

        local messages = {
            [1] = "Maw.",
            [2] = "+10 Mult",
            [3] = "+50 Chips",
            [4] = "X2 Mult"
        }

        return {
            message = messages[card.ability.extra.mode]
        }
    end

    if context.joker_main then

        if card.ability.extra.mode == 2 then
            return {
                mult = 10
            }

        elseif card.ability.extra.mode == 3 then
            return {
                chips = 50
            }

        elseif card.ability.extra.mode == 4 then
            return {
                Xmult = 2
            }
        end
    end
end
}
SMODS.Achievement({
    key = "ach_isthat",
    loc_txt = { name = "is that yahamouse",
        description = {"Obtain yahiamouse"
}
    },
    order = 6,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "brunotoawards",
    unlock_condition = function(self, args)
      if args.type == "ach_isthat" then return true end
    end,
})
SMODS.Atlas{
    key = "Yahiamice",
    path = "Yahiamice.png",
    px = 138,
    py = 186
}

SMODS.Joker{
    key = "yahiamice",

    loc_txt = {
        name = "Yahiamice",
        text = {
            "Gives {C:mult}+#1#{} Mult",
            "for every {C:attention}3{} played"
        }
    },

    config = {
        extra = {
            mult_per_three = 7
        }
    },

    atlas = "Yahiamice",

    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},

    rarity = 3,
    cost = 24,

    unlocked = true,
    discovered = true,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    pools = {
        ["Brunotomodaddition"] = true
    },

    loc_vars = function(self, info_queue, card)

        local threes = 1

        if G and G.hand and G.hand.highlighted then
            threes = 0

            for _, v in ipairs(G.hand.highlighted) do
                if v:get_id() == 3 then
                    threes = threes + 1
                end
            end

            if threes == 0 then
                threes = 1
            end
        end

        return {
            vars = {
                threes * card.ability.extra.mult_per_three
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        check_for_unlock({type = "ach_isthat"})
    end,

    calculate = function(self, card, context)

        if context.joker_main then

            local threes = 0

            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == 3 then
                    threes = threes + 1
                end
            end

            if threes > 0 then

                local mult = threes * card.ability.extra.mult_per_three

                return {
                    mult = mult,
                    message = "+" .. mult
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == "ach_isthat" then
            unlock_card(self)
        end
    end
}
SMODS.Font{
    key = "sans",
    path = "Comic Sans MS Bold.ttf",

    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.83,
    TEXT_OFFSET = {x = 0, y = 0},
    FONTSCALE = 0.1,
    squish = 1,
    DESCSCALE = 1
}
SMODS.Atlas{
    key = "loljoker",
    path = "loljoker.png",
    px = 69,
    py = 93
}
SMODS.Joker{
    key = "loljoker",

    loc_txt = {
        name = "LOL!!",
        text = {
            "{C:inactive}lol.{}",
            "{C:mult}+4{} Mult",
            "and {C:chips}+1{} Chips"
        }
    },

    config = {
        extra = {
            mult = 4,
            chips = 1
        }
    },

    atlas = "loljoker",

    pos = {x = 0, y = 0},

    rarity = 3,
    cost = 9,

    unlocked = true,
    discovered = true,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    pools = {
        ["Brunotomodaddition"] = true,
        ["Meme"] = true
    },

    check_for_unlock = function(self, args)
        if args.type == "hi_im_a_joker_unlocker" then
            unlock_card(self)
        end
        unlock_card(self)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                message = "lol.",
                colour = G.C.MULT
            }
        end
    end
}
SMODS.Atlas{
    key = "sans",
    path = "sans.png",
    px = 69,
    py = 93
}
SMODS.Joker{
key = "sans",
loc_txt = {
    name = "{f:brunotomod_sans}sans.",
    text = {
        "{f:brunotomod_sans}heya.",
        "{f:brunotomod_sans}{C:uncommon,f:brunotomod_sans}1 in 10{}{f:brunotomod_sans} chance to",
        "{f:brunotomod_sans}survive defeat.",
        "{C:inactive,f:brunotomod_sans}(you'd be surprised.)"
    }
},

atlas = "sans",
pos = {x = 0, y = 0},

rarity = 4,
cost = 20,

unlocked = true,
discovered = true,

blueprint_compat = false,
eternal_compat = true,
perishable_compat = false,

pools = {
    ["Brunotomodaddition"] = true
},
add_to_deck = function(self, card, from_debuff)

    unlock_card(G.P_CENTERS.c_brunotomod_undertale)

end,
calculate = function(self, card, context)

    if context.end_of_round
    and G.GAME.chips < G.GAME.blind.chips then

        if pseudorandom("sansdodge") < 0.1 then

            ease_dollars(-1)

            return {
                message = "MISS"
            }
        end
    end
end
}
SMODS.Font{
    key = "undertale",
    path = "PixelOperatorSC-Bold.ttf",

    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.83,
    TEXT_OFFSET = {x = 0, y = 0},
    FONTSCALE = 0.1,
    squish = 1,
    DESCSCALE = 1
}
SMODS.Atlas{
    key = "undertaleconsumablememe",
    path = "undertaleconsumablememe.png",
    px = 71,
    py = 96
}
SMODS.Consumable{
    key = "undertale",
    set = "MemeConsumableType",
    pos = {x = 0, y = 0},

    loc_txt = {
        name = "{f:brunotomod_undertale}UNDERTALE",
        text = {
            "{f:brunotomod_sans}sans."
        }
    },

    cost = 3,

    unlocked = false,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,

    atlas = "undertaleconsumablememe",

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)

        SMODS.add_card{
            key = "j_brunotomod_sans"
        }

    end
}
SMODS.Atlas{
    key = "trolljoker",
    path = "trolljoker.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "trolljoker",
    loc_txt = {
    name = "Troll Joker",
    text = {
        "At end of round,",
        "does something random.",
        "{C:inactive}(good luck)"
    }
},

config = {
    extra = {
        mult = 0,
        chips = 0
    }
},

atlas = "trolljoker",
pos = {x = 0, y = 0},

rarity = 2,
cost = 6,

unlocked = true,
discovered = true,

blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,

pools = {
    ["Brunotomodaddition"] = true,
    ["Meme"] = true
},

loc_vars = function(self, info_queue, card)
    return {
        vars = {
            card.ability.extra.mult,
            card.ability.extra.chips
        }
    }
end,

calculate = function(self, card, context)

    if context.end_of_round
    and not context.blueprint
    and not context.repetition then

        local roll = pseudorandom("trolljoker", 1, 5)

        if roll == 1 then

            ease_dollars(10)

            return {
                message = "+$10"
            }

        elseif roll == 2 then

            ease_dollars(-5)

            return {
                message = "-$5"
            }

        elseif roll == 3 then

            card.ability.extra.mult =
                card.ability.extra.mult + 10

            return {
                message = "+10 Mult"
            }

        elseif roll == 4 then

            card.ability.extra.chips =
                card.ability.extra.chips + 50

            return {
                message = "+50 Chips"
            }

        elseif roll == 5 then

            card:start_dissolve()

            return {
                message = "trolled lol"
            }

        end
    end

    if context.joker_main then

        return {
            mult = card.ability.extra.mult,
            chips = card.ability.extra.chips
        }

    end
end
}
SMODS.Font{
    key = "freaky",
    path = "Freaky Font.ttf",
    
    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.83,
    TEXT_OFFSET = {x = 0, y = 0},
    FONTSCALE = 0.1,
    squish = 1,
    DESCSCALE = 1
}
SMODS.Sound({key = "jabibinoise", path = "jabibinoise.ogg",})
SMODS.Atlas{
key = "jabibixd",
path = "jabibixd.png",
px = 69,
py = 93
}

SMODS.Joker{
key = "jabibixd",

loc_txt = {
    name = "Jabibixd",
    text = {
        "{C:inactive}group chat name has been changed to the {f:brunotomod_freaky,C:inactive}freaky{} {C:inactive}Chat{}",
        "{C:mult}+13{} Mult",
        "{C:chips}+69{} Chips"
    }
},

config = {
    extra = {
        mult = 13,
        chips = 69
    }
},

atlas = "jabibixd",
pos = {x = 0, y = 0},

rarity = 2,
cost = 7,

unlocked = true,
discovered = true,

blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,

pools = {
    ["Brunotomodaddition"] = true,
    ["Meme"] = true
},

calculate = function(self, card, context)
    if context.joker_main then

        play_sound("brunotomod_jabibinoise")

        return {
            mult_mod = card.ability.extra.mult,
            chip_mod = card.ability.extra.chips,
            message = "*rage*"
        }

    end
end
}
SMODS.Atlas{
    key = "gibberesh",
    path = "gibberesh.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "gibberesh",
    loc_txt = {
        name = "Gibberesh",
        text = {
           "hukhighuia",
           "{C:red}+fs{}adsbadsasdfdsa",
           "junksasfeadnyfb" 
        }
    },

    config = {
        extra = {
            mult = 619
        }
    },
    
    atlas = "gibberesh",
    pos = {x = 0, y = 0},

    rarity = 4,
    cost = 42,

    unlocked = true,
    discovered = true,

    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    pools = { ["Brunotomodaddition"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 619
            }
        end
    end
}
SMODS.Atlas{
    key = "mawjoker",
    path = "maw.png",
    px = 498,
    py = 429
}
SMODS.Joker{
    key = "maw",
    loc_txt = {
        name = "maw",
        text = {
            "{X:mult,C:white}X12{} Mult."
        }
    },
    display_size = {
        w = 71 * 1,
        h = 71 * 1
    },

    pos = {x = 0, y = 0},
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "mawjoker",
    pools = { ["Brunotomodaddition"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = 12
            }
        end
    end
}
SMODS.Font{
    key = "tf2font",
    path = "TF2Build.ttf",
    
    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.83,
    TEXT_OFFSET = {x = 0, y = 0},
    FONTSCALE = 0.1,
    squish = 1,
    DESCSCALE = 1
}
SMODS.Atlas{
    key = "spyjokertf2",
    path = "spyjokertf2.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "spytf2",

    loc_txt = {
        name = "Spy TF2",
        text = {
            "{f:brunotomod_tf2font,C:blue}That could be your mother!{}",
            "{C:red}Copies{} the ability of",
            "{C:attention}1 random Joker.{}"
        }
    },

    atlas = "spyjokertf2",
    pos = {x = 0, y = 0},

    rarity = 3,
    cost = 4,

    unlocked = true,
    discovered = true,

    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    pools = {
        ["Brunotomodaddition"] = true,
        ["Meme"] = true
    },

    calculate = function(self, card, context)

        if context.blueprint then
            return
        end

        local possible_jokers = {}

        for _, joker in ipairs(G.jokers.cards) do
            if joker ~= card then
                possible_jokers[#possible_jokers + 1] = joker
            end
        end

        if #possible_jokers == 0 then
            return
        end

        local target = pseudorandom_element(
            possible_jokers,
            pseudoseed("spytf2")
        )

        if target and target.config.center.calculate then

            local result =
                target.config.center:calculate(target, context)

            if result then
                result.message = "INTRUDER ALERT!"
                return result
            end
        end
    end
}
SMODS.Achievement({
    key = "ach_ytp",
    loc_txt = { name = "Youtube PooP",
        description = {"Obtain the Youtube PooP Joker."
}
    },
    order = 6,
    bypass_all_unlocked = true,
    hidden_name = true,
    atlas = "brunotoawards",
    unlock_condition = function(self, args)
      if args.type == "ach_ytp" then return true end
    end,
})
SMODS.Atlas{
    key = "ytp",
    path = "ytp.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "ytp",
    loc_txt = {
        name = "YTP",
        text = {
            "{C:inactive}Where there's smoke they pinch back!{}",
            "{X:mult,C:white}X#1#{} Mult",
            "if a {C:attention}2{} Is Played"
        }
    },
    
    config = {
        extra = {
            Xmult_per_two = 2
        }
    },
    atlas = "ytp",

    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 12,

    unlocked = true,
    discovered = true,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    pools = { ["Brunotomodaddition"] = true, ["Meme"] = true },

    loc_vars = function(self, info_queue, card)

        local twos = 1

        if G and G.hand and G.hand.highlighted then
            twos = 0

            for _, v in ipairs(G.hand.highlighted) do
                if v:get_id() == 2 then
                    twos = twos + 1
                end
            end

            if twos == 0 then
                twos = 1
            end
        end

        return{
            vars = {
                twos * card.ability.extra.Xmult_per_two
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        check_for_unlock({type = "ach_ytp"})
    end,

    calculate = function(self, card, context)

        if context.joker_main then

            local twos = 0

            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == 2 then
                    twos = twos + 1
                end
            end

            if twos > 0 then

                local Xmult = twos * card.ability.extra.Xmult_per_two

                return{
                    Xmult = Xmult,
                    message = "X" .. Xmult
                }
            end
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == "ach_ytp" then
            unlock_card(self)
        end
    end
}
SMODS.Sound({key = "mariopaintmeow", path = "mariopaintmeow.ogg",})
-- cardboardbox
SMODS.Atlas{
    key = "cardboardbox",
    path = "cardboardbox.png",
    px = 63,
    py = 93
}
SMODS.Consumable({
    key = "brunotomod_cardboardbox",
    set = "Tarot",
    object_type = "Consumable",
    loc_txt = {
        name = "Cardboard box",
        text={
        "Creates a random",
        "{C:attention}Cat Joker{}",
        "{C:inactive}(must have room){}",
        },
    },
	
	
	pos = {x = 0, y = 0},
	order = 99,
	atlas = "cardboardbox",
    unlocked = true,
    discovered = true,
    cost = 4,

    use = function(self, card, area, copier)
        local card = create_card("Cat", G.Jokers, nil, nil, nil, nil, nil, 'cardboardbox')
        card:add_to_deck()
        G.jokers:emplace(card)
        play_sound("brunotomod_mariopaintmeow")
    end,

    can_use = function(self, card)
        if #G.jokers.cards < G.jokers.config.card_limit then
            return true
        end
	end
})
SMODS.Atlas{
    key = 'npcstare',
    path = 'npcstare.png',
    px = 71,
    py = 96,
}
SMODS.Joker{
    key = 'npcstare',

    loc_txt = {
        name = 'NPC Stare',
        text = {
            "It didn't do anything."
        }
    },

    atlas = 'npcstare',
    rarity = 2,
    cost = 5,

    pools = { ["Brunotomodaddition"] = true },

    pixel_size = { w = 71, h = 96 },
    frame = 0,

    unlocked = true,
    discovered = true,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    pos = {x = 0, y = 0},

    config = { extra = {} },

    calculate = function(self, card, context)
        return nil
    end
}
SMODS.Atlas{ --raxdflipnote
    key = 'raxdjoker',
    path = 'raxdjoker.png',
    px = 71,
    py = 96,
}
SMODS.Joker {
    key = "raxdjoker",

    loc_txt = {
        name = "raxdjoker",
        text = {
            "When playing a hand,",
            "{C:green}50%{} chance to gain",
            "{X:mult,C:white}X2{} Mult",
            "{C:inactive}RAXD FLIP!!!{}"
        }
    },

    rarity = 2,
    cost = 6,

    unlocked = true,
    discovered = true,

    atlas = "raxdjoker",
    pos = { x = 0, y = 0 },
    pools = { ["Brunotomodaddition"] = true },

    config = {
        extra = {
            chance = 0.5,
            xmult = 2,
            frame = 0,
            timer = 0
        }
    },
    --coin flip thing
    calculate = function(self, card, context)
        if context.joker_main then
            if math.random() < card.ability.extra.chance then
                return {
                    xmult = card.ability.extra.xmult,
                    message = "RAXD FLIP!",
                    colour = G.C.GREEN
                }
            else
                return {
                    message = "no flip :(",
                    colour = G.C.RED
                }
            end
        end
    end,

    update = function(self, card, dt)
        if not card.children or not card.children.center then return end
        if not card.ability then return end

        local e = card.ability.extra

        e.timer = e.timer + dt

        if e.timer >= 0.12 then
            e.timer = 0

            e.frame = (e.frame + 1) % 4

            --please work i hope it works
            card.children.center:set_sprite_pos({
                x = e.frame,
                y = 0
            })
        end
    end
}
SMODS.Atlas{
    key = "pepethefrog",
    path = "pepethefrog.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "pepethefrog",
    loc_txt = {
        name = "Pepe The Frog",
        text = {
            "{X:mult,C:white}X9{} Mult"
        }
    },

    atlas = "pepethefrog",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    pools = { ["Brunotomodaddition"] = true },
    config = {
        extra = {
            xmult = 9
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
                return {
                    xmult = card.ability.extra.xmult,
                    message = "X9 Mult",
                    colour = G.C.MULT
                }
            end
        end            
}
SMODS.Joker {
    key = 'schrodinger',
    loc_txt = {
        name = "Schrödinger's Joker",
        text = { "{X:mult,C:white} X5 {} Mult.", "Has a {C:green}50%{} chance to {C:red}delete{}", "your highest scoring card", "before it scores." }
    },
    atlas = "pepethefrog",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    pools = { ["Brunotomodaddition"] = true },
    
    calculate = function(self, card, context)
        -- 1. X5 Mult scoring hook
        if context.joker_main then
            return {
                message = 'X' .. card.ability.extra.Xmult .. ' Mult',
                Xmult_mod = card.ability.extra.Xmult
            }
        end

        -- 2. Deletion hook before scoring triggers
        if context.before and not context.blueprint then
            if pseudorandom('schrodinger') < 0.5 then
                local highest_card = nil
                for _, scoring_card in ipairs(context.scoring_hand) do
                    if not highest_card or scoring_card.base.nominal > highest_card.base.nominal then
                        highest_card = scoring_card
                    end
                end
                
                if highest_card then
                    G.E_MAIN:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            card_eval_status_text(card, 'extra', {message = "Collapsed!", colour = G.C.RED})
                            highest_card:start_dissolve()
                            return true
                        end
                    }))
                end
            end
        end
    end
}
SMODS.Atlas{
    key = "noimnotdoingthissprite",
    path = "noimnotdoingthissprite.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "penis",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Penis',
        ['text'] = {
            [1] = '{C:inactive}Snoo{}{C:attention}Pingas!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'noimnotdoingthissprite',
    pools = { ["Brunotomodaddition"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end
}
SMODS.Atlas{
    key = "creeper",
    path = "creeper.png",
    px = 71,
    py = 96
}
SMODS.Joker{
    key = "creeper",

    loc_txt = {
        name = "Creeper",
        text = {
            "If a {C:attention}6{} is played,",
            "{C:red}3 in 5{} chance to {C:red}BOOM!{}",
            "Otherwise gain {C:blue}+12{} Chips",
            "If no 6 is played, gain {C:red}+12{} Mult"
        }
    },

    atlas = "creeper",
    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 6,

    unlocked = true,
    discovered = true,
    pools = { ["Brunotomodaddition"] = true },
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    config = {
        extra = {
            chips = 12,
            mult = 12
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then

            local has_six = false

            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == 6 then
                    has_six = true
                    break
                end
            end

            if has_six then
                if pseudorandom("creeper_boom") < 0.6 then

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("tarot1")
                            card:start_dissolve()
                            return true
                        end
                    }))

                    return {
                        message = "BOOM!"
                    }
                else
                    return {
                        chips = card.ability.extra.chips,
                        message = "+12 Chips",
                        colour = G.C.CHIPS
                    }
                end
            else
                return {
                    mult = card.ability.extra.mult,
                    message = "+12 Mult",
                    colour = G.C.MULT
                }
            end
        end
    end
}
SMODS.Atlas{
    key = "Pizarrin",
    path = "Pizarrin.png",
    px = 71,
    py = 95
}
SMODS.Consumable{
    key = "pizarrin",
    set = "WineXDConsumableType",

    pos = {x = 0, y = 0},
    atlas = "Pizarrin",

    cost = 3,

    loc_txt = {
        name = "Pizarrín",
        text = {
            "Creates a random",
            "{C:attention}WineXD{} Consumable"
        }
    },

    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()

                play_sound("timpani")

                SMODS.add_card({
                    set = "WineXDConsumableType"
                })

                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        delay(0.6)

        return {
            message = "JIJIJI!"
        }
    end,

    can_use = function(self, card)
        return #G.consumeables.cards < G.consumeables.config.card_limit
    end
}
SMODS.Atlas{
    key = "gnarp",
    path = "gnarp.png",
    px = 71,
    py = 95
}
SMODS.Joker{
    key = "gnarp",

    loc_txt = {
        name = "Gnarp",
        text = {
            "{C:mult}+9{} Mult",
            "If {C:attention}Cat Lover{} is present:",
            "{X:white,C:mult}X9{} Mult"
        }
    },

    config = {
        extra = {
            mult = 9,
            xmult = 9
        }
    },

    atlas = "gnarp",
    pos = {x = 0, y = 0},

    rarity = 2,
    cost = 6,

    unlocked = true,
    discovered = true,
    pools = { ["Brunotomodaddition"] = true, ["Cat"] = true },
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.joker_main then
            local has_cat_lover = false

            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.key == "j_brunotomod_catlover" then
                    has_cat_lover = true
                    break
                end
            end

            if has_cat_lover then
                return {
                    mult = card.ability.extra.mult,
                    xmult = card.ability.extra.xmult
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}
SMODS.Atlas{
    key = "zarpassucias",
    path = "zarpassucias.png",
    px = 71,
    py = 95
}
SMODS.Consumable{
    key = "zarpassucias",
    set = "WineXDConsumableType",

    pos = {x = 0, y = 0},
    atlas = "zarpassucias",

    cost = 3,

    loc_txt = {
        name = "ZarpasSucias",
        text = {
            "Enhances up to {C:attention}3{}",
            "selected cards into",
            "{C:mult}Mult Cards{}"
        }
    },

    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,

    config = {
        max_highlighted = 3
    },

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card

        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function()
                play_sound("tarot1")
                
                for i = 1, #G.hand.highlighted do
                    local highlighted = G.hand.highlighted[i]
                    highlighted:set_ability(G.P_CENTERS.m_mult, nil, true)
                    highlighted:juice_up(0.5, 0.5)
                end

                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        delay(0.6)

        return {
            message = "¡AQUI VOY!"
        }
    end
}
SMODS.Atlas{
    key = "jokerbase",
    path = "jokerbase.png",
    px = 71,
    py = 96
}

SMODS.Joker{
    key = "void",

    loc_txt = {
        name = "Void",
        text = {
            "{C:mult}+9{} Mult."
        },
    },

    config = {
        extra = {
            mult = 9
        }
    },

    atlas = "jokerbase",
    pos = {x = 0, y = 0},

    rarity = 1,
    cost = 4,

    unlocked = true,
    discovered = true,

    pools = {
        ["Brunotomodaddition"] = true
    },

    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                message = "+" .. card.ability.extra.mult .. " Mult",
                colour = G.C.MULT
            }
        end
    end
}

















--effects and stuff
SMODS.ObjectType({
    key = "Meme",
    default = "",
    cards = {},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        -- insert base game food jokers
    end,
})