local function loadScript()
    -- Services
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    
    -- Key System Configuration
    local correctKey = "Sweb123" -- Fixed key
    
    -- Instances
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_TopBar = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local UICorner_Close = Instance.new("UICorner")
    local ContentFrame = Instance.new("Frame")
    local UICorner_Content = Instance.new("UICorner")
    local KeySystemFrame = Instance.new("Frame")
    local UICorner_KeySystem = Instance.new("UICorner")
    local KeyLabel = Instance.new("TextLabel")
    local KeyInput = Instance.new("TextBox")
    local UICorner_KeyInput = Instance.new("UICorner")
    local UIStroke_KeyInput = Instance.new("UIStroke")
    local VerifyButton = Instance.new("TextButton")
    local UICorner_Verify = Instance.new("UICorner")
    local UIGradient_Verify = Instance.new("UIGradient")
    local StatusLabel = Instance.new("TextLabel")
    local KeyIcon = Instance.new("ImageLabel")
    local MainContentFrame = Instance.new("Frame")
    local UICorner_MainContent = Instance.new("UICorner")
    local ScriptLabel = Instance.new("TextLabel")
    local LoadButton = Instance.new("TextButton")
    local UICorner_Load = Instance.new("UICorner")
    local UIGradient_Load = Instance.new("UIGradient")
    local UIStroke = Instance.new("UIStroke")
    local Shadow = Instance.new("ImageLabel")
    local Particles = Instance.new("Frame")
    
    -- Properties
    ScreenGui.Name = "SwebScriptGUI"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 9999
    ScreenGui.ResetOnSpawn = false
    
    Shadow.Name = "Shadow"
    Shadow.Parent = ScreenGui
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Size = UDim2.new(0, 450, 0, 300)
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 420, 0, 270)
    MainFrame.ClipsDescendants = true
    
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame
    
    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(65, 105, 225)
    UIStroke.Thickness = 2
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    -- Particles for visual effect
    Particles.Name = "Particles"
    Particles.Parent = MainFrame
    Particles.BackgroundTransparency = 1
    Particles.Size = UDim2.new(1, 0, 1, 0)
    Particles.ZIndex = 0
    
    -- Create particle effects
    for i = 1, 15 do
        local particle = Instance.new("Frame")
        particle.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
        particle.BackgroundTransparency = 0.8
        particle.BorderSizePixel = 0
        particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.ZIndex = 0
        
        local particleCorner = Instance.new("UICorner")
        particleCorner.CornerRadius = UDim.new(1, 0)
        particleCorner.Parent = particle
        
        particle.Parent = Particles
        
        -- Animate particles
        spawn(function()
            while true do
                local randomDuration = math.random(3, 8)
                local targetX = math.random()
                local targetY = math.random()
                
                TweenService:Create(particle, TweenInfo.new(randomDuration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(targetX, 0, targetY, 0),
                    BackgroundTransparency = math.random(70, 95)/100
                }):Play()
                
                wait(randomDuration - 0.1)
            end
        end)
    end
    
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    
    UICorner_TopBar.CornerRadius = UDim.new(0, 10)
    UICorner_TopBar.Parent = TopBar
    
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "SwebScript Rivals"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    CloseButton.Position = UDim2.new(1, -35, 0.5, -12)
    CloseButton.Size = UDim2.new(0, 24, 0, 24)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.AutoButtonColor = false
    
    UICorner_Close.CornerRadius = UDim.new(1, 0)
    UICorner_Close.Parent = CloseButton
    
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Position = UDim2.new(0, 15, 0, 55)
    ContentFrame.Size = UDim2.new(1, -30, 1, -70)
    
    UICorner_Content.CornerRadius = UDim.new(0, 8)
    UICorner_Content.Parent = ContentFrame
    
    -- Key System Frame
    KeySystemFrame.Name = "KeySystemFrame"
    KeySystemFrame.Parent = ContentFrame
    KeySystemFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    KeySystemFrame.BorderSizePixel = 0
    KeySystemFrame.Size = UDim2.new(1, 0, 1, 0)
    KeySystemFrame.ZIndex = 2
    
    UICorner_KeySystem.CornerRadius = UDim.new(0, 8)
    UICorner_KeySystem.Parent = KeySystemFrame
    
    KeyIcon.Name = "KeyIcon"
    KeyIcon.Parent = KeySystemFrame
    KeyIcon.BackgroundTransparency = 1
    KeyIcon.Position = UDim2.new(0.5, -30, 0, 15)
    KeyIcon.Size = UDim2.new(0, 60, 0, 60)
    KeyIcon.Image = "rbxassetid://7734010488"
    KeyIcon.ImageColor3 = Color3.fromRGB(65, 105, 225)
    
    KeyLabel.Name = "KeyLabel"
    KeyLabel.Parent = KeySystemFrame
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Position = UDim2.new(0, 0, 0, 80)
    KeyLabel.Size = UDim2.new(1, 0, 0, 30)
    KeyLabel.Font = Enum.Font.GothamBold
    KeyLabel.Text = "Authentication Required"
    KeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyLabel.TextSize = 18
    
    KeyInput.Name = "KeyInput"
    KeyInput.Parent = KeySystemFrame
    KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    KeyInput.Position = UDim2.new(0.5, -125, 0, 120)
    KeyInput.Size = UDim2.new(0, 250, 0, 40)
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.PlaceholderText = "Enter your key here..."
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.TextSize = 14
    KeyInput.ClearTextOnFocus = false
    
    UICorner_KeyInput.CornerRadius = UDim.new(0, 6)
    UICorner_KeyInput.Parent = KeyInput
    
    UIStroke_KeyInput.Parent = KeyInput
    UIStroke_KeyInput.Color = Color3.fromRGB(65, 105, 225)
    UIStroke_KeyInput.Thickness = 1
    UIStroke_KeyInput.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    VerifyButton.Name = "VerifyButton"
    VerifyButton.Parent = KeySystemFrame
    VerifyButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
    VerifyButton.Position = UDim2.new(0.5, -75, 0, 175)
    VerifyButton.Size = UDim2.new(0, 150, 0, 40)
    VerifyButton.Font = Enum.Font.GothamBold
    VerifyButton.Text = "VERIFY"
    VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyButton.TextSize = 16
    VerifyButton.AutoButtonColor = false
    
    UICorner_Verify.CornerRadius = UDim.new(0, 6)
    UICorner_Verify.Parent = VerifyButton
    
    UIGradient_Verify.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 105, 225)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 140, 255))
    }
    UIGradient_Verify.Rotation = 45
    UIGradient_Verify.Parent = VerifyButton
    
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Parent = KeySystemFrame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0, 225)
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = ""
    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    StatusLabel.TextSize = 14
    
    -- Main Content Frame (hidden initially)
    MainContentFrame.Name = "MainContentFrame"
    MainContentFrame.Parent = ContentFrame
    MainContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    MainContentFrame.BorderSizePixel = 0
    MainContentFrame.Size = UDim2.new(1, 0, 1, 0)
    MainContentFrame.Visible = false
    
    UICorner_MainContent.CornerRadius = UDim.new(0, 8)
    UICorner_MainContent.Parent = MainContentFrame
    
    ScriptLabel.Name = "ScriptLabel"
    ScriptLabel.Parent = MainContentFrame
    ScriptLabel.BackgroundTransparency = 1
    ScriptLabel.Position = UDim2.new(0, 20, 0, 20)
    ScriptLabel.Size = UDim2.new(1, -40, 0, 60)
    ScriptLabel.Font = Enum.Font.Gotham
    ScriptLabel.Text = "Rivals Script v2.1\nUnlock all features and dominate the game!"
    ScriptLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    ScriptLabel.TextSize = 16
    ScriptLabel.TextXAlignment = Enum.TextXAlignment.Left
    ScriptLabel.TextYAlignment = Enum.TextYAlignment.Top
    
    LoadButton.Name = "LoadButton"
    LoadButton.Parent = MainContentFrame
    LoadButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
    LoadButton.Position = UDim2.new(0.5, -75, 1, -80)
    LoadButton.Size = UDim2.new(0, 150, 0, 45)
    LoadButton.Font = Enum.Font.GothamBold
    LoadButton.Text = "LOAD SCRIPT"
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
