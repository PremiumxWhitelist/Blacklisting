local scriptBlacklist = {
        [3931702163] = true,  -- ROBLOX: Razorbacks1266 | DISCORD: 850875668698366003
        [0] = true,   -- 
        [0] = true,   -- 
    }
    
    local function executeScript()
        local scriptUrl = "https://raw.githubusercontent.com/PremiumxWhitelist/Blacklisting/main/Redirect/Redirect-Main.lua"
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
        if not success then
            warn("Failed to load script:", errorMsg)
        end
    end
    
    local function sendNotification()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Account Is Blacklisted.",
            Text = "This Cannot Be Appealed. discord.gg/VsEMZD8r2Y",
            Icon = "",  
            Duration = 999999999,
            Button1 = "I Understand."
        })
    end
    
    -- Check if the user ID is NOT in the scriptBlacklist
    if not scriptBlacklist[game.Players.LocalPlayer.UserId] then
        executeScript()
    else
        -- Users who are in the blacklist receive a notification instead
        sendNotification()
    end