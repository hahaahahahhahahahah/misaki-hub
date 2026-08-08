local Library = (getgenv and getgenv().MisakiLibrary) or loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\114\97\119\47\109\97\105\110\47\108\105\98\114\97\114\121\47\76\105\98\114\97\114\121\46\108\117\97"))()
local Window = Library:Window({
	Logo = getcustomasset("\97\115\115\101\116\115\47\105\109\97\103\101\115\47\108\111\103\111\46\112\110\103"),
	FadeTime = ((0.3 * 2) / 2),
})
Library.MenuKeybind = tostring(Enum.KeyCode.Delete)
local Watermark = Library:Watermark("\108\111\97\100\105\110\103\46\46\46")
local KeybindList = Library:KeybindList()
do
	local CombatPage = Window:Page({
		Name = "\67\111\109\98\97\116",
		Columns = (-145 + 147),
	})
	local MovementPage = Window:Page({
		Name = "\77\111\118\101\109\101\110\116",
		Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
	})
	local VisualsPage = Window:Page({
		Name = "\86\105\115\117\97\108\115",
		Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
	})
	local WorldPage = Window:Page({
		Name = "\87\111\114\108\100",
		Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
	})
	local MiscPage = Window:Page({
		Name = "\77\105\115\99",
		Columns = (-580 + 582),
	})
	local RagebotPage = Window:Page({
		Name = "\82\97\103\101\98\111\116",
		Columns = (-902 + 904),
	})
	local PlayersPage = Window:Page({
		Name = "\80\108\97\121\101\114\115",
		Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
	})
	local SettingsPage = Library:CreateSettingsPage(Window, Watermark, KeybindList)
	local RagebotForcedTarget = nil
	local RagebotMuzzleOrigin = nil
	local RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
	local RenderCache = {}
	local NotificationShown = {}
	local CleanupCallbacks = {}
	local TrackedDrawings = {}
	local TrackedConnections = {}
	local ScriptAlive = (not false)
	local function RegisterCleanup(fn)
		if 1 == 2 then
			local _dc14620 = 545
		end
		table.insert(CleanupCallbacks, fn)
	end
	local function TrackDrawing(obj)
		table.insert(TrackedDrawings, obj)
		return obj
	end
	local function TrackConnection(conn)
		table.insert(TrackedConnections, conn)
		return conn
	end
	local FriendsCache = {}
	do
		if 1 == 2 then
			local _dc40820 = "dc659"
			local _dc80585 = "dc569"
			local _dc12123 = 815
		end
		local LP = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
		for _, p in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
			if p ~= LP then
				task.spawn(function()
					local ok, result = pcall(LP.IsFriendsWith, LP, p.UserId)
					if ok then
						FriendsCache[p.Name] = result
					end
				end)
			end
		end
		TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerAdded:Connect(function(p)
			task.spawn(function()
				local ok, result = pcall(LP.IsFriendsWith, LP, p.UserId)
				if ok then
					FriendsCache[p.Name] = result
				end
			end)
		end))
		TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerRemoving:Connect(function(p)
			FriendsCache[p.Name] = nil
		end))
	end
	local function NewRender(Callback)
		local Connection = {
			Function = Callback,
		}
		local Index = #RenderCache + 1
		RenderCache[Index] = Connection
		Connection.Disconnect = function(self)
			if RenderCache[Index] then
				RenderCache[Index] = nil
			end
		end
		return Connection
	end
	local MasterRenderConnection
	local function StopAllRenderers()
		if MasterRenderConnection and MasterRenderConnection.Connected then
			if 10 < 1 then
				local _dc55171 = 356
				local _dc9744 = "dc526"
				local _dc20476 = 328
			end
			MasterRenderConnection:Disconnect()
		end
		for _, connection in RenderCache do
			if connection and connection.Disconnect then
				if 5 ~= 5 then
					local _dc17744 = 816
				end
				pcall(connection.Disconnect, connection)
			end
		end
		table.clear(RenderCache)
	end
	MasterRenderConnection = RunService.RenderStepped:Connect(function(Delta)
		if not ScriptAlive then
			return
		end
		for _, Connection in RenderCache do
			if Connection and Connection.Function then
				Connection.Function(Delta)
			end
		end
	end)
	RegisterCleanup(StopAllRenderers)
	local PingWarningEnabled = (not not false)
	local KillfeedNotificationsEnabled = (not true)
	local PingThreshold = ((0.3 * 2) / 2)
	local LastPingWarning = 0
	local PingCooldown = (-786 + 816)
	local AutoBlacklistSet = {}
	local ItemESPState = {
		Enabled = (1 == 0),
		Items = {},
		Color = Library.Theme.Accent,
		Chams = (not not false),
		ChamsColor = Library.Theme.Accent,
		ChamsFillTransparency = ((0.5 * 5) / 5),
	}
	local ItemESPDrawings = {}
	local ItemESPHighlights = {}
	local ItemESPChamsFolder = Instance.new("\70\111\108\100\101\114")
	ItemESPChamsFolder.Name = "\109\105\115\97\107\105\73\116\101\109\67\104\97\109\115"
	ItemESPChamsFolder.Parent = game:GetService("\67\111\114\101\71\117\105")
	local function ResolvePickupPart(obj)
		if obj:IsA("\66\97\115\101\80\97\114\116") then
			return obj
		elseif obj:IsA("\77\111\100\101\108") then
			return obj.PrimaryPart or obj:FindFirstChildWhichIsA("\66\97\115\101\80\97\114\116")
		end
		return nil
	end
	do
		local LastFPS = 0
		local FrameCount = 0
		local LastFPSUpdate = os.clock()
		NewRender(function(Delta)
			FrameCount = FrameCount + 1
			local now = os.clock()
			if now - LastFPSUpdate >= ((0.5 * 4) / 4) then
				LastFPS = math.floor(FrameCount / (now - LastFPSUpdate))
				FrameCount = 0
				LastFPSUpdate = now
			end
			local ping = game.Players.LocalPlayer:GetNetworkPing()
			local pingMs = math.floor(ping * (1753 - 753))
			Watermark:SetText(string.format("\109\105\115\97\107\105\32\124\32\80\114\105\115\111\110\32\76\105\102\101\32\124\32\37\100\32\70\80\83\32\124\32\37\100\109\115", LastFPS, pingMs))
			if PingWarningEnabled and ping >= PingThreshold and (now - LastPingWarning) >= PingCooldown then
				LastPingWarning = now
				Library:Notification("\72\105\103\104\32\80\105\110\103", string.format("\89\111\117\114\32\112\105\110\103\32\105\115\32\37\100\109\115\32\20\32\103\97\109\101\112\108\97\121\32\109\97\121\32\98\101\32\117\110\112\108\97\121\97\98\108\101\46", pingMs), (-125 + 130))
			end
		end)
	end
	local PL = {
		Shoot = nil,
		rawShoot = nil,
		Bullet = nil,
		Reload = nil,
		GunTracers = nil,
	}
	local PLTargeting = {}
	local aimTimer, shootTimer, aimVec = os.clock(), os.clock(), Vector3.zero
	local PlayersService = game:GetService("\80\108\97\121\101\114\115")
	local LocalPlayer = PlayersService.LocalPlayer
	local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
	local ReplicatedStorage = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")
	local CollectionService = game:GetService("\67\111\108\108\101\99\116\105\111\110\83\101\114\118\105\99\101")
	local TweenService = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
	local Teams = game:GetService("\84\101\97\109\115")
	local PLCamera = workspace.CurrentCamera
	local WallbangRayGuard = (1 == 0)
	local function GuardedRaycast(origin, direction, params)
		WallbangRayGuard = (not false)
		local ok, result = pcall(workspace.Raycast, workspace, origin, direction, params)
		WallbangRayGuard = (1 == 0)
		return ok and result or nil
	end
	local function GuardedGetPartBoundsInBox(cframe, size, params)
		WallbangRayGuard = (1 == 1)
		local ok, result = pcall(workspace.GetPartBoundsInBox, workspace, cframe, size, params)
		WallbangRayGuard = (not true)
		return ok and result or {}
	end
	PL.OriginScanner = {}
	do
		local rayParams = RaycastParams.new()
		rayParams.CollisionGroup = "\67\108\105\101\110\116\66\117\108\108\101\116"
		rayParams.FilterType = Enum.RaycastFilterType.Exclude
		local rayParams2 = OverlapParams.new()
		rayParams2.CollisionGroup = "\67\108\105\101\110\116\66\117\108\108\101\116"
		rayParams2.FilterType = Enum.RaycastFilterType.Exclude
		PL.OriginScanner.Ray = rayParams
		PL.OriginScanner.Overlap = rayParams2
		local scanOffsets = {
			Vector3.new(0, 1, 0),
			Vector3.new(1, 0, 0),
			Vector3.new(((0.7 * 4) / 4), -((0.5 * 5) / 5), -((0.5 * 10) / 10)),
			Vector3.new(-((0.1 * 5) / 5), -((0.8 * 4) / 4), -((0.8 * 5) / 5)),
			Vector3.new(-((0.8 * 4) / 4), -((0.5 * 4) / 4), -((0.5 * 2) / 2)),
			Vector3.new(-1, 0, 0),
			Vector3.new(-((0.8 * 2) / 2), ((0.4 * 10) / 10), ((0.4 * 2) / 2)),
			Vector3.new(0, ((0.7 * 10) / 10), ((0.7 * 10) / 10)),
			Vector3.new(((0.7 * 4) / 4), ((0.5 * 10) / 10), ((0.5 * 2) / 2)),
			Vector3.new(1, 0, 0),
			Vector3.new(((0.7 * 4) / 4), 0, -((0.8 * 2) / 2)),
			Vector3.new(-((0.1 * 10) / 10), 0, -1),
			Vector3.new(-((0.8 * 10) / 10), 0, -((0.8 * 5) / 5)),
			Vector3.new(-1, 0, 0),
			Vector3.new(-((0.8 * 2) / 2), 0, ((0.7 * 5) / 5)),
			Vector3.new(0, 0, 1),
			Vector3.new(((0.7 * 2) / 2), 0, ((0.7 * 5) / 5)),
			Vector3.new(1, 0, 0),
			Vector3.new(((0.7 * 2) / 2), ((0.4 * 10) / 10), -((0.5 * 2) / 2)),
			Vector3.new(-((0.1 * 5) / 5), ((0.7 * 4) / 4), -((0.8 * 4) / 4)),
			Vector3.new(-((0.8 * 5) / 5), ((0.4 * 5) / 5), -((0.5 * 5) / 5)),
			Vector3.new(-1, -((0.1 * 5) / 5), 0),
			Vector3.new(-((0.8 * 2) / 2), -((0.5 * 2) / 2), ((0.4 * 2) / 2)),
			Vector3.new(0, -((0.8 * 2) / 2), ((0.7 * 10) / 10)),
			Vector3.new(((0.7 * 5) / 5), -((0.6 * 2) / 2), ((0.5 * 5) / 5)),
			Vector3.new(0, -1, 0),
		}
		local wallbangIgnoreList = {}
		local function RefreshWallbangIgnoreList()
			if 1 == 2 then
				local _dc43 = "dc337"
			end
			table.clear(wallbangIgnoreList)
			local localCharacter = LocalPlayer.Character
			if localCharacter then
				table.insert(wallbangIgnoreList, localCharacter)
			end
			for _, player in ipairs(PlayersService:GetPlayers()) do
				if player.Character then
					if 5 ~= 5 then
						local _dc38805 = "dc467"
					end
					table.insert(wallbangIgnoreList, player.Character)
				end
			end
			rayParams.FilterDescendantsInstances = wallbangIgnoreList
			rayParams2.FilterDescendantsInstances = wallbangIgnoreList
		end
		function PL.OriginScanner:UpdateIgnore(self)
			if 10 < 1 then
				local _dc46895 = "dc75"
				local _dc25186 = "dc822"
				local _dc78134 = 221
			end
			rayParams.FilterDescendantsInstances = wallbangIgnoreList
			rayParams2.FilterDescendantsInstances = wallbangIgnoreList
		end
		RefreshWallbangIgnoreList()
		TrackConnection(PlayersService.PlayerAdded:Connect(function(player)
			RefreshWallbangIgnoreList()
			TrackConnection(player.CharacterAdded:Connect(RefreshWallbangIgnoreList))
		end))
		TrackConnection(PlayersService.PlayerRemoving:Connect(RefreshWallbangIgnoreList))
		TrackConnection(LocalPlayer.CharacterAdded:Connect(RefreshWallbangIgnoreList))
		function PL.OriginScanner:Scan(self, origin, target, ...)
			local scanPositions = {}
			for _, v in {
				...,
			} do
				if (origin - v).Magnitude < ((7.5 * 5) / 5) then
					table.insert(scanPositions, v)
				end
			end
			for i = 5, 7 do
				if 1 == 2 then
					local _dc61783 = 261
					local _dc94062 = "dc173"
				end
				for _, v in scanOffsets do
					if 10 < 1 then
						local _dc55928 = "dc51"
						local _dc58148 = "dc200"
						local _dc30809 = "dc465"
					end
					table.insert(scanPositions, origin + v * i)
				end
			end
			for _, pos in scanPositions do
				local ray = GuardedRaycast(target, (pos - target), rayParams)
				if not ray and #GuardedGetPartBoundsInBox(CFrame.new(pos), Vector3.one * ((0.1 * 10) / 10), rayParams2) <= 0 then
					return pos
				end
			end
		end
	end
	function PL.resolveShoot()
		local home = LocalPlayer.PlayerGui:FindFirstChild("\72\111\109\101")
		local actionArea = home and home:FindFirstChild("\104\117\100") and home.hud:FindFirstChild("\65\99\116\105\111\110\65\114\101\97")
		if not actionArea then
			return (not not false)
		end
		for _, connection in getconnections(actionArea.InputBegan) do
			local shootFn = connection.Function and debug.getupvalue(connection.Function, (-318 + 320))
			if shootFn then
				PL.Shoot = shootFn
				PL.rawShoot = shootFn
				PL.Reload = debug.getupvalue(shootFn, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810))
				PL.Bullet = debug.getupvalue(shootFn, bit32.bxor(bit32.bxor(16, 1515870810), 1515870810))
				return PL.Bullet ~= nil
			end
		end
		return (not not false)
	end
	function PL.getGunData()
		local fn = PL.rawShoot
		if not fn then
			if 5 ~= 5 then
				local _dc51525 = 638
				local _dc65953 = 838
				local _dc15609 = "dc55"
			end
			return nil
		end
		local ok, data = pcall(debug.getupvalue, fn, (-663 + 673))
		if ok and type(data) == "\116\97\98\108\101" and data.Range ~= nil then
			return data
		end
		for i = 1, 40 do
			ok, data = pcall(debug.getupvalue, fn, i)
			if ok and type(data) == "\116\97\98\108\101" and data.Range ~= nil and data.FireRate ~= nil then
				if 10 < 1 then
					local _dc78920 = "dc817"
					local _dc15357 = "dc633"
					local _dc22850 = "dc512"
				end
				return data
			end
		end
		return nil
	end
	function PL.getEquippedTool()
		if 1 == 2 then
			local _dc76793 = "dc954"
		end
		local character = LocalPlayer.Character
		return character and character:FindFirstChildWhichIsA("\84\111\111\108")
	end
	function PL.getMousePosition()
		if UserInputService.TouchEnabled then
			return PLCamera.ViewportSize / (947 - 945)
		end
		return UserInputService:GetMouseLocation()
	end
	function PL.GetInmateStatus(character)
		local humanoid = character:FindFirstChild("\72\117\109\97\110\111\105\100")
		if not humanoid then
			if 1 == 2 then
				local _dc83114 = "dc545"
				local _dc66074 = 673
				local _dc5568 = 227
			end
			return "\82\101\103\117\108\97\114"
		end
		local displayName = humanoid.DisplayName
		if string.sub(displayName, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\148\151" then
			return "\65\114\114\101\115\116\97\98\108\101"
		elseif string.sub(displayName, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\146\162" then
			if 1 == 2 then
				local _dc6571 = "dc914"
				local _dc49025 = "dc767"
			end
			return "\65\103\103\114\101\115\115\105\118\101"
		end
		return "\82\101\103\117\108\97\114"
	end
	function PL.passesCombatFilters(player, character, filters)
		local isBlacklisted = filters.Blacklist and (filters.Blacklist[player.Name] or (filters.AutoBlacklist and filters.AutoBlacklist[player.Name]))
		local teamName = player.Team and player.Team.Name or ""
		local myTeam = LocalPlayer.Team and LocalPlayer.Team.Name or ""
		if isBlacklisted and teamName == myTeam and teamName ~= "\73\110\109\97\116\101\115" then
			return (not true)
		end
		if isBlacklisted and teamName == "\73\110\109\97\116\101\115" and PL.GetInmateStatus(character) == "\82\101\103\117\108\97\114" then
			if 5 ~= 5 then
				local _dc16633 = 304
				local _dc46176 = "dc985"
			end
			return (1 == 0)
		end
		if not isBlacklisted then
			if 1 == 2 then
				local _dc66020 = "dc249"
			end
			if filters.Whitelist and filters.Whitelist[player.Name] then
				if 5 ~= 5 then
					local _dc19390 = 67
					local _dc1913 = "dc106"
				end
				return (not not false)
			end
			if filters.FriendCheck and FriendsCache[player.Name] then
				return (1 == 0)
			end
			if filters.Teams and next(filters.Teams) and not filters.Teams[teamName] then
				if 1 == 2 then
					local _dc21326 = 728
					local _dc15409 = "dc638"
				end
				return (1 == 0)
			end
			if teamName == "\73\110\109\97\116\101\115" then
				local holdingTaser = filters.HoldingTaser
				local needStatus = (filters.InmateTypes and next(filters.InmateTypes)) or (filters.ArrestSafety and not holdingTaser)
				if needStatus then
					local status = PL.GetInmateStatus(character)
					if filters.InmateTypes and next(filters.InmateTypes) and not filters.InmateTypes[status] then
						return (1 == 0)
					end
					if filters.ArrestSafety and not holdingTaser and status == "\65\114\114\101\115\116\97\98\108\101" then
						return (not not false)
					end
				end
			end
		end
		local humanoid = character:FindFirstChild("\72\117\109\97\110\111\105\100")
		if filters.DeathCheck and (not humanoid or humanoid.Health <= 0) then
			if 10 < 1 then
				local _dc99523 = "dc279"
			end
			return (1 == 0)
		end
		if filters.ForceFieldCheck and character:FindFirstChild("\70\111\114\99\101\70\105\101\108\100") then
			return (1 == 0)
		end
		return (not false)
	end
	function PL.wallcheck(shootOrigin, targetPos, wallbangRootPos)
		PL.OriginScanner:UpdateIgnore()
		local ray = GuardedRaycast(targetPos, shootOrigin - targetPos, PL.OriginScanner.Ray)
		if ray then
			return not wallbangRootPos or not PL.OriginScanner:Scan(wallbangRootPos, targetPos, ray.Position + ray.Normal * ((0.05 * 10) / 10))
		end
		return (not not false)
	end
	function PLTargeting.getClosestPart(settings)
		local origin = settings.Origin or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") and LocalPlayer.Character.HumanoidRootPart.Position)
		if not origin then
			if 5 ~= 5 then
				local _dc90183 = 505
				local _dc16887 = 458
			end
			return nil
		end
		local localCharacter = LocalPlayer.Character
		if not localCharacter then
			if 5 ~= 5 then
				local _dc20690 = 110
				local _dc46881 = "dc473"
			end
			return nil
		end
		local root = localCharacter:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
		if not root then
			return nil
		end
		if settings.RollChance and settings.HitChance and settings.HitChance < (880 - 780) and settings.AimRandom then
			if settings.AimRandom:NextInteger(1, bit32.bxor(bit32.bxor(100, 1515870810), 1515870810)) > settings.HitChance then
				return nil
			end
		end
		local boneName = "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116"
		if settings.Bone then
			if 10 < 1 then
				local _dc43815 = 205
				local _dc59850 = "dc477"
			end
			boneName = settings.Bone
		elseif settings.HeadshotChance and settings.HeadshotChance >= bit32.bxor(bit32.bxor(100, 1515870810), 1515870810) then
			boneName = "\72\101\97\100"
		elseif settings.HeadshotChance and settings.AimRandom then
			if 5 ~= 5 then
				local _dc74636 = "dc830"
			end
			boneName = settings.AimRandom:NextInteger(1, (658 - 558)) <= settings.HeadshotChance and "\72\101\97\100" or "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116"
		end
		local aimRange = settings.Range or (-273 + 423)
		if settings.Mode == "\80\111\115\105\116\105\111\110" and settings.RangeLimit then
			aimRange = math.min(aimRange, settings.RangeLimit)
		end
		local wallbangRoot = settings.Wallbang and root.Position or nil
		local sortingTable = {}
		local mousePos = PL.getMousePosition()
		local filters = settings.Filters or {}
		for _, player in PlayersService:GetPlayers() do
			if player == LocalPlayer then
				if 5 ~= 5 then
					local _dc47890 = 926
					local _dc67530 = "dc542"
				end
				continue
			end
			local character = player.Character
			if not character then
				continue
			end
			if not PL.passesCombatFilters(player, character, filters) then
				continue
			end
			if player.Team == Teams.Inmates then
				if 1 == 2 then
					local _dc90918 = 874
					local _dc76196 = 966
				end
				if not (character:GetAttribute("\84\114\101\115\112\97\115\115\105\110\103") or character:GetAttribute("\72\111\115\116\105\108\101")) then
					continue
				end
				if settings.AttackCheck and LocalPlayer.Team == Teams.Guards and not character:GetAttribute("\72\111\115\116\105\108\101") then
					continue
				end
			end
			local targetPart = character:FindFirstChild(boneName) or character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
			if not targetPart then
				if 1 == 2 then
					local _dc61315 = 461
					local _dc26124 = "dc710"
				end
				continue
			end
			local magnitude
			if settings.Mode == "\77\111\117\115\101" then
				local screenPos, onScreen = PLCamera:WorldToViewportPoint(targetPart.Position)
				if not onScreen then
					continue
				end
				magnitude = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
			else
				magnitude = (targetPart.Position - origin).Magnitude
			end
			if magnitude > aimRange then
				continue
			end
			if PL.wallcheck(origin, targetPart.Position, wallbangRoot) then
				if 5 ~= 5 then
					local _dc58116 = "dc518"
					local _dc11709 = 306
				end
				continue
			end
			table.insert(sortingTable, {
				Part = targetPart,
				Magnitude = magnitude,
				Player = player,
			})
		end
		table.sort(sortingTable, function(a, b)
			return a.Magnitude < b.Magnitude
		end)
		return sortingTable[1] and sortingTable[1].Part or nil, sortingTable[1] and sortingTable[1].Player or nil
	end
	function PLTargeting.allPositions(settings)
		local origin = settings.Origin or (LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character.HumanoidRootPart.Position)
		if not origin then
			return {}
		end
		local results = {}
		local wallbangRoot = settings.Wallbang and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") and LocalPlayer.Character.HumanoidRootPart.Position or nil
		local filters = settings.Filters or {}
		for _, player in PlayersService:GetPlayers() do
			if 1 == 2 then
				local _dc9023 = "dc791"
				local _dc72884 = "dc914"
			end
			if player == LocalPlayer then
				continue
			end
			local character = player.Character
			if not character then
				continue
			end
			if not PL.passesCombatFilters(player, character, filters) then
				continue
			end
			if player.Team == Teams.Inmates and settings.AttackCheck and LocalPlayer.Team == Teams.Guards and not character:GetAttribute("\72\111\115\116\105\108\101") then
				continue
			end
			local targetPart = character:FindFirstChild(settings.Bone or "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116") or character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
			if not targetPart then
				continue
			end
			local magnitude = (targetPart.Position - origin).Magnitude
			if magnitude > (settings.Range or (663 - 651)) then
				if 10 < 1 then
					local _dc43346 = 61
					local _dc43580 = "dc6"
					local _dc66947 = "dc287"
				end
				continue
			end
			if settings.Wallcheck ~= (1 == 0) and PL.wallcheck(origin, targetPart.Position, wallbangRoot) then
				continue
			end
			table.insert(results, {
				Part = targetPart,
				Player = player,
				Magnitude = magnitude,
			})
		end
		table.sort(results, function(a, b)
			return a.Magnitude < b.Magnitude
		end)
		if settings.Limit then
			if 10 < 1 then
				local _dc28459 = 946
				local _dc46790 = 697
				local _dc93431 = "dc400"
			end
			while #results > settings.Limit do
				if 1 == 2 then
					local _dc77610 = "dc570"
					local _dc34867 = 516
					local _dc26812 = 106
				end
				table.remove(results)
			end
		end
		return results
	end
	function PL.applyWallbang(origin, targetPos)
		local character = LocalPlayer.Character
		local root = character and character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
		if not root then
			if 1 == 2 then
				local _dc6584 = 235
				local _dc19209 = 479
			end
			return origin
		end
		PL.OriginScanner:UpdateIgnore()
		local ray = GuardedRaycast(targetPos, origin - targetPos, PL.OriginScanner.Ray)
		if ray then
			if 5 ~= 5 then
				local _dc13189 = "dc968"
				local _dc24723 = 740
			end
			local newOrigin = PL.OriginScanner:Scan(root.Position, targetPos, ray.Position + ray.Normal * ((0.05 * 5) / 5))
			if newOrigin then
				return newOrigin
			end
		end
		return origin
	end
	PL.TracerHook = {
		Hooks = {},
	}
	local oldGunTracer = nil
	function PL.TracerHook:Add(self, key, fn, priority)
		if 10 < 1 then
			local _dc51918 = 310
		end
		table.insert(self.Hooks, {
			key,
			fn,
			priority or 0,
		})
		table.sort(self.Hooks, function(a, b)
			return a[(-396 + 399)] < b[(-851 + 854)]
		end)
		if not oldGunTracer and PL.GunTracers then
			oldGunTracer = hookfunction(PL.GunTracers.createBullet, function(...)
				if debug.info((-247 + 250), "s") ~= "\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101\46\83\99\114\105\112\116\115\46\82\101\112\108\105\99\97\116\105\111\110\46\67\108\105\101\110\116\82\101\112\108\105\99\97\116\111\114" then
					for _, v in self.Hooks do
						if v[bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)](...) then
							return
						end
					end
				end
				return oldGunTracer(...)
			end)
		end
	end
	function PL.TracerHook:Remove(self, key)
		for i, v in self.Hooks do
			if v[1] == key then
				table.remove(self.Hooks, i)
				break
			end
		end
		if oldGunTracer and not next(self.Hooks) then
			hookfunction(PL.GunTracers.createBullet, oldGunTracer)
			oldGunTracer = nil
		end
	end
	local bulletHandlers = {}
	local oldBullet = nil
	local bulletHookActive = (1 == 0)
	function PL.addBulletHandler(name, handler, priority)
		if 1 == 2 then
			local _dc4543 = 829
		end
		table.insert(bulletHandlers, {
			name,
			handler,
			priority or 0,
		})
		table.sort(bulletHandlers, function(a, b)
			return a[(-726 + 729)] < b[bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)]
		end)
		PL.ensureBulletHook()
	end
	function PL.removeBulletHandler(name)
		for i, v in bulletHandlers do
			if v[1] == name then
				table.remove(bulletHandlers, i)
				break
			end
		end
		if not next(bulletHandlers) then
			PL.removeBulletHook()
		end
	end
	function PL.ensureBulletHook()
		if 1 == 2 then
			local _dc18519 = 819
			local _dc80781 = "dc163"
		end
		if bulletHookActive or not PL.Bullet then
			if 1 == 2 then
				local _dc60768 = 627
			end
			return
		end
		oldBullet = hookfunction(PL.Bullet, newcclosure(function(...)
			local args = table.pack(...)
			for _, h in bulletHandlers do
				local result = h[bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)](args)
				if result == (not true) then
					return oldBullet(unpack(args, 1, args.n))
				end
			end
			return oldBullet(unpack(args, 1, args.n))
		end))
		bulletHookActive = (1 == 1)
	end
	function PL.removeBulletHook()
		if 10 < 1 then
			local _dc72073 = 89
		end
		if oldBullet and PL.Bullet then
			if 10 < 1 then
				local _dc54969 = 305
				local _dc1777 = "dc512"
			end
			if restorefunction then
				restorefunction(PL.Bullet)
			else
				if 5 ~= 5 then
					local _dc67241 = "dc359"
					local _dc64965 = 286
					local _dc52029 = 3
				end
				hookfunction(PL.Bullet, oldBullet)
			end
			oldBullet = nil
			bulletHookActive = (not true)
		end
	end
	local shootHandlers = {}
	local oldShootHook = nil
	local shootHookActive = (not true)
	function PL.addShootHandler(name, handler)
		if 10 < 1 then
			local _dc98998 = "dc883"
			local _dc74147 = 934
		end
		shootHandlers[name] = handler
		PL.ensureShootHook()
	end
	function PL.removeShootHandler(name)
		shootHandlers[name] = nil
		if not next(shootHandlers) then
			if 5 ~= 5 then
				local _dc26060 = "dc410"
				local _dc77380 = 381
			end
			PL.removeShootHook()
		end
	end
	function PL.ensureShootHook()
		if shootHookActive or not PL.Shoot then
			return
		end
		oldShootHook = hookfunction(PL.Shoot, newcclosure(function(...)
			local args = table.pack(oldShootHook(...))
			for _, handler in shootHandlers do
				handler(args)
			end
			return unpack(args, 1, args.n)
		end))
		shootHookActive = (1 == 1)
	end
	function PL.removeShootHook()
		if oldShootHook and PL.Shoot then
			if 10 < 1 then
				local _dc83432 = 349
			end
			if restorefunction then
				restorefunction(PL.Shoot)
			else
				if 5 ~= 5 then
					local _dc27314 = 470
					local _dc87994 = "dc801"
					local _dc36642 = 187
				end
				hookfunction(PL.Shoot, oldShootHook)
			end
			oldShootHook = nil
			shootHookActive = (1 == 0)
		end
	end
	task.spawn(function()
		while not PL.resolveShoot() do
			task.wait(((0.5 * 5) / 5))
		end
		pcall(function()
			PL.GunTracers = require(ReplicatedStorage:WaitForChild("\83\104\97\114\101\100\77\111\100\117\108\101\115"):WaitForChild("\71\117\110\84\114\97\99\101\114\115"))
		end)
	end)
	RegisterCleanup(function()
		local bulletNames, shootNames = {}, {}
		for _, h in bulletHandlers do
			table.insert(bulletNames, h[1])
		end
		for _, name in bulletNames do
			PL.removeBulletHandler(name)
		end
		for name in shootHandlers do
			table.insert(shootNames, name)
		end
		for _, name in shootNames do
			PL.removeShootHandler(name)
		end
		PL.removeBulletHook()
		PL.removeShootHook()
		if PL.TracerHook and PL.TracerHook.Hooks then
			local tracerKeys = {}
			for _, h in PL.TracerHook.Hooks do
				table.insert(tracerKeys, h[1])
			end
			for _, key in tracerKeys do
				PL.TracerHook:Remove(key)
			end
		end
		if oldGunTracer and PL.GunTracers then
			pcall(function()
				hookfunction(PL.GunTracers.createBullet, oldGunTracer)
			end)
			oldGunTracer = nil
		end
	end)
	do
		local GunModState = {
			Enabled = (not not false),
			NoSpread = (1 == 0),
			FullAuto = (1 == 0),
			FireRatePct = bit32.bxor(bit32.bxor(100, 1515870810), 1515870810),
		}
		local gunModOldData, gunModOldRef = {}, nil
		local gunModThread = nil
		local function restoreGunData()
			if gunModOldRef then
				if 1 == 2 then
					local _dc79270 = "dc92"
				end
				for i, v in gunModOldData do
					gunModOldRef[i] = v
				end
				table.clear(gunModOldData)
				gunModOldRef = nil
			end
		end
		local function startGunModLoop()
			if 10 < 1 then
				local _dc59505 = 532
				local _dc91754 = "dc943"
			end
			if gunModThread then
				if 10 < 1 then
					local _dc50500 = "dc393"
					local _dc41429 = 964
				end
				return
			end
			gunModThread = task.spawn(function()
				while GunModState.Enabled do
					local data = PL.getGunData()
					if data then
						if gunModOldRef ~= data then
							gunModOldData = table.clone(data)
							gunModOldRef = data
						end
						data.SpreadRadius = GunModState.NoSpread and 0 or gunModOldData.SpreadRadius
						data.FireRate = (gunModOldData.FireRate or 0) * (GunModState.FireRatePct / (1096 - 996))
						data.AutoFire = GunModState.FullAuto or gunModOldData.AutoFire
					end
					task.wait(((0.016 * 4) / 4))
				end
				restoreGunData()
				gunModThread = nil
			end)
		end
		local GunModSection = CombatPage:Section({
			Name = "\71\117\110\32\77\111\100\105\102\105\99\97\116\105\111\110\115",
			Side = (553 - 551),
		})
		GunModSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\71\117\110\77\111\100\105\102\105\99\97\116\105\111\110\115\69\110\97\98\108\101\100",
			Default = (1 == 0),
			Callback = function(v)
				GunModState.Enabled = v
				if v then
					if not PL.rawShoot then
						PL.resolveShoot()
					end
					startGunModLoop()
				else
					restoreGunData()
				end
			end,
		})
		GunModSection:Slider({
			Name = "\70\105\114\101\82\97\116\101\32\77\117\108\116\105\112\108\105\101\114",
			Flag = "\71\117\110\77\111\100\70\105\114\101\82\97\116\101",
			Min = 1,
			Max = (741 - 641),
			Default = (-406 + 506),
			Suffix = "%",
			Callback = function(v)
				GunModState.FireRatePct = v
			end,
		})
		GunModSection:Toggle({
			Name = "\78\111\32\83\112\114\101\97\100",
			Flag = "\71\117\110\77\111\100\78\111\83\112\114\101\97\100",
			Default = (not true),
			Callback = function(v)
				GunModState.NoSpread = v
			end,
		})
		GunModSection:Toggle({
			Name = "\70\117\108\108\32\65\117\116\111\109\97\116\105\99",
			Flag = "\71\117\110\77\111\100\70\117\108\108\65\117\116\111",
			Default = (not true),
			Callback = function(v)
				GunModState.FullAuto = v
			end,
		})
		RegisterCleanup(function()
			GunModState.Enabled = (1 == 0)
			restoreGunData()
		end)
	end
	do
		do
			if 10 < 1 then
				local _dc91585 = 424
				local _dc78835 = 940
				local _dc77531 = 261
			end
			local SilentAimSection = CombatPage:Section({
				Name = "\83\105\108\101\110\116\32\65\105\109",
				Side = 1,
			})
			do
				if 1 == 2 then
					local _dc24907 = 836
					local _dc40659 = "dc164"
				end
				local SilentAimState = {
					Enabled = (not true),
					Style = "\76\101\103\105\116",
					Triggerbot = (not true),
					ArrestSafety = (1 == 0),
					FoVCircle = (1 == 0),
					FoVCircleFilled = (1 == 0),
					FoVCircleTransparency = ((0.5 * 10) / 10),
					FoVCircleColor = Library.Theme.Accent,
					Tracer = (not true),
					TracerColor = Library.Theme.Accent,
					Mode = "\77\111\117\115\101",
					Range = (702 - 552),
					HitChance = (-619 + 704),
					HeadshotChance = (-205 + 270),
					Wallbang = (not true),
					ForceFieldCheck = (not not true),
					Teams = {},
					InmateTypes = {},
					DeathCheck = (not false),
					FriendCheck = (not true),
					Whitelist = {},
					Blacklist = {},
				}
				local aimRandom = Random.new()
				local function getSAFilters()
					local holdingTaser = (1 == 0)
					local char = LocalPlayer.Character
					if char and SilentAimState.ArrestSafety then
						local tool = char:FindFirstChildOfClass("\84\111\111\108")
						if tool then
							if 1 == 2 then
								local _dc56297 = "dc184"
							end
							holdingTaser = tool.Name == "\84\97\115\101\114"
						end
					end
					return {
						Teams = SilentAimState.Teams,
						InmateTypes = SilentAimState.InmateTypes,
						Whitelist = SilentAimState.Whitelist,
						Blacklist = SilentAimState.Blacklist,
						AutoBlacklist = AutoBlacklistSet,
						FriendCheck = SilentAimState.FriendCheck,
						DeathCheck = SilentAimState.DeathCheck,
						ForceFieldCheck = SilentAimState.ForceFieldCheck,
						ArrestSafety = SilentAimState.ArrestSafety,
						HoldingTaser = holdingTaser,
					}
				end
				local function saGetTarget(origin, rangeLimit, attackCheck, rollChance)
					if 5 ~= 5 then
						local _dc55893 = 93
					end
					local blatant = SilentAimState.Style == "\66\108\97\116\97\110\116"
					return PLTargeting.getClosestPart({
						Origin = origin,
						Mode = SilentAimState.Mode,
						Range = SilentAimState.Range,
						RangeLimit = rangeLimit,
						HitChance = blatant and (137 - 37) or SilentAimState.HitChance,
						HeadshotChance = blatant and bit32.bxor(bit32.bxor(100, 1515870810), 1515870810) or SilentAimState.HeadshotChance,
						Bone = blatant and "\72\101\97\100" or nil,
						Wallbang = SilentAimState.Wallbang,
						AttackCheck = attackCheck,
						RollChance = rollChance and not blatant,
						AimRandom = aimRandom,
						Filters = getSAFilters(),
					})
				end
				SilentAimSection:Dropdown({
					Name = "\83\116\121\108\101",
					Flag = "\83\105\108\101\110\116\65\105\109\83\116\121\108\101",
					Default = "\76\101\103\105\116",
					Multi = (not not false),
					Items = {
						"\76\101\103\105\116",
						"\66\108\97\116\97\110\116",
					},
					Callback = function(v)
						SilentAimState.Style = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\83\105\108\101\110\116\32\65\105\109",
						Description = "\76\101\103\105\116\58\32\104\105\116\47\104\101\97\100\115\104\111\116\32\99\104\97\110\99\101\32\114\111\108\108\115\32\99\97\110\32\109\105\115\115\32\40\86\97\112\101\41\46\32\66\108\97\116\97\110\116\58\32\97\108\119\97\121\115\32\114\101\100\105\114\101\99\116\115\32\116\111\32\104\101\97\100\46",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\69\110\97\98\108\101\100",
					Default = SilentAimState.Enabled,
					Callback = function(v)
						SilentAimState.Enabled = v
						if not v then
							PL.removeBulletHandler("\83\105\108\101\110\116\65\105\109")
							return
						end
						PL.addBulletHandler("\83\105\108\101\110\116\65\105\109", function(args)
							if not (SilentAimState.Enabled or RagebotForcedTarget) then
								return
							end
							local origin = args[1]
							local gunData = PL.getGunData()
							local rangeLimit = gunData and gunData.Range or bit32.bxor(bit32.bxor(1000, 1515870810), 1515870810)
							local attackCheck = not gunData or gunData.Behavior ~= "\84\97\115\101\114"
							local hitPart = RagebotForcedTarget or saGetTarget(origin, rangeLimit, attackCheck, (1 == 1))
							if not hitPart then
								return (not true)
							end
							args[(-477 + 479)] = hitPart.Position
							aimVec = args[bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)]
							aimTimer = os.clock() + ((0.3 * 10) / 10)
							shootTimer = os.clock() + ((0.3 * 10) / 10)
							if SilentAimState.Wallbang then
								local newOrigin = PL.applyWallbang(origin, args[bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)])
								for i, v in debug.getstack(bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)) do
									if v == origin then
										debug.setstack(bit32.bxor(bit32.bxor(3, 1515870810), 1515870810), i, newOrigin)
									end
								end
								args[1] = newOrigin
							end
						end, 1)
					end,
				})
				SilentAimSection:Toggle({
					Name = "\84\114\105\103\103\101\114\98\111\116",
					ToolTip = {
						Name = "\84\114\105\103\103\101\114\98\111\116",
						Description = "\65\117\116\111\109\97\116\105\99\97\108\108\121\32\102\105\114\101\115\32\119\104\101\110\32\97\32\118\97\108\105\100\32\116\97\114\103\101\116\32\105\115\32\119\105\116\104\105\110\32\116\104\101\32\70\111\86\32\99\105\114\99\108\101",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\84\114\105\103\103\101\114\98\111\116",
					Default = SilentAimState.Triggerbot,
					Callback = function(v)
						SilentAimState.Triggerbot = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\65\114\114\101\115\116\32\83\97\102\101\116\121",
					ToolTip = {
						Name = "\65\114\114\101\115\116\32\83\97\102\101\116\121",
						Description = "\73\103\110\111\114\101\115\32\97\114\114\101\115\116\97\98\108\101\32\105\110\109\97\116\101\115\32\117\110\108\101\115\115\32\121\111\117\32\97\114\101\32\104\111\108\100\105\110\103\32\116\104\101\32\84\97\115\101\114\32\20\32\107\105\108\108\105\110\103\32\116\104\101\109\32\119\105\116\104\111\117\116\32\99\97\117\115\101\32\105\115\32\112\117\110\105\115\104\97\98\108\101",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\65\114\114\101\115\116\83\97\102\101\116\121",
					Default = SilentAimState.ArrestSafety,
					Callback = function(v)
						SilentAimState.ArrestSafety = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\70\111\86\32\67\105\114\99\108\101",
					ToolTip = {
						Name = "\70\111\86\32\67\105\114\99\108\101",
						Description = "\83\104\111\119\115\32\116\97\114\103\101\116\105\110\103\32\114\97\100\105\117\115\32\111\110\32\115\99\114\101\101\110\32\40\77\111\117\115\101\32\109\111\100\101\32\111\110\108\121\41",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\70\111\86\69\110\97\98\108\101\100",
					Default = SilentAimState.FoVCircle,
					Callback = function(v)
						SilentAimState.FoVCircle = v
					end,
				}):Colorpicker({
					Name = "\67\111\108\111\114",
					Flag = "\83\105\108\101\110\116\65\105\109\70\111\86\67\111\108\111\114",
					Default = SilentAimState.FoVCircleColor,
					Alpha = 0,
					Callback = function(v)
						SilentAimState.FoVCircleColor = v
					end,
				})
				SilentAimSection:Slider({
					Name = "\67\105\114\99\108\101\32\84\114\97\110\115\112\97\114\101\110\99\121",
					Flag = "\83\105\108\101\110\116\65\105\109\70\111\86\84\114\97\110\115\112\97\114\101\110\99\121",
					Min = 0,
					Max = 1,
					Default = ((0.5 * 4) / 4),
					Decimals = ((0.01 * 10) / 10),
					Callback = function(v)
						SilentAimState.FoVCircleTransparency = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\67\105\114\99\108\101\32\70\105\108\108\101\100",
					Flag = "\83\105\108\101\110\116\65\105\109\70\111\86\70\105\108\108\101\100",
					Default = (not true),
					Callback = function(v)
						SilentAimState.FoVCircleFilled = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\84\114\97\99\101\114",
					ToolTip = {
						Name = "\84\114\97\99\101\114",
						Description = "\68\114\97\119\115\32\97\32\108\105\110\101\32\102\114\111\109\32\121\111\117\114\32\99\117\114\115\111\114\32\116\111\32\116\104\101\32\99\117\114\114\101\110\116\32\116\97\114\103\101\116",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\84\114\97\99\101\114\69\110\97\98\108\101\100",
					Default = SilentAimState.Tracer,
					Callback = function(v)
						SilentAimState.Tracer = v
					end,
				}):Colorpicker({
					Name = "\67\111\108\111\114",
					Flag = "\83\105\108\101\110\116\65\105\109\84\114\97\99\101\114\67\111\108\111\114",
					Default = SilentAimState.TracerColor,
					Alpha = 0,
					Callback = function(v)
						SilentAimState.TracerColor = v
					end,
				})
				SilentAimSection:Dropdown({
					Name = "\77\111\100\101",
					Flag = "\83\105\108\101\110\116\65\105\109\77\111\100\101",
					Default = SilentAimState.Mode,
					Multi = (not not false),
					Items = {
						"\77\111\117\115\101",
						"\80\111\115\105\116\105\111\110",
					},
					Callback = function(v)
						SilentAimState.Mode = v
					end,
				})
				SilentAimSection:Slider({
					Name = "\82\97\110\103\101",
					Flag = "\83\105\108\101\110\116\65\105\109\82\97\110\103\101",
					Min = 1,
					Max = bit32.bxor(bit32.bxor(1000, 1515870810), 1515870810),
					Default = SilentAimState.Range,
					Decimals = 1,
					Callback = function(v)
						SilentAimState.Range = v
					end,
				})
				SilentAimSection:Slider({
					Name = "\72\105\116\32\67\104\97\110\99\101",
					Flag = "\83\105\108\101\110\116\65\105\109\72\105\116\67\104\97\110\99\101",
					Min = 0,
					Max = (-867 + 967),
					Default = SilentAimState.HitChance,
					Suffix = "%",
					ToolTip = {
						Name = "\72\105\116\32\67\104\97\110\99\101",
						Description = "\76\101\103\105\116\32\111\110\108\121\46\32\67\104\97\110\99\101\32\115\105\108\101\110\116\32\97\105\109\32\114\101\100\105\114\101\99\116\115\32\116\104\101\32\98\117\108\108\101\116\46\32\66\101\108\111\119\32\49\48\48\37\32\115\111\109\101\32\115\104\111\116\115\32\102\105\114\101\32\110\111\114\109\97\108\108\121\32\97\110\100\32\99\97\110\32\109\105\115\115\46",
					},
					Callback = function(v)
						SilentAimState.HitChance = v
					end,
				})
				SilentAimSection:Slider({
					Name = "\72\101\97\100\115\104\111\116\32\67\104\97\110\99\101",
					Flag = "\83\105\108\101\110\116\65\105\109\72\101\97\100\115\104\111\116\67\104\97\110\99\101",
					Min = 0,
					Max = (714 - 614),
					Default = SilentAimState.HeadshotChance,
					Suffix = "%",
					ToolTip = {
						Name = "\72\101\97\100\115\104\111\116\32\67\104\97\110\99\101",
						Description = "\76\101\103\105\116\32\111\110\108\121\46\32\67\104\97\110\99\101\32\116\111\32\97\105\109\32\97\116\32\72\101\97\100\32\105\110\115\116\101\97\100\32\111\102\32\116\111\114\115\111\32\119\104\101\110\32\97\32\115\104\111\116\32\105\115\32\114\101\100\105\114\101\99\116\101\100\46",
					},
					Callback = function(v)
						SilentAimState.HeadshotChance = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\87\97\108\108\98\97\110\103",
					ToolTip = {
						Name = "\87\97\108\108\98\97\110\103",
						Description = "\83\104\111\111\116\32\116\104\114\111\117\103\104\32\119\97\108\108\115\32\119\104\101\110\32\97\32\67\108\105\101\110\116\66\117\108\108\101\116\32\112\97\116\104\32\101\120\105\115\116\115\32\102\114\111\109\32\121\111\117\114\32\99\104\97\114\97\99\116\101\114\32\116\111\32\116\104\101\32\116\97\114\103\101\116",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\87\97\108\108\98\97\110\103",
					Default = SilentAimState.Wallbang,
					Callback = function(v)
						SilentAimState.Wallbang = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\70\111\114\99\101\70\105\101\108\100\32\67\104\101\99\107",
					ToolTip = {
						Name = "\70\111\114\99\101\70\105\101\108\100\32\67\104\101\99\107",
						Description = "\83\107\105\112\115\32\116\97\114\103\101\116\115\32\119\105\116\104\32\97\110\32\97\99\116\105\118\101\32\115\112\97\119\110\32\70\111\114\99\101\70\105\101\108\100",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\70\111\114\99\101\70\105\101\108\100\67\104\101\99\107",
					Default = SilentAimState.ForceFieldCheck,
					Callback = function(v)
						SilentAimState.ForceFieldCheck = v
					end,
				})
				SilentAimSection:Dropdown({
					Name = "\84\101\97\109\115",
					Flag = "\83\105\108\101\110\116\65\105\109\84\101\97\109\115",
					Multi = (1 == 1),
					Items = {
						"\71\117\97\114\100\115",
						"\73\110\109\97\116\101\115",
						"\67\114\105\109\105\110\97\108\115",
					},
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (not false)
						end
						SilentAimState.Teams = set
					end,
				})
				SilentAimSection:Dropdown({
					Name = "\73\110\109\97\116\101\32\84\121\112\101\115",
					Flag = "\83\105\108\101\110\116\65\105\109\73\110\109\97\116\101\84\121\112\101\115",
					Multi = (1 == 1),
					Items = {
						"\82\101\103\117\108\97\114",
						"\65\103\103\114\101\115\115\105\118\101",
						"\65\114\114\101\115\116\97\98\108\101",
					},
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (not not true)
						end
						SilentAimState.InmateTypes = set
					end,
				})
				SilentAimSection:Toggle({
					Name = "\68\101\97\116\104\32\67\104\101\99\107",
					ToolTip = {
						Name = "\68\101\97\116\104\32\67\104\101\99\107",
						Description = "\83\107\105\112\115\32\100\101\97\100\32\112\108\97\121\101\114\115\32\115\111\32\121\111\117\32\100\111\110\39\116\32\119\97\115\116\101\32\115\104\111\116\115\32\111\110\32\99\111\114\112\115\101\115",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\68\101\97\116\104\67\104\101\99\107",
					Default = SilentAimState.DeathCheck,
					Callback = function(v)
						SilentAimState.DeathCheck = v
					end,
				})
				SilentAimSection:Toggle({
					Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
					ToolTip = {
						Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
						Description = "\87\111\110\39\116\32\116\97\114\103\101\116\32\112\108\97\121\101\114\115\32\111\110\32\121\111\117\114\32\82\111\98\108\111\120\32\102\114\105\101\110\100\115\32\108\105\115\116",
					},
					Flag = "\83\105\108\101\110\116\65\105\109\70\114\105\101\110\100\67\104\101\99\107",
					Default = SilentAimState.FriendCheck,
					Callback = function(v)
						SilentAimState.FriendCheck = v
					end,
				})
				do
					if 10 < 1 then
						local _dc80366 = "dc394"
						local _dc89522 = "dc243"
						local _dc20946 = 84
					end
					local saPlayerNames = {}
					for _, p in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
						if p ~= game.Players.LocalPlayer then
							table.insert(saPlayerNames, p.Name)
						end
					end
					local SAWhitelistDropdown = SilentAimSection:Dropdown({
						Name = "\87\104\105\116\101\108\105\115\116",
						Flag = "\83\105\108\101\110\116\65\105\109\87\104\105\116\101\108\105\115\116",
						Multi = (not not true),
						Items = saPlayerNames,
						Callback = function(v)
							local set = {}
							for _, name in pairs(v) do
								set[name] = (not false)
							end
							SilentAimState.Whitelist = set
						end,
					})
					local SABlacklistDropdown = SilentAimSection:Dropdown({
						Name = "\66\108\97\99\107\108\105\115\116",
						ToolTip = {
							Name = "\66\108\97\99\107\108\105\115\116",
							Description = "\65\108\119\97\121\115\32\116\97\114\103\101\116\32\116\104\101\115\101\32\112\108\97\121\101\114\115\32\114\101\103\97\114\100\108\101\115\115\32\111\102\32\116\101\97\109\44\32\105\110\109\97\116\101\32\115\116\97\116\117\115\44\32\111\114\32\97\114\114\101\115\116\32\115\97\102\101\116\121\32\102\105\108\116\101\114\115",
						},
						Flag = "\83\105\108\101\110\116\65\105\109\66\108\97\99\107\108\105\115\116",
						Multi = (not not true),
						Items = saPlayerNames,
						Callback = function(v)
							local set = {}
							for _, name in pairs(v) do
								set[name] = (not not true)
							end
							SilentAimState.Blacklist = set
						end,
					})
					TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerAdded:Connect(function(p)
						SAWhitelistDropdown:Add(p.Name)
						SABlacklistDropdown:Add(p.Name)
					end))
					TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerRemoving:Connect(function(p)
						SAWhitelistDropdown:Remove(p.Name)
						SABlacklistDropdown:Remove(p.Name)
					end))
				end
				do
					local FoVCircle = TrackDrawing(Drawing.new("\67\105\114\99\108\101"))
					FoVCircle.Thickness = 1
					FoVCircle.NumSides = bit32.bxor(bit32.bxor(100, 1515870810), 1515870810)
					FoVCircle.Filled = (1 == 0)
					FoVCircle.Visible = (not true)
					FoVCircle.ZIndex = bit32.bxor(bit32.bxor(999, 1515870810), 1515870810)
					FoVCircle.Transparency = 1
					local Tracer = TrackDrawing(Drawing.new("\76\105\110\101"))
					Tracer.Thickness = 1
					Tracer.Visible = (not true)
					Tracer.ZIndex = bit32.bxor(bit32.bxor(999, 1515870810), 1515870810)
					Tracer.Transparency = 1
					local previewTarget = nil
					NewRender(function()
						PLCamera = workspace.CurrentCamera
						local showCircle = SilentAimState.Enabled and SilentAimState.FoVCircle and SilentAimState.Mode == "\77\111\117\115\101"
						if showCircle then
							FoVCircle.Position = PL.getMousePosition()
							FoVCircle.Radius = SilentAimState.Range
							FoVCircle.Color = SilentAimState.FoVCircleColor
							FoVCircle.Filled = SilentAimState.FoVCircleFilled
							FoVCircle.Thickness = 1
							FoVCircle.Transparency = 1 - SilentAimState.FoVCircleTransparency
							FoVCircle.Visible = (not false)
						else
							FoVCircle.Visible = (1 == 0)
						end
						previewTarget = nil
						if SilentAimState.Enabled or RagebotForcedTarget then
							local head = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\72\101\97\100")
							local previewOrigin = RagebotMuzzleOrigin or (head and head.Position) or Vector3.zero
							local previewRoll = SilentAimState.Style == "\76\101\103\105\116" and not RagebotForcedTarget
							previewTarget = RagebotForcedTarget or saGetTarget(previewOrigin, (693 + 307), (not not true), previewRoll)
						end
						if SilentAimState.Enabled and SilentAimState.Tracer and previewTarget then
							local screenPos, onScreen = PLCamera:WorldToViewportPoint(previewTarget.Position)
							if onScreen then
								Tracer.From = PL.getMousePosition()
								Tracer.To = Vector2.new(screenPos.X, screenPos.Y)
								Tracer.Color = SilentAimState.TracerColor
								Tracer.Visible = (not not true)
							else
								Tracer.Visible = (not not false)
							end
						else
							Tracer.Visible = (not not false)
						end
						if SilentAimState.Triggerbot and previewTarget then
							local character = LocalPlayer.Character
							if character then
								local tool = character:FindFirstChildOfClass("\84\111\111\108")
								if tool and tool:FindFirstChild("\72\97\110\100\108\101") and tool.Handle:FindFirstChild("\83\104\111\111\116\83\111\117\110\100") then
									mouse1click()
								end
							end
						end
					end)
					RegisterCleanup(function()
						PL.removeBulletHandler("\83\105\108\101\110\116\65\105\109")
					end)
				end
			end
		end
	end
	do
		do
			if 5 ~= 5 then
				local _dc75864 = 886
				local _dc85733 = "dc818"
			end
			local SoundFiles = {
				["\49\50\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\49\50\46\109\112\51"),
				["\97\103\112\97\50\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\97\103\112\97\50\46\109\112\51"),
				["\98\97\115\115\104\105\116\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\98\97\115\115\104\105\116\46\109\112\51"),
				["\98\101\108\108\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\98\101\108\108\46\109\112\51"),
				["\98\108\105\122\122\97\114\100\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\98\108\105\122\122\97\114\100\46\109\112\51"),
				["\98\117\98\98\108\101\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\98\117\98\98\108\101\46\109\112\51"),
				["\99\104\111\99\107\112\114\111\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\99\104\111\99\107\112\114\111\46\109\112\51"),
				["\99\111\100\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\99\111\100\46\109\112\51"),
				["\99\111\112\112\101\114\98\101\108\108\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\99\111\112\112\101\114\98\101\108\108\46\109\112\51"),
				["\99\114\111\119\98\97\114\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\99\114\111\119\98\97\114\46\109\112\51"),
				["\104\101\97\100\115\104\111\116\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\104\101\97\100\115\104\111\116\46\109\112\51"),
				["\107\110\111\98\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\107\110\111\98\46\109\112\51"),
				["\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51"),
				["\110\101\118\101\114\108\111\115\101\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\110\101\118\101\114\108\111\115\101\46\109\112\51"),
				["\114\117\115\116\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\114\117\115\116\46\109\112\51"),
				["\115\107\101\101\116\46\109\112\51"] = getcustomasset("\97\115\115\101\116\115\47\115\111\117\110\100\115\47\115\107\101\101\116\46\109\112\51"),
			}
			local Players = game:GetService("\80\108\97\121\101\114\115")
			local ReplicatedStorage = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")
			local LocalPlayer = Players.LocalPlayer
			local HealthConnections = {}
			local LastFireTime = 0
			local HIT_WINDOW = ((0.35 * 4) / 4)
			local HitSoundState = {
				Enabled = (not true),
				Volume = 1,
				Sound = "\114\117\115\116\46\109\112\51",
				MuteGunSound = (1 == 0),
			}
			local KillSoundState = {
				Enabled = (not not false),
				Volume = 1,
				Sound = "\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51",
			}
			local ConfirmedKillCount = 0
			local function PlaySound(soundFile, volume)
				if 10 < 1 then
					local _dc35142 = 32
					local _dc44753 = "dc479"
					local _dc58695 = 17
				end
				local id = SoundFiles[soundFile]
				if not id then
					return
				end
				local sound = Instance.new("\83\111\117\110\100")
				sound.SoundId = id
				sound.Volume = volume
				sound.PlayOnRemove = (not not true)
				sound.Parent = workspace
				sound:Destroy()
			end
			local function PlayHitSound()
				PlaySound(HitSoundState.Sound, HitSoundState.Volume)
			end
			local function PlayKillSound()
				PlaySound(KillSoundState.Sound, KillSoundState.Volume)
			end
			local function IsLocalKillfeedEntry(entryText)
				if type(entryText) ~= "\115\116\114\105\110\103" or entryText == "" then
					return (not true)
				end
				local killPos = string.find(entryText, "\32\107\105\108\108\101\100\32", 1, (1 == 1))
				if not killPos then
					return (1 == 0)
				end
				local killerText = string.sub(entryText, 1, killPos - 1)
				local token = "\40\64" .. LocalPlayer.Name .. ")"
				return string.find(string.lower(killerText), string.lower(token), 1, (not false)) ~= nil
			end
			local function MuteShootSound(tool)
				local handle = tool:FindFirstChild("\72\97\110\100\108\101")
				if not handle then
					if 10 < 1 then
						local _dc35836 = 385
						local _dc85617 = 606
					end
					return
				end
				local shootSound = handle:FindFirstChild("\83\104\111\111\116\83\111\117\110\100")
				if not shootSound or not shootSound:IsA("\83\111\117\110\100") then
					return
				end
				if HitSoundState.MuteGunSound then
					if 10 < 1 then
						local _dc19545 = 859
						local _dc60048 = 139
						local _dc5390 = "dc778"
					end
					shootSound.Volume = 0
				end
			end
			local function HookTool(tool)
				if not tool:IsA("\84\111\111\108") then
					if 5 ~= 5 then
						local _dc1026 = "dc428"
						local _dc66707 = "dc606"
						local _dc96128 = "dc935"
					end
					return
				end
				tool.Activated:Connect(function()
					LastFireTime = tick()
					MuteShootSound(tool)
				end)
			end
			local function HookCharacter(character)
				for _, child in pairs(character:GetChildren()) do
					if 5 ~= 5 then
						local _dc19140 = 397
						local _dc74510 = "dc86"
					end
					HookTool(child)
				end
				TrackConnection(character.ChildAdded:Connect(HookTool))
			end
			if LocalPlayer.Character then
				if 1 == 2 then
					local _dc2385 = 6
					local _dc84434 = 605
					local _dc21821 = "dc976"
				end
				HookCharacter(LocalPlayer.Character)
			end
			TrackConnection(LocalPlayer.CharacterAdded:Connect(HookCharacter))
			TrackConnection(LocalPlayer.Backpack.ChildAdded:Connect(HookTool))
			for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
				HookTool(tool)
			end
			local function TrackPlayer(player)
				if player == LocalPlayer then
					if 10 < 1 then
						local _dc55054 = "dc985"
						local _dc88312 = 815
						local _dc15649 = "dc570"
					end
					return
				end
				local function ConnectHealth(character)
					local humanoid = character:WaitForChild("\72\117\109\97\110\111\105\100", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
					if not humanoid then
						if 5 ~= 5 then
							local _dc18012 = "dc864"
							local _dc3980 = 587
						end
						return
					end
					local lastHealth = humanoid.Health
					if HealthConnections[player] then
						if 1 == 2 then
							local _dc87445 = "dc799"
							local _dc88679 = "dc111"
							local _dc78485 = "dc875"
						end
						HealthConnections[player]:Disconnect()
					end
					HealthConnections[player] = humanoid.HealthChanged:Connect(function(newHealth)
						if (tick() - LastFireTime) <= HIT_WINDOW and newHealth < lastHealth then
							if HitSoundState.Enabled then
								PlayHitSound()
							end
						end
						lastHealth = newHealth
					end)
				end
				if player.Character then
					task.spawn(ConnectHealth, player.Character)
				end
				TrackConnection(player.CharacterAdded:Connect(function(char)
					task.spawn(ConnectHealth, char)
				end))
			end
			for _, player in pairs(Players:GetPlayers()) do
				TrackPlayer(player)
			end
			TrackConnection(Players.PlayerAdded:Connect(TrackPlayer))
			TrackConnection(Players.PlayerRemoving:Connect(function(player)
				if HealthConnections[player] then
					HealthConnections[player]:Disconnect()
					HealthConnections[player] = nil
				end
			end))
			local KillfeedFolder = ReplicatedStorage:FindFirstChild("\75\105\108\108\102\101\101\100")
			if KillfeedFolder then
				TrackConnection(KillfeedFolder.ChildAdded:Connect(function(entry)
					if not entry:IsA("\73\110\116\86\97\108\117\101") then
						return
					end
					local entryText = entry.Name
					if KillfeedNotificationsEnabled then
						local killPos = string.find(entryText, "\32\107\105\108\108\101\100\32", 1, (1 == 1))
						if killPos then
							local victim = string.match(string.sub(entryText, killPos + bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)), "\64\40\91\37\119\95\93\43\41\37\41")
							if victim == LocalPlayer.Name then
								local killer = string.match(string.sub(entryText, 1, killPos - 1), "\64\40\91\37\119\95\93\43\41\37\41")
								if killer and killer ~= LocalPlayer.Name then
									Library:Notification("\75\105\108\108\32\78\111\116\105\102\105\99\97\116\105\111\110\115", killer .. "\32\107\105\108\108\101\100\32\121\111\117\33", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
								end
							end
						end
					end
					if KillSoundState.Enabled and IsLocalKillfeedEntry(entryText) then
						ConfirmedKillCount = ConfirmedKillCount + 1
						PlayKillSound()
					end
				end))
			end
			RegisterCleanup(function()
				for player, conn in pairs(HealthConnections) do
					conn:Disconnect()
				end
				local function RestoreAllSounds(container)
					for _, tool in pairs(container:GetChildren()) do
						if tool:IsA("\84\111\111\108") then
							local handle = tool:FindFirstChild("\72\97\110\100\108\101")
							if handle then
								local s = handle:FindFirstChild("\83\104\111\111\116\83\111\117\110\100")
								if s and s:IsA("\83\111\117\110\100") then
									s.Volume = ((0.5 * 5) / 5)
								end
							end
						end
					end
				end
				RestoreAllSounds(LocalPlayer.Backpack)
				if LocalPlayer.Character then
					RestoreAllSounds(LocalPlayer.Character)
				end
			end)
			local HitSoundsSection = CombatPage:Section({
				Name = "\72\105\116\32\83\111\117\110\100\115",
				Side = (159 - 157),
			})
			do
				HitSoundsSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\72\105\116\32\83\111\117\110\100\115",
						Description = "\80\108\97\121\115\32\97\32\99\117\115\116\111\109\32\115\111\117\110\100\32\119\104\101\110\32\121\111\117\114\32\98\117\108\108\101\116\115\32\100\97\109\97\103\101\32\97\32\112\108\97\121\101\114",
					},
					Flag = "\72\105\116\83\111\117\110\100\115\69\110\97\98\108\101\100",
					Default = (1 == 0),
					Callback = function(v)
						HitSoundState.Enabled = v
					end,
				})
				HitSoundsSection:Toggle({
					Name = "\77\117\116\101\32\71\117\110\32\83\111\117\110\100",
					ToolTip = {
						Name = "\77\117\116\101\32\71\117\110\32\83\111\117\110\100",
						Description = "\83\105\108\101\110\99\101\115\32\116\104\101\32\119\101\97\112\111\110\39\115\32\115\104\111\111\116\32\115\111\117\110\100\32\101\102\102\101\99\116",
					},
					Flag = "\72\105\116\83\111\117\110\100\115\77\117\116\101\71\117\110",
					Default = (not not false),
					Callback = function(v)
						HitSoundState.MuteGunSound = v
						local char = LocalPlayer.Character
						if not v then
							local function RestoreVolume(container)
								for _, tool in pairs(container:GetChildren()) do
									if tool:IsA("\84\111\111\108") then
										local handle = tool:FindFirstChild("\72\97\110\100\108\101")
										if handle then
											local s = handle:FindFirstChild("\83\104\111\111\116\83\111\117\110\100")
											if s and s:IsA("\83\111\117\110\100") then
												s.Volume = ((0.5 * 5) / 5)
											end
										end
									end
								end
							end
							RestoreVolume(LocalPlayer.Backpack)
							if char then
								RestoreVolume(char)
							end
						end
					end,
				})
				HitSoundsSection:Slider({
					Name = "\86\111\108\117\109\101",
					Flag = "\72\105\116\83\111\117\110\100\115\86\111\108\117\109\101",
					Min = 0,
					Max = bit32.bxor(bit32.bxor(3, 1515870810), 1515870810),
					Default = 1,
					Decimals = ((0.1 * 2) / 2),
					Callback = function(v)
						HitSoundState.Volume = v
					end,
				})
				HitSoundsSection:Dropdown({
					Name = "\83\111\117\110\100",
					Flag = "\72\105\116\83\111\117\110\100\115\83\111\117\110\100",
					Default = "\114\117\115\116\46\109\112\51",
					Multi = (1 == 0),
					Items = {
						"\49\50\46\109\112\51",
						"\97\103\112\97\50\46\109\112\51",
						"\98\97\115\115\104\105\116\46\109\112\51",
						"\98\101\108\108\46\109\112\51",
						"\98\108\105\122\122\97\114\100\46\109\112\51",
						"\98\117\98\98\108\101\46\109\112\51",
						"\99\104\111\99\107\112\114\111\46\109\112\51",
						"\99\111\100\46\109\112\51",
						"\99\111\112\112\101\114\98\101\108\108\46\109\112\51",
						"\99\114\111\119\98\97\114\46\109\112\51",
						"\104\101\97\100\115\104\111\116\46\109\112\51",
						"\107\110\111\98\46\109\112\51",
						"\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51",
						"\110\101\118\101\114\108\111\115\101\46\109\112\51",
						"\114\117\115\116\46\109\112\51",
						"\115\107\101\101\116\46\109\112\51",
					},
					Callback = function(v)
						HitSoundState.Sound = v
					end,
				})
				HitSoundsSection:Button():Add("\80\114\101\118\105\101\119", function()
					PlayHitSound()
				end)
			end
			local KillSoundsSection = CombatPage:Section({
				Name = "\75\105\108\108\32\83\111\117\110\100\115",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				KillSoundsSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\75\105\108\108\32\83\111\117\110\100\115",
						Description = "\80\108\97\121\115\32\97\32\99\117\115\116\111\109\32\115\111\117\110\100\32\119\104\101\110\32\121\111\117\32\101\108\105\109\105\110\97\116\101\32\97\32\112\108\97\121\101\114",
					},
					Flag = "\75\105\108\108\83\111\117\110\100\115\69\110\97\98\108\101\100",
					Default = (not not false),
					Callback = function(v)
						KillSoundState.Enabled = v
					end,
				})
				KillSoundsSection:Slider({
					Name = "\86\111\108\117\109\101",
					Flag = "\75\105\108\108\83\111\117\110\100\115\86\111\108\117\109\101",
					Min = 0,
					Max = bit32.bxor(bit32.bxor(3, 1515870810), 1515870810),
					Default = 1,
					Decimals = ((0.1 * 4) / 4),
					Callback = function(v)
						KillSoundState.Volume = v
					end,
				})
				KillSoundsSection:Dropdown({
					Name = "\83\111\117\110\100",
					Flag = "\75\105\108\108\83\111\117\110\100\115\83\111\117\110\100",
					Default = "\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51",
					Multi = (1 == 0),
					Items = {
						"\49\50\46\109\112\51",
						"\97\103\112\97\50\46\109\112\51",
						"\98\97\115\115\104\105\116\46\109\112\51",
						"\98\101\108\108\46\109\112\51",
						"\98\108\105\122\122\97\114\100\46\109\112\51",
						"\98\117\98\98\108\101\46\109\112\51",
						"\99\104\111\99\107\112\114\111\46\109\112\51",
						"\99\111\100\46\109\112\51",
						"\99\111\112\112\101\114\98\101\108\108\46\109\112\51",
						"\99\114\111\119\98\97\114\46\109\112\51",
						"\104\101\97\100\115\104\111\116\46\109\112\51",
						"\107\110\111\98\46\109\112\51",
						"\109\105\110\101\99\114\97\102\116\32\111\114\98\46\109\112\51",
						"\110\101\118\101\114\108\111\115\101\46\109\112\51",
						"\114\117\115\116\46\109\112\51",
						"\115\107\101\101\116\46\109\112\51",
					},
					Callback = function(v)
						KillSoundState.Sound = v
					end,
				})
				KillSoundsSection:Button():Add("\80\114\101\118\105\101\119", function()
					PlayKillSound()
				end)
			end
		end
	end
	do
		do
			if 10 < 1 then
				local _dc385 = 327
				local _dc42831 = 778
			end
			local AutoDetonateSection = CombatPage:Section({
				Name = "\65\117\116\111\32\68\101\116\111\110\97\116\101",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			local ADEnabled = (1 == 0)
			local localC4 = nil
			local detonateTicks = 0
			local detonateRay = RaycastParams.new()
			detonateRay.CollisionGroup = "\67\108\105\101\110\116\66\117\108\108\101\116"
			detonateRay.FilterType = Enum.RaycastFilterType.Exclude
			AutoDetonateSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				Flag = "\65\117\116\111\68\101\116\111\110\97\116\101\69\110\97\98\108\101\100",
				Default = (not true),
				Callback = function(v)
					ADEnabled = v
				end,
			})
			local function trackC4(obj)
				if obj:GetAttribute("\85\115\101\114\73\100") == LocalPlayer.UserId then
					localC4 = obj
				end
			end
			TrackConnection(CollectionService:GetInstanceAddedSignal("\67\52"):Connect(function(obj)
				if ADEnabled then
					trackC4(obj)
				end
			end))
			for _, obj in CollectionService:GetTagged("\67\52") do
				if 10 < 1 then
					local _dc23964 = 75
				end
				trackC4(obj)
			end
			task.spawn(function()
				while ScriptAlive do
					if ADEnabled and localC4 and localC4.Parent then
						local backpack = LocalPlayer:FindFirstChildWhichIsA("\66\97\99\107\112\97\99\107")
						local tool = backpack and backpack:FindFirstChild("\67\52\32\69\120\112\108\111\115\105\118\101")
						if tool then
							local ent = PLTargeting.getClosestPart({
								Mode = "\80\111\115\105\116\105\111\110",
								Origin = localC4.Position,
								Range = (150 - 125),
								Bone = "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
								AttackCheck = (not not true),
								Filters = {
									Teams = {
										Criminals = (1 == 1),
										Inmates = (1 == 1),
									},
								},
							})
							if ent then
								local char = ent.Parent
								local player = PlayersService:GetPlayerFromCharacter(char)
								detonateRay.FilterDescendantsInstances = {
									char,
									LocalPlayer.Character,
									localC4,
								}
								local ray = workspace:Raycast(localC4.Position, ent.Position - localC4.Position, detonateRay)
								if not ray then
									detonateTicks += 1
									if detonateTicks > bit32.bxor(bit32.bxor(3, 1515870810), 1515870810) then
										local equipped = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("\84\111\111\108")
										if equipped then
											equipped.Parent = backpack
										end
										tool.Parent = LocalPlayer.Character
										pcall(function()
											ReplicatedStorage:WaitForChild("\82\101\109\111\116\101\115"):WaitForChild("\67\52"):WaitForChild("\65\99\116\105\118\97\116\101\67\52"):InvokeServer()
										end)
										tool.Parent = backpack
										if equipped then
											equipped.Parent = LocalPlayer.Character
										end
										detonateTicks = 0
									end
									task.wait(((0.05 * 4) / 4))
									continue
								end
							end
						end
					end
					detonateTicks = 0
					task.wait(((0.05 * 10) / 10))
				end
			end)
		end
		do
			local AutoHealSection = CombatPage:Section({
				Name = "\65\117\116\111\32\72\101\97\108",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			local AHEnabled = (not true)
			local healItems = {
				Breakfast = (not not true),
				Lunch = (1 == 1),
				Dinner = (1 == 1),
			}
			AutoHealSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				Flag = "\65\117\116\111\72\101\97\108\69\110\97\98\108\101\100",
				Default = (not true),
				Callback = function(v)
					AHEnabled = v
				end,
			})
			task.spawn(function()
				while ScriptAlive do
					if AHEnabled and LocalPlayer.Character then
						local humanoid = LocalPlayer.Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
						local backpack = LocalPlayer:FindFirstChildWhichIsA("\66\97\99\107\112\97\99\107")
						if humanoid and humanoid.Health <= (-97 + 182) and backpack then
							local healTool
							for _, t in backpack:GetChildren() do
								if healItems[t.Name] then
									healTool = t
									break
								end
							end
							if healTool and (os.clock() - (healTool:GetAttribute("\67\108\105\101\110\116\95\76\97\115\116\67\111\110\115\117\109\101\100\65\116") or 0)) >= (-332 + 335) then
								local equipped = LocalPlayer.Character:FindFirstChildWhichIsA("\84\111\111\108")
								if equipped then
									equipped.Parent = backpack
								end
								healTool.Parent = LocalPlayer.Character
								healTool:SetAttribute("\81\117\97\110\116\105\116\121", (healTool:GetAttribute("\81\117\97\110\116\105\116\121") or 1) - 1)
								healTool:SetAttribute("\67\108\105\101\110\116\95\76\97\115\116\67\111\110\115\117\109\101\100\65\116", os.clock())
								pcall(function()
									ReplicatedStorage:WaitForChild("\82\101\109\111\116\101\115"):WaitForChild("\69\97\116\70\111\111\100"):FireServer()
								end)
								healTool.Parent = backpack
								if equipped then
									equipped.Parent = LocalPlayer.Character
								end
							end
						end
					end
					task.wait(((0.05 * 2) / 2))
				end
			end)
		end
		do
			local AutoReloadSection = CombatPage:Section({
				Name = "\65\117\116\111\32\82\101\108\111\97\100",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			local AREnabled, ARHotSwap = (not true), (1 == 0)
			local weaponPriority = {
				["\77\52\65\49"] = 1,
				["\65\75\45\52\55"] = 1,
				MP5 = 1,
				FAL = 1,
				["\82\101\109\105\110\103\116\111\110\32\56\55\48"] = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				M9 = bit32.bxor(bit32.bxor(3, 1515870810), 1515870810),
				Revolver = (113 - 109),
			}
			local function getSwapWeapon()
				local backpack = LocalPlayer:FindFirstChildWhichIsA("\66\97\99\107\112\97\99\107")
				if not backpack then
					return nil
				end
				local items = {}
				for _, tool in backpack:GetChildren() do
					if tool:GetAttribute("\70\105\114\101\82\97\116\101") and (tool:GetAttribute("\76\111\99\97\108\95\82\101\108\111\97\100\83\101\115\115\105\111\110") or 0) <= 0 and tool.Name ~= "\84\97\115\101\114" and tool.Name ~= "\83\110\105\112\101\114" then
						table.insert(items, tool)
					end
				end
				table.sort(items, function(a, b)
					return (weaponPriority[a.Name] or (-225 + 325)) < (weaponPriority[b.Name] or bit32.bxor(bit32.bxor(100, 1515870810), 1515870810))
				end)
				return items[1]
			end
			local function shootReloadHandler()
				if not AREnabled or not PL.rawShoot then
					return
				end
				local tool = PL.getEquippedTool()
				if tool and (tool:GetAttribute("\76\111\99\97\108\95\67\117\114\114\101\110\116\65\109\109\111") or 1) <= 0 then
					if PL.Reload then
						task.spawn(PL.Reload)
					end
					if ARHotSwap then
						if 10 < 1 then
							local _dc98008 = "dc938"
							local _dc20870 = 564
							local _dc62283 = 942
						end
						local wep = getSwapWeapon()
						if wep then
							if 10 < 1 then
								local _dc34762 = "dc589"
							end
							tool.Parent = LocalPlayer.Backpack
							wep.Parent = LocalPlayer.Character
						end
					end
				end
			end
			AutoReloadSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				Flag = "\65\117\116\111\82\101\108\111\97\100\69\110\97\98\108\101\100",
				Default = (1 == 0),
				Callback = function(v)
					AREnabled = v
					if v then
						PL.addShootHandler("\65\117\116\111\82\101\108\111\97\100", shootReloadHandler)
					else
						PL.removeShootHandler("\65\117\116\111\82\101\108\111\97\100")
					end
				end,
			})
			AutoReloadSection:Toggle({
				Name = "\72\111\116\32\83\119\97\112",
				Flag = "\65\117\116\111\82\101\108\111\97\100\72\111\116\83\119\97\112",
				Default = (not true),
				Callback = function(v)
					ARHotSwap = v
				end,
			})
			RegisterCleanup(function()
				PL.removeShootHandler("\65\117\116\111\82\101\108\111\97\100")
			end)
		end
		do
			local VehicleWallbangSection = CombatPage:Section({
				Name = "\86\101\104\105\99\108\101\32\87\97\108\108\98\97\110\103",
				Side = (313 - 311),
			})
			local vehicleWallbangModified = {}
			local function ModifyVehiclePart(part)
				if 5 ~= 5 then
					local _dc15846 = 290
				end
				if part:IsA("\66\97\115\101\80\97\114\116") then
					if not vehicleWallbangModified[part] then
						if 1 == 2 then
							local _dc41907 = "dc733"
							local _dc22838 = "dc60"
						end
						vehicleWallbangModified[part] = part.CanQuery
					end
					part.CanQuery = (not not false)
				end
			end
			local carContainer = workspace:FindFirstChild("\67\97\114\67\111\110\116\97\105\110\101\114")
			if carContainer then
				local VehicleWallbangEnabled
				local function SetVehicleWallbang(enabled)
					if enabled then
						task.defer(function()
							if VehicleWallbangEnabled:Get() ~= (not not true) then
								return
							end
							for _, part in carContainer:GetDescendants() do
								ModifyVehiclePart(part)
							end
						end)
					else
						for part, original in pairs(vehicleWallbangModified) do
							if part.Parent then
								part.CanQuery = original
							end
						end
						table.clear(vehicleWallbangModified)
					end
				end
				VehicleWallbangEnabled = VehicleWallbangSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\86\101\104\105\99\108\101\32\87\97\108\108\98\97\110\103",
						Description = "\68\105\115\97\98\108\101\115\32\67\97\110\81\117\101\114\121\32\111\110\32\118\101\104\105\99\108\101\32\112\97\114\116\115\32\115\111\32\98\117\108\108\101\116\115\32\99\97\110\32\112\97\115\115\32\116\104\114\111\117\103\104\32\99\97\114\115",
					},
					Flag = "\86\101\104\105\99\108\101\87\97\108\108\98\97\110\103\69\110\97\98\108\101\100",
					Default = (not not false),
					Callback = SetVehicleWallbang,
				})
				TrackConnection(carContainer.DescendantAdded:Connect(function(part)
					if VehicleWallbangEnabled:Get() == (1 == 1) then
						ModifyVehiclePart(part)
					end
				end))
				RegisterCleanup(function()
					SetVehicleWallbang((1 == 0))
				end)
			end
		end
	end
	do
		if 1 == 2 then
			local _dc40242 = 613
			local _dc3096 = 225
		end
		do
			local NoclipSection = MovementPage:Section({
				Name = "\78\111\99\108\105\112",
				Side = 1,
			})
			do
				local NoclipEnabled = NoclipSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\78\111\99\108\105\112",
						Description = "\87\97\108\107\32\116\104\114\111\117\103\104\32\119\97\108\108\115\44\32\102\108\111\111\114\115\44\32\97\110\100\32\97\108\108\32\115\111\108\105\100\32\111\98\106\101\99\116\115",
					},
					Flag = "\78\111\99\108\105\112\69\110\97\98\108\101\100",
					Default = (1 == 0),
				})
				do
					local Players = game:GetService("\80\108\97\121\101\114\115")
					local LocalPlayer = Players.LocalPlayer
					local ReplicatedStorage = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")
					local scriptsFolder = ReplicatedStorage:FindFirstChild("\83\99\114\105\112\116\115")
					if scriptsFolder then
						local CharacterCollision = scriptsFolder:FindFirstChild("\67\104\97\114\97\99\116\101\114\67\111\108\108\105\115\105\111\110")
						if CharacterCollision then
							if 5 ~= 5 then
								local _dc73893 = "dc585"
							end
							CharacterCollision:Destroy()
						end
					end
					local function SetupNoclip(Character)
						if 5 ~= 5 then
							local _dc48950 = "dc175"
							local _dc61864 = 229
						end
						local Head = Character:WaitForChild("\72\101\97\100")
						task.spawn(function()
							for _, Connection in getconnections(Head:GetPropertyChangedSignal("\67\97\110\67\111\108\108\105\100\101")) do
								Connection:Disable()
							end
						end)
					end
					TrackConnection(LocalPlayer.CharacterAdded:Connect(SetupNoclip))
					if LocalPlayer.Character then
						if 5 ~= 5 then
							local _dc97740 = "dc527"
						end
						SetupNoclip(LocalPlayer.Character)
					end
					TrackConnection(game.RunService.Stepped:Connect(function()
						if NoclipEnabled:Get() == (1 == 1) then
							local character = LocalPlayer.Character
							if not character then
								return
							end
							for _, part in pairs(character:GetDescendants()) do
								if part:IsA("\66\97\115\101\80\97\114\116") then
									part.CanCollide = (1 == 0)
								end
							end
						end
					end))
				end
			end
			local InfJumpSection = MovementPage:Section({
				Name = "\73\110\102\105\110\105\116\101\32\74\117\109\112",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				local InfJumpEnabled = InfJumpSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\73\110\102\105\110\105\116\101\32\74\117\109\112",
						Description = "\74\117\109\112\32\105\110\32\109\105\100\45\97\105\114\32\119\105\116\104\111\117\116\32\110\101\101\100\105\110\103\32\116\111\32\116\111\117\99\104\32\116\104\101\32\103\114\111\117\110\100",
					},
					Flag = "\73\110\102\74\117\109\112\69\110\97\98\108\101\100",
					Default = (not not false),
				})
				do
					local LocalPlayer = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
					local UserInputService = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
					local infJumpConn = nil
					local debounce = (not not false)
					local function EnableInfJump()
						if infJumpConn then
							return
						end
						infJumpConn = UserInputService.JumpRequest:Connect(function()
							if not debounce then
								debounce = (not not true)
								local character = LocalPlayer.Character
								if character then
									local humanoid = character:FindFirstChildWhichIsA("\72\117\109\97\110\111\105\100")
									if humanoid then
										humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
									end
								end
								task.wait()
								debounce = (not true)
							end
						end)
					end
					local function DisableInfJump()
						if infJumpConn then
							if 5 ~= 5 then
								local _dc19330 = "dc445"
								local _dc2658 = 882
							end
							infJumpConn:Disconnect()
							infJumpConn = nil
						end
						debounce = (1 == 0)
					end
					NewRender(function()
						if InfJumpEnabled:Get() == (1 == 1) then
							EnableInfJump()
						else
							DisableInfJump()
						end
					end)
				end
			end
		end
	end
	do
		local VFState = {
			Enabled = (1 == 0),
			Mode = "\67\70\114\97\109\101",
			Speed = bit32.bxor(bit32.bxor(60, 1515870810), 1515870810),
		}
		local vfUp, vfDown = 0, 0
		local vfWheels = {}
		local vfPart
		local VehicleFlySection = MovementPage:Section({
			Name = "\86\101\104\105\99\108\101\32\70\108\121",
			Side = 1,
		})
		local carContainer = workspace:WaitForChild("\67\97\114\67\111\110\116\97\105\110\101\114", (-598 + 628))
		VehicleFlySection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\86\101\104\105\99\108\101\70\108\121\69\110\97\98\108\101\100",
			Default = (1 == 0),
			Callback = function(v)
				VFState.Enabled = v
				vfUp, vfDown = 0, 0
			end,
		})
		VehicleFlySection:Dropdown({
			Name = "\77\111\100\101",
			Flag = "\86\101\104\105\99\108\101\70\108\121\77\111\100\101",
			Default = "\67\70\114\97\109\101",
			Multi = (not true),
			Items = {
				"\67\70\114\97\109\101",
				"\80\97\114\116",
			},
			Callback = function(v)
				VFState.Mode = v
			end,
		})
		VehicleFlySection:Slider({
			Name = "\83\112\101\101\100",
			Flag = "\86\101\104\105\99\108\101\70\108\121\83\112\101\101\100",
			Min = 1,
			Max = (195 - 95),
			Default = bit32.bxor(bit32.bxor(60, 1515870810), 1515870810),
			Callback = function(v)
				VFState.Speed = v
			end,
		})
		TrackConnection(UserInputService.InputBegan:Connect(function(input)
			if not VFState.Enabled or UserInputService:GetFocusedTextBox() then
				return
			end
			if input.KeyCode == Enum.KeyCode.E then
				vfUp = 1
			elseif input.KeyCode == Enum.KeyCode.Q then
				vfDown = -1
			end
		end))
		TrackConnection(UserInputService.InputEnded:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.E and vfUp == 1 then
				vfUp = 0
			elseif input.KeyCode == Enum.KeyCode.Q and vfDown == -1 then
				vfDown = 0
			end
		end))
		NewRender(function(dt)
			if not VFState.Enabled or not LocalPlayer.Character then
				for _, w in vfWheels do
					pcall(function()
						w.Enabled = (not not true)
					end)
				end
				table.clear(vfWheels)
				if vfPart then
					vfPart.Parent = nil
				end
				return
			end
			local hum = LocalPlayer.Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
			local seat = hum and hum.SeatPart
			local root = LocalPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
			if not (seat and root and carContainer and seat:IsDescendantOf(carContainer)) then
				if vfPart then
					vfPart.Parent = nil
				end
				return
			end
			if VFState.Mode == "\80\97\114\116" then
				if not vfPart then
					vfPart = Instance.new("\80\97\114\116")
					vfPart.Size = Vector3.new((-488 + 538), 1, bit32.bxor(bit32.bxor(50, 1515870810), 1515870810))
					vfPart.Anchored, vfPart.CanQuery, vfPart.Transparency = (not not true), (not not false), 1
				end
				vfPart.CFrame = CFrame.new(seat.Position - Vector3.new(0, ((2.2 * 4) / 4) - (vfUp + vfDown), 0))
				vfPart.Parent = workspace
			elseif seat:IsA("\86\101\104\105\99\108\101\83\101\97\116") then
				local wheels = seat.Parent and seat.Parent.Parent and seat.Parent.Parent:FindFirstChild("\87\104\101\101\108\115")
				if wheels and #vfWheels == 0 then
					for _, w in wheels:GetDescendants() do
						if w.ClassName == "\82\111\116\97\116\101" or w:IsA("\72\105\110\103\101\67\111\110\115\116\114\97\105\110\116") then
							w.Enabled = (not true)
							table.insert(vfWheels, w)
						end
					end
				end
				root.AssemblyLinearVelocity = Vector3.new(0, ((2.25 * 4) / 4), 0)
				root.CFrame = CFrame.lookAlong(root.Position, PLCamera.CFrame.LookVector) + (hum.MoveDirection + Vector3.new(0, vfUp + vfDown, 0)) * VFState.Speed * dt
			end
		end)
		RegisterCleanup(function()
			for _, w in vfWheels do
				pcall(function()
					w.Enabled = (not false)
				end)
			end
			if vfPart then
				vfPart:Destroy()
			end
		end)
	end
	do
		if 5 ~= 5 then
			local _dc95083 = "dc433"
			local _dc74660 = "dc476"
			local _dc59302 = "dc854"
		end
		local VSState = {
			Enabled = (1 == 0),
			Speed = (232 - 92),
		}
		local vsSeats, vsOldSeat = {}, nil
		local VehicleSpeedSection = MovementPage:Section({
			Name = "\86\101\104\105\99\108\101\32\83\112\101\101\100",
			Side = (-548 + 550),
		})
		VehicleSpeedSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\86\101\104\105\99\108\101\83\112\101\101\100\69\110\97\98\108\101\100",
			Default = (1 == 0),
			Callback = function(v)
				VSState.Enabled = v
				if not v then
					table.clear(vsSeats)
					vsOldSeat = nil
				end
			end,
		})
		VehicleSpeedSection:Slider({
			Name = "\83\112\101\101\100",
			Flag = "\86\101\104\105\99\108\101\83\112\101\101\100\86\97\108\117\101",
			Min = (635 - 555),
			Max = (-731 + 931),
			Default = bit32.bxor(bit32.bxor(140, 1515870810), 1515870810),
			Callback = function(v)
				VSState.Speed = v
			end,
		})
		local carContainerVS = workspace:FindFirstChild("\67\97\114\67\111\110\116\97\105\110\101\114")
		task.spawn(function()
			while ScriptAlive do
				if VSState.Enabled and carContainerVS and LocalPlayer.Character then
					local seat = LocalPlayer.Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100") and LocalPlayer.Character.Humanoid.SeatPart
					if seat and seat:IsDescendantOf(carContainerVS) then
						if seat ~= vsOldSeat then
							vsSeats = {}
							local model = seat.Parent and seat.Parent.Parent
							if model then
								for _, v in model:GetDescendants() do
									if v:IsA("\86\101\104\105\99\108\101\83\101\97\116") then
										table.insert(vsSeats, v)
									end
								end
							end
							vsOldSeat = seat
						end
						for _, v in vsSeats do
							v.MaxSpeed = VSState.Speed
							v.Torque = (-86 + 90)
						end
					end
				end
				task.wait()
			end
		end)
	end
	do
		do
			local ESPFilterState = {
				Teams = {},
				InmateTypes = {},
				Whitelist = {},
				Blacklist = {},
				FriendCheck = (not not false),
				WhitelistMode = "\72\105\100\101\32\69\83\80",
			}
			local function GetInmateStatusESP(Character)
				local humanoid = Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
				if not humanoid then
					if 1 == 2 then
						local _dc52002 = "dc790"
						local _dc54725 = 886
						local _dc77467 = "dc733"
					end
					return "\82\101\103\117\108\97\114"
				end
				local displayName = humanoid.DisplayName
				if string.sub(displayName, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\148\151" then
					return "\65\114\114\101\115\116\97\98\108\101"
				elseif string.sub(displayName, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\146\162" then
					return "\65\103\103\114\101\115\115\105\118\101"
				end
				return "\82\101\103\117\108\97\114"
			end
			local function IsWhitelisted(Player)
				if ESPFilterState.Whitelist[Player.Name] then
					return (not not true)
				end
				if ESPFilterState.FriendCheck and FriendsCache[Player.Name] then
					if 10 < 1 then
						local _dc89621 = "dc457"
						local _dc61934 = 359
						local _dc3283 = 645
					end
					return (not not true)
				end
				return (not not false)
			end
			local function IsBlacklisted(Player)
				if 10 < 1 then
					local _dc66567 = 648
					local _dc67998 = "dc208"
					local _dc73335 = 474
				end
				return ESPFilterState.Blacklist[Player.Name] == (1 == 1) or AutoBlacklistSet[Player.Name] == (not not true)
			end
			local function ShouldShowPlayer(Player)
				if IsBlacklisted(Player) then
					local myTeam = game.Players.LocalPlayer.Team
					local myTeamName = myTeam and myTeam.Name or ""
					local theirTeamName = Player.Team and Player.Team.Name or ""
					if theirTeamName == myTeamName and theirTeamName ~= "\73\110\109\97\116\101\115" then
					elseif theirTeamName == "\73\110\109\97\116\101\115" then
						local Character = Player.Character
						if Character and GetInmateStatusESP(Character) == "\82\101\103\117\108\97\114" then
						else
							return (1 == 1)
						end
					else
						return (not false)
					end
				end
				if IsWhitelisted(Player) then
					if 1 == 2 then
						local _dc1602 = "dc907"
					end
					if ESPFilterState.WhitelistMode == "\72\105\100\101\32\69\83\80" then
						if 1 == 2 then
							local _dc92340 = 128
						end
						return (not true)
					end
				end
				local TeamName = Player.Team and Player.Team.Name or ""
				if next(ESPFilterState.Teams) and not ESPFilterState.Teams[TeamName] then
					return (1 == 0)
				end
				if TeamName == "\73\110\109\97\116\101\115" and next(ESPFilterState.InmateTypes) then
					local Character = Player.Character
					if Character then
						local Status = GetInmateStatusESP(Character)
						if not ESPFilterState.InmateTypes[Status] then
							return (not not false)
						end
					end
				end
				return (not false)
			end
			local ESPState
			local function GetDisplayName(Character)
				if 1 == 2 then
					local _dc6956 = 358
				end
				local humanoid = Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
				if not humanoid then
					if 10 < 1 then
						local _dc8037 = "dc839"
						local _dc22878 = 835
					end
					return Character.Name
				end
				local prefix = ""
				if Character:FindFirstChild("\70\111\114\99\101\70\105\101\108\100") then
					if 10 < 1 then
						local _dc46804 = "dc81"
						local _dc85324 = 820
					end
					prefix = "\91\70\70\93\32"
				end
				if ESPState.InmateStatus then
					local dn = humanoid.DisplayName
					if string.sub(dn, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\148\151" then
						prefix = prefix .. "\91\87\93\32"
					elseif string.sub(dn, 1, (386 - 382)) == "\240\159\146\162" then
						prefix = prefix .. "\91\65\93\32"
					end
				end
				local player = game.Players:GetPlayerFromCharacter(Character)
				local username = Character.Name
				local realDisplayName = player and player.DisplayName or username
				local fmt = ESPState.NameFormat
				if fmt == "\68\105\115\112\108\97\121\32\78\97\109\101" then
					return prefix .. realDisplayName
				elseif fmt == "\68\105\115\112\108\97\121\32\78\97\109\101\32\40\64\85\115\101\114\110\97\109\101\41" then
					if realDisplayName == username then
						if 10 < 1 then
							local _dc20541 = "dc450"
							local _dc15646 = 707
						end
						return prefix .. username
					end
					return prefix .. realDisplayName .. "\32\40\64" .. username .. ")"
				end
				return prefix .. username
			end
			local ESPFilters = VisualsPage:Section({
				Name = "\70\105\108\116\101\114\115",
				Side = 1,
			})
			do
				ESPFilters:Dropdown({
					Name = "\84\101\97\109\115",
					Flag = "\69\83\80\70\105\108\116\101\114\84\101\97\109\115",
					Multi = (not false),
					Items = {
						"\71\117\97\114\100\115",
						"\73\110\109\97\116\101\115",
						"\67\114\105\109\105\110\97\108\115",
					},
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (not not true)
						end
						ESPFilterState.Teams = set
					end,
				})
				ESPFilters:Dropdown({
					Name = "\73\110\109\97\116\101\32\84\121\112\101\115",
					Flag = "\69\83\80\70\105\108\116\101\114\73\110\109\97\116\101\84\121\112\101\115",
					Multi = (not not true),
					Items = {
						"\82\101\103\117\108\97\114",
						"\65\103\103\114\101\115\115\105\118\101",
						"\65\114\114\101\115\116\97\98\108\101",
					},
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (1 == 1)
						end
						ESPFilterState.InmateTypes = set
					end,
				})
				ESPFilters:Toggle({
					Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
					ToolTip = {
						Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
						Description = "\65\112\112\108\105\101\115\32\119\104\105\116\101\108\105\115\116\32\98\101\104\97\118\105\111\114\32\116\111\32\112\108\97\121\101\114\115\32\111\110\32\121\111\117\114\32\82\111\98\108\111\120\32\102\114\105\101\110\100\115\32\108\105\115\116",
					},
					Flag = "\69\83\80\70\114\105\101\110\100\67\104\101\99\107",
					Default = (not true),
					Callback = function(v)
						ESPFilterState.FriendCheck = v
					end,
				})
				local playerNames = {}
				for _, p in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
					if p ~= game.Players.LocalPlayer then
						table.insert(playerNames, p.Name)
					end
				end
				local WhitelistDropdown = ESPFilters:Dropdown({
					Name = "\87\104\105\116\101\108\105\115\116",
					Flag = "\69\83\80\87\104\105\116\101\108\105\115\116",
					Multi = (not not true),
					Items = playerNames,
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (1 == 1)
						end
						ESPFilterState.Whitelist = set
					end,
				})
				local ESPBlacklistDropdown = ESPFilters:Dropdown({
					Name = "\66\108\97\99\107\108\105\115\116",
					ToolTip = {
						Name = "\66\108\97\99\107\108\105\115\116",
						Description = "\65\108\119\97\121\115\32\115\104\111\119\32\116\104\101\115\101\32\112\108\97\121\101\114\115\32\111\110\32\69\83\80\32\119\105\116\104\32\99\114\105\109\105\110\97\108\32\99\111\108\111\114\44\32\114\101\103\97\114\100\108\101\115\115\32\111\102\32\116\101\97\109\32\111\114\32\102\105\108\116\101\114\32\115\101\116\116\105\110\103\115",
					},
					Flag = "\69\83\80\66\108\97\99\107\108\105\115\116",
					Multi = (1 == 1),
					Items = playerNames,
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (not false)
						end
						ESPFilterState.Blacklist = set
					end,
				})
				TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerAdded:Connect(function(p)
					WhitelistDropdown:Add(p.Name)
					ESPBlacklistDropdown:Add(p.Name)
				end))
				TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerRemoving:Connect(function(p)
					WhitelistDropdown:Remove(p.Name)
					ESPBlacklistDropdown:Remove(p.Name)
				end))
				ESPFilters:Dropdown({
					Name = "\87\104\105\116\101\108\105\115\116\32\77\111\100\101",
					Flag = "\69\83\80\87\104\105\116\101\108\105\115\116\77\111\100\101",
					Multi = (not not false),
					Default = "\72\105\100\101\32\69\83\80",
					Items = {
						"\72\105\100\101\32\69\83\80",
						"\83\104\111\119\32\71\114\101\101\110",
					},
					Callback = function(v)
						ESPFilterState.WhitelistMode = v
					end,
				})
			end
			ESPState = {
				Enabled = (not not false),
				ShowSelf = (not not false),
				TeamColor = (not false),
				Color = Library.Theme.Accent,
				Outline = (1 == 1),
				Name = (1 == 0),
				InmateStatus = (1 == 1),
				NameFormat = "\85\115\101\114\110\97\109\101",
				Box = (not not false),
				Skeleton = (1 == 0),
				Chams = (not not false),
				ChamsColor = Library.Theme.Accent,
				ChamsFillTransparency = ((0.75 * 4) / 4),
				ChamsOutlineTransparency = 0,
				HealthBar = (not not false),
				HealthBarSide = "\76\101\102\116",
			}
			local ActiveHighlights = {}
			local ChamsFolder = Instance.new("\70\111\108\100\101\114")
			ChamsFolder.Name = "\109\105\115\97\107\105\67\104\97\109\115"
			ChamsFolder.Parent = game:GetService("\67\111\114\101\71\117\105")
			local ESPSection = VisualsPage:Section({
				Name = "\69\83\80",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				if 5 ~= 5 then
					local _dc57566 = 685
				end
				ESPSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\69\83\80",
						Description = "\77\97\115\116\101\114\32\116\111\103\103\108\101\32\102\111\114\32\97\108\108\32\69\83\80\32\99\111\109\112\111\110\101\110\116\115\32\40\110\97\109\101\44\32\98\111\120\44\32\115\107\101\108\101\116\111\110\44\32\99\104\97\109\115\44\32\104\101\97\108\116\104\32\98\97\114\41",
					},
					Flag = "\69\83\80\69\110\97\98\108\101\100",
					Default = (1 == 0),
					Callback = function(v)
						ESPState.Enabled = v
					end,
				})
				ESPSection:Toggle({
					Name = "\78\97\109\101",
					ToolTip = {
						Name = "\78\97\109\101\32\69\83\80",
						Description = "\83\104\111\119\115\32\112\108\97\121\101\114\32\110\97\109\101\115\32\102\108\111\97\116\105\110\103\32\97\98\111\118\101\32\116\104\101\105\114\32\104\101\97\100\115\32\116\104\114\111\117\103\104\32\119\97\108\108\115",
					},
					Flag = "\69\83\80\78\97\109\101",
					Default = (1 == 0),
					Callback = function(v)
						ESPState.Name = v
					end,
				})
				ESPSection:Toggle({
					Name = "\73\110\109\97\116\101\32\83\116\97\116\117\115",
					ToolTip = {
						Name = "\73\110\109\97\116\101\32\83\116\97\116\117\115",
						Description = "\80\114\101\102\105\120\101\115\32\110\97\109\101\115\32\119\105\116\104\32\91\87\93\32\102\111\114\32\119\97\110\116\101\100\32\111\114\32\91\65\93\32\102\111\114\32\97\103\103\114\101\115\115\105\118\101\32\105\110\109\97\116\101\115",
					},
					Flag = "\69\83\80\73\110\109\97\116\101\83\116\97\116\117\115",
					Default = (1 == 1),
					Callback = function(v)
						ESPState.InmateStatus = v
					end,
				})
				ESPSection:Dropdown({
					Name = "\78\97\109\101\32\70\111\114\109\97\116",
					ToolTip = {
						Name = "\78\97\109\101\32\70\111\114\109\97\116",
						Description = "\67\104\111\111\115\101\32\104\111\119\32\112\108\97\121\101\114\32\110\97\109\101\115\32\97\112\112\101\97\114\32\111\110\32\69\83\80",
					},
					Flag = "\69\83\80\78\97\109\101\70\111\114\109\97\116",
					Multi = (not not false),
					Default = "\85\115\101\114\110\97\109\101",
					Items = {
						"\85\115\101\114\110\97\109\101",
						"\68\105\115\112\108\97\121\32\78\97\109\101",
						"\68\105\115\112\108\97\121\32\78\97\109\101\32\40\64\85\115\101\114\110\97\109\101\41",
					},
					Callback = function(v)
						ESPState.NameFormat = v
					end,
				})
				ESPSection:Toggle({
					Name = "\66\111\120",
					ToolTip = {
						Name = "\66\111\120\32\69\83\80",
						Description = "\68\114\97\119\115\32\50\68\32\98\111\117\110\100\105\110\103\32\98\111\120\101\115\32\97\114\111\117\110\100\32\112\108\97\121\101\114\115\32\118\105\115\105\98\108\101\32\116\104\114\111\117\103\104\32\119\97\108\108\115",
					},
					Flag = "\69\83\80\66\111\120",
					Default = (not not false),
					Callback = function(v)
						ESPState.Box = v
					end,
				})
				ESPSection:Toggle({
					Name = "\83\107\101\108\101\116\111\110",
					ToolTip = {
						Name = "\83\107\101\108\101\116\111\110\32\69\83\80",
						Description = "\68\114\97\119\115\32\115\105\109\112\108\105\102\105\101\100\32\115\107\101\108\101\116\111\110\32\108\105\110\101\115\32\99\111\110\110\101\99\116\105\110\103\32\104\101\97\100\44\32\116\111\114\115\111\44\32\104\97\110\100\115\32\97\110\100\32\102\101\101\116",
					},
					Flag = "\69\83\80\83\107\101\108\101\116\111\110",
					Default = (1 == 0),
					Callback = function(v)
						ESPState.Skeleton = v
					end,
				})
				ESPSection:Toggle({
					Name = "\67\104\97\109\115",
					ToolTip = {
						Name = "\67\104\97\109\115",
						Description = "\72\105\103\104\108\105\103\104\116\115\32\112\108\97\121\101\114\32\109\111\100\101\108\115\32\119\105\116\104\32\97\32\99\111\108\111\114\101\100\32\111\118\101\114\108\97\121\32\118\105\115\105\98\108\101\32\116\104\114\111\117\103\104\32\119\97\108\108\115",
					},
					Flag = "\69\83\80\67\104\97\109\115",
					Default = (not true),
					Callback = function(v)
						ESPState.Chams = v
					end,
				}):Colorpicker({
					Name = "\67\104\97\109\115\32\67\111\108\111\114",
					Flag = "\69\83\80\67\104\97\109\115\67\111\108\111\114",
					Default = Library.Theme.Accent,
					Alpha = 0,
					Callback = function(v)
						ESPState.ChamsColor = v
					end,
				})
				ESPSection:Slider({
					Name = "\67\104\97\109\115\32\70\105\108\108\32\84\114\97\110\115\112\97\114\101\110\99\121",
					Flag = "\69\83\80\67\104\97\109\115\70\105\108\108\84\114\97\110\115\112\97\114\101\110\99\121",
					Default = ((0.75 * 10) / 10),
					Min = 0,
					Max = 1,
					Decimals = ((0.01 * 5) / 5),
					Callback = function(v)
						ESPState.ChamsFillTransparency = v
					end,
				})
				ESPSection:Toggle({
					Name = "\72\101\97\108\116\104\32\66\97\114",
					ToolTip = {
						Name = "\72\101\97\108\116\104\32\66\97\114",
						Description = "\68\114\97\119\115\32\97\32\118\101\114\116\105\99\97\108\32\104\101\97\108\116\104\32\98\97\114\32\110\101\120\116\32\116\111\32\116\104\101\32\98\111\117\110\100\105\110\103\32\98\111\120\44\32\103\114\101\101\110\32\97\116\32\102\117\108\108\32\72\80\32\102\97\100\105\110\103\32\116\111\32\114\101\100",
					},
					Flag = "\69\83\80\72\101\97\108\116\104\66\97\114",
					Default = (not true),
					Callback = function(v)
						ESPState.HealthBar = v
					end,
				})
				ESPSection:Dropdown({
					Name = "\72\101\97\108\116\104\32\66\97\114\32\83\105\100\101",
					Flag = "\69\83\80\72\101\97\108\116\104\66\97\114\83\105\100\101",
					Default = "\76\101\102\116",
					Multi = (not true),
					Items = {
						"\76\101\102\116",
						"\82\105\103\104\116",
					},
					Callback = function(v)
						ESPState.HealthBarSide = v
					end,
				})
				ESPSection:Toggle({
					Name = "\84\101\97\109\32\67\111\108\111\114",
					Flag = "\69\83\80\84\101\97\109\67\111\108\111\114",
					Default = (not false),
					Callback = function(v)
						ESPState.TeamColor = v
					end,
				}):Colorpicker({
					Name = "\67\111\108\111\114",
					Flag = "\69\83\80\67\111\108\111\114",
					Default = Library.Theme.Accent,
					Alpha = 0,
					Callback = function(v)
						ESPState.Color = v
					end,
				})
				ESPSection:Toggle({
					Name = "\83\104\111\119\32\83\101\108\102",
					Flag = "\69\83\80\83\104\111\119\83\101\108\102",
					Default = (1 == 0),
					Callback = function(v)
						ESPState.ShowSelf = v
					end,
				})
				ESPSection:Toggle({
					Name = "\79\117\116\108\105\110\101",
					ToolTip = {
						Name = "\79\117\116\108\105\110\101",
						Description = "\65\100\100\115\32\97\32\100\97\114\107\32\111\117\116\108\105\110\101\32\116\111\32\110\97\109\101\32\116\101\120\116\32\97\110\100\32\98\111\120\32\100\114\97\119\105\110\103\115\32\102\111\114\32\114\101\97\100\97\98\105\108\105\116\121",
					},
					Flag = "\69\83\80\79\117\116\108\105\110\101",
					Default = (not not true),
					Callback = function(v)
						ESPState.Outline = v
					end,
				})
				do
					local SKELETON_LINKS = {
						{
							"\84\111\114\115\111",
							"\72\101\97\100",
						},
						{
							"\84\111\114\115\111",
							"\76\101\102\116\32\65\114\109",
						},
						{
							"\84\111\114\115\111",
							"\82\105\103\104\116\32\65\114\109",
						},
						{
							"\84\111\114\115\111",
							"\76\101\102\116\32\76\101\103",
						},
						{
							"\84\111\114\115\111",
							"\82\105\103\104\116\32\76\101\103",
						},
					}
					local function HideAll(drawings, highlight)
						if 5 ~= 5 then
							local _dc22076 = "dc490"
							local _dc76655 = 371
						end
						drawings.Text.Visible = (1 == 0)
						drawings.Box.Visible = (not not false)
						drawings.BoxOutline.Visible = (not true)
						for i = 1, 5 do
							drawings.Skeleton[i].Visible = (not true)
						end
						drawings.HealthBG.Visible = (1 == 0)
						drawings.HealthFill.Visible = (not true)
						if highlight then
							highlight.Enabled = (not not false)
						end
					end
					local function Apply(Character)
						local Player = game.Players:GetPlayerFromCharacter(Character)
						if not Player then
							return
						end
						local Text = TrackDrawing(Drawing.new("\84\101\120\116"))
						Text.Visible = (not not false)
						Text.ZIndex = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)
						Text.Size = bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)
						Text.Center = (1 == 1)
						Text.OutlineColor = Color3.fromRGB(0, 0, 0)
						local Box = TrackDrawing(Drawing.new("\83\113\117\97\114\101"))
						Box.Visible = (1 == 0)
						Box.ZIndex = (565 - 563)
						Box.Filled = (1 == 0)
						Box.Thickness = 1
						local BoxOutline = TrackDrawing(Drawing.new("\83\113\117\97\114\101"))
						BoxOutline.Visible = (not not false)
						BoxOutline.Thickness = bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)
						BoxOutline.ZIndex = 1
						BoxOutline.Color = Color3.fromRGB(0, 0, 0)
						BoxOutline.Filled = (1 == 0)
						local SkeletonLines = {}
						for i = 1, 5 do
							local line = TrackDrawing(Drawing.new("\76\105\110\101"))
							line.Visible = (not true)
							line.Thickness = 1
							line.ZIndex = (-556 + 559)
							SkeletonLines[i] = line
						end
						local HealthBG = TrackDrawing(Drawing.new("\76\105\110\101"))
						HealthBG.Visible = (1 == 0)
						HealthBG.Thickness = bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)
						HealthBG.ZIndex = 1
						HealthBG.Color = Color3.fromRGB(0, 0, 0)
						local HealthFill = TrackDrawing(Drawing.new("\76\105\110\101"))
						HealthFill.Visible = (not true)
						HealthFill.Thickness = (868 - 866)
						HealthFill.ZIndex = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)
						local Highlight = Instance.new("\72\105\103\104\108\105\103\104\116")
						Highlight.Name = Player.Name
						Highlight.Adornee = Character
						Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						Highlight.Enabled = (not not false)
						Highlight.Parent = ChamsFolder
						ActiveHighlights[Character] = Highlight
						local drawings = {
							Text = Text,
							Box = Box,
							BoxOutline = BoxOutline,
							Skeleton = SkeletonLines,
							HealthBG = HealthBG,
							HealthFill = HealthFill,
						}
						local Render = NewRender(function()
							if not ESPState.Enabled then
								HideAll(drawings, Highlight)
								return
							end
							local isSelf = Character == game.Players.LocalPlayer.Character
							if isSelf and not ESPState.ShowSelf then
								HideAll(drawings, Highlight)
								return
							end
							if not ShouldShowPlayer(Player) then
								HideAll(drawings, Highlight)
								return
							end
							local hrp = Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
							if not hrp then
								HideAll(drawings, Highlight)
								return
							end
							local hum = Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
							if not hum or hum.Health <= 0 then
								HideAll(drawings, Highlight)
								return
							end
							local pos, onscreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
							if not onscreen then
								HideAll(drawings, Highlight)
								return
							end
							local espColor
							if IsBlacklisted(Player) then
								espColor = Color3.fromRGB((986 - 896), (-120 + 210), (-618 + 708))
							elseif IsWhitelisted(Player) then
								espColor = Color3.fromRGB(0, (-196 + 451), 0)
							elseif ESPState.TeamColor then
								espColor = Player.TeamColor.Color
							else
								espColor = ESPState.Color
							end
							local scale = 1 / (pos.Z * math.tan(math.rad(workspace.CurrentCamera.FieldOfView * ((0.5 * 10) / 10))) * (-521 + 523)) * (1722 - 722)
							local width, height = math.floor(((4.5 * 4) / 4) * scale), math.floor((-783 + 789) * scale)
							local x, y = math.floor(pos.X), math.floor(pos.Y)
							local xPos, yPos = math.floor(x - width * ((0.5 * 10) / 10)), math.floor((y - height * ((0.5 * 4) / 4)) + (((0.5 * 4) / 4) * scale))
							if ESPState.Name then
								Text.Position = Vector2.new(pos.X, yPos - (900 - 886))
								Text.Text = GetDisplayName(Character)
								Text.Color = espColor
								Text.Outline = ESPState.Outline
								Text.Visible = (not false)
							else
								Text.Visible = (not true)
							end
							if ESPState.Box then
								Box.Size = Vector2.new(width, height)
								Box.Position = Vector2.new(xPos, yPos)
								Box.Color = espColor
								Box.Visible = (1 == 1)
								BoxOutline.Size = Vector2.new(width, height)
								BoxOutline.Position = Vector2.new(xPos, yPos)
								BoxOutline.Visible = ESPState.Outline
							else
								Box.Visible = (not true)
								BoxOutline.Visible = (not true)
							end
							if ESPState.Skeleton then
								for i, link in ipairs(SKELETON_LINKS) do
									local partA = Character:FindFirstChild(link[1])
									local partB = Character:FindFirstChild(link[(-585 + 587)])
									if partA and partB then
										local aPos, aOn = workspace.CurrentCamera:WorldToViewportPoint(partA.Position)
										local bPos, bOn = workspace.CurrentCamera:WorldToViewportPoint(partB.Position)
										if aOn and bOn then
											SkeletonLines[i].From = Vector2.new(aPos.X, aPos.Y)
											SkeletonLines[i].To = Vector2.new(bPos.X, bPos.Y)
											SkeletonLines[i].Color = espColor
											SkeletonLines[i].Visible = (1 == 1)
										else
											SkeletonLines[i].Visible = (not true)
										end
									else
										SkeletonLines[i].Visible = (1 == 0)
									end
								end
							else
								for i = 1, 5 do
									SkeletonLines[i].Visible = (not true)
								end
							end
							if ESPState.Chams then
								Highlight.FillColor = ESPState.ChamsColor
								Highlight.OutlineColor = espColor
								Highlight.FillTransparency = ESPState.ChamsFillTransparency
								Highlight.OutlineTransparency = ESPState.ChamsOutlineTransparency
								Highlight.Enabled = (not not true)
							else
								Highlight.Enabled = (not not false)
							end
							if ESPState.HealthBar then
								local hpRatio = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
								local barX
								if ESPState.HealthBarSide == "\76\101\102\116" then
									barX = xPos - (983 - 978)
								else
									barX = xPos + width + (-489 + 494)
								end
								local barTop = yPos
								local barBot = yPos + height
								local fillBot = barBot
								local fillTop = barBot - math.floor(height * hpRatio)
								HealthBG.From = Vector2.new(barX, barTop)
								HealthBG.To = Vector2.new(barX, barBot)
								HealthBG.Visible = (not not true)
								HealthFill.From = Vector2.new(barX, fillTop)
								HealthFill.To = Vector2.new(barX, fillBot)
								HealthFill.Color = Color3.fromRGB((862 - 607), 0, 0):Lerp(Color3.fromRGB(0, (1034 - 779), 0), hpRatio)
								HealthFill.Visible = (1 == 1)
							else
								HealthBG.Visible = (1 == 0)
								HealthFill.Visible = (not not false)
							end
						end)
						Character.AncestryChanged:Connect(function(_, parent)
							if not parent then
								Render:Disconnect()
								Text:Destroy()
								Box:Destroy()
								BoxOutline:Destroy()
								for i = 1, 5 do
									SkeletonLines[i]:Destroy()
								end
								HealthBG:Destroy()
								HealthFill:Destroy()
								if Highlight then
									ActiveHighlights[Character] = nil
									Highlight:Destroy()
									Highlight = nil
								end
							end
						end)
					end
					for _, v in pairs(game:GetService("\80\108\97\121\101\114\115"):GetPlayers()) do
						if v.Character then
							Apply(v.Character)
						end
						TrackConnection(v.CharacterAdded:Connect(function(char)
							Apply(char)
						end))
					end
					TrackConnection(game:GetService("\80\108\97\121\101\114\115").PlayerAdded:Connect(function(v)
						TrackConnection(v.CharacterAdded:Connect(function(char)
							Apply(char)
						end))
					end))
				end
			end
			local ItemESPSection = VisualsPage:Section({
				Name = "\73\116\101\109\32\69\83\80",
				Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				if 10 < 1 then
					local _dc88071 = "dc974"
				end
				ItemESPSection:Toggle({
					Name = "\69\110\97\98\108\101\100",
					ToolTip = {
						Name = "\73\116\101\109\32\69\83\80",
						Description = "\68\114\97\119\115\32\102\108\111\97\116\105\110\103\32\108\97\98\101\108\115\32\111\110\32\119\111\114\108\100\32\105\116\101\109\115\44\32\119\105\116\104\32\100\105\115\116\97\110\99\101\32\115\99\97\108\105\110\103\32\109\97\116\99\104\105\110\103\32\112\108\97\121\101\114\32\69\83\80",
					},
					Flag = "\73\116\101\109\69\83\80\69\110\97\98\108\101\100",
					Default = (not true),
					Callback = function(v)
						ItemESPState.Enabled = v
					end,
				}):Colorpicker({
					Name = "\67\111\108\111\114",
					Flag = "\73\116\101\109\69\83\80\67\111\108\111\114",
					Default = Library.Theme.Accent,
					Alpha = 0,
					Callback = function(v)
						ItemESPState.Color = v
					end,
				})
				ItemESPSection:Dropdown({
					Name = "\73\116\101\109\115",
					ToolTip = {
						Name = "\73\116\101\109\115",
						Description = "\83\101\108\101\99\116\32\119\104\105\99\104\32\119\111\114\108\100\32\105\116\101\109\115\32\116\111\32\115\104\111\119\32\119\105\116\104\32\73\116\101\109\32\69\83\80",
					},
					Flag = "\73\116\101\109\69\83\80\73\116\101\109\115",
					Multi = (1 == 1),
					Items = {
						"\77\57",
						"\72\97\109\109\101\114",
						"\67\114\117\100\101\32\75\110\105\102\101",
						"\75\101\121\32\99\97\114\100",
					},
					Callback = function(v)
						local set = {}
						for _, name in pairs(v) do
							set[name] = (1 == 1)
						end
						ItemESPState.Items = set
					end,
				})
				ItemESPSection:Toggle({
					Name = "\67\104\97\109\115",
					ToolTip = {
						Name = "\73\116\101\109\32\67\104\97\109\115",
						Description = "\72\105\103\104\108\105\103\104\116\115\32\105\116\101\109\115\32\119\105\116\104\32\97\32\99\111\108\111\114\101\100\32\111\118\101\114\108\97\121\32\118\105\115\105\98\108\101\32\116\104\114\111\117\103\104\32\119\97\108\108\115",
					},
					Flag = "\73\116\101\109\69\83\80\67\104\97\109\115",
					Default = (not not false),
					Callback = function(v)
						ItemESPState.Chams = v
					end,
				}):Colorpicker({
					Name = "\67\104\97\109\115\32\67\111\108\111\114",
					Flag = "\73\116\101\109\69\83\80\67\104\97\109\115\67\111\108\111\114",
					Default = Library.Theme.Accent,
					Alpha = 0,
					Callback = function(v)
						ItemESPState.ChamsColor = v
					end,
				})
				ItemESPSection:Slider({
					Name = "\67\104\97\109\115\32\70\105\108\108\32\84\114\97\110\115\112\97\114\101\110\99\121",
					Flag = "\73\116\101\109\69\83\80\67\104\97\109\115\70\105\108\108\84\114\97\110\115\112\97\114\101\110\99\121",
					Default = ((0.5 * 5) / 5),
					Min = 0,
					Max = 1,
					Decimals = ((0.01 * 4) / 4),
					Callback = function(v)
						ItemESPState.ChamsFillTransparency = v
					end,
				})
				do
					NewRender(function()
						local character = game.Players.LocalPlayer.Character
						local hrp = character and character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
						if not ItemESPState.Enabled or not hrp or not next(ItemESPState.Items) then
							for _, data in pairs(ItemESPDrawings) do
								data.Text.Visible = (not not false)
							end
							for obj, hl in pairs(ItemESPHighlights) do
								hl.Enabled = (1 == 0)
							end
							return
						end
						local camera = workspace.CurrentCamera
						local myPos = hrp.Position
						local visibleNow = {}
						for _, obj in pairs(workspace:GetChildren()) do
							if not ItemESPState.Items[obj.Name] then
								continue
							end
							local part = ResolvePickupPart(obj)
							if not part then
								continue
							end
							local distance = (myPos - part.Position).Magnitude
							local screenPos, onScreen = camera:WorldToViewportPoint(part.Position + Vector3.new(0, ((1.2 * 4) / 4), 0))
							if not onScreen then
								continue
							end
							local scale = 1 / (screenPos.Z * math.tan(math.rad(camera.FieldOfView * ((0.5 * 10) / 10))) * bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)) * bit32.bxor(bit32.bxor(1000, 1515870810), 1515870810)
							local textSize = math.clamp(math.floor(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810) * (scale / ((3.5 * 4) / 4))), (-426 + 434), (-469 + 487))
							local data = ItemESPDrawings[obj]
							if not data then
								local text = TrackDrawing(Drawing.new("\84\101\120\116"))
								text.Center = (not not true)
								text.ZIndex = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)
								text.OutlineColor = Color3.fromRGB(0, 0, 0)
								data = {
									Text = text,
								}
								ItemESPDrawings[obj] = data
							end
							data.Text.Size = textSize
							data.Text.Outline = ESPState.Outline
							data.Text.Text = string.format("\37\115\32\91\37\100\93", obj.Name, math.floor(distance))
							data.Text.Color = ItemESPState.Color
							data.Text.Position = Vector2.new(screenPos.X, screenPos.Y)
							data.Text.Visible = (1 == 1)
							visibleNow[obj] = (not false)
							if ItemESPState.Chams then
								local hl = ItemESPHighlights[obj]
								if not hl then
									hl = Instance.new("\72\105\103\104\108\105\103\104\116")
									hl.Name = obj.Name
									hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
									hl.Parent = ItemESPChamsFolder
									ItemESPHighlights[obj] = hl
								end
								hl.Adornee = obj
								hl.FillColor = ItemESPState.ChamsColor
								hl.OutlineColor = ItemESPState.ChamsColor
								hl.FillTransparency = ItemESPState.ChamsFillTransparency
								hl.OutlineTransparency = 0
								hl.Enabled = (1 == 1)
							else
								local hl = ItemESPHighlights[obj]
								if hl then
									hl.Enabled = (1 == 0)
								end
							end
						end
						for obj, data in pairs(ItemESPDrawings) do
							if not visibleNow[obj] then
								data.Text.Visible = (not not false)
								local hl = ItemESPHighlights[obj]
								if hl then
									hl.Enabled = (1 == 0)
								end
							end
						end
					end)
					RegisterCleanup(function()
						for _, data in pairs(ItemESPDrawings) do
							pcall(data.Text.Remove, data.Text)
						end
						ItemESPDrawings = {}
						for _, hl in pairs(ItemESPHighlights) do
							pcall(hl.Destroy, hl)
						end
						ItemESPHighlights = {}
						pcall(ItemESPChamsFolder.Destroy, ItemESPChamsFolder)
					end)
				end
			end
			RegisterCleanup(function()
				for char, hl in pairs(ActiveHighlights) do
					pcall(hl.Destroy, hl)
				end
				ActiveHighlights = {}
				pcall(ChamsFolder.Destroy, ChamsFolder)
			end)
		end
		do
			local C4ESPSection = VisualsPage:Section({
				Name = "\67\52\32\69\83\80",
				Side = (9 - 7),
			})
			local c4Refs, c4Folder = {}, Instance.new("\70\111\108\100\101\114")
			c4Folder.Name = "\109\105\115\97\107\105\67\52\69\83\80"
			c4Folder.Parent = game:GetService("\67\111\114\101\71\117\105")
			local c4Fill = Color3.fromRGB((-351 + 606), bit32.bxor(bit32.bxor(80, 1515870810), 1515870810), 0)
			local c4Outline = Color3.new(1, 1, 1)
			local c4FillT, c4OutlineT = ((0.5 * 10) / 10), 0
			local function addC4(obj)
				if c4Refs[obj] then
					return
				end
				local h = Instance.new("\72\105\103\104\108\105\103\104\116")
				h.Adornee = obj
				h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				h.FillColor, h.OutlineColor = c4Fill, c4Outline
				h.FillTransparency, h.OutlineTransparency = c4FillT, c4OutlineT
				h.Parent = c4Folder
				c4Refs[obj] = h
			end
			local function remC4(obj)
				if c4Refs[obj] then
					if 10 < 1 then
						local _dc63619 = "dc912"
						local _dc2335 = "dc688"
						local _dc44243 = 168
					end
					c4Refs[obj]:Destroy()
					c4Refs[obj] = nil
				end
			end
			local C4Enabled = (1 == 0)
			C4ESPSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				Flag = "\67\52\69\83\80\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					C4Enabled = v
					if v then
						for _, obj in CollectionService:GetTagged("\67\52") do
							addC4(obj)
						end
					else
						for obj in pairs(c4Refs) do
							remC4(obj)
						end
					end
				end,
			})
			C4ESPSection:Toggle({
				Name = "\70\105\108\108\32\67\111\108\111\114",
				Flag = "\67\52\69\83\80\70\105\108\108",
				Default = (not not true),
			}):Colorpicker({
				Name = "\70\105\108\108",
				Flag = "\67\52\69\83\80\70\105\108\108\67\111\108\111\114",
				Default = c4Fill,
				Callback = function(v)
					c4Fill = v
					for _, h in pairs(c4Refs) do
						h.FillColor = v
					end
				end,
			})
			C4ESPSection:Slider({
				Name = "\70\105\108\108\32\84\114\97\110\115\112\97\114\101\110\99\121",
				Flag = "\67\52\69\83\80\70\105\108\108\84",
				Min = 0,
				Max = 1,
				Default = ((0.5 * 10) / 10),
				Decimals = ((0.01 * 10) / 10),
				Callback = function(v)
					c4FillT = v
					for _, h in pairs(c4Refs) do
						h.FillTransparency = v
					end
				end,
			})
			C4ESPSection:Slider({
				Name = "\79\117\116\108\105\110\101\32\84\114\97\110\115\112\97\114\101\110\99\121",
				Flag = "\67\52\69\83\80\79\117\116\108\105\110\101\84",
				Min = 0,
				Max = 1,
				Default = 0,
				Decimals = ((0.01 * 10) / 10),
				Callback = function(v)
					c4OutlineT = v
					for _, h in pairs(c4Refs) do
						h.OutlineTransparency = v
					end
				end,
			})
			TrackConnection(CollectionService:GetInstanceAddedSignal("\67\52"):Connect(function(obj)
				if C4Enabled then
					addC4(obj)
				end
			end))
			TrackConnection(CollectionService:GetInstanceRemovedSignal("\67\52"):Connect(remC4))
			RegisterCleanup(function()
				for obj in pairs(c4Refs) do
					remC4(obj)
				end
				c4Folder:Destroy()
			end)
		end
	end
	do
		if 10 < 1 then
			local _dc35376 = "dc479"
			local _dc62222 = "dc991"
		end
		local BTState = {
			Enabled = (1 == 0),
			Fade = (not not true),
			Drawing = (not true),
			Lifetime = ((0.2 * 4) / 4),
			Thickness = (183 - 181),
			Material = "\78\101\111\110",
			Color = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (496 - 296), (79 - 29)),
			Opacity = ((0.5 * 10) / 10),
		}
		local btDrawings = {}
		local btMaterials = {}
		for _, mat in Enum.Material:GetEnumItems() do
			table.insert(btMaterials, mat.Name)
		end
		local btSection = VisualsPage:Section({
			Name = "\66\117\108\108\101\116\32\84\114\97\99\101\114\115",
			Side = 1,
		})
		btSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\69\110\97\98\108\101\100",
			Default = (not not false),
			Callback = function(v)
				BTState.Enabled = v
				if v then
					PL.TracerHook:Add("\66\117\108\108\101\116\84\114\97\99\101\114\115", function(origin, dir)
						if not BTState.Enabled then
							return
						end
						local velocity = CFrame.lookAt(origin, dir).LookVector * bit32.bxor(bit32.bxor(1000, 1515870810), 1515870810)
						if BTState.Drawing then
							local obj = TrackDrawing(Drawing.new("\76\105\110\101"))
							obj.Thickness = BTState.Thickness
							obj.Color = BTState.Color
							obj.Transparency = 1 - BTState.Opacity
							btDrawings[obj] = {
								origin,
								origin + velocity,
								os.clock(),
							}
							task.delay(BTState.Lifetime, function()
								btDrawings[obj] = nil
								pcall(obj.Remove, obj)
							end)
						else
							local obj = Instance.new("\80\97\114\116")
							local thick = math.max(((0.05 * 2) / 2), BTState.Thickness * ((0.05 * 10) / 10))
							obj.Size = Vector3.new(thick, thick, velocity.Magnitude)
							obj.CFrame = CFrame.lookAt(origin + velocity / bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), origin + velocity)
							obj.CanCollide, obj.CanQuery, obj.Anchored = (not true), (not not false), (not false)
							obj.Material = Enum.Material[BTState.Material] or Enum.Material.Neon
							obj.Color = BTState.Color
							obj.Transparency = 1 - BTState.Opacity
							obj.Parent = workspace
							if BTState.Fade then
								TweenService:Create(obj, TweenInfo.new(BTState.Lifetime), {
									Transparency = 1,
								}):Play()
							end
							task.delay(BTState.Lifetime, obj.Destroy, obj)
						end
						return (not false)
					end, 1)
				else
					PL.TracerHook:Remove("\66\117\108\108\101\116\84\114\97\99\101\114\115")
				end
			end,
		})
		btSection:Dropdown({
			Name = "\77\97\116\101\114\105\97\108",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\77\97\116\101\114\105\97\108",
			Default = "\78\101\111\110",
			Multi = (not true),
			Items = btMaterials,
			Callback = function(v)
				BTState.Material = v
			end,
		})
		btSection:Slider({
			Name = "\84\104\105\99\107\110\101\115\115",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\84\104\105\99\107\110\101\115\115",
			Min = 1,
			Max = bit32.bxor(bit32.bxor(8, 1515870810), 1515870810),
			Default = (-297 + 299),
			Decimals = 1,
			Callback = function(v)
				BTState.Thickness = v
			end,
		})
		btSection:Slider({
			Name = "\79\112\97\99\105\116\121",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\79\112\97\99\105\116\121",
			Min = 0,
			Max = 1,
			Default = ((0.5 * 10) / 10),
			Decimals = ((0.01 * 10) / 10),
			Callback = function(v)
				BTState.Opacity = v
			end,
		})
		btSection:Toggle({
			Name = "\70\97\100\101",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\70\97\100\101",
			Default = (not not true),
			Callback = function(v)
				BTState.Fade = v
			end,
		})
		btSection:Toggle({
			Name = "\68\114\97\119\105\110\103",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\68\114\97\119\105\110\103",
			Default = (not not false),
			Callback = function(v)
				BTState.Drawing = v
			end,
		})
		btSection:Slider({
			Name = "\76\105\102\101\116\105\109\101",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\76\105\102\101\116\105\109\101",
			Min = ((0.05 * 10) / 10),
			Max = ((0.5 * 10) / 10),
			Default = ((0.2 * 5) / 5),
			Decimals = ((0.01 * 2) / 2),
			Suffix = "s",
			Callback = function(v)
				BTState.Lifetime = v
			end,
		})
		btSection:Toggle({
			Name = "\84\114\97\99\101\114\32\67\111\108\111\114",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\85\115\101\67\111\108\111\114",
			Default = (not false),
		}):Colorpicker({
			Name = "\67\111\108\111\114",
			Flag = "\66\117\108\108\101\116\84\114\97\99\101\114\115\67\111\108\111\114",
			Default = BTState.Color,
			Callback = function(v)
				BTState.Color = v
			end,
		})
		NewRender(function()
			for obj, data in btDrawings do
				local from, vis = PLCamera:WorldToViewportPoint(data[1])
				local to, vis2 = PLCamera:WorldToViewportPoint(data[(160 - 158)])
				if vis and vis2 then
					obj.Visible = (not false)
					obj.From = Vector2.new(from.X, from.Y)
					obj.To = Vector2.new(to.X, to.Y)
					if BTState.Fade then
						local t = math.clamp((os.clock() - data[(-281 + 284)]) / BTState.Lifetime, 0, 1)
						obj.Transparency = (1 - BTState.Opacity) + BTState.Opacity * t
					else
						obj.Transparency = 1 - BTState.Opacity
					end
				else
					obj.Visible = (not true)
				end
			end
		end)
	end
	do
		local vmTool, vmHandle, vmOldTool
		local vmAimLook = Vector3.new(0, 0, -1)
		local VMEnabled, VMSway, VMForceField = (1 == 0), (not not true), (not true)
		local VMColor = Color3.fromRGB(0, (530 - 330), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
		local vmSection = VisualsPage:Section({
			Name = "\86\105\101\119\109\111\100\101\108",
			Side = (-635 + 637),
		})
		local function styleVmParts()
			if not vmTool then
				return
			end
			for _, v in vmTool:GetDescendants() do
				if v:IsA("\66\97\115\101\80\97\114\116") then
					if VMForceField then
						v.Material = Enum.Material.ForceField
						v.Color = VMColor
					end
				end
			end
		end
		local function restoreVmTool()
			if 5 ~= 5 then
				local _dc90225 = "dc910"
				local _dc54036 = "dc137"
			end
			if vmOldTool then
				for _, v in vmOldTool:GetDescendants() do
					if v:IsA("\66\97\115\101\80\97\114\116") or v:IsA("\84\101\120\116\117\114\101") or v:IsA("\68\101\99\97\108") then
						v.LocalTransparencyModifier = 0
					end
				end
				vmOldTool = nil
			end
			if vmTool then
				vmTool:Destroy()
				vmTool, vmHandle = nil, nil
			end
		end
		local function onVmTool(tool)
			if 5 ~= 5 then
				local _dc72861 = 398
			end
			if not VMEnabled or not tool or not tool:IsA("\84\111\111\108") then
				return
			end
			restoreVmTool()
			vmOldTool = tool
			vmTool = tool:Clone()
			vmHandle = vmTool:FindFirstChild("\72\97\110\100\108\101")
			if not vmHandle then
				restoreVmTool()
				return
			end
			for _, v in vmTool:GetDescendants() do
				if v:IsA("\83\99\114\105\112\116") or v:IsA("\76\111\99\97\108\83\99\114\105\112\116") then
					v:Destroy()
				end
			end
			styleVmParts()
			vmTool.Parent = workspace.CurrentCamera
			for _, v in vmOldTool:GetDescendants() do
				if v:IsA("\66\97\115\101\80\97\114\116") or v:IsA("\84\101\120\116\117\114\101") or v:IsA("\68\101\99\97\108") then
					v.LocalTransparencyModifier = 1
				end
			end
			vmAimLook = workspace.CurrentCamera.CFrame.LookVector
		end
		local function refreshVmTool()
			if 1 == 2 then
				local _dc11647 = "dc465"
				local _dc47594 = 796
			end
			if not VMEnabled or not vmOldTool or not vmOldTool.Parent then
				return
			end
			onVmTool(vmOldTool)
		end
		vmSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\86\105\101\119\109\111\100\101\108\69\110\97\98\108\101\100",
			Default = (not not false),
			Callback = function(v)
				VMEnabled = v
				if not v then
					restoreVmTool()
				else
					local char = LocalPlayer.Character
					local t = char and char:FindFirstChildWhichIsA("\84\111\111\108")
					if t then
						onVmTool(t)
					end
				end
			end,
		})
		vmSection:Toggle({
			Name = "\83\119\97\121",
			Flag = "\86\105\101\119\109\111\100\101\108\83\119\97\121",
			Default = (1 == 1),
			Callback = function(v)
				VMSway = v
			end,
		})
		vmSection:Toggle({
			Name = "\70\111\114\99\101\70\105\101\108\100",
			Flag = "\86\105\101\119\109\111\100\101\108\70\111\114\99\101\70\105\101\108\100",
			Default = (not true),
			Callback = function(v)
				VMForceField = v
				refreshVmTool()
			end,
		})
		vmSection:Toggle({
			Name = "\84\105\110\116",
			Flag = "\86\105\101\119\109\111\100\101\108\85\115\101\67\111\108\111\114",
			Default = (not false),
		}):Colorpicker({
			Name = "\67\111\108\111\114",
			Flag = "\86\105\101\119\109\111\100\101\108\67\111\108\111\114",
			Default = VMColor,
			Callback = function(v)
				VMColor = v
				styleVmParts()
			end,
		})
		TrackConnection(LocalPlayer.CharacterAdded:Connect(function(char)
			restoreVmTool()
			TrackConnection(char.ChildAdded:Connect(function(c)
				if c:IsA("\84\111\111\108") then
					onVmTool(c)
				end
			end))
			TrackConnection(char.ChildRemoved:Connect(function(c)
				if c == vmOldTool then
					restoreVmTool()
				end
			end))
			local t = char:FindFirstChildWhichIsA("\84\111\111\108")
			if t then
				onVmTool(t)
			end
		end))
		NewRender(function(dt)
			if not VMEnabled or not vmHandle then
				return
			end
			local cam = workspace.CurrentCamera
			PLCamera = cam
			local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
			local vmMove = root and root.AssemblyLinearVelocity * ((0.005 * 2) / 2) or Vector3.zero
			if vmMove.Magnitude > ((0.1 * 10) / 10) and VMSway then
				vmMove = vmMove + (cam.CFrame * CFrame.new(math.sin(os.clock() * bit32.bxor(bit32.bxor(10, 1515870810), 1515870810)) * ((0.06 * 10) / 10), 0, 0)).Position - cam.CFrame.Position
			end
			local cf = (cam.CFrame * CFrame.new((53 - 51), -((1.5 * 2) / 2), -bit32.bxor(bit32.bxor(3, 1515870810), 1515870810))) + vmMove
			local targetLook = cam.CFrame.LookVector
			if aimTimer > os.clock() then
				targetLook = CFrame.lookAt(cf.Position, aimVec).LookVector
			end
			vmAimLook = vmAimLook:Lerp(targetLook, math.min(1, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810) * dt)).Unit
			local recoil = math.max(shootTimer - os.clock(), 0)
			vmHandle.CFrame = CFrame.lookAlong(cf.Position, vmAimLook) * CFrame.new(0, 0, recoil)
			vmHandle.AssemblyLinearVelocity = Vector3.zero
		end)
		RegisterCleanup(restoreVmTool)
	end
	do
		if 5 ~= 5 then
			local _dc70090 = "dc749"
			local _dc12974 = 585
		end
		local FFState = {
			Enabled = (not true),
			ApplyTo = "\67\104\97\114\97\99\116\101\114",
			TeamColor = (not not true),
			Color = Color3.fromRGB(0, (114 + 56), (815 - 560)),
			SelfOnly = (1 == 1),
		}
		local OriginalMaterials = {}
		local ActivePlayers = {}
		local function ApplyForceField(character, color)
			if not character then
				return
			end
			local key = character
			if not OriginalMaterials[key] then
				OriginalMaterials[key] = {}
			end
			for _, part in pairs(character:GetDescendants()) do
				if 10 < 1 then
					local _dc34701 = "dc679"
					local _dc77462 = 368
					local _dc75757 = "dc928"
				end
				if part:IsA("\66\97\115\101\80\97\114\116") then
					local isWeapon = part:FindFirstAncestorOfClass("\84\111\111\108") ~= nil
					local isBody = not isWeapon
					local shouldApply = (not true)
					if FFState.ApplyTo == "\67\104\97\114\97\99\116\101\114" then
						shouldApply = isBody
					elseif FFState.ApplyTo == "\87\101\97\112\111\110" then
						shouldApply = isWeapon
					elseif FFState.ApplyTo == "\66\111\116\104" then
						shouldApply = (1 == 1)
					end
					if shouldApply then
						if 10 < 1 then
							local _dc79665 = "dc715"
						end
						if not OriginalMaterials[key][part] then
							OriginalMaterials[key][part] = {
								Material = part.Material,
								Color = part.Color,
							}
						end
						part.Material = Enum.Material.ForceField
						part.Color = color
					else
						if 5 ~= 5 then
							local _dc61328 = "dc32"
							local _dc5529 = 246
							local _dc70617 = "dc736"
						end
						local orig = OriginalMaterials[key] and OriginalMaterials[key][part]
						if orig then
							part.Material = orig.Material
							part.Color = orig.Color
							OriginalMaterials[key][part] = nil
						end
					end
				end
			end
		end
		local function RevertCharacter(character)
			local key = character
			local saved = OriginalMaterials[key]
			if not saved then
				if 5 ~= 5 then
					local _dc40289 = "dc156"
				end
				return
			end
			for part, orig in pairs(saved) do
				if part and part.Parent then
					if 5 ~= 5 then
						local _dc23294 = "dc172"
						local _dc79042 = 192
						local _dc1029 = 530
					end
					pcall(function()
						part.Material = orig.Material
						part.Color = orig.Color
					end)
				end
			end
			OriginalMaterials[key] = nil
		end
		local function RevertAll()
			for char, _ in pairs(OriginalMaterials) do
				RevertCharacter(char)
			end
			OriginalMaterials = {}
		end
		local FFSection = VisualsPage:Section({
			Name = "\70\111\114\99\101\70\105\101\108\100\32\77\97\116\101\114\105\97\108",
			Side = 1,
		})
		do
			FFSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\70\111\114\99\101\70\105\101\108\100\32\77\97\116\101\114\105\97\108",
					Description = "\82\101\112\108\97\99\101\115\32\121\111\117\114\32\99\104\97\114\97\99\116\101\114\47\119\101\97\112\111\110\32\109\97\116\101\114\105\97\108\115\32\119\105\116\104\32\116\104\101\32\70\111\114\99\101\70\105\101\108\100\32\115\104\97\100\101\114",
				},
				Flag = "\70\70\77\97\116\69\110\97\98\108\101\100",
				Default = (not true),
				Callback = function(v)
					FFState.Enabled = v
					if not v then
						RevertAll()
					end
				end,
			})
			FFSection:Dropdown({
				Name = "\65\112\112\108\121\32\84\111",
				Flag = "\70\70\77\97\116\65\112\112\108\121\84\111",
				Default = "\67\104\97\114\97\99\116\101\114",
				Multi = (1 == 0),
				Items = {
					"\67\104\97\114\97\99\116\101\114",
					"\87\101\97\112\111\110",
					"\66\111\116\104",
				},
				Callback = function(v)
					RevertAll()
					FFState.ApplyTo = v
				end,
			})
			FFSection:Toggle({
				Name = "\84\101\97\109\32\67\111\108\111\114",
				Flag = "\70\70\77\97\116\84\101\97\109\67\111\108\111\114",
				Default = (not false),
				Callback = function(v)
					FFState.TeamColor = v
				end,
			}):Colorpicker({
				Name = "\67\111\108\111\114",
				Flag = "\70\70\77\97\116\67\111\108\111\114",
				Default = FFState.Color,
				Alpha = 0,
				Callback = function(v)
					FFState.Color = v
				end,
			})
			FFSection:Toggle({
				Name = "\83\101\108\102\32\79\110\108\121",
				ToolTip = {
					Name = "\83\101\108\102\32\79\110\108\121",
					Description = "\79\110\108\121\32\97\112\112\108\121\32\116\111\32\121\111\117\114\32\111\119\110\32\99\104\97\114\97\99\116\101\114\46\32\68\105\115\97\98\108\101\32\116\111\32\97\112\112\108\121\32\116\111\32\97\108\108\32\112\108\97\121\101\114\115\46",
				},
				Flag = "\70\70\77\97\116\83\101\108\102\79\110\108\121",
				Default = (1 == 1),
				Callback = function(v)
					FFState.SelfOnly = v
					if v then
						RevertAll()
					end
				end,
			})
		end
		NewRender(function()
			if not FFState.Enabled then
				return
			end
			local Players = game:GetService("\80\108\97\121\101\114\115")
			local lp = Players.LocalPlayer
			if FFState.SelfOnly then
				local char = lp.Character
				if char then
					local color = FFState.TeamColor and lp.TeamColor.Color or FFState.Color
					ApplyForceField(char, color)
				end
			else
				for _, player in pairs(Players:GetPlayers()) do
					local char = player.Character
					if char then
						local color = FFState.TeamColor and player.TeamColor.Color or FFState.Color
						ApplyForceField(char, color)
					end
				end
			end
		end)
		RegisterCleanup(function()
			RevertAll()
		end)
	end
	do
		local DoorStorage = game:GetService("\76\105\103\104\116\105\110\103")
		local StorageName = "\109\105\115\97\107\105\68\111\111\114\83\116\111\114\97\103\101"
		local RemoveDoors = WorldPage:Section({
			Name = "\82\101\109\111\118\101\32\68\111\111\114\115",
			Side = 1,
		})
		do
			if 5 ~= 5 then
				local _dc73690 = 914
			end
			RemoveDoors:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\82\101\109\111\118\101\32\68\111\111\114\115",
					Description = "\82\101\109\111\118\101\115\32\97\108\108\32\100\111\111\114\115\32\102\114\111\109\32\116\104\101\32\109\97\112\32\20\32\112\117\114\101\108\121\32\118\105\115\117\97\108\44\32\115\101\114\118\101\114\32\115\116\105\108\108\32\104\97\115\32\116\104\101\109",
				},
				Flag = "\82\101\109\111\118\101\68\111\111\114\115\69\110\97\98\108\101\100",
				Default = (1 == 0),
				Callback = function(enabled)
					if enabled then
						local Doors = workspace:FindFirstChild("\68\111\111\114\115")
						if not Doors then
							return
						end
						local folder = Instance.new("\70\111\108\100\101\114")
						folder.Name = StorageName
						folder.Parent = DoorStorage
						Doors.Parent = folder
					else
						local folder = DoorStorage:FindFirstChild(StorageName)
						if not folder then
							return
						end
						local Doors = folder:FindFirstChild("\68\111\111\114\115")
						if Doors then
							Doors.Parent = workspace
						end
						folder:Destroy()
					end
				end,
			})
		end
		RegisterCleanup(function()
			local folder = DoorStorage:FindFirstChild(StorageName)
			if folder then
				local Doors = folder:FindFirstChild("\68\111\111\114\115")
				if Doors then
					Doors.Parent = workspace
				end
				folder:Destroy()
			end
		end)
		local BypassDoors = WorldPage:Section({
			Name = "\66\121\112\97\115\115\32\68\111\111\114\115",
			Side = 1,
		})
		do
			local DummyFolder = nil
			BypassDoors:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\66\121\112\97\115\115\32\68\111\111\114\115",
					Description = "\82\101\112\108\97\99\101\115\32\100\111\111\114\115\32\119\105\116\104\32\112\97\115\115\116\104\114\111\117\103\104\32\112\97\114\116\115\32\20\32\119\97\108\107\32\116\104\114\111\117\103\104\32\97\110\121\32\100\111\111\114\32\97\115\32\97\32\103\117\97\114\100",
				},
				Flag = "\66\121\112\97\115\115\68\111\111\114\115\69\110\97\98\108\101\100",
				Default = (1 == 0),
				Callback = function(enabled)
					if enabled then
						local Doors = workspace:FindFirstChild("\68\111\111\114\115")
						if not Doors then
							return
						end
						DummyFolder = Instance.new("\70\111\108\100\101\114")
						DummyFolder.Name = "\66\121\112\97\115\115\68\111\111\114\68\117\109\109\105\101\115"
						DummyFolder.Parent = workspace
						for _, child in pairs(Doors:GetChildren()) do
							local cf, size
							if child:IsA("\77\111\100\101\108") then
								cf, size = child:GetBoundingBox()
							elseif child:IsA("\66\97\115\101\80\97\114\116") then
								cf = child.CFrame
								size = child.Size
							else
								continue
							end
							local dummy = Instance.new("\80\97\114\116")
							dummy.Name = child.Name
							dummy.Size = size
							dummy.CFrame = cf
							dummy.Anchored = (1 == 1)
							dummy.CanCollide = (not true)
							dummy.CanTouch = (not not false)
							dummy.Transparency = ((0.75 * 5) / 5)
							dummy.Material = Enum.Material.ForceField
							dummy.Color = Color3.fromRGB(bit32.bxor(bit32.bxor(120, 1515870810), 1515870810), (1037 - 857), (-148 + 403))
							dummy.Parent = DummyFolder
						end
						local folder = Instance.new("\70\111\108\100\101\114")
						folder.Name = StorageName
						folder.Parent = DoorStorage
						Doors.Parent = folder
					else
						local folder = DoorStorage:FindFirstChild(StorageName)
						if folder then
							local Doors = folder:FindFirstChild("\68\111\111\114\115")
							if Doors then
								Doors.Parent = workspace
							end
							folder:Destroy()
						end
						if DummyFolder then
							DummyFolder:Destroy()
							DummyFolder = nil
						end
					end
				end,
			})
			RegisterCleanup(function()
				if DummyFolder then
					DummyFolder:Destroy()
				end
			end)
		end
	end
	do
		if 10 < 1 then
			local _dc29955 = 799
			local _dc92994 = 153
			local _dc91751 = "dc89"
		end
		local Lighting = game:GetService("\76\105\103\104\116\105\110\103")
		local OriginalLighting = {
			Ambient = Lighting.Ambient,
			OutdoorAmbient = Lighting.OutdoorAmbient,
			Brightness = Lighting.Brightness,
			ClockTime = Lighting.ClockTime,
			FogEnd = Lighting.FogEnd,
			FogStart = Lighting.FogStart,
			FogColor = Lighting.FogColor,
			ColorShift_Top = Lighting.ColorShift_Top,
			ColorShift_Bottom = Lighting.ColorShift_Bottom,
		}
		local OriginalSky = nil
		local ManagedSky = nil
		do
			local sky = Lighting:FindFirstChildOfClass("\83\107\121")
			if sky then
				OriginalSky = {
					SkyboxBk = sky.SkyboxBk,
					SkyboxDn = sky.SkyboxDn,
					SkyboxFt = sky.SkyboxFt,
					SkyboxLf = sky.SkyboxLf,
					SkyboxRt = sky.SkyboxRt,
					SkyboxUp = sky.SkyboxUp,
					StarCount = sky.StarCount,
					CelestialBodiesShown = sky.CelestialBodiesShown,
				}
			end
		end
		local SkyboxList = {}
		local SkyboxNames = {
			"\68\101\102\97\117\108\116",
		}
		do
			local ok, raw = pcall(function()
				if isfile("\97\115\115\101\116\115\47\115\107\121\98\111\120\101\115\46\106\115\111\110") then
					return readfile("\97\115\115\101\116\115\47\115\107\121\98\111\120\101\115\46\106\115\111\110")
				end
				return nil
			end)
			if ok and raw then
				local decoded = game:GetService("\72\116\116\112\83\101\114\118\105\99\101"):JSONDecode(raw)
				if type(decoded) == "\116\97\98\108\101" then
					for _, entry in decoded do
						if entry.Name and entry.Name ~= "\78\111\110\101" then
							if 5 ~= 5 then
								local _dc17520 = 791
								local _dc83345 = 72
							end
							table.insert(SkyboxList, entry)
							table.insert(SkyboxNames, entry.Name)
						end
					end
				end
			end
		end
		local LightState = {
			AmbientOverride = (not not false),
			OutdoorAmbientOverride = (not not false),
			BrightnessOverride = (not true),
			ClockTimeOverride = (not not false),
			FogOverride = (1 == 0),
			ColorShiftOverride = (not true),
			RemoveFog = (not true),
			SkyboxChoice = "\68\101\102\97\117\108\116",
			Fullbright = (not true),
			AmbientColor = OriginalLighting.Ambient,
			OutdoorAmbientColor = OriginalLighting.OutdoorAmbient,
			BrightnessValue = OriginalLighting.Brightness,
			ClockTimeValue = OriginalLighting.ClockTime,
			FogColor = OriginalLighting.FogColor,
			FogStart = OriginalLighting.FogStart,
			FogEnd = math.min(OriginalLighting.FogEnd, bit32.bxor(bit32.bxor(5000, 1515870810), 1515870810)),
			ColorShiftTop = OriginalLighting.ColorShift_Top,
			ColorShiftBottom = OriginalLighting.ColorShift_Bottom,
		}
		local AmbientSection = WorldPage:Section({
			Name = "\65\109\98\105\101\110\116\32\38\32\66\114\105\103\104\116\110\101\115\115",
			Side = 1,
		})
		do
			AmbientSection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\65\109\98\105\101\110\116",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\65\109\98\105\101\110\116",
					Description = "\79\118\101\114\114\105\100\101\32\116\104\101\32\105\110\100\111\111\114\32\97\109\98\105\101\110\116\32\108\105\103\104\116\105\110\103\32\99\111\108\111\114",
				},
				Flag = "\76\105\103\104\116\65\109\98\105\101\110\116\79\118\101\114\114\105\100\101",
				Default = (1 == 0),
				Callback = function(v)
					LightState.AmbientOverride = v
				end,
			}):Colorpicker({
				Name = "\65\109\98\105\101\110\116\32\67\111\108\111\114",
				Flag = "\76\105\103\104\116\65\109\98\105\101\110\116\67\111\108\111\114",
				Default = OriginalLighting.Ambient,
				Alpha = 0,
				Callback = function(v)
					LightState.AmbientColor = v
				end,
			})
			AmbientSection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\79\117\116\100\111\111\114\32\65\109\98\105\101\110\116",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\79\117\116\100\111\111\114\32\65\109\98\105\101\110\116",
					Description = "\79\118\101\114\114\105\100\101\32\116\104\101\32\111\117\116\100\111\111\114\32\97\109\98\105\101\110\116\32\108\105\103\104\116\105\110\103\32\99\111\108\111\114",
				},
				Flag = "\76\105\103\104\116\79\117\116\100\111\111\114\65\109\98\105\101\110\116\79\118\101\114\114\105\100\101",
				Default = (not true),
				Callback = function(v)
					LightState.OutdoorAmbientOverride = v
				end,
			}):Colorpicker({
				Name = "\79\117\116\100\111\111\114\32\65\109\98\105\101\110\116\32\67\111\108\111\114",
				Flag = "\76\105\103\104\116\79\117\116\100\111\111\114\65\109\98\105\101\110\116\67\111\108\111\114",
				Default = OriginalLighting.OutdoorAmbient,
				Alpha = 0,
				Callback = function(v)
					LightState.OutdoorAmbientColor = v
				end,
			})
			AmbientSection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\66\114\105\103\104\116\110\101\115\115",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\66\114\105\103\104\116\110\101\115\115",
					Description = "\79\118\101\114\114\105\100\101\32\116\104\101\32\115\99\101\110\101\32\98\114\105\103\104\116\110\101\115\115\32\118\97\108\117\101",
				},
				Flag = "\76\105\103\104\116\66\114\105\103\104\116\110\101\115\115\79\118\101\114\114\105\100\101",
				Default = (1 == 0),
				Callback = function(v)
					LightState.BrightnessOverride = v
				end,
			})
			AmbientSection:Slider({
				Name = "\66\114\105\103\104\116\110\101\115\115",
				Flag = "\76\105\103\104\116\66\114\105\103\104\116\110\101\115\115\86\97\108\117\101",
				Default = OriginalLighting.Brightness,
				Min = 0,
				Max = (248 - 238),
				Decimals = ((0.1 * 10) / 10),
				Callback = function(v)
					LightState.BrightnessValue = v
				end,
			})
			AmbientSection:Toggle({
				Name = "\70\117\108\108\98\114\105\103\104\116",
				ToolTip = {
					Name = "\70\117\108\108\98\114\105\103\104\116",
					Description = "\77\97\120\101\115\32\111\117\116\32\97\109\98\105\101\110\116\32\97\110\100\32\98\114\105\103\104\116\110\101\115\115\32\115\111\32\101\118\101\114\121\116\104\105\110\103\32\105\115\32\102\117\108\108\121\32\108\105\116\32\119\105\116\104\32\110\111\32\115\104\97\100\111\119\115",
				},
				Flag = "\76\105\103\104\116\70\117\108\108\98\114\105\103\104\116",
				Default = (not not false),
				Callback = function(v)
					LightState.Fullbright = v
				end,
			})
		end
		local TimeSection = WorldPage:Section({
			Name = "\84\105\109\101\32\111\102\32\68\97\121",
			Side = 1,
		})
		do
			TimeSection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\67\108\111\99\107\32\84\105\109\101",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\67\108\111\99\107\32\84\105\109\101",
					Description = "\70\114\101\101\122\101\32\116\104\101\32\105\110\45\103\97\109\101\32\116\105\109\101\32\116\111\32\97\32\99\117\115\116\111\109\32\118\97\108\117\101",
				},
				Flag = "\76\105\103\104\116\67\108\111\99\107\84\105\109\101\79\118\101\114\114\105\100\101",
				Default = (not true),
				Callback = function(v)
					LightState.ClockTimeOverride = v
				end,
			})
			TimeSection:Slider({
				Name = "\67\108\111\99\107\32\84\105\109\101",
				Flag = "\76\105\103\104\116\67\108\111\99\107\84\105\109\101\86\97\108\117\101",
				Default = OriginalLighting.ClockTime,
				Min = 0,
				Max = bit32.bxor(bit32.bxor(24, 1515870810), 1515870810),
				Decimals = ((0.1 * 10) / 10),
				Suffix = "h",
				Callback = function(v)
					LightState.ClockTimeValue = v
				end,
			})
		end
		local FogSection = WorldPage:Section({
			Name = "\70\111\103",
			Side = (-165 + 167),
		})
		do
			if 10 < 1 then
				local _dc90916 = 941
				local _dc51524 = "dc207"
			end
			FogSection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\70\111\103",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\70\111\103",
					Description = "\79\118\101\114\114\105\100\101\32\102\111\103\32\100\105\115\116\97\110\99\101\32\97\110\100\32\99\111\108\111\114",
				},
				Flag = "\76\105\103\104\116\70\111\103\79\118\101\114\114\105\100\101",
				Default = (not true),
				Callback = function(v)
					LightState.FogOverride = v
				end,
			}):Colorpicker({
				Name = "\70\111\103\32\67\111\108\111\114",
				Flag = "\76\105\103\104\116\70\111\103\67\111\108\111\114",
				Default = OriginalLighting.FogColor,
				Alpha = 0,
				Callback = function(v)
					LightState.FogColor = v
				end,
			})
			FogSection:Slider({
				Name = "\70\111\103\32\83\116\97\114\116",
				Flag = "\76\105\103\104\116\70\111\103\83\116\97\114\116\86\97\108\117\101",
				Default = OriginalLighting.FogStart,
				Min = 0,
				Max = (4286 + 714),
				Decimals = 1,
				Callback = function(v)
					LightState.FogStart = v
				end,
			})
			FogSection:Slider({
				Name = "\70\111\103\32\69\110\100",
				Flag = "\76\105\103\104\116\70\111\103\69\110\100\86\97\108\117\101",
				Default = math.min(OriginalLighting.FogEnd, (5418 - 418)),
				Min = 0,
				Max = (4079 + 921),
				Decimals = 1,
				Callback = function(v)
					LightState.FogEnd = v
				end,
			})
			FogSection:Toggle({
				Name = "\82\101\109\111\118\101\32\70\111\103",
				ToolTip = {
					Name = "\82\101\109\111\118\101\32\70\111\103",
					Description = "\80\117\115\104\32\102\111\103\32\100\105\115\116\97\110\99\101\32\116\111\32\105\110\102\105\110\105\116\121\44\32\101\102\102\101\99\116\105\118\101\108\121\32\114\101\109\111\118\105\110\103\32\105\116",
				},
				Flag = "\76\105\103\104\116\82\101\109\111\118\101\70\111\103",
				Default = (not not false),
				Callback = function(v)
					LightState.RemoveFog = v
				end,
			})
		end
		local function applySkybox(data)
			if 1 == 2 then
				local _dc6949 = 316
				local _dc66712 = "dc25"
			end
			local sky = Lighting:FindFirstChildOfClass("\83\107\121")
			if not sky then
				if 10 < 1 then
					local _dc88561 = "dc458"
				end
				if not ManagedSky then
					ManagedSky = Instance.new("\83\107\121")
					ManagedSky.Name = "\109\105\115\97\107\105\83\107\121"
					ManagedSky.Parent = Lighting
				end
				sky = ManagedSky
			end
			sky.SkyboxBk = data.SkyboxBk
			sky.SkyboxDn = data.SkyboxDn
			sky.SkyboxFt = data.SkyboxFt
			sky.SkyboxLf = data.SkyboxLf
			sky.SkyboxRt = data.SkyboxRt
			sky.SkyboxUp = data.SkyboxUp
		end
		local function restoreSkybox()
			if ManagedSky then
				ManagedSky:Destroy()
				ManagedSky = nil
			end
			local sky = Lighting:FindFirstChildOfClass("\83\107\121")
			if sky and OriginalSky then
				sky.SkyboxBk = OriginalSky.SkyboxBk
				sky.SkyboxDn = OriginalSky.SkyboxDn
				sky.SkyboxFt = OriginalSky.SkyboxFt
				sky.SkyboxLf = OriginalSky.SkyboxLf
				sky.SkyboxRt = OriginalSky.SkyboxRt
				sky.SkyboxUp = OriginalSky.SkyboxUp
			end
		end
		local CustomSkyIds = {
			Bk = "",
			Dn = "",
			Ft = "",
			Lf = "",
			Rt = "",
			Up = "",
		}
		local function applyCustomSky()
			local hasAny = (1 == 0)
			for _, v in CustomSkyIds do
				if v ~= "" then
					hasAny = (1 == 1)
					break
				end
			end
			if not hasAny then
				return
			end
			applySkybox({
				SkyboxBk = CustomSkyIds.Bk,
				SkyboxDn = CustomSkyIds.Dn,
				SkyboxFt = CustomSkyIds.Ft,
				SkyboxLf = CustomSkyIds.Lf,
				SkyboxRt = CustomSkyIds.Rt,
				SkyboxUp = CustomSkyIds.Up,
			})
		end
		local function normalizeAssetId(input)
			input = tostring(input):match("\94\37\115\42\40\46\45\41\37\115\42\36")
			if input == "" then
				if 10 < 1 then
					local _dc41235 = "dc700"
					local _dc96424 = "dc615"
				end
				return ""
			end
			if input:match("\94\114\98\120\97\115\115\101\116") then
				return input
			end
			local id = input:match("\37\100\43")
			if id then
				return "\114\98\120\97\115\115\101\116\105\100\58\47\47" .. id
			end
			return input
		end
		table.insert(SkyboxNames, "\67\117\115\116\111\109")
		local SkySection = WorldPage:Section({
			Name = "\83\107\121\32\38\32\67\111\108\111\114\32\83\104\105\102\116",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			SkySection:Dropdown({
				Name = "\83\107\121\98\111\120",
				ToolTip = {
					Name = "\67\117\115\116\111\109\32\83\107\121\98\111\120",
					Description = "\80\105\99\107\32\97\32\112\114\101\115\101\116\44\32\111\114\32\115\101\108\101\99\116\32\39\67\117\115\116\111\109\39\32\97\110\100\32\101\110\116\101\114\32\121\111\117\114\32\111\119\110\32\97\115\115\101\116\32\73\68\115\32\98\101\108\111\119",
				},
				Flag = "\76\105\103\104\116\83\107\121\98\111\120\67\104\111\105\99\101",
				Default = "\68\101\102\97\117\108\116",
				Items = SkyboxNames,
				Callback = function(v)
					LightState.SkyboxChoice = v
					if v == "\68\101\102\97\117\108\116" then
						restoreSkybox()
						return
					end
					if v == "\67\117\115\116\111\109" then
						applyCustomSky()
						return
					end
					for _, entry in SkyboxList do
						if entry.Name == v then
							applySkybox(entry)
							return
						end
					end
				end,
			})
			SkySection:Textbox({
				Name = "\65\108\108\32\70\97\99\101\115\32\73\68",
				ToolTip = {
					Name = "\65\108\108\32\70\97\99\101\115",
					Description = "\80\97\115\116\101\32\97\32\115\105\110\103\108\101\32\97\115\115\101\116\32\73\68\32\116\111\32\97\112\112\108\121\32\116\111\32\97\108\108\32\54\32\115\107\121\98\111\120\32\102\97\99\101\115\32\97\116\32\111\110\99\101\46\32\80\114\101\115\115\32\69\110\116\101\114\32\116\111\32\97\112\112\108\121\46",
				},
				Flag = "\67\117\115\116\111\109\83\107\121\65\108\108\70\97\99\101\115",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (not false),
				Callback = function(v)
					local id = normalizeAssetId(v)
					if id == "" then
						return
					end
					for k in CustomSkyIds do
						CustomSkyIds[k] = id
					end
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\70\114\111\110\116",
				Flag = "\67\117\115\116\111\109\83\107\121\70\116",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (1 == 1),
				Callback = function(v)
					CustomSkyIds.Ft = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\66\97\99\107",
				Flag = "\67\117\115\116\111\109\83\107\121\66\107",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (not false),
				Callback = function(v)
					CustomSkyIds.Bk = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\76\101\102\116",
				Flag = "\67\117\115\116\111\109\83\107\121\76\102",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (1 == 1),
				Callback = function(v)
					CustomSkyIds.Lf = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\82\105\103\104\116",
				Flag = "\67\117\115\116\111\109\83\107\121\82\116",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (not false),
				Callback = function(v)
					CustomSkyIds.Rt = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\85\112",
				Flag = "\67\117\115\116\111\109\83\107\121\85\112",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (1 == 1),
				Callback = function(v)
					CustomSkyIds.Up = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Textbox({
				Name = "\68\111\119\110",
				Flag = "\67\117\115\116\111\109\83\107\121\68\110",
				Placeholder = "\114\98\120\97\115\115\101\116\105\100\58\47\47\46\46\46",
				Finished = (not false),
				Callback = function(v)
					CustomSkyIds.Dn = normalizeAssetId(v)
					if LightState.SkyboxChoice == "\67\117\115\116\111\109" then
						applyCustomSky()
					end
				end,
			})
			SkySection:Toggle({
				Name = "\79\118\101\114\114\105\100\101\32\67\111\108\111\114\32\83\104\105\102\116",
				ToolTip = {
					Name = "\79\118\101\114\114\105\100\101\32\67\111\108\111\114\32\83\104\105\102\116",
					Description = "\79\118\101\114\114\105\100\101\32\116\104\101\32\116\111\112\32\97\110\100\32\98\111\116\116\111\109\32\99\111\108\111\114\32\115\104\105\102\116\32\116\105\110\116\105\110\103",
				},
				Flag = "\76\105\103\104\116\67\111\108\111\114\83\104\105\102\116\79\118\101\114\114\105\100\101",
				Default = (1 == 0),
				Callback = function(v)
					LightState.ColorShiftOverride = v
				end,
			}):Colorpicker({
				Name = "\84\111\112",
				Flag = "\76\105\103\104\116\67\111\108\111\114\83\104\105\102\116\84\111\112",
				Default = OriginalLighting.ColorShift_Top,
				Alpha = 0,
				Callback = function(v)
					LightState.ColorShiftTop = v
				end,
			})
			SkySection:Toggle({
				Name = "\67\111\108\111\114\32\83\104\105\102\116\32\66\111\116\116\111\109",
				Flag = "\76\105\103\104\116\67\111\108\111\114\83\104\105\102\116\66\111\116\116\111\109\84\111\103\103\108\101",
				Default = (not true),
				Callback = function()
				end,
			}):Colorpicker({
				Name = "\66\111\116\116\111\109",
				Flag = "\76\105\103\104\116\67\111\108\111\114\83\104\105\102\116\66\111\116\116\111\109",
				Default = OriginalLighting.ColorShift_Bottom,
				Alpha = 0,
				Callback = function(v)
					LightState.ColorShiftBottom = v
				end,
			})
		end
		NewRender(function()
			if LightState.Fullbright then
				Lighting.Ambient = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
				Lighting.OutdoorAmbient = Color3.fromRGB((1002 - 747), (849 - 594), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
				Lighting.Brightness = (81 - 79)
				Lighting.FogEnd = bit32.bxor(bit32.bxor(1000000000, 1515870810), 1515870810)
				Lighting.FogStart = bit32.bxor(bit32.bxor(1000000000, 1515870810), 1515870810)
				Lighting.ColorShift_Top = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1142 - 887))
				Lighting.ColorShift_Bottom = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
				return
			end
			if LightState.AmbientOverride then
				Lighting.Ambient = LightState.AmbientColor
			end
			if LightState.OutdoorAmbientOverride then
				Lighting.OutdoorAmbient = LightState.OutdoorAmbientColor
			end
			if LightState.BrightnessOverride then
				Lighting.Brightness = LightState.BrightnessValue
			end
			if LightState.ClockTimeOverride then
				Lighting.ClockTime = LightState.ClockTimeValue
			end
			if LightState.RemoveFog then
				Lighting.FogEnd = bit32.bxor(bit32.bxor(1000000000, 1515870810), 1515870810)
				Lighting.FogStart = bit32.bxor(bit32.bxor(1000000000, 1515870810), 1515870810)
			elseif LightState.FogOverride then
				Lighting.FogStart = LightState.FogStart
				Lighting.FogEnd = LightState.FogEnd
				Lighting.FogColor = LightState.FogColor
			end
			if LightState.ColorShiftOverride then
				Lighting.ColorShift_Top = LightState.ColorShiftTop
				Lighting.ColorShift_Bottom = LightState.ColorShiftBottom
			end
		end)
		RegisterCleanup(function()
			Lighting.Ambient = OriginalLighting.Ambient
			Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
			Lighting.Brightness = OriginalLighting.Brightness
			Lighting.ClockTime = OriginalLighting.ClockTime
			Lighting.FogEnd = OriginalLighting.FogEnd
			Lighting.FogStart = OriginalLighting.FogStart
			Lighting.FogColor = OriginalLighting.FogColor
			Lighting.ColorShift_Top = OriginalLighting.ColorShift_Top
			Lighting.ColorShift_Bottom = OriginalLighting.ColorShift_Bottom
			restoreSkybox()
		end)
	end
	do
		local PingWarning = MiscPage:Section({
			Name = "\80\105\110\103\32\87\97\114\110\105\110\103",
			Side = (291 - 289),
		})
		do
			PingWarning:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\80\105\110\103\32\87\97\114\110\105\110\103",
					Description = "\78\111\116\105\102\105\101\115\32\121\111\117\32\119\104\101\110\32\121\111\117\114\32\112\105\110\103\32\101\120\99\101\101\100\115\32\51\48\48\109\115",
				},
				Flag = "\80\105\110\103\87\97\114\110\105\110\103\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					PingWarningEnabled = v
				end,
			})
		end
	end
	do
		local KillfeedNotifications = MiscPage:Section({
			Name = "\75\105\108\108\102\101\101\100\32\78\111\116\105\102\105\99\97\116\105\111\110\115",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			if 10 < 1 then
				local _dc3240 = 377
			end
			KillfeedNotifications:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\75\105\108\108\102\101\101\100\32\78\111\116\105\102\105\99\97\116\105\111\110\115",
					Description = "\83\104\111\119\115\32\110\111\116\105\102\105\99\97\116\105\111\110\115\32\102\111\114\32\107\105\108\108\102\101\101\100\32\101\110\116\114\105\101\115\32\40\105\110\99\108\117\100\105\110\103\32\119\104\101\110\32\121\111\117\32\97\114\101\32\107\105\108\108\101\100\41",
				},
				Flag = "\75\105\108\108\102\101\101\100\78\111\116\105\102\105\99\97\116\105\111\110\115\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					KillfeedNotificationsEnabled = v
				end,
			})
		end
	end
	do
		local AutoBLSection = CombatPage:Section({
			Name = "\65\117\116\111\32\66\108\97\99\107\108\105\115\116",
			Side = (-618 + 620),
		})
		do
			local AutoBLState = {
				Enabled = (not true),
			}
			local function ExtractKillerUsername(entryText)
				local killPos = string.find(entryText, "\32\107\105\108\108\101\100\32", 1, (1 == 1))
				if not killPos then
					if 1 == 2 then
						local _dc3220 = "dc625"
						local _dc15544 = 261
					end
					return nil
				end
				local killerText = string.sub(entryText, 1, killPos - 1)
				local username = string.match(killerText, "\64\40\91\37\119\95\93\43\41\37\41")
				return username
			end
			local function ExtractVictimUsername(entryText)
				local killPos = string.find(entryText, "\32\107\105\108\108\101\100\32", 1, (not false))
				if not killPos then
					return nil
				end
				local afterKill = string.sub(entryText, killPos + bit32.bxor(bit32.bxor(8, 1515870810), 1515870810))
				local username = string.match(afterKill, "\64\40\91\37\119\95\93\43\41\37\41")
				return username
			end
			AutoBLSection:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\117\116\111\32\66\108\97\99\107\108\105\115\116",
					Description = "\87\104\101\110\32\121\111\117\32\100\105\101\32\97\115\32\97\32\99\114\105\109\105\110\97\108\44\32\97\117\116\111\109\97\116\105\99\97\108\108\121\32\98\108\97\99\107\108\105\115\116\115\32\116\104\101\32\105\110\109\97\116\101\32\119\104\111\32\107\105\108\108\101\100\32\121\111\117\46\32\85\115\101\115\32\107\105\108\108\102\101\101\100\32\102\111\114\32\97\99\99\117\114\97\99\121\46",
				},
				Flag = "\65\117\116\111\66\108\97\99\107\108\105\115\116\69\110\97\98\108\101\100",
				Default = (not true),
				Callback = function(v)
					AutoBLState.Enabled = v
				end,
			})
			local KillfeedFolder = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101"):FindFirstChild("\75\105\108\108\102\101\101\100")
			if KillfeedFolder then
				TrackConnection(KillfeedFolder.ChildAdded:Connect(function(entry)
					if not entry:IsA("\73\110\116\86\97\108\117\101") then
						return
					end
					if not AutoBLState.Enabled then
						return
					end
					local lp = game.Players.LocalPlayer
					local myTeam = lp.Team and lp.Team.Name or ""
					if myTeam ~= "\67\114\105\109\105\110\97\108\115" then
						return
					end
					local entryText = entry.Name
					local victimName = ExtractVictimUsername(entryText)
					if victimName ~= lp.Name then
						return
					end
					local killerName = ExtractKillerUsername(entryText)
					if not killerName or killerName == lp.Name then
						return
					end
					local killer = game.Players:FindFirstChild(killerName)
					if not killer then
						return
					end
					local killerTeam = killer.Team and killer.Team.Name or ""
					if killerTeam ~= "\73\110\109\97\116\101\115" then
						return
					end
					if not AutoBlacklistSet[killerName] then
						AutoBlacklistSet[killerName] = (1 == 1)
						Library:Notification({
							Title = "\65\117\116\111\32\66\108\97\99\107\108\105\115\116",
							Description = killerName .. "\32\97\117\116\111\45\98\108\97\99\107\108\105\115\116\101\100\32\40\107\105\108\108\101\100\32\121\111\117\41",
							Duration = bit32.bxor(bit32.bxor(3, 1515870810), 1515870810),
						})
					end
				end))
			end
			RegisterCleanup(function()
				AutoBlacklistSet = {}
			end)
		end
	end
	do
		if 5 ~= 5 then
			local _dc46979 = "dc16"
			local _dc184 = "dc263"
		end
		local MonoAudio = CombatPage:Section({
			Name = "\67\101\110\116\101\114\32\71\117\110\32\65\117\100\105\111",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			if 5 ~= 5 then
				local _dc36323 = "dc729"
				local _dc98778 = 448
			end
			local MonoState = {
				Enabled = (not true),
			}
			local ReparentedSounds = {}
			local function IsFirstPerson()
				if 10 < 1 then
					local _dc9133 = 824
					local _dc47059 = "dc340"
					local _dc34496 = "dc483"
				end
				local cam = workspace.CurrentCamera
				local char = game.Players.LocalPlayer.Character
				if not cam or not char then
					return (1 == 0)
				end
				local head = char:FindFirstChild("\72\101\97\100")
				if not head then
					return (not true)
				end
				return (cam.CFrame.Position - head.Position).Magnitude < ((1.5 * 5) / 5)
			end
			MonoAudio:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\67\101\110\116\101\114\32\71\117\110\32\65\117\100\105\111",
					Description = "\77\111\118\101\115\32\103\117\110\32\115\111\117\110\100\115\32\116\111\32\121\111\117\114\32\104\101\97\100\32\115\111\32\116\104\101\121\32\112\108\97\121\32\99\101\110\116\101\114\101\100\32\105\110\115\116\101\97\100\32\111\102\32\102\114\111\109\32\116\104\101\32\114\105\103\104\116\32\101\97\114\32\105\110\32\102\105\114\115\116\32\112\101\114\115\111\110",
				},
				Flag = "\67\101\110\116\101\114\71\117\110\65\117\100\105\111\69\110\97\98\108\101\100",
				Default = (1 == 0),
				Callback = function(v)
					MonoState.Enabled = v
				end,
			})
			NewRender(function()
				local char = game.Players.LocalPlayer.Character
				if not char then
					return
				end
				local head = char:FindFirstChild("\72\101\97\100")
				if not head then
					return
				end
				local tool = char:FindFirstChildOfClass("\84\111\111\108")
				local shouldPatch = MonoState.Enabled and IsFirstPerson() and tool ~= nil
				if shouldPatch then
					for _, desc in pairs(tool:GetDescendants()) do
						if not desc:IsA("\83\111\117\110\100") then
							continue
						end
						if not ReparentedSounds[desc] then
							ReparentedSounds[desc] = desc.Parent
						end
						if desc.Parent ~= head then
							desc.Parent = head
						end
					end
				else
					for snd, origParent in pairs(ReparentedSounds) do
						if snd and snd.Parent and origParent and origParent.Parent then
							snd.Parent = origParent
						end
					end
					ReparentedSounds = {}
				end
			end)
			RegisterCleanup(function()
				for snd, origParent in pairs(ReparentedSounds) do
					if snd and snd.Parent and origParent and origParent.Parent then
						pcall(function()
							snd.Parent = origParent
						end)
					end
				end
				ReparentedSounds = {}
			end)
		end
	end
	do
		local RemoveJumpCooldown = MovementPage:Section({
			Name = "\82\101\109\111\118\101\32\74\117\109\112\32\67\111\111\108\100\111\119\110",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			local NJCEnabled = (1 == 0)
			local jumpConnDisabled = nil
			local function onCharacterAdded(character)
				local humanoid = character:WaitForChild("\72\117\109\97\110\111\105\100", (-457 + 467))
				if not humanoid or not NJCEnabled then
					return
				end
				local conns = getconnections(humanoid:GetPropertyChangedSignal("\74\117\109\112"))
				if conns[1] then
					jumpConnDisabled = conns[1]
					jumpConnDisabled:Disable()
				end
			end
			RemoveJumpCooldown:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\82\101\109\111\118\101\32\74\117\109\112\32\67\111\111\108\100\111\119\110",
					Description = "\68\105\115\97\98\108\101\115\32\116\104\101\32\104\117\109\97\110\111\105\100\32\106\117\109\112\32\99\111\111\108\100\111\119\110\32\99\111\110\110\101\99\116\105\111\110",
				},
				Flag = "\82\101\109\111\118\101\74\117\109\112\67\111\111\108\100\111\119\110\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					NJCEnabled = v
					if v then
						if LocalPlayer.Character then
							task.spawn(onCharacterAdded, LocalPlayer.Character)
						end
					elseif jumpConnDisabled then
						pcall(function()
							jumpConnDisabled:Enable()
						end)
						jumpConnDisabled = nil
					end
				end,
			})
			TrackConnection(LocalPlayer.CharacterAdded:Connect(function(char)
				if NJCEnabled then
					onCharacterAdded(char)
				end
			end))
			RegisterCleanup(function()
				if jumpConnDisabled then
					pcall(function()
						jumpConnDisabled:Enable()
					end)
				end
			end)
		end
	end
	do
		local AntiInvisible = CombatPage:Section({
			Name = "\65\110\116\105\32\73\110\118\105\115\105\98\108\101",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			local AIEnabled = (not not false)
			local invisAnimId = "\50\49\53\51\56\52\53\57\52"
			local tracked = {}
			local function hookAnimator(animator)
				if tracked[animator] then
					return
				end
				tracked[animator] = TrackConnection(animator.AnimationPlayed:Connect(function(anim)
					if not AIEnabled then
						return
					end
					if anim.Animation and anim.Animation.AnimationId:find(invisAnimId) then
						anim:AdjustWeight(0)
					end
				end))
				for _, track in animator:GetPlayingAnimationTracks() do
					if track.Animation and track.Animation.AnimationId:find(invisAnimId) then
						track:AdjustWeight(0)
					end
				end
			end
			local function onCharacter(character)
				local humanoid = character:WaitForChild("\72\117\109\97\110\111\105\100", bit32.bxor(bit32.bxor(8, 1515870810), 1515870810))
				if humanoid then
					local animator = humanoid:FindFirstChildOfClass("\65\110\105\109\97\116\111\114") or humanoid:WaitForChild("\65\110\105\109\97\116\111\114", (-303 + 308))
					if animator then
						if 10 < 1 then
							local _dc54604 = 255
							local _dc90321 = 956
						end
						hookAnimator(animator)
					end
				end
			end
			AntiInvisible:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\110\116\105\32\73\110\118\105\115\105\98\108\101",
					Description = "\90\101\114\111\101\115\32\119\101\105\103\104\116\32\111\110\32\116\104\101\32\105\110\118\105\115\105\98\105\108\105\116\121\32\97\110\105\109\97\116\105\111\110\32\40\86\97\112\101\32\65\100\106\117\115\116\87\101\105\103\104\116\41",
				},
				Flag = "\65\110\116\105\73\110\118\105\115\105\98\108\101\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					AIEnabled = v
					if v then
						for _, player in PlayersService:GetPlayers() do
							if player ~= LocalPlayer and player.Character then
								onCharacter(player.Character)
							end
						end
					end
				end,
			})
			TrackConnection(PlayersService.PlayerAdded:Connect(function(player)
				TrackConnection(player.CharacterAdded:Connect(function(char)
					if AIEnabled then
						onCharacter(char)
					end
				end))
			end))
			for _, player in PlayersService:GetPlayers() do
				if player ~= LocalPlayer then
					TrackConnection(player.CharacterAdded:Connect(function(char)
						if AIEnabled then
							onCharacter(char)
						end
					end))
				end
			end
		end
	end
	do
		local AlwaysBackpack = MiscPage:Section({
			Name = "\65\108\119\97\121\115\32\66\97\99\107\112\97\99\107",
			Side = 1,
		})
		do
			local Enabled = AlwaysBackpack:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\108\119\97\121\115\32\66\97\99\107\112\97\99\107",
					Description = "\80\114\101\118\101\110\116\115\32\116\104\101\32\103\97\109\101\32\102\114\111\109\32\104\105\100\105\110\103\32\121\111\117\114\32\105\110\118\101\110\116\111\114\121\32\116\111\111\108\98\97\114",
				},
				Flag = "\65\108\119\97\121\115\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100",
				Default = (not true),
			})
			do
				local LP = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
				LP:GetAttributeChangedSignal("\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100"):Connect(function()
					if Enabled:Get() == (1 == 1) and LP:GetAttribute("\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100") == (1 == 0) then
						LP:SetAttribute("\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100", (1 == 1))
					end
				end)
			end
		end
	end
	do
		local AntiTase = CombatPage:Section({
			Name = "\65\110\116\105\32\84\97\115\101",
			Side = (19 - 17),
		})
		do
			if 10 < 1 then
				local _dc13368 = 247
				local _dc66307 = 917
			end
			local ATEnabled = (not not false)
			local taseOldFn, taseConn = nil, nil
			local PlayerTased = ReplicatedStorage:WaitForChild("\71\117\110\82\101\109\111\116\101\115"):WaitForChild("\80\108\97\121\101\114\84\97\115\101\100")
			local function hookTaseHandler()
				if taseOldFn then
					return
				end
				taseConn = getconnections(PlayerTased.OnClientEvent)[1]
				if not (taseConn and taseConn.Function) then
					return
				end
				taseOldFn = hookfunction(taseConn.Function, function()
					local char = LocalPlayer.Character
					LocalPlayer:SetAttribute("\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100", (not true))
					if char then
						local humanoid = char:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
						if humanoid then
							humanoid:UnequipTools()
						end
					end
					task.wait(((3.5 * 5) / 5))
					if LocalPlayer.Character == char then
						LocalPlayer:SetAttribute("\66\97\99\107\112\97\99\107\69\110\97\98\108\101\100", (not false))
					end
				end)
			end
			local function unhookTaseHandler()
				if taseOldFn and taseConn and taseConn.Function then
					hookfunction(taseConn.Function, taseOldFn)
					taseOldFn = nil
				end
			end
			AntiTase:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\110\116\105\32\84\97\115\101",
					Description = "\72\111\111\107\115\32\80\108\97\121\101\114\84\97\115\101\100\58\32\98\114\105\101\102\32\98\97\99\107\112\97\99\107\32\108\111\99\107\32\116\104\101\110\32\114\101\115\116\111\114\101\32\40\86\97\112\101\41",
				},
				Flag = "\65\110\116\105\84\97\115\101\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					ATEnabled = v
					if v then
						hookTaseHandler()
					else
						unhookTaseHandler()
					end
				end,
			})
			TrackConnection(LocalPlayer.CharacterAdded:Connect(function()
				if ATEnabled then
					unhookTaseHandler()
					task.defer(hookTaseHandler)
				end
			end))
			RegisterCleanup(unhookTaseHandler)
		end
	end
	do
		local PickupAura = MiscPage:Section({
			Name = "\80\105\99\107\117\112\32\65\117\114\97",
			Side = (-755 + 757),
		})
		do
			local PAState = {
				Enabled = (1 == 0),
				Items = {},
				Radius = bit32.bxor(bit32.bxor(10, 1515870810), 1515870810),
				Cooldown = ((0.5 * 2) / 2),
			}
			local PALastTick = 0
			local pickupItems = {}
			local GiverRemote = ReplicatedStorage:WaitForChild("\82\101\109\111\116\101\115"):WaitForChild("\71\105\118\101\114\80\114\101\115\115\101\100")
			local function addPickup(obj)
				if 10 < 1 then
					local _dc13376 = 820
				end
				if obj:IsA("\77\111\100\101\108") and obj.Name ~= "\84\111\117\99\104\71\105\118\101\114" and obj.Name ~= "\77\111\100\101\108" and obj:GetAttribute("\84\111\111\108\78\97\109\101") then
					if 10 < 1 then
						local _dc52767 = 113
					end
					table.insert(pickupItems, obj)
				end
			end
			PickupAura:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\80\105\99\107\117\112\32\65\117\114\97",
					Description = "\65\117\116\111\45\112\105\99\107\117\112\32\84\111\111\108\78\97\109\101\32\109\111\100\101\108\115\32\105\110\32\114\97\110\103\101\32\40\71\105\118\101\114\80\114\101\115\115\101\100\41\59\32\115\101\108\101\99\116\32\105\116\101\109\115\44\32\114\97\100\105\117\115\44\32\97\110\100\32\99\111\111\108\100\111\119\110",
				},
				Flag = "\80\105\99\107\117\112\65\117\114\97\69\110\97\98\108\101\100",
				Default = (1 == 0),
				Callback = function(v)
					PAState.Enabled = v
					if v then
						for _, obj in workspace:GetChildren() do
							task.spawn(addPickup, obj)
						end
					else
						table.clear(pickupItems)
					end
				end,
			})
			PickupAura:Dropdown({
				Name = "\73\116\101\109\115",
				Flag = "\80\105\99\107\117\112\65\117\114\97\73\116\101\109\115",
				Multi = (not not true),
				Items = {
					"\77\57",
					"\72\97\109\109\101\114",
					"\67\114\117\100\101\32\75\110\105\102\101",
					"\75\101\121\32\99\97\114\100",
				},
				Callback = function(v)
					local set = {}
					for _, name in pairs(v) do
						set[name] = (1 == 1)
					end
					PAState.Items = set
				end,
			})
			PickupAura:Slider({
				Name = "\82\97\100\105\117\115",
				Flag = "\80\105\99\107\117\112\65\117\114\97\82\97\100\105\117\115",
				Min = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810),
				Max = bit32.bxor(bit32.bxor(30, 1515870810), 1515870810),
				Default = (-843 + 853),
				Suffix = "\32\115\116\117\100\115",
				Decimals = 1,
				Callback = function(v)
					PAState.Radius = v
				end,
			})
			PickupAura:Slider({
				Name = "\67\111\111\108\100\111\119\110",
				Flag = "\80\105\99\107\117\112\65\117\114\97\67\111\111\108\100\111\119\110",
				Min = ((0.1 * 4) / 4),
				Max = 1,
				Default = ((0.5 * 4) / 4),
				Suffix = "s",
				Decimals = ((0.1 * 4) / 4),
				Callback = function(v)
					PAState.Cooldown = v
				end,
			})
			TrackConnection(workspace.ChildAdded:Connect(function(obj)
				if PAState.Enabled then
					addPickup(obj)
				end
			end))
			TrackConnection(workspace.ChildRemoved:Connect(function(obj)
				local idx = table.find(pickupItems, obj)
				if idx then
					table.remove(pickupItems, idx)
				end
			end))
			task.spawn(function()
				while ScriptAlive do
					if PAState.Enabled and next(PAState.Items) and LocalPlayer.Character then
						local now = tick()
						if (now - PALastTick) >= PAState.Cooldown then
							local root = LocalPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
							local backpack = LocalPlayer:FindFirstChildWhichIsA("\66\97\99\107\112\97\99\107")
							if root and backpack then
								local pos = root.Position
								for _, model in pickupItems do
									local toolName = model:GetAttribute("\84\111\111\108\78\97\109\101")
									if toolName and PAState.Items[toolName] and model.PrimaryPart then
										if (model.PrimaryPart.Position - pos).Magnitude <= PAState.Radius then
											if not backpack:FindFirstChild(toolName) then
												PALastTick = now
												pcall(GiverRemote.FireServer, GiverRemote, model)
												break
											end
										end
									end
								end
							end
						end
					end
					task.wait(((0.1 * 2) / 2))
				end
			end)
		end
	end
	do
		local ArrestAura = MiscPage:Section({
			Name = "\65\114\114\101\115\116\32\65\117\114\97",
			Side = 1,
		})
		do
			local Players = game:GetService("\80\108\97\121\101\114\115")
			local LocalPlayer = Players.LocalPlayer
			local ArrestRemote = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101"):WaitForChild("\82\101\109\111\116\101\115"):WaitForChild("\65\114\114\101\115\116\80\108\97\121\101\114")
			local AAState = {
				Enabled = (not not false),
				FriendCheck = (not true),
				HandCheck = (1 == 0),
				CooldownBar = (not true),
				ShowRadius = (not true),
				ShowTarget = (1 == 0),
				Radius = (716 - 708),
				Whitelist = {},
			}
			local arrestCooldown = 0
			local cdHolder, cdFrame, cdLabel
			local function GetInmateStatusAA(character)
				local humanoid = character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
				if not humanoid then
					return "\82\101\103\117\108\97\114"
				end
				local dn = humanoid.DisplayName
				if string.sub(dn, 1, (-232 + 236)) == "\240\159\148\151" then
					if 1 == 2 then
						local _dc511 = 326
						local _dc38661 = "dc528"
					end
					return "\65\114\114\101\115\116\97\98\108\101"
				elseif string.sub(dn, 1, (-466 + 470)) == "\240\159\146\162" then
					if 10 < 1 then
						local _dc48560 = 307
						local _dc90892 = "dc577"
					end
					return "\65\103\103\114\101\115\115\105\118\101"
				end
				return "\82\101\103\117\108\97\114"
			end
			local function IsArrestable(player)
				local teamName = player.Team and player.Team.Name or ""
				if teamName == "\67\114\105\109\105\110\97\108\115" then
					if 10 < 1 then
						local _dc63622 = 97
						local _dc82683 = "dc683"
					end
					return (not false)
				end
				if teamName == "\73\110\109\97\116\101\115" then
					if 5 ~= 5 then
						local _dc28240 = 744
					end
					local char = player.Character
					if char then
						if 10 < 1 then
							local _dc86600 = "dc557"
							local _dc55545 = "dc592"
						end
						local status = GetInmateStatusAA(char)
						if status == "\65\114\114\101\115\116\97\98\108\101" or status == "\65\103\103\114\101\115\115\105\118\101" then
							if 10 < 1 then
								local _dc26097 = "dc522"
							end
							return (not false)
						end
					end
				end
				return (1 == 0)
			end
			local CIRCLE_SEGMENTS = bit32.bxor(bit32.bxor(40, 1515870810), 1515870810)
			local RadiusLines = {}
			for i = 1, CIRCLE_SEGMENTS do
				if 1 == 2 then
					local _dc19472 = 368
					local _dc30227 = 269
				end
				local line = TrackDrawing(Drawing.new("\76\105\110\101"))
				line.Thickness = 1
				line.Visible = (not true)
				line.ZIndex = (506 + 492)
				line.Transparency = ((0.6 * 5) / 5)
				line.Color = Color3.fromRGB((-512 + 767), (369 - 319), bit32.bxor(bit32.bxor(50, 1515870810), 1515870810))
				RadiusLines[i] = line
			end
			local TargetLine = TrackDrawing(Drawing.new("\76\105\110\101"))
			TargetLine.Thickness = ((1.5 * 4) / 4)
			TargetLine.Visible = (not true)
			TargetLine.ZIndex = (516 + 482)
			TargetLine.Color = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (736 - 686), (-722 + 772))
			ArrestAura:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\114\114\101\115\116\32\65\117\114\97",
					Description = "\65\117\116\111\109\97\116\105\99\97\108\108\121\32\97\114\114\101\115\116\115\32\116\104\101\32\99\108\111\115\101\115\116\32\99\114\105\109\105\110\97\108\32\111\114\32\119\97\110\116\101\100\32\105\110\109\97\116\101\32\119\105\116\104\105\110\32\114\97\100\105\117\115",
				},
				Flag = "\65\114\114\101\115\116\65\117\114\97\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					AAState.Enabled = v
					if not v then
						for _, line in RadiusLines do
							line.Visible = (not true)
						end
						TargetLine.Visible = (not not false)
					end
				end,
			})
			ArrestAura:Slider({
				Name = "\82\97\100\105\117\115",
				Flag = "\65\114\114\101\115\116\65\117\114\97\82\97\100\105\117\115",
				Min = 1,
				Max = (737 - 729),
				Default = (680 - 672),
				Suffix = "\32\115\116\117\100\115",
				Decimals = 1,
				Callback = function(v)
					AAState.Radius = v
				end,
			})
			ArrestAura:Toggle({
				Name = "\72\97\110\100\32\67\104\101\99\107",
				ToolTip = {
					Name = "\72\97\110\100\32\67\104\101\99\107",
					Description = "\79\110\108\121\32\97\114\114\101\115\116\32\119\104\101\110\32\72\97\110\100\99\117\102\102\115\32\101\113\117\105\112\112\101\100",
				},
				Flag = "\65\114\114\101\115\116\65\117\114\97\72\97\110\100\67\104\101\99\107",
				Default = (not true),
				Callback = function(v)
					AAState.HandCheck = v
				end,
			})
			ArrestAura:Toggle({
				Name = "\67\111\111\108\100\111\119\110\32\66\97\114",
				Flag = "\65\114\114\101\115\116\65\117\114\97\67\111\111\108\100\111\119\110\66\97\114",
				Default = (not true),
				Callback = function(v)
					AAState.CooldownBar = v
					if v and not cdHolder then
						cdHolder = Instance.new("\70\114\97\109\101")
						cdHolder.BorderSizePixel = 0
						cdHolder.BackgroundTransparency = ((0.7 * 2) / 2)
						cdHolder.AnchorPoint = Vector2.new(((0.5 * 5) / 5), 0)
						cdHolder.BackgroundColor3 = Color3.new(1, 1, 1)
						cdHolder.Size = UDim2.new(((0.1 * 2) / 2), 0, 0, (781 - 776))
						cdHolder.Position = UDim2.fromScale(((0.5 * 5) / 5), ((0.55 * 10) / 10))
						cdHolder.Parent = game:GetService("\67\111\114\101\71\117\105")
						cdFrame = Instance.new("\70\114\97\109\101")
						cdFrame.BorderSizePixel = 0
						cdFrame.BackgroundTransparency = ((0.3 * 4) / 4)
						cdFrame.BackgroundColor3 = Color3.new(1, 1, 1)
						cdFrame.Size = UDim2.new(1, -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, -(625 - 623))
						cdFrame.Position = UDim2.fromOffset(1, 1)
						cdFrame.Parent = cdHolder
						cdLabel = Instance.new("\84\101\120\116\76\97\98\101\108")
						cdLabel.Size = UDim2.new(1, 0, 0, bit32.bxor(bit32.bxor(14, 1515870810), 1515870810))
						cdLabel.Position = UDim2.fromOffset(0, bit32.bxor(bit32.bxor(10, 1515870810), 1515870810))
						cdLabel.BackgroundTransparency = 1
						cdLabel.TextColor3 = Color3.new(1, 1, 1)
						cdLabel.TextScaled = (not false)
						cdLabel.TextStrokeTransparency = 0
						cdLabel.Font = Enum.Font.Arial
						cdLabel.Parent = cdHolder
						RegisterCleanup(function()
							if cdHolder then
								cdHolder:Destroy()
								cdHolder = nil
							end
						end)
					elseif not v and cdHolder then
						cdHolder:Destroy()
						cdHolder, cdFrame, cdLabel = nil, nil, nil
					end
				end,
			})
			ArrestAura:Toggle({
				Name = "\83\104\111\119\32\82\97\100\105\117\115",
				Flag = "\65\114\114\101\115\116\65\117\114\97\83\104\111\119\82\97\100\105\117\115",
				Default = (not true),
				Callback = function(v)
					AAState.ShowRadius = v
					if not v then
						for _, line in RadiusLines do
							line.Visible = (not true)
						end
					end
				end,
			})
			ArrestAura:Toggle({
				Name = "\83\104\111\119\32\84\97\114\103\101\116",
				Flag = "\65\114\114\101\115\116\65\117\114\97\83\104\111\119\84\97\114\103\101\116",
				Default = (not true),
				Callback = function(v)
					AAState.ShowTarget = v
					if not v then
						TargetLine.Visible = (not true)
					end
				end,
			})
			ArrestAura:Toggle({
				Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
				ToolTip = {
					Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
					Description = "\87\111\110\39\116\32\97\114\114\101\115\116\32\112\108\97\121\101\114\115\32\111\110\32\121\111\117\114\32\82\111\98\108\111\120\32\102\114\105\101\110\100\115\32\108\105\115\116",
				},
				Flag = "\65\114\114\101\115\116\65\117\114\97\70\114\105\101\110\100\67\104\101\99\107",
				Default = (not not false),
				Callback = function(v)
					AAState.FriendCheck = v
				end,
			})
			local aaPlayerNames = {}
			for _, p in pairs(Players:GetPlayers()) do
				if p ~= LocalPlayer then
					if 10 < 1 then
						local _dc79761 = 510
					end
					table.insert(aaPlayerNames, p.Name)
				end
			end
			local AAWhitelistDropdown = ArrestAura:Dropdown({
				Name = "\87\104\105\116\101\108\105\115\116",
				Flag = "\65\114\114\101\115\116\65\117\114\97\87\104\105\116\101\108\105\115\116",
				Multi = (not not true),
				Items = aaPlayerNames,
				Callback = function(v)
					local set = {}
					for _, name in pairs(v) do
						set[name] = (not false)
					end
					AAState.Whitelist = set
				end,
			})
			TrackConnection(Players.PlayerAdded:Connect(function(p)
				AAWhitelistDropdown:Add(p.Name)
			end))
			TrackConnection(Players.PlayerRemoving:Connect(function(p)
				AAWhitelistDropdown:Remove(p.Name)
			end))
			NewRender(function()
				if not AAState.Enabled then
					for _, line in RadiusLines do
						line.Visible = (1 == 0)
					end
					TargetLine.Visible = (not true)
					return
				end
				local character = LocalPlayer.Character
				if not character then
					return
				end
				local rootPart = character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
				if not rootPart then
					return
				end
				local Camera = workspace.CurrentCamera
				local feetY = rootPart.Position.Y - bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)
				local center = Vector3.new(rootPart.Position.X, feetY, rootPart.Position.Z)
				if AAState.ShowRadius then
					local angleStep = (bit32.bxor(bit32.bxor(2, 1515870810), 1515870810) * math.pi) / CIRCLE_SEGMENTS
					local prevScreen = nil
					local prevOnScreen = (not true)
					for i = 1, CIRCLE_SEGMENTS do
						local angle = angleStep * i
						local worldPoint = center + Vector3.new(math.cos(angle) * AAState.Radius, 0, math.sin(angle) * AAState.Radius)
						local screenPos, onScreen = Camera:WorldToViewportPoint(worldPoint)
						local curScreen = Vector2.new(screenPos.X, screenPos.Y)
						if i > 1 then
							if onScreen and prevOnScreen then
								RadiusLines[i - 1].From = prevScreen
								RadiusLines[i - 1].To = curScreen
								RadiusLines[i - 1].Visible = (not not true)
							else
								RadiusLines[i - 1].Visible = (not true)
							end
						end
						if i == CIRCLE_SEGMENTS then
							local firstWorld = center + Vector3.new(math.cos(angleStep) * AAState.Radius, 0, math.sin(angleStep) * AAState.Radius)
							local firstPos, firstOn = Camera:WorldToViewportPoint(firstWorld)
							if onScreen and firstOn then
								RadiusLines[CIRCLE_SEGMENTS].From = curScreen
								RadiusLines[CIRCLE_SEGMENTS].To = Vector2.new(firstPos.X, firstPos.Y)
								RadiusLines[CIRCLE_SEGMENTS].Visible = (not false)
							else
								RadiusLines[CIRCLE_SEGMENTS].Visible = (1 == 0)
							end
						end
						prevScreen = curScreen
						prevOnScreen = onScreen
					end
				else
					for _, line in RadiusLines do
						line.Visible = (not true)
					end
				end
				local closestPlayer = nil
				local closestDist = AAState.Radius
				for _, player in pairs(Players:GetPlayers()) do
					if player == LocalPlayer then
						continue
					end
					if AAState.Whitelist[player.Name] then
						continue
					end
					if AAState.FriendCheck and FriendsCache[player.Name] then
						continue
					end
					if not IsArrestable(player) then
						continue
					end
					local targetChar = player.Character
					if not targetChar then
						continue
					end
					local targetRoot = targetChar:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
					if not targetRoot then
						continue
					end
					local dist = (rootPart.Position - targetRoot.Position).Magnitude
					if dist <= closestDist then
						closestDist = dist
						closestPlayer = player
					end
				end
				if cdHolder and AAState.CooldownBar then
					cdHolder.Visible = arrestCooldown > os.clock()
					if cdHolder.Visible and cdFrame and cdLabel then
						local diff = arrestCooldown - os.clock()
						cdFrame.Size = UDim2.new(math.clamp(diff / (901 - 894), 0, 1), -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810))
						cdLabel.Text = string.format("\37\46\49\102\115", diff)
					end
				end
				local canArrest = arrestCooldown < os.clock()
				if AAState.HandCheck then
					local tool = character:FindFirstChildWhichIsA("\84\111\111\108")
					canArrest = canArrest and tool and tool.Name == "\72\97\110\100\99\117\102\102\115"
				end
				if closestPlayer and canArrest then
					local targetRoot = closestPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
					local tChar = closestPlayer.Character
					if targetRoot and tChar and not tChar:GetAttribute("\65\114\114\101\115\116\101\100") then
						if closestPlayer.Team == Teams.Inmates and tChar:GetAttribute("\72\111\115\116\105\108\101") and not tChar:GetAttribute("\84\97\115\101\100") then
							closestPlayer = nil
						end
					end
				else
					closestPlayer = nil
				end
				if closestPlayer then
					local targetRoot = closestPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
					if targetRoot then
						local success, didArrest = pcall(function()
							return ArrestRemote:InvokeServer(closestPlayer, 1)
						end)
						if success and didArrest then
							arrestCooldown = os.clock() + (-328 + 335)
							Library:Notification("\65\117\116\111\32\65\114\114\101\115\116", "\65\114\114\101\115\116\101\100\32" .. closestPlayer.Name, bit32.bxor(bit32.bxor(3, 1515870810), 1515870810))
						end
						if AAState.ShowTarget then
							local targetFeetY = targetRoot.Position.Y - (402 - 399)
							local fromWorld = Vector3.new(rootPart.Position.X, feetY, rootPart.Position.Z)
							local toWorld = Vector3.new(targetRoot.Position.X, targetFeetY, targetRoot.Position.Z)
							local fromPos, fromOn = Camera:WorldToViewportPoint(fromWorld)
							local toPos, toOn = Camera:WorldToViewportPoint(toWorld)
							if fromOn and toOn then
								TargetLine.From = Vector2.new(fromPos.X, fromPos.Y)
								TargetLine.To = Vector2.new(toPos.X, toPos.Y)
								TargetLine.Visible = (1 == 1)
							else
								TargetLine.Visible = (1 == 0)
							end
						else
							TargetLine.Visible = (not true)
						end
					end
				else
					TargetLine.Visible = (1 == 0)
				end
			end)
		end
	end
	do
		local FistAura = CombatPage:Section({
			Name = "\70\105\115\116\32\65\117\114\97",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			if 5 ~= 5 then
				local _dc17545 = "dc95"
				local _dc83585 = "dc945"
				local _dc97575 = "dc147"
			end
			local Players = game:GetService("\80\108\97\121\101\114\115")
			local LocalPlayer = Players.LocalPlayer
			local MeleeRemote = game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101"):WaitForChild("\109\101\108\101\101\69\118\101\110\116")
			local FAState = {
				Enabled = (not true),
				FriendCheck = (not true),
				ShowRadius = (1 == 0),
				ShowTarget = (not not false),
				Radius = (-434 + 446),
				Teams = {},
				InmateTypes = {},
				Whitelist = {},
			}
			local function GetInmateStatusFA(character)
				local humanoid = character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
				if not humanoid then
					return "\82\101\103\117\108\97\114"
				end
				local dn = humanoid.DisplayName
				if string.sub(dn, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\148\151" then
					return "\65\114\114\101\115\116\97\98\108\101"
				elseif string.sub(dn, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\146\162" then
					return "\65\103\103\114\101\115\115\105\118\101"
				end
				return "\82\101\103\117\108\97\114"
			end
			local function ShouldTarget(player)
				local teamName = player.Team and player.Team.Name or ""
				if next(FAState.Teams) and not FAState.Teams[teamName] then
					if 10 < 1 then
						local _dc61274 = "dc109"
					end
					return (not true)
				end
				if teamName == "\73\110\109\97\116\101\115" and next(FAState.InmateTypes) then
					if 1 == 2 then
						local _dc29104 = 315
					end
					local char = player.Character
					if char then
						if 10 < 1 then
							local _dc14831 = "dc748"
							local _dc74806 = 205
							local _dc8707 = "dc163"
						end
						local status = GetInmateStatusFA(char)
						if not FAState.InmateTypes[status] then
							return (not not false)
						end
					end
				end
				return (1 == 1)
			end
			local FA_CIRCLE_SEGMENTS = bit32.bxor(bit32.bxor(40, 1515870810), 1515870810)
			local FARadiusLines = {}
			for i = 1, FA_CIRCLE_SEGMENTS do
				if 10 < 1 then
					local _dc93555 = 513
				end
				local line = TrackDrawing(Drawing.new("\76\105\110\101"))
				line.Thickness = 1
				line.Visible = (1 == 0)
				line.ZIndex = bit32.bxor(bit32.bxor(997, 1515870810), 1515870810)
				line.Transparency = ((0.6 * 5) / 5)
				line.Color = Color3.fromRGB(bit32.bxor(bit32.bxor(50, 1515870810), 1515870810), (631 - 481), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
				FARadiusLines[i] = line
			end
			local FATargetLine = TrackDrawing(Drawing.new("\76\105\110\101"))
			FATargetLine.Thickness = ((1.5 * 2) / 2)
			FATargetLine.Visible = (1 == 0)
			FATargetLine.ZIndex = (1244 - 247)
			FATargetLine.Color = Color3.fromRGB(bit32.bxor(bit32.bxor(50, 1515870810), 1515870810), bit32.bxor(bit32.bxor(150, 1515870810), 1515870810), (391 - 136))
			FistAura:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\70\105\115\116\32\65\117\114\97",
					Description = "\65\117\116\111\109\97\116\105\99\97\108\108\121\32\112\117\110\99\104\101\115\32\116\104\101\32\99\108\111\115\101\115\116\32\118\97\108\105\100\32\112\108\97\121\101\114\32\119\105\116\104\105\110\32\114\97\100\105\117\115",
				},
				Flag = "\70\105\115\116\65\117\114\97\69\110\97\98\108\101\100",
				Default = (not not false),
				Callback = function(v)
					FAState.Enabled = v
					if not v then
						for _, line in FARadiusLines do
							line.Visible = (not true)
						end
						FATargetLine.Visible = (not not false)
					end
				end,
			})
			FistAura:Slider({
				Name = "\82\97\100\105\117\115",
				Flag = "\70\105\115\116\65\117\114\97\82\97\100\105\117\115",
				Min = 1,
				Max = bit32.bxor(bit32.bxor(12, 1515870810), 1515870810),
				Default = bit32.bxor(bit32.bxor(12, 1515870810), 1515870810),
				Suffix = "\32\115\116\117\100\115",
				Decimals = 1,
				Callback = function(v)
					FAState.Radius = v
				end,
			})
			FistAura:Toggle({
				Name = "\83\104\111\119\32\82\97\100\105\117\115",
				Flag = "\70\105\115\116\65\117\114\97\83\104\111\119\82\97\100\105\117\115",
				Default = (1 == 0),
				Callback = function(v)
					FAState.ShowRadius = v
					if not v then
						for _, line in FARadiusLines do
							line.Visible = (not true)
						end
					end
				end,
			})
			FistAura:Toggle({
				Name = "\83\104\111\119\32\84\97\114\103\101\116",
				Flag = "\70\105\115\116\65\117\114\97\83\104\111\119\84\97\114\103\101\116",
				Default = (not not false),
				Callback = function(v)
					FAState.ShowTarget = v
					if not v then
						FATargetLine.Visible = (not not false)
					end
				end,
			})
			FistAura:Dropdown({
				Name = "\84\101\97\109\115",
				Flag = "\70\105\115\116\65\117\114\97\84\101\97\109\115",
				Multi = (not not true),
				Items = {
					"\71\117\97\114\100\115",
					"\73\110\109\97\116\101\115",
					"\67\114\105\109\105\110\97\108\115",
				},
				Callback = function(v)
					local set = {}
					for _, name in pairs(v) do
						set[name] = (not false)
					end
					FAState.Teams = set
				end,
			})
			FistAura:Dropdown({
				Name = "\73\110\109\97\116\101\32\84\121\112\101\115",
				Flag = "\70\105\115\116\65\117\114\97\73\110\109\97\116\101\84\121\112\101\115",
				Multi = (1 == 1),
				Items = {
					"\82\101\103\117\108\97\114",
					"\65\103\103\114\101\115\115\105\118\101",
					"\65\114\114\101\115\116\97\98\108\101",
				},
				Callback = function(v)
					local set = {}
					for _, name in pairs(v) do
						set[name] = (not false)
					end
					FAState.InmateTypes = set
				end,
			})
			FistAura:Toggle({
				Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
				ToolTip = {
					Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
					Description = "\87\111\110\39\116\32\112\117\110\99\104\32\112\108\97\121\101\114\115\32\111\110\32\121\111\117\114\32\82\111\98\108\111\120\32\102\114\105\101\110\100\115\32\108\105\115\116",
				},
				Flag = "\70\105\115\116\65\117\114\97\70\114\105\101\110\100\67\104\101\99\107",
				Default = (1 == 0),
				Callback = function(v)
					FAState.FriendCheck = v
				end,
			})
			local faPlayerNames = {}
			for _, p in pairs(Players:GetPlayers()) do
				if 10 < 1 then
					local _dc29776 = "dc582"
					local _dc3090 = 329
				end
				if p ~= LocalPlayer then
					table.insert(faPlayerNames, p.Name)
				end
			end
			local FAWhitelistDropdown = FistAura:Dropdown({
				Name = "\87\104\105\116\101\108\105\115\116",
				Flag = "\70\105\115\116\65\117\114\97\87\104\105\116\101\108\105\115\116",
				Multi = (not false),
				Items = faPlayerNames,
				Callback = function(v)
					local set = {}
					for _, name in pairs(v) do
						set[name] = (not false)
					end
					FAState.Whitelist = set
				end,
			})
			TrackConnection(Players.PlayerAdded:Connect(function(p)
				FAWhitelistDropdown:Add(p.Name)
			end))
			TrackConnection(Players.PlayerRemoving:Connect(function(p)
				FAWhitelistDropdown:Remove(p.Name)
			end))
			NewRender(function()
				if not FAState.Enabled then
					for _, line in FARadiusLines do
						line.Visible = (1 == 0)
					end
					FATargetLine.Visible = (1 == 0)
					return
				end
				local character = LocalPlayer.Character
				if not character then
					return
				end
				local rootPart = character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
				if not rootPart then
					return
				end
				local Camera = workspace.CurrentCamera
				local feetY = rootPart.Position.Y - (-672 + 675)
				local center = Vector3.new(rootPart.Position.X, feetY, rootPart.Position.Z)
				if FAState.ShowRadius then
					local angleStep = (bit32.bxor(bit32.bxor(2, 1515870810), 1515870810) * math.pi) / FA_CIRCLE_SEGMENTS
					local prevScreen = nil
					local prevOnScreen = (1 == 0)
					for i = 1, FA_CIRCLE_SEGMENTS do
						local angle = angleStep * i
						local worldPoint = center + Vector3.new(math.cos(angle) * FAState.Radius, 0, math.sin(angle) * FAState.Radius)
						local screenPos, onScreen = Camera:WorldToViewportPoint(worldPoint)
						local curScreen = Vector2.new(screenPos.X, screenPos.Y)
						if i > 1 then
							if onScreen and prevOnScreen then
								FARadiusLines[i - 1].From = prevScreen
								FARadiusLines[i - 1].To = curScreen
								FARadiusLines[i - 1].Visible = (not not true)
							else
								FARadiusLines[i - 1].Visible = (not true)
							end
						end
						if i == FA_CIRCLE_SEGMENTS then
							local firstWorld = center + Vector3.new(math.cos(angleStep) * FAState.Radius, 0, math.sin(angleStep) * FAState.Radius)
							local firstPos, firstOn = Camera:WorldToViewportPoint(firstWorld)
							if onScreen and firstOn then
								FARadiusLines[FA_CIRCLE_SEGMENTS].From = curScreen
								FARadiusLines[FA_CIRCLE_SEGMENTS].To = Vector2.new(firstPos.X, firstPos.Y)
								FARadiusLines[FA_CIRCLE_SEGMENTS].Visible = (1 == 1)
							else
								FARadiusLines[FA_CIRCLE_SEGMENTS].Visible = (1 == 0)
							end
						end
						prevScreen = curScreen
						prevOnScreen = onScreen
					end
				else
					for _, line in FARadiusLines do
						line.Visible = (1 == 0)
					end
				end
				local entities = PLTargeting.allPositions({
					Origin = rootPart.Position,
					Range = FAState.Radius,
					Bone = "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
					AttackCheck = (not false),
					Wallcheck = (not true),
					Filters = {
						Teams = FAState.Teams,
						InmateTypes = FAState.InmateTypes,
						FriendCheck = FAState.FriendCheck,
						Whitelist = FAState.Whitelist,
					},
				})
				local closestPlayer = entities[1] and entities[1].Player or nil
				if closestPlayer then
					local targetRoot = closestPlayer.Character and closestPlayer.Character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
					if targetRoot then
						pcall(function()
							MeleeRemote:FireServer(closestPlayer, 1, 1)
						end)
						if FAState.ShowTarget then
							local targetFeetY = targetRoot.Position.Y - bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)
							local fromWorld = Vector3.new(rootPart.Position.X, feetY, rootPart.Position.Z)
							local toWorld = Vector3.new(targetRoot.Position.X, targetFeetY, targetRoot.Position.Z)
							local fromPos, fromOn = Camera:WorldToViewportPoint(fromWorld)
							local toPos, toOn = Camera:WorldToViewportPoint(toWorld)
							if fromOn and toOn then
								FATargetLine.From = Vector2.new(fromPos.X, fromPos.Y)
								FATargetLine.To = Vector2.new(toPos.X, toPos.Y)
								FATargetLine.Visible = (not not true)
							else
								FATargetLine.Visible = (not true)
							end
						else
							FATargetLine.Visible = (not true)
						end
					end
				else
					FATargetLine.Visible = (1 == 0)
				end
			end)
		end
	end
	do
		if 5 ~= 5 then
			local _dc15600 = "dc461"
			local _dc53607 = 507
			local _dc56330 = "dc887"
		end
		local AntiRiotShield = MiscPage:Section({
			Name = "\65\110\116\105\32\82\105\111\116\32\83\104\105\101\108\100",
			Side = 1,
		})
		do
			if 5 ~= 5 then
				local _dc157 = "dc934"
				local _dc7537 = "dc493"
			end
			local Enabled = AntiRiotShield:Toggle({
				Name = "\69\110\97\98\108\101\100",
				ToolTip = {
					Name = "\65\110\116\105\32\82\105\111\116\32\83\104\105\101\108\100",
					Description = "\83\101\116\115\32\82\105\111\116\83\104\105\101\108\100\80\97\114\116\32\67\97\110\81\117\101\114\121\32\102\97\108\115\101\32\115\111\32\98\117\108\108\101\116\115\32\112\97\115\115\32\116\104\114\111\117\103\104",
				},
				Flag = "\65\110\116\105\82\105\111\116\83\104\105\101\108\100\69\110\97\98\108\101\100",
				Default = (not true),
			})
			do
				local shieldModified = {}
				NewRender(function()
					if Enabled:Get() ~= (not false) then
						for shield, orig in pairs(shieldModified) do
							if shield.Parent then
								shield.CanQuery = orig
							end
						end
						table.clear(shieldModified)
						return
					end
					for _, player in pairs(PlayersService:GetPlayers()) do
						local character = player.Character
						if not character then
							continue
						end
						local shield = character:FindFirstChild("\82\105\111\116\83\104\105\101\108\100\80\97\114\116")
						if shield and shield:IsA("\66\97\115\101\80\97\114\116") then
							if not shieldModified[shield] then
								shieldModified[shield] = shield.CanQuery
							end
							shield.CanQuery = (not not false)
						end
					end
				end)
				RegisterCleanup(function()
					for shield, orig in pairs(shieldModified) do
						if shield.Parent then
							shield.CanQuery = orig
						end
					end
				end)
			end
		end
	end
	do
		local AntiKillPlaneSection = WorldPage:Section({
			Name = "\65\110\116\105\32\75\105\108\108\32\80\108\97\110\101",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		local killPlaneParts = {}
		AntiKillPlaneSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\65\110\116\105\75\105\108\108\80\108\97\110\101\69\110\97\98\108\101\100",
			Default = (not not false),
			Callback = function(v)
				if v then
					for x = -2048, 2048, 2048 do
						for z = -2048, 2048, 2048 do
							local part = Instance.new("\80\97\114\116")
							part.CanQuery = (1 == 0)
							part.CanCollide = (1 == 1)
							part.Anchored = (not false)
							part.Transparency = 1
							part.Size = Vector3.new((1584 + 464), bit32.bxor(bit32.bxor(10, 1515870810), 1515870810), (2963 - 915))
							part.Position = Vector3.new(x, (777 - 607), z)
							part.Parent = workspace
							table.insert(killPlaneParts, part)
						end
					end
				else
					for _, part in killPlaneParts do
						pcall(part.Destroy, part)
					end
					table.clear(killPlaneParts)
				end
			end,
		})
		RegisterCleanup(function()
			for _, part in killPlaneParts do
				pcall(part.Destroy, part)
			end
			table.clear(killPlaneParts)
		end)
	end
	do
		if 5 ~= 5 then
			local _dc28617 = 408
		end
		local AutoResetSection = MiscPage:Section({
			Name = "\65\117\116\111\32\82\101\115\101\116",
			Side = (-654 + 656),
		})
		local criminalsTeam = Teams:FindFirstChild("\67\114\105\109\105\110\97\108\115")
		local autoResetConn
		AutoResetSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			Flag = "\65\117\116\111\82\101\115\101\116\69\110\97\98\108\101\100",
			Default = (1 == 0),
			Callback = function(v)
				if autoResetConn then
					autoResetConn:Disconnect()
					autoResetConn = nil
				end
				if v then
					autoResetConn = LocalPlayer:GetPropertyChangedSignal("\84\101\97\109"):Connect(function()
						if criminalsTeam and LocalPlayer.Team == criminalsTeam and LocalPlayer.Character then
							local hum = LocalPlayer.Character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
							if hum then
								hum:ChangeState(Enum.HumanoidStateType.Dead)
							end
						end
					end)
					TrackConnection(autoResetConn)
				end
			end,
		})
	end
	do
		local RagebotSection = RagebotPage:Section({
			Name = "\82\97\103\101\98\111\116",
			Side = 1,
		})
		local RagebotConfigSection = RagebotPage:Section({
			Name = "\82\97\103\101\98\111\116\32\67\111\110\102\105\103",
			Side = (794 - 792),
		})
		local Players = game:GetService("\80\108\97\121\101\114\115")
		local LocalPlayer = Players.LocalPlayer
		local RBState = {
			Enabled = (not true),
			AutoSwitch = (1 == 1),
			AutoReload = (not false),
			TargetBone = "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
			Teams = {},
			InmateTypes = {},
			DeathCheck = (not not true),
			ForceFieldCheck = (not not true),
			FriendCheck = (not true),
			Whitelist = {},
			Blacklist = {},
		}
		local RBLastFireTick = 0
		local RBSwitchCooldown = 0
		local RBPhase = "\102\105\103\104\116"
		local RBReloadQueue = {}
		local RBReloadIndex = 0
		local RBLastReloadTick = 0
		local VIM = cloneref(game:GetService("\86\105\114\116\117\97\108\73\110\112\117\116\77\97\110\97\103\101\114"))
		local function RBGetAmmoLabel()
			if 1 == 2 then
				local _dc44929 = "dc961"
				local _dc31240 = "dc992"
			end
			local pg = LocalPlayer:FindFirstChild("\80\108\97\121\101\114\71\117\105")
			if not pg then
				return nil
			end
			local home = pg:FindFirstChild("\72\111\109\101")
			if not home then
				if 10 < 1 then
					local _dc81082 = 745
				end
				return nil
			end
			local hud = home:FindFirstChild("\104\117\100")
			if not hud then
				if 5 ~= 5 then
					local _dc77449 = 239
				end
				return nil
			end
			local brf = hud:FindFirstChild("\66\111\116\116\111\109\82\105\103\104\116\70\114\97\109\101")
			if not brf then
				return nil
			end
			local gf = brf:FindFirstChild("\71\117\110\70\114\97\109\101")
			if not gf then
				return nil
			end
			return gf:FindFirstChild("\66\117\108\108\101\116\115\76\97\98\101\108")
		end
		local function RBReadAmmo()
			local label = RBGetAmmoLabel()
			if not label then
				return nil, nil
			end
			local text = label.Text
			local current, total = text:match("\94\40\37\100\43\41\47\40\37\100\43\41")
			return tonumber(current), tonumber(total)
		end
		local function RBSendReloadKey()
			VIM:SendKeyEvent((not not true), Enum.KeyCode.R, (not true), game)
			task.delay(((0.05 * 10) / 10), function()
				VIM:SendKeyEvent((not true), Enum.KeyCode.R, (not not false), game)
			end)
		end
		local function RBIsGun(tool)
			if not tool:IsA("\84\111\111\108") then
				return (1 == 0)
			end
			local handle = tool:FindFirstChild("\72\97\110\100\108\101")
			if not handle then
				return (not not false)
			end
			return handle:FindFirstChild("\83\104\111\111\116\83\111\117\110\100") ~= nil
		end
		local function RBGetAllGuns()
			local guns = {}
			for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
				if 1 == 2 then
					local _dc14106 = 32
					local _dc14393 = "dc862"
				end
				if RBIsGun(tool) then
					table.insert(guns, tool)
				end
			end
			local char = LocalPlayer.Character
			if char then
				for _, tool in pairs(char:GetChildren()) do
					if RBIsGun(tool) then
						if 1 == 2 then
							local _dc59677 = 331
							local _dc92461 = 632
							local _dc99198 = "dc608"
						end
						table.insert(guns, tool)
					end
				end
			end
			return guns
		end
		local function RBGetEquippedGun()
			local char = LocalPlayer.Character
			if not char then
				return nil
			end
			for _, tool in pairs(char:GetChildren()) do
				if RBIsGun(tool) then
					return tool
				end
			end
			return nil
		end
		local function RBGetMuzzlePosition(tool)
			local muzzle = tool:FindFirstChild("\77\117\122\122\108\101")
			if muzzle and muzzle:IsA("\66\97\115\101\80\97\114\116") then
				return muzzle.Position
			end
			local handle = tool:FindFirstChild("\72\97\110\100\108\101")
			if handle and handle:IsA("\66\97\115\101\80\97\114\116") then
				return handle.Position
			end
			return nil
		end
		local RB_R6_BONES = {
			"\72\101\97\100",
			"\84\111\114\115\111",
			"\76\101\102\116\32\65\114\109",
			"\82\105\103\104\116\32\65\114\109",
			"\76\101\102\116\32\76\101\103",
			"\82\105\103\104\116\32\76\101\103",
			"\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
		}
		local RB_R6_BONE_ITEMS = {
			"\72\101\97\100",
			"\84\111\114\115\111",
			"\76\101\102\116\32\65\114\109",
			"\82\105\103\104\116\32\65\114\109",
			"\76\101\102\116\32\76\101\103",
			"\82\105\103\104\116\32\76\101\103",
			"\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
			"\82\97\110\100\111\109",
			"\78\101\97\114\101\115\116\32\86\105\115\105\98\108\101",
		}
		local function RBHasClearLOS(origin, targetPos, ignoreList)
			local direction = targetPos - origin
			local params = RaycastParams.new()
			params.FilterType = Enum.RaycastFilterType.Exclude
			params.FilterDescendantsInstances = ignoreList
			local result = workspace:Raycast(origin, direction, params)
			return result == nil
		end
		local function RBResolveBone(rawBone, character, localChar)
			if rawBone == "\82\97\110\100\111\109" then
				return RB_R6_BONES[math.random(1, #RB_R6_BONES)]
			end
			if rawBone == "\78\101\97\114\101\115\116\32\86\105\115\105\98\108\101" then
				if 10 < 1 then
					local _dc69276 = 105
					local _dc63315 = "dc750"
					local _dc47826 = "dc481"
				end
				local cam = workspace.CurrentCamera
				for _, name in ipairs(RB_R6_BONES) do
					local part = character:FindFirstChild(name)
					if part then
						if #cam:GetPartsObscuringTarget({
							part.Position,
						}, {
							localChar,
							character,
						}) == 0 then
							if 1 == 2 then
								local _dc82447 = 256
								local _dc42660 = "dc521"
							end
							return name
						end
					end
				end
				return "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116"
			end
			return rawBone
		end
		local function RBGetInmateStatus(character)
			local humanoid = character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
			if not humanoid then
				return "\82\101\103\117\108\97\114"
			end
			local dn = humanoid.DisplayName
			if string.sub(dn, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\148\151" then
				return "\65\114\114\101\115\116\97\98\108\101"
			elseif string.sub(dn, 1, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)) == "\240\159\146\162" then
				return "\65\103\103\114\101\115\115\105\118\101"
			end
			return "\82\101\103\117\108\97\114"
		end
		local function RBFindBestTarget(muzzlePos, gun)
			if 10 < 1 then
				local _dc31640 = 540
				local _dc2704 = 940
				local _dc94504 = 232
			end
			local localChar = LocalPlayer.Character
			if not localChar then
				return nil
			end
			local range = gun:GetAttribute("\82\97\110\103\101") or (655 + 345)
			local bestTarget = nil
			local bestDist = math.huge
			local rbMyTeam = LocalPlayer.Team and LocalPlayer.Team.Name or ""
			for _, player in pairs(Players:GetPlayers()) do
				if player == LocalPlayer then
					continue
				end
				local rbBlacklisted = RBState.Blacklist[player.Name] or AutoBlacklistSet[player.Name]
				local teamName = player.Team and player.Team.Name or ""
				if rbBlacklisted then
					if teamName == rbMyTeam and teamName ~= "\73\110\109\97\116\101\115" then
						if 5 ~= 5 then
							local _dc93660 = 526
							local _dc65251 = 516
						end
						continue
					end
				end
				local character = player.Character
				if not character then
					continue
				end
				if rbBlacklisted then
					if teamName == "\73\110\109\97\116\101\115" and RBGetInmateStatus(character) == "\82\101\103\117\108\97\114" then
						continue
					end
				end
				if not rbBlacklisted then
					if 10 < 1 then
						local _dc87769 = 363
						local _dc38629 = "dc359"
					end
					if RBState.Whitelist[player.Name] then
						if 5 ~= 5 then
							local _dc88153 = "dc85"
						end
						continue
					end
					if RBState.FriendCheck and FriendsCache[player.Name] then
						continue
					end
					if next(RBState.Teams) and not RBState.Teams[teamName] then
						continue
					end
					if teamName == "\73\110\109\97\116\101\115" and next(RBState.InmateTypes) then
						local status = RBGetInmateStatus(character)
						if not RBState.InmateTypes[status] then
							continue
						end
					end
				end
				local humanoid = character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
				if RBState.DeathCheck and (not humanoid or humanoid.Health <= 0) then
					continue
				end
				if RBState.ForceFieldCheck and character:FindFirstChild("\70\111\114\99\101\70\105\101\108\100") then
					if 5 ~= 5 then
						local _dc5370 = "dc306"
						local _dc87060 = "dc944"
					end
					continue
				end
				local bone = RBResolveBone(RBState.TargetBone, character, localChar)
				local targetPart = character:FindFirstChild(bone) or character:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
				if not targetPart then
					continue
				end
				local dist = (muzzlePos - targetPart.Position).Magnitude
				if dist > range then
					continue
				end
				local clear = RBHasClearLOS(muzzlePos, targetPart.Position, {
					localChar,
					character,
				})
				if clear and dist < bestDist then
					bestDist = dist
					bestTarget = targetPart
				end
			end
			return bestTarget
		end
		RagebotSection:Toggle({
			Name = "\69\110\97\98\108\101\100",
			ToolTip = {
				Name = "\82\97\103\101\98\111\116",
				Description = "\70\117\108\108\121\32\97\117\116\111\109\97\116\101\100\32\99\111\109\98\97\116\32\20\32\97\99\113\117\105\114\101\115\32\116\97\114\103\101\116\115\44\32\97\105\109\115\44\32\97\110\100\32\102\105\114\101\115\32\119\105\116\104\32\110\111\32\105\110\112\117\116\32\110\101\101\100\101\100",
			},
			Flag = "\82\97\103\101\98\111\116\69\110\97\98\108\101\100",
			Default = (not not false),
			Callback = function(v)
				RBState.Enabled = v
				if not v then
					RagebotForcedTarget = nil
				end
			end,
		})
		RagebotSection:Toggle({
			Name = "\65\117\116\111\32\83\119\105\116\99\104",
			ToolTip = {
				Name = "\65\117\116\111\32\83\119\105\116\99\104",
				Description = "\65\117\116\111\109\97\116\105\99\97\108\108\121\32\115\119\105\116\99\104\101\115\32\116\111\32\97\110\111\116\104\101\114\32\103\117\110\32\119\104\101\110\32\116\104\101\32\99\117\114\114\101\110\116\32\111\110\101\32\105\115\32\101\109\112\116\121",
			},
			Flag = "\82\97\103\101\98\111\116\65\117\116\111\83\119\105\116\99\104",
			Default = (1 == 1),
			Callback = function(v)
				RBState.AutoSwitch = v
			end,
		})
		RagebotSection:Toggle({
			Name = "\65\117\116\111\32\82\101\108\111\97\100",
			ToolTip = {
				Name = "\65\117\116\111\32\82\101\108\111\97\100",
				Description = "\65\117\116\111\109\97\116\105\99\97\108\108\121\32\114\101\108\111\97\100\115\32\116\104\101\32\99\117\114\114\101\110\116\32\103\117\110\32\119\104\101\110\32\116\104\101\32\109\97\103\97\122\105\110\101\32\105\115\32\101\109\112\116\121",
			},
			Flag = "\82\97\103\101\98\111\116\65\117\116\111\82\101\108\111\97\100",
			Default = (not not true),
			Callback = function(v)
				RBState.AutoReload = v
			end,
		})
		RagebotSection:Dropdown({
			Name = "\84\97\114\103\101\116\32\66\111\110\101",
			Flag = "\82\97\103\101\98\111\116\84\97\114\103\101\116\66\111\110\101",
			Default = "\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116",
			Multi = (not true),
			Items = RB_R6_BONE_ITEMS,
			Callback = function(v)
				RBState.TargetBone = v
			end,
		})
		RagebotConfigSection:Dropdown({
			Name = "\84\101\97\109\115",
			Flag = "\82\97\103\101\98\111\116\84\101\97\109\115",
			Multi = (not false),
			Items = {
				"\71\117\97\114\100\115",
				"\73\110\109\97\116\101\115",
				"\67\114\105\109\105\110\97\108\115",
			},
			Callback = function(v)
				local set = {}
				for _, name in pairs(v) do
					set[name] = (1 == 1)
				end
				RBState.Teams = set
			end,
		})
		RagebotConfigSection:Dropdown({
			Name = "\73\110\109\97\116\101\32\84\121\112\101\115",
			Flag = "\82\97\103\101\98\111\116\73\110\109\97\116\101\84\121\112\101\115",
			Multi = (1 == 1),
			Items = {
				"\82\101\103\117\108\97\114",
				"\65\103\103\114\101\115\115\105\118\101",
				"\65\114\114\101\115\116\97\98\108\101",
			},
			Callback = function(v)
				local set = {}
				for _, name in pairs(v) do
					set[name] = (not false)
				end
				RBState.InmateTypes = set
			end,
		})
		RagebotConfigSection:Toggle({
			Name = "\68\101\97\116\104\32\67\104\101\99\107",
			ToolTip = {
				Name = "\68\101\97\116\104\32\67\104\101\99\107",
				Description = "\83\107\105\112\115\32\100\101\97\100\32\112\108\97\121\101\114\115\32\115\111\32\116\104\101\32\114\97\103\101\98\111\116\32\100\111\101\115\110\39\116\32\119\97\115\116\101\32\97\109\109\111\32\111\110\32\99\111\114\112\115\101\115",
			},
			Flag = "\82\97\103\101\98\111\116\68\101\97\116\104\67\104\101\99\107",
			Default = (1 == 1),
			Callback = function(v)
				RBState.DeathCheck = v
			end,
		})
		RagebotConfigSection:Toggle({
			Name = "\70\111\114\99\101\70\105\101\108\100\32\67\104\101\99\107",
			ToolTip = {
				Name = "\70\111\114\99\101\70\105\101\108\100\32\67\104\101\99\107",
				Description = "\83\107\105\112\115\32\116\97\114\103\101\116\115\32\119\105\116\104\32\97\110\32\97\99\116\105\118\101\32\115\112\97\119\110\32\70\111\114\99\101\70\105\101\108\100",
			},
			Flag = "\82\97\103\101\98\111\116\70\111\114\99\101\70\105\101\108\100\67\104\101\99\107",
			Default = (not false),
			Callback = function(v)
				RBState.ForceFieldCheck = v
			end,
		})
		RagebotConfigSection:Toggle({
			Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
			ToolTip = {
				Name = "\70\114\105\101\110\100\32\67\104\101\99\107",
				Description = "\87\111\110\39\116\32\116\97\114\103\101\116\32\112\108\97\121\101\114\115\32\111\110\32\121\111\117\114\32\82\111\98\108\111\120\32\102\114\105\101\110\100\115\32\108\105\115\116",
			},
			Flag = "\82\97\103\101\98\111\116\70\114\105\101\110\100\67\104\101\99\107",
			Default = (1 == 0),
			Callback = function(v)
				RBState.FriendCheck = v
			end,
		})
		local rbPlayerNames = {}
		for _, p in pairs(Players:GetPlayers()) do
			if 10 < 1 then
				local _dc6450 = "dc214"
				local _dc55543 = 57
			end
			if p ~= LocalPlayer then
				table.insert(rbPlayerNames, p.Name)
			end
		end
		local RBWhitelistDropdown = RagebotConfigSection:Dropdown({
			Name = "\87\104\105\116\101\108\105\115\116",
			Flag = "\82\97\103\101\98\111\116\87\104\105\116\101\108\105\115\116",
			Multi = (not not true),
			Items = rbPlayerNames,
			Callback = function(v)
				local set = {}
				for _, name in pairs(v) do
					set[name] = (not not true)
				end
				RBState.Whitelist = set
			end,
		})
		local RBBlacklistDropdown = RagebotConfigSection:Dropdown({
			Name = "\66\108\97\99\107\108\105\115\116",
			ToolTip = {
				Name = "\66\108\97\99\107\108\105\115\116",
				Description = "\65\108\119\97\121\115\32\116\97\114\103\101\116\32\116\104\101\115\101\32\112\108\97\121\101\114\115\32\114\101\103\97\114\100\108\101\115\115\32\111\102\32\116\101\97\109\44\32\105\110\109\97\116\101\32\115\116\97\116\117\115\44\32\111\114\32\111\116\104\101\114\32\102\105\108\116\101\114\115",
			},
			Flag = "\82\97\103\101\98\111\116\66\108\97\99\107\108\105\115\116",
			Multi = (1 == 1),
			Items = rbPlayerNames,
			Callback = function(v)
				local set = {}
				for _, name in pairs(v) do
					set[name] = (not not true)
				end
				RBState.Blacklist = set
			end,
		})
		TrackConnection(Players.PlayerAdded:Connect(function(p)
			RBWhitelistDropdown:Add(p.Name)
			RBBlacklistDropdown:Add(p.Name)
		end))
		TrackConnection(Players.PlayerRemoving:Connect(function(p)
			RBWhitelistDropdown:Remove(p.Name)
			RBBlacklistDropdown:Remove(p.Name)
		end))
		NewRender(function()
			if not RBState.Enabled then
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
				RBPhase = "\102\105\103\104\116"
				return
			end
			local character = LocalPlayer.Character
			if not character then
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
				return
			end
			local humanoid = character:FindFirstChildOfClass("\72\117\109\97\110\111\105\100")
			if not humanoid or humanoid.Health <= 0 then
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
				return
			end
			local now = tick()
			local currentAmmo, totalAmmo = RBReadAmmo()
			if RBPhase == "\114\101\108\111\97\100" then
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
				if RBReloadIndex > #RBReloadQueue then
					RBPhase = "\102\105\103\104\116"
					RBReloadQueue = {}
					RBReloadIndex = 0
					return
				end
				local gun = RBReloadQueue[RBReloadIndex]
				if not gun or not gun.Parent then
					RBReloadIndex = RBReloadIndex + 1
					return
				end
				local equipped = RBGetEquippedGun()
				if equipped ~= gun then
					if (now - RBSwitchCooldown) > ((0.3 * 10) / 10) then
						humanoid:EquipTool(gun)
						RBSwitchCooldown = now
					end
					return
				end
				if currentAmmo and currentAmmo > 0 then
					RBReloadIndex = RBReloadIndex + 1
					return
				end
				if (now - RBLastReloadTick) > (811 - 809) then
					RBSendReloadKey()
					RBLastReloadTick = now
					return
				end
				return
			end
			local equippedGun = RBGetEquippedGun()
			local magEmpty = not currentAmmo or currentAmmo == 0
			if not equippedGun or magEmpty then
				if equippedGun and magEmpty and RBState.AutoSwitch then
					local allGuns = RBGetAllGuns()
					for _, gun in pairs(allGuns) do
						if gun ~= equippedGun and gun.Parent == LocalPlayer.Backpack then
							if (now - RBSwitchCooldown) > ((0.3 * 2) / 2) then
								humanoid:EquipTool(gun)
								RBSwitchCooldown = now
							end
							RagebotForcedTarget = nil
							RagebotMuzzleOrigin = nil
							return
						end
					end
				end
				if RBState.AutoReload and magEmpty then
					RBReloadQueue = RBGetAllGuns()
					if #RBReloadQueue > 0 then
						RBPhase = "\114\101\108\111\97\100"
						RBReloadIndex = 1
						RBLastReloadTick = 0
					end
				end
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
				return
			end
			if (now - RBLastFireTick) < ((0.08 * 5) / 5) then
				return
			end
			local muzzlePos = RBGetMuzzlePosition(equippedGun)
			if not muzzlePos then
				return
			end
			local target = RBFindBestTarget(muzzlePos, equippedGun)
			if target then
				RagebotForcedTarget = target
				RagebotMuzzleOrigin = muzzlePos
				RBLastFireTick = now
				mouse1click()
			else
				RagebotForcedTarget = nil
				RagebotMuzzleOrigin = nil
			end
		end)
	end
	do
		if 10 < 1 then
			local _dc77361 = "dc440"
		end
		local PlayersState = {
			SelectedPlayer = "",
			TeleportCooldown = (not true),
		}
		local PlayersSection = PlayersPage:Section({
			Name = "\80\108\97\121\101\114\115",
			Side = 1,
		})
		do
			local SelectedPlayer = PlayersSection:Dropdown({
				Name = "\83\101\108\101\99\116\101\100\32\80\108\97\121\101\114",
				Flag = "\80\108\97\121\101\114\115\83\101\108\101\99\116\101\100\80\108\97\121\101\114",
				Multi = (not true),
				Callback = function(callback)
					PlayersState.SelectedPlayer = callback
				end,
			})
			do
				for _, player in pairs(game.Players:GetPlayers()) do
					if 10 < 1 then
						local _dc71280 = 501
						local _dc76901 = "dc380"
						local _dc71058 = 844
					end
					if player.Name ~= game.Players.LocalPlayer.Name then
						SelectedPlayer:Add(player.Name)
					end
				end
				TrackConnection(game.Players.PlayerAdded:Connect(function(player)
					SelectedPlayer:Add(player.Name)
				end))
				TrackConnection(game.Players.PlayerRemoving:Connect(function(player)
					SelectedPlayer:Remove(player.Name)
				end))
			end
		end
		local ActionsSection = PlayersPage:Section({
			Name = "\65\99\116\105\111\110\115",
			Side = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		})
		do
			ActionsSection:Button():Add("\84\101\108\101\112\111\114\116", function()
				if PlayersState.TeleportCooldown == (not not false) then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayersState.SelectedPlayer].Character.HumanoidRootPart.CFrame
					Library:Notification("\84\101\108\101\112\111\114\116", "\89\111\117\32\97\114\101\32\97\98\108\101\32\116\111\32\116\101\108\101\112\111\114\116\32\97\103\97\105\110\32\105\110\32\49\53\32\115\101\99\111\110\100\115\44\32\116\104\101\32\119\97\105\116\32\105\115\32\100\117\101\32\116\111\32\116\104\101\32\97\110\116\105\99\104\101\97\116\32\102\108\97\103\103\105\110\103\32\105\102\32\121\111\117\32\116\101\108\101\112\111\114\116\32\116\111\111\32\111\102\116\101\110\46", bit32.bxor(bit32.bxor(15, 1515870810), 1515870810))
					PlayersState.TeleportCooldown = (not false)
					task.delay(bit32.bxor(bit32.bxor(15, 1515870810), 1515870810), function()
						PlayersState.TeleportCooldown = (not not false)
					end)
				end
			end)
		end
	end
	local OriginalUnload = Library.Unload
	Library.Unload = function(self)
		if not ScriptAlive then
			return OriginalUnload(self)
		end
		ScriptAlive = (not not false)
		RagebotForcedTarget = nil
		RagebotMuzzleOrigin = nil
		PingWarningEnabled = (not true)
		KillfeedNotificationsEnabled = (1 == 0)
		ItemESPState.Enabled = (not not false)
		StopAllRenderers()
		for i = #CleanupCallbacks, 1, -1 do
			pcall(CleanupCallbacks[i])
		end
		table.clear(CleanupCallbacks)
		for _, conn in TrackedConnections do
			pcall(function()
				conn:Disconnect()
			end)
		end
		table.clear(TrackedConnections)
		for _, drawing in TrackedDrawings do
			pcall(function()
				if drawing.Remove then
					drawing:Remove()
				elseif drawing.Destroy then
					drawing:Destroy()
				end
			end)
		end
		table.clear(TrackedDrawings)
		pcall(function()
			if ItemESPChamsFolder and ItemESPChamsFolder.Parent then
				ItemESPChamsFolder:Destroy()
			end
		end)
		pcall(function()
			local lp = game:GetService("\80\108\97\121\101\114\115").LocalPlayer
			local char = lp and lp.Character
			if not char then
				return
			end
			for _, v in char:GetDescendants() do
				if v:IsA("\66\97\115\101\80\97\114\116") or v:IsA("\84\101\120\116\117\114\101") or v:IsA("\68\101\99\97\108") then
					v.LocalTransparencyModifier = 0
				end
			end
			local cam = workspace.CurrentCamera
			if cam then
				for _, child in cam:GetChildren() do
					if child:IsA("\84\111\111\108") then
						child:Destroy()
					end
				end
			end
		end)
		OriginalUnload(self)
	end
end
