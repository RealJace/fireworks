--https://github.com/Mokiros/roblox-FE-compatibility
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	print("FE Compatibility code V2 by Mokiros")
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.Character

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
	local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
	FakeMouse.keyUp = FakeMouse.KeyUp
	FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)

	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game

	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
					and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
		},"RunService")
	}
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame.Players.LocalPlayer
end

local mouse = owner:GetMouse()
local char = owner.Character or owner.CharacterAdded:Wait()

function spawnFirework(position)
	coroutine.wrap(function()
		local Firework = Instance.new("Part")
		local Sound1 = Instance.new("Sound")
		local Sound2 = Instance.new("Sound")
		local Sound3 = Instance.new("Sound")
		local SpecialMesh4 = Instance.new("SpecialMesh")
		local ParticleEmitter5 = Instance.new("ParticleEmitter")
		local ParticleEmitter6 = Instance.new("ParticleEmitter")
		local ParticleEmitter7 = Instance.new("ParticleEmitter")
		Firework.Name = "Firework"
		Firework.Parent = script
		Firework.Position = position
		Firework.Size = Vector3.new(1, 3, 1)
		Firework.Anchored = false
		Firework.BottomSurface = Enum.SurfaceType.Smooth
		Firework.BrickColor = BrickColor.new("Bright yellow")
		Firework.CanCollide = false
		Firework.Elasticity = 0
		Firework.Friction = 1
		Firework.TopSurface = Enum.SurfaceType.Smooth
		Firework.brickColor = BrickColor.new("Bright yellow")
		Firework.FormFactor = Enum.FormFactor.Custom
		Firework.formFactor = Enum.FormFactor.Custom
		Sound1.Name = "Bang"
		Sound1.Parent = Firework
		Sound1.SoundId = "http://www.roblox.com/asset/?id=160248505"
		Sound1.Volume = 1
		Sound2.Name = "Fountain"
		Sound2.Parent = Firework
		Sound2.SoundId = "http://www.roblox.com/asset/?id=160248368"
		Sound2.Volume = 1
		Sound3.Name = "Pop"
		Sound3.Parent = Firework
		Sound3.SoundId = "http://www.roblox.com/asset/?id=160248302"
		Sound3.Volume = 1
		SpecialMesh4.Parent = Firework
		SpecialMesh4.MeshId = "http://www.roblox.com/asset/?id=162969265"
		SpecialMesh4.Offset = Vector3.new(0, 0, 0.5)
		SpecialMesh4.Scale = Vector3.new(0.80000001192093, 0.80000001192093, 0.80000001192093)
		SpecialMesh4.TextureId = "http://www.roblox.com/asset/?id=162969520"
		SpecialMesh4.MeshType = Enum.MeshType.FileMesh
		ParticleEmitter5.Name = "Red"
		ParticleEmitter5.Parent = Firework
		ParticleEmitter5.Speed = NumberRange.new(25, 25)
		ParticleEmitter5.Color = ColorSequence.new(Color3.new(1, 0, 0),Color3.new(1, 0, 0))
		ParticleEmitter5.Enabled = false
		ParticleEmitter5.LightEmission = 1
		ParticleEmitter5.LightInfluence = 1
		ParticleEmitter5.Texture = "http://www.roblox.com/asset/?id=129033729"
		ParticleEmitter5.Transparency = NumberSequence.new(0.5,0.5)
		ParticleEmitter5.Size = NumberSequence.new(0.40000000596046,0.80000001192093)
		ParticleEmitter5.Shape = Enum.ParticleEmitterShape.Sphere
		ParticleEmitter5.Acceleration = Vector3.new(0, -30, 0)
		ParticleEmitter5.Lifetime = NumberRange.new(15, 15)
		ParticleEmitter5.Rate = 100
		ParticleEmitter5.SpreadAngle = Vector2.new(-360, 360)
		ParticleEmitter5.VelocitySpread = -360
		ParticleEmitter6.Name = "Green"
		ParticleEmitter6.Parent = Firework
		ParticleEmitter6.Speed = NumberRange.new(25, 25)
		ParticleEmitter6.Color = ColorSequence.new(Color3.new(0, 1, 0),Color3.new(0, 1, 0))
		ParticleEmitter6.Enabled = false
		ParticleEmitter6.LightEmission = 1
		ParticleEmitter6.LightInfluence = 1
		ParticleEmitter6.Texture = "http://www.roblox.com/asset/?id=129033729"
		ParticleEmitter6.Transparency = NumberSequence.new(0.5,0.5)
		ParticleEmitter6.Size = NumberSequence.new(0.40000000596046,0.80000001192093)
		ParticleEmitter6.Shape = Enum.ParticleEmitterShape.Sphere
		ParticleEmitter6.Acceleration = Vector3.new(0, -30, 0)
		ParticleEmitter6.Lifetime = NumberRange.new(15, 15)
		ParticleEmitter6.Rate = 100
		ParticleEmitter6.SpreadAngle = Vector2.new(-360, 360)
		ParticleEmitter6.VelocitySpread = -360
		ParticleEmitter7.Name = "Yellow"
		ParticleEmitter7.Parent = Firework
		ParticleEmitter7.Speed = NumberRange.new(25, 25)
		ParticleEmitter7.Color = ColorSequence.new(Color3.new(1, 1, 0),Color3.new(1, 1, 0))
		ParticleEmitter7.Enabled = false
		ParticleEmitter7.LightEmission = 1
		ParticleEmitter7.LightInfluence = 1
		ParticleEmitter7.Texture = "http://www.roblox.com/asset/?id=129033729"
		ParticleEmitter7.Transparency = NumberSequence.new(0.5,0.5)
		ParticleEmitter7.Size = NumberSequence.new(0.40000000596046,0.80000001192093)
		ParticleEmitter7.Shape = Enum.ParticleEmitterShape.Sphere
		ParticleEmitter7.Acceleration = Vector3.new(0, -30, 0)
		ParticleEmitter7.Lifetime = NumberRange.new(15, 15)
		ParticleEmitter7.Rate = 100
		ParticleEmitter7.SpreadAngle = Vector2.new(-360, 360)
		ParticleEmitter7.VelocitySpread = -360
		Sound2:Play()
		local force = Instance.new("BodyForce",Firework)
		force.Force = Vector3.new(0,Firework:GetMass() + 600,0)
		task.wait(1)
		force:Destroy()
		Firework.Transparency = 1
		Sound1:Play()
		Sound3:Play()
		for _,i in pairs(Firework:GetDescendants()) do
			if i:IsA("ParticleEmitter") then
				i:Emit(100)
			end
		end
	end)()
end

mouse.Button1Down:Connect(function()
	if mouse.Target ~= nil then
		spawnFirework(mouse.Hit.Position + Vector3.new(0,3,0))
	end
end)
