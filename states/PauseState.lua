PauseState = Class{__includes = BaseState}

function PauseState:init()
  -- Pause audio
  love.audio.pause()
end

function PauseState:enter(params)
  --Define params
  self.params = params
end

function PauseState:update(dt)
    -- transition to countdown when enter/return are pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        love.audio.play(sounds['music'])
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
