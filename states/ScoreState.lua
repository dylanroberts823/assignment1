--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

-- credits to https://github.com/mesporas1/Fifty-Bird-Assignment for the stars

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

  -- No star is default star
  star = nil

  --Display the appropriate text
  if score < 1 then
    text = 'Oof! You lost! Can you get to 1?'
  elseif score < 3 then
    star = brownStar
    text = 'Congratulations! You got a Brown Star! Can you get to 3?'
  elseif score < 5 then
    star = silverStar
    text = 'Congratulations! You got a Silver Star! Can you get to 5?'
  else
    star = goldStar
    text = 'Congratulations! You got a Gold Star!'
  end

  --Print the star and appropriate text
  if star ~= nil then
    --Define the width for the star
    x = VIRTUAL_WIDTH/2 - star:getWidth()
    love.graphics.draw(star, x, 12)
  end

  love.graphics.printf(text, 0, 64, VIRTUAL_WIDTH, 'center')
end

function ScoreState:render()
    -- draw the appropriate star with its reward
    drawStar(self.score)

    -- simply render the score to the middle of the screen
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 150, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end
