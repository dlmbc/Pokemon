--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

MenuState = Class{__includes = BaseState}

function MenuState:init(stats, onClose)
    self.stats = stats
    self.onClose = onClose or function() end

    self.MenuState = Menu {
        x = 0,
        y = VIRTUAL_HEIGHT - 128,
        width = 128,
        height = 64,
        cursor = false,
        items = {
            {
                text = 'HP: ' .. stats.HPBefore .. ' + ' .. stats.HPIncrease .. ' = ' .. stats.playerPokemon.HP
            },
            {
                text = 'ATK: ' .. stats.attackBefore .. ' + ' .. stats.attackIncrease .. ' = ' .. stats.playerPokemon.attack
            },
            {
                text = 'DEF: ' .. stats.defenseBefore .. ' + ' .. stats.defenseIncrease .. ' = ' .. stats.playerPokemon.defense
            },
            {
                text = 'SPD: ' .. stats.speedBefore .. ' + ' .. stats.speedIncrease .. ' = ' .. stats.playerPokemon.speed
            }
        }
    }
end

function MenuState:update(dt)
    if love.keyboard.wasPressed('return') then
        gStateStack:pop()
        self:onClose()
    end

    self.MenuState:update(dt)
end

function MenuState:render()
    love.graphics.setFont(gFonts['small'])
    self.MenuState:render()
end