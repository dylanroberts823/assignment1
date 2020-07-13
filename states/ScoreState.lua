--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function drawStar(score)
  --Set the initial font
  love.graphics.setFont(flappyFont)

  --Define the stars
  local brownStar = love.graphics.newImage('brown-star.png')
  local silverStar = love.graphics.newImage('silver-star.png')
  local goldStar = love.graphics.newImage('gold-star.png')

  --Display the appropriate text
  if score < 1 then
    love.graphics.printf('Oof! You lost!', 0, 12, VIRTUAL_WIDTH, 'center')
  elseif score < 3 then
    love.graphics.draw(brownStar, VIRTUAL_WIDTH/2, 12)
    love.graphics.printf('Congratulations! You got a Brown Star! Can you get to 3?', 0, 64, VIRTUAL_WIDTH, 'center')
  elseif score < 5 then
    love.graphics.draw(silverStar, VIRTUAL_WIDTH/2, 12)
    love.graphics.printf('Congratulations! You got a Silver Star! Can you get to 5?', 0, 64, VIRTUAL_WIDTH, 'center')
  else
    love.graphics.draw(goldStar, VIRTUAL_WIDTH/2, 12)
    love.graphics.printf('Congratulations! You got a Gold Star!', 0, 64, VIRTUAL_WIDTH, 'center')
  end
end

function ScoreState:render()
    -- draw the appropriate star with its reward
    drawStar(self.score)

    -- simply render the score to the middle of the screen
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end
