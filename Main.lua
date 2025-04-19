Here’s the script formatted for easier use in your Roblox project:

```lua
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Define UI elements
local ScreenGui = script.Parent
local MainFrame = ScreenGui.MainFrame
local Shadow = ScreenGui.Shadow
local TopBar = MainFrame.TopBar
local CloseButton = MainFrame.CloseButton
local LoadButton = MainFrame.LoadButton
local VerifyButton = MainFrame.VerifyButton
local KeyInput = MainFrame.KeyInput
local StatusLabel = MainFrame.StatusLabel
local KeyIcon = MainFrame.KeyIcon
local UIStroke = MainFrame.UIStroke
local UIStroke_KeyInput = KeyInput.UIStroke
local UIGradient_Load = LoadButton.UIGradient
local UIGradient_Verify = VerifyButton.UIGradient
local UICorner_Load = LoadButton.UICorner
local MainContentFrame = ScreenGui.MainContentFrame
local KeySystemFrame = ScreenGui.KeySystemFrame
local correctKey = "yourCorrectKeyHere"

-- Load script functionality
local function loadScript()
    -- Set up UI properties
    LoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LoadButton.TextSize = 16
    LoadButton.AutoButtonColor = false
    
    UICorner_Load.CornerRadius = UDim.new(0, 8)
    UICorner_Load.Parent = LoadButton
    
    UIGradient_Load.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 105, 225)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 140, 255))
    }
    UIGradient_Load.Rotation = 45
    UIGradient_Load.Parent = LoadButton
    
    -- Position Shadow behind MainFrame
    Shadow.Position = MainFrame.Position
    Shadow.Size = UDim2.new(0, MainFrame.Size.X.Offset + 40, 0, MainFrame.Size.Y.Offset + 40)
    
    -- Animations and Effects
    local function createButtonEffect(button)
        local originalSize = button.Size
        
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {Size = originalSize + UDim2.new(0, 10, 0, 3)}):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.3), {Size = originalSize}):Play()
        end)
        
        button.MouseButton1Down:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {Size = originalSize - UDim2.new(0, 5, 0, 2)}):Play()
        end)
        
        button.MouseButton1Up:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {Size = originalSize + UDim2.new(0, 10, 0, 3)}):Play()
        end)
    end
    
    -- Apply button effects
    createButtonEffect(VerifyButton)
    createButtonEffect(LoadButton)
    
    -- Animated UI Stroke
    spawn(function()
        local hue = 0
        while wait() do
            hue = (hue + 0.001) % 1
            UIStroke.Color = Color3.fromHSV(hue, 0.8, 1)
            wait(0.05)
        end
    end)
    
    -- Drag functionality
    local dragging = false
    local dragInput, dragStart, startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        TweenService:Create(MainFrame, TweenInfo.new(0.1), {
            Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        }):Play()
        
        -- Update shadow position
        Shadow.Position = MainFrame.Position
    end
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- Close button functionality
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        -- Animate closing
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        
        TweenService:Create(Shadow, TweenInfo.new(0.5), {
            ImageTransparency = 1
        }):Play()
        
        wait(0.5)
        ScreenGui:Destroy()
    end)
    
    -- Key System Functionality
    local function showStatus(message, isError)
        StatusLabel.Text = message
        StatusLabel.TextColor3 = isError and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(80, 255, 120)
        
        -- Animate status label
        StatusLabel.TextTransparency = 1
        TweenService:Create(StatusLabel, TweenInfo.new(0.3), {TextTransparency = 0}):Play()
    end
    
    -- Typing effect for key input
    KeyInput.Changed:Connect(function(prop)
        if prop == "Text" then
            UIStroke_KeyInput.Color = Color3.fromRGB(65, 105, 225)
            TweenService:Create(UIStroke_KeyInput, TweenInfo.new(0.3), {Thickness = 2}):Play()
            wait(0.3)
            TweenService:Create(UIStroke_KeyInput, TweenInfo.new(0.3), {Thickness = 1}):Play()
        end
    end)
    
    -- Animated key icon
    spawn(function()
        while wait() do
            TweenService:Create(KeyIcon, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = 5
            }):Play()
            wait(2)
            TweenService:Create(KeyIcon, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = -5
            }):Play()
            wait(2)
        end
    end)
    
    local function verifyKey()
        local inputKey = KeyInput.Text
        
        if inputKey == "" then
            showStatus("Please enter a key", true)
            
            -- Shake animation for empty input
            TweenService:Create(KeyInput, TweenInfo.new(0.1), {Position = KeyInput.Position + UDim2.new(0, 10, 0, 0)}):Play()
            wait(0.1)
            TweenService:Create(KeyInput, TweenInfo.new(0.1), {Position = KeyInput.Position - UDim2.new(0, 20, 0, 0)}):Play()
            wait(0.1)
            TweenService:Create(KeyInput, TweenInfo.new(0.1), {Position = KeyInput.Position + UDim2.new(0, 10, 0, 0)}):Play()
            return
        end
        
        -- Add a small delay to simulate verification with loading animation
        VerifyButton.Text = "VERIFYING"
        
        -- Loading dots animation
        spawn(function()
            local dots = 0
            while VerifyButton.Text:sub(1, 9) == "VERIFYING" do
                dots = (dots % 3) + 1
                VerifyButton.Text = "VERIFYING" .. string.rep(".", dots)
                wait(0.3)
            end
        end)
        
        -- Simulate verification process
        wait(1.2)
        
        if inputKey == correctKey then
            -- Success animation
            showStatus("Key verified successfully!", false)
            VerifyButton.Text = "SUCCESS!"
            
            -- Change button color to green
            UIGradient_Verify.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 200, 100)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 240, 120))
            }
            
            -- Success particles
            for i = 1, 20 do
                local particle = Instance.new("Frame")
                particle.BackgroundColor3 = Color3.fromRGB(80, 255, 120)
                particle.BackgroundTransparency = 0.2
                particle.BorderSizePixel = 0
                particle.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
                particle.Position = UDim2.new(0.5, 0, 0.5, 0)
                particle.ZIndex = 5
                
                local particleCorner = Instance.new("UICorner")
                particleCorner.CornerRadius = UDim.new(1, 0)
                particleCorner.Parent = particle
                
                particle.Parent = KeySystemFrame
                
                -- Animate particle
                TweenService:Create(particle, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Position = UDim2.new(math.random(0, 100)/100, 0, math.random(0, 100)/100, 0),
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, math.random(10, 15), 0, math.random(10, 15))
                }):Play()
                
                spawn(function()
                    wait(1)
                    particle:Destroy()
                end)
            end
            
            -- Transition to main content
            wait(1)
            
            -- Animate transition
            TweenService:Create(KeySystemFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(-1, 0, 0, 0)
            }):Play()
            
            MainContentFrame.Position = UDim2.new(1, 0, 0, 0)
            MainContentFrame.Visible = true
            
            TweenService:Create(MainContentFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
            
            wait(0.8)
            KeySystemFrame.Visible = false
        else
            showStatus("Invalid key. Please try again.", true)
            VerifyButton.Text = "VERIFY"
            
            -- Error animation
            UIStroke_KeyInput.Color = Color3.fromRGB(255, 80, 80)
            TweenService:Create(UIStroke_KeyInput, TweenInfo.new(0.3), {Thickness = 2}):Play()
            
            -- Shake animation for wrong key
            local originalPosition = MainFrame.Position
            for i = 1, 5 do
                TweenService:Create(MainFrame, TweenInfo.new(0.05), {
                    Position = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset + (i % 2 == 0 and 10 or -10), originalPosition.Y.Scale, originalPosition.Y.Offset)
                }):Play()
                wait(0.05)
            end
            TweenService:Create(MainFrame, TweenInfo.new(0.05), {
                Position = originalPosition
            }):Play()
            
            wait(0.3)
            TweenService:Create(UIStroke_KeyInput, TweenInfo.new(0.3), {Thickness = 1}):Play()
        end
    end
    
    VerifyButton.MouseButton1Click:Connect(verifyKey)
    
    -- Allow pressing Enter to verify
    KeyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            verifyKey()
        end
    end)
    
    -- Load button functionality (just visual feedback, no actual script loading)
    LoadButton.MouseButton1Click:Connect(function()
        -- Visual feedback
        local clickEffect = TweenService:Create(LoadButton, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(100, 255, 100)})
        clickEffect:Play()
        
        -- Loading animation
        LoadButton.Text = "LOADING..."
        
        -- Placeholder for script loading logic
        print("Load button clicked")
        
        wait(0.8)
        LoadButton.Text = "LOADED!"
        
        wait(0.5)
        TweenService:Create(LoadButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(65, 105, 225)}):Play()
        wait(0.3)
        LoadButton.Text = "LOAD SCRIPT"
    end)
    
    -- Entrance animation
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.ImageTransparency = 1
    
    TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 420, 0, 270),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    
    TweenService:Create(Shadow, TweenInfo.new(0.7), {
        ImageTransparency = 0.5
    }):Play()
end

loadScript()
```

You can paste this code into a Script object in Roblox Studio, and it should work properly within the defined UI structure. Let me know if you'd like any changes!
