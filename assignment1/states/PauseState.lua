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

function PauseState:init(bird, pipePairs, timer, score)
    self.bird = Bird()
    self.pipePairs = {}

    self.bird = bird
    self.pipePairs = pipePairs
    self.timer = timer
    self.score = score
end

function PauseState:update(dt)
    -- unpause if p is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score
        })
    end
end

function PauseState:render()

    -- for k, pair in pairs(self.pipePairs) do
    --     pair:render()
    -- end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    -- self.bird:render()

    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Is Paused', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(205, 127, 50)
    love.graphics.circle("fill", VIRTUAL_WIDTH / 2, 200, 20)
end