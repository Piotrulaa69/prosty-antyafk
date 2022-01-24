-- scripted and modded by Piotrulaa#0192 --

secondsUntilKick = 1200 -- czas przed kickiem w sekundach (20min)

kickWarning = true      -- ostrzezenie gracza jesli 3/4 czasu bez ruszania sie uplynie

Citizen.CreateThread(function()
    while true do
        Wait(1000)

        playerPed = GetPlayerPed(-1)
        if playerPed then
            currentPos = GetEntityCoords(playerPed, true)

            if currentPos == prevPos then
                if time > 0 then

                    if kickWarning and time == math.ceil(secondsUntilKick / 4) then
                        TriggerEvent("chatMessage", "Ostrzeżenie!", {255, 0, 0}, "^1Zostaniesz Wyrzucany za ".. time .." sekund za bycie AFK!") -- tutaj zmieniace wiadomosc na jaka chceice tylkow azne by zostawic .. xyz ..
                    end
                            -- tutaj nizej juz lepiej nic nie tykac

                    time = time -1

                else
                    TriggerServerEvent("kickForBeingAnAFKDouchebag")
                end
            else
                time = secondsUntilKick
            end

            prevPos = currentPos
        end
    end
end)