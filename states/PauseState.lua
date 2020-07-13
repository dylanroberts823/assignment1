PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
  self.params = params
end

function PauseState:update(dt)
    -- transition to countdown when enter/return are pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play', self.params)
    end
end

function PauseState:render()
    -- simple UI code
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to continue', 0, 100, VIRTUAL_WIDTH, 'center')
end
