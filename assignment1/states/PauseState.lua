--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

PauseState = Class{__includes = BaseState}

--

function PauseState:enter()
    --add sth about fancy bird here
end

function PauseState:update(dt)
    -- unpause if p is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play')
    end
end

function PauseState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Is Paused', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(205, 127, 50)
    love.graphics.circle("fill", VIRTUAL_WIDTH / 2, 200, 20)
end