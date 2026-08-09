local LoadTick = os.clock()
local a
do
	local b = game:GetService("\87\111\114\107\115\112\97\99\101")
	local c = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
	local d = game:GetService("\80\108\97\121\101\114\115")
	local e = game:GetService("\72\116\116\112\83\101\114\118\105\99\101")
	local f = game:GetService("\82\117\110\83\101\114\118\105\99\101")
	local g = cloneref and cloneref(game:GetService("\67\111\114\101\71\117\105")) or game:GetService("\67\111\114\101\71\117\105")
	local h = game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")
	gethui = gethui or function()
		return g
	end
	local i = d.LocalPlayer
	local j = b.CurrentCamera
	local k = i:GetMouse()
	local l = Color3.fromRGB
	local m = Color3.fromHSV
	local n = Color3.fromHex
	local o = ColorSequence.new
	local p = ColorSequenceKeypoint.new
	local q = NumberSequence.new
	local r = NumberSequenceKeypoint.new
	local s = UDim2.new
	local t = UDim.new
	local u = Vector2.new
	local v = math.clamp
	local w = math.floor
	local x = math.abs
	local y = math.sin
	local z = table.insert
	local aa = table.find
	local ab = table.remove
	local ac = table.concat
	local ad = table.clone
	local ae = table.unpack
	local af = string.format
	local ag = string.find
	local ah = string.gsub
	local ai = string.lower
	local aj = string.len
	local ak = Instance.new
	local RectNew = Rect.new
	a = {
		Theme = {},
		MenuKeybind = tostring(Enum.KeyCode.RightControl),
		Flags = {},
		Tween = {
			Time = ((0.2 * 2) / 2),
			Style = Enum.EasingStyle.Quad,
			Direction = Enum.EasingDirection.Out,
		},
		FadeSpeed = ((0.2 * 2) / 2),
		Folders = {
			Directory = "\115\99\111\111\116",
			Configs = "\115\99\111\111\116\47\67\111\110\102\105\103\115",
			Assets = "\115\99\111\111\116\47\65\115\115\101\116\115",
		},
		Images = {
			["\83\97\116\117\114\97\116\105\111\110"] = {
				"\83\97\116\117\114\97\116\105\111\110\46\112\110\103",
				"\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\98\108\111\98\47\109\97\105\110\47\108\105\98\114\97\114\121\47\105\109\97\103\101\115\47\115\97\116\117\114\97\116\105\111\110\46\112\110\103\63\114\97\119\61\116\114\117\101",
			},
			["\86\97\108\117\101"] = {
				"\86\97\108\117\101\46\112\110\103",
				"\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\98\108\111\98\47\109\97\105\110\47\108\105\98\114\97\114\121\47\105\109\97\103\101\115\47\118\97\108\117\101\46\112\110\103\63\114\97\119\61\116\114\117\101",
			},
			["\72\117\101"] = {
				"\72\117\101\46\112\110\103",
				"\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\98\108\111\98\47\109\97\105\110\47\108\105\98\114\97\114\121\47\105\109\97\103\101\115\47\104\111\114\105\122\111\110\116\97\108\104\117\101\46\112\110\103\63\114\97\119\61\116\114\117\101",
			},
			["\67\104\101\99\107\101\114\115"] = {
				"\67\104\101\99\107\101\114\115\46\112\110\103",
				"\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\98\108\111\98\47\109\97\105\110\47\108\105\98\114\97\114\121\47\105\109\97\103\101\115\47\99\104\101\99\107\101\114\115\46\112\110\103\63\114\97\119\61\116\114\117\101",
			},
		},
		Pages = {},
		Sections = {},
		Connections = {},
		Threads = {},
		ThemeMap = {},
		ThemeItems = {},
		CopiedColor = nil,
		OpenFrames = {},
		CurrentPage = nil,
		SearchItems = {},
		SetFlags = {},
		UnnamedConnections = 0,
		UnnamedFlags = 0,
		Holder = nil,
		NotifHolder = nil,
		UnusedHolder = nil,
		Font = nil,
		KeyList = nil,
		Colorpickers = {},
	}
	a.__index = a
	a.Sections.__index = a.Sections
	a.Pages.__index = a.Pages
	local al = {
		["\85\110\107\110\111\119\110"] = "\85\110\107\110\111\119\110",
		["\66\97\99\107\115\112\97\99\101"] = "\66\97\99\107",
		["\84\97\98"] = "\84\97\98",
		["\67\108\101\97\114"] = "\67\108\101\97\114",
		["\82\101\116\117\114\110"] = "\82\101\116\117\114\110",
		["\80\97\117\115\101"] = "\80\97\117\115\101",
		["\69\115\99\97\112\101"] = "\69\115\99\97\112\101",
		["\83\112\97\99\101"] = "\83\112\97\99\101",
		["\81\117\111\116\101\100\68\111\117\98\108\101"] = "\"",
		["\72\97\115\104"] = "#",
		["\68\111\108\108\97\114"] = "$",
		["\80\101\114\99\101\110\116"] = "%",
		["\65\109\112\101\114\115\97\110\100"] = "&",
		["\81\117\111\116\101"] = "'",
		["\76\101\102\116\80\97\114\101\110\116\104\101\115\105\115"] = "(",
		["\82\105\103\104\116\80\97\114\101\110\116\104\101\115\105\115"] = "\32\41",
		["\65\115\116\101\114\105\115\107"] = "*",
		["\80\108\117\115"] = "+",
		["\67\111\109\109\97"] = ",",
		["\77\105\110\117\115"] = "-",
		["\80\101\114\105\111\100"] = ".",
		["\83\108\97\115\104"] = "`",
		["\84\104\114\101\101"] = "3",
		["\83\101\118\101\110"] = "7",
		["\69\105\103\104\116"] = "8",
		["\67\111\108\111\110"] = ":",
		["\83\101\109\105\99\111\108\111\110"] = ";",
		["\76\101\115\115\84\104\97\110"] = "<",
		["\71\114\101\97\116\101\114\84\104\97\110"] = ">",
		["\81\117\101\115\116\105\111\110"] = "?",
		["\69\113\117\97\108\115"] = "=",
		["\65\116"] = "@",
		["\76\101\102\116\66\114\97\99\107\101\116"] = "\76\101\102\116\66\114\97\99\107\101\116",
		["\82\105\103\104\116\66\114\97\99\107\101\116"] = "\82\105\103\104\116\66\114\97\99\107\101\100",
		["\66\97\99\107\83\108\97\115\104"] = "\66\97\99\107\83\108\97\115\104",
		["\67\97\114\101\116"] = "^",
		["\85\110\100\101\114\115\99\111\114\101"] = "_",
		["\66\97\99\107\113\117\111\116\101"] = "`",
		["\76\101\102\116\67\117\114\108\121"] = "{",
		["\80\105\112\101"] = "|",
		["\82\105\103\104\116\67\117\114\108\121"] = "}",
		["\84\105\108\100\101"] = "~",
		["\68\101\108\101\116\101"] = "\68\101\108\101\116\101",
		["\69\110\100"] = "\69\110\100",
		["\75\101\121\112\97\100\90\101\114\111"] = "\75\101\121\112\97\100\48",
		["\75\101\121\112\97\100\79\110\101"] = "\75\101\121\112\97\100\49",
		["\75\101\121\112\97\100\84\119\111"] = "\75\101\121\112\97\100\50",
		["\75\101\121\112\97\100\84\104\114\101\101"] = "\75\101\121\112\97\100\51",
		["\75\101\121\112\97\100\70\111\117\114"] = "\75\101\121\112\97\100\52",
		["\75\101\121\112\97\100\70\105\118\101"] = "\75\101\121\112\97\100\53",
		["\75\101\121\112\97\100\83\105\120"] = "\75\101\121\112\97\100\54",
		["\75\101\121\112\97\100\83\101\118\101\110"] = "\75\101\121\112\97\100\55",
		["\75\101\121\112\97\100\69\105\103\104\116"] = "\75\101\121\112\97\100\56",
		["\75\101\121\112\97\100\78\105\110\101"] = "\75\101\121\112\97\100\57",
		["\75\101\121\112\97\100\80\101\114\105\111\100"] = "\75\101\121\112\97\100\80",
		["\75\101\121\112\97\100\68\105\118\105\100\101"] = "\75\101\121\112\97\100\68",
		["\75\101\121\112\97\100\77\117\108\116\105\112\108\121"] = "\75\101\121\112\97\100\77",
		["\75\101\121\112\97\100\77\105\110\117\115"] = "\75\101\121\112\97\100\77",
		["\75\101\121\112\97\100\80\108\117\115"] = "\75\101\121\112\97\100\80",
		["\75\101\121\112\97\100\69\110\116\101\114"] = "\75\101\121\112\97\100\69",
		["\75\101\121\112\97\100\69\113\117\97\108\115"] = "\75\101\121\112\97\100\69",
		["\73\110\115\101\114\116"] = "\73\110\115\101\114\116",
		["\72\111\109\101"] = "\72\111\109\101",
		["\80\97\103\101\85\112"] = "\80\97\103\101\85\112",
		["\80\97\103\101\68\111\119\110"] = "\80\97\103\101\68\111\119\110",
		["\82\105\103\104\116\83\104\105\102\116"] = "\82\105\103\104\116\83\104\105\102\116",
		["\76\101\102\116\83\104\105\102\116"] = "\76\101\102\116\83\104\105\102\116",
		["\82\105\103\104\116\67\111\110\116\114\111\108"] = "\82\105\103\104\116\67\111\110\116\114\111\108",
		["\76\101\102\116\67\111\110\116\114\111\108"] = "\76\101\102\116\67\111\110\116\114\111\108",
		["\76\101\102\116\65\108\116"] = "\76\101\102\116\65\108\116",
		["\82\105\103\104\116\65\108\116"] = "\82\105\103\104\116\65\108\116",
	}
	local am = {
		"[",
		"]",
		"(",
		")",
		"{",
		"}",
		"!",
		"@",
		"#",
		"$",
		"%",
		"^",
		"&",
		"*",
		"+",
		"=",
	}
	local an = {
		["\80\114\101\115\101\116"] = {
			["\66\97\99\107\103\114\111\117\110\100"] = l((560 - 546), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), (-567 + 582)),
			["\66\111\114\100\101\114"] = l((-892 + 904), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
			["\73\110\108\105\110\101"] = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
			["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"] = l((279 - 242), (130 - 88), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
			["\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100"] = l(bit32.bxor(bit32.bxor(25, 1515870810), 1515870810), (-327 + 357), bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
			["\79\117\116\108\105\110\101"] = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (-81 + 130), (-304 + 349)),
			["\69\108\101\109\101\110\116"] = l((369 - 339), (514 - 478), bit32.bxor(bit32.bxor(31, 1515870810), 1515870810)),
			["\71\114\97\100\105\101\110\116"] = l(bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810)),
			["\84\101\120\116"] = l((-167 + 402), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (624 - 389)),
			["\84\101\120\116\32\83\116\114\111\107\101"] = l(0, 0, 0),
			["\80\108\97\99\101\104\111\108\100\101\114\32\84\101\120\116"] = l((-305 + 490), (16 + 169), bit32.bxor(bit32.bxor(185, 1515870810), 1515870810)),
			["\65\99\99\101\110\116"] = l((356 - 226), bit32.bxor(bit32.bxor(174, 1515870810), 1515870810), (-726 + 869)),
		},
	}
	a.Theme = ad(an["\80\114\101\115\101\116"])
	for Index, Value in a.Folders do
		if not isfolder(Value) then
			if 1 == 2 then
				local _dc14620 = 545
			end
			makefolder(Value)
		end
	end
	for Index, Value in a.Images do
		local ao = Value
		local ap = ao[1]
		local aq = ao[(728 - 726)]
		if not isfile(a.Folders.Assets .. "/" .. ap) then
			writefile(a.Folders.Assets .. "/" .. ap, game:HttpGet(aq))
		end
	end
	local ar = {}
	do
		ar.__index = ar
		ar.Create = function(self, as, at, au, av)
			if not a then
				return
			end
			as = av and as or as.Instance
			at = at or TweenInfo.new(a.Tween.Time, a.Tween.Style, a.Tween.Direction)
			local aw = {
				Tween = h:Create(as, at, au),
				Info = at,
				Goal = au,
				Item = as,
			}
			aw.Tween:Play()
			setmetatable(aw, ar)
			return aw
		end
		ar.GetProperty = function(ax, ay)
			ay = ay or ax.Item
			if ay:IsA("\70\114\97\109\101") then
				return {
					"\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			elseif ay:IsA("\84\101\120\116\76\97\98\101\108") or ay:IsA("\84\101\120\116\66\117\116\116\111\110") then
				return {
					"\84\101\120\116\84\114\97\110\115\112\97\114\101\110\99\121",
					"\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			elseif ay:IsA("\73\109\97\103\101\76\97\98\101\108") or ay:IsA("\73\109\97\103\101\66\117\116\116\111\110") then
				return {
					"\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121",
					"\73\109\97\103\101\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			elseif ay:IsA("\83\99\114\111\108\108\105\110\103\70\114\97\109\101") then
				return {
					"\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121",
					"\83\99\114\111\108\108\66\97\114\73\109\97\103\101\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			elseif ay:IsA("\84\101\120\116\66\111\120") then
				return {
					"\84\101\120\116\84\114\97\110\115\112\97\114\101\110\99\121",
					"\66\97\99\107\103\114\111\117\110\100\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			elseif ay:IsA("\85\73\83\116\114\111\107\101") then
				return {
					"\84\114\97\110\115\112\97\114\101\110\99\121",
				}
			end
		end
		ar.FadeItem = function(az, ba, bb, bc, bd)
			local be = ba or az.Item
			local bf = be[bb]
			be[bb] = bc and 1 or bf
			local bg = ar:Create(be, TweenInfo.new(bd or a.Tween.Time, a.Tween.Style, a.Tween.Direction), {
				[bb] = bc and bf or 1,
			}, (not not true))
			a:Connect(bg.Tween.Completed, function()
				if not bc then
					task.wait()
					be[bb] = bf
				end
			end)
			return bg
		end
		ar.Get = function(bh)
			if not bh.Tween then
				return
			end
			return bh.Tween, bh.Info, bh.Goal
		end
		ar.Pause = function(bi)
			if not bi.Tween then
				return
			end
			bi.Tween:Pause()
		end
		ar.Play = function(bj)
			if not bj.Tween then
				return
			end
			bj.Tween:Play()
		end
		ar.Clean = function(bk)
			if not bk.Tween then
				return
			end
			ar:Pause()
			bk = nil
		end
	end
	local bl = {}
	do
		if 1 == 2 then
			local _dc40820 = "dc659"
			local _dc80585 = "dc569"
			local _dc12123 = 815
		end
		bl.__index = bl
		bl.Create = function(self, bm, bn)
			local bo = {
				Instance = ak(bm),
				Properties = bn,
				Class = bm,
			}
			setmetatable(bo, bl)
			for bp, Value in bo.Properties do
				bo.Instance[bp] = Value
			end
			return bo
		end
		bl.FadeItem = function(bq, br, bs)
			local bt = bq.Instance
			if br == (1 == 1) then
				bt.Visible = (1 == 1)
			end
			local bu = bt:GetDescendants()
			z(bu, bt)
			local bv
			for Index, Value in bu do
				local bw = ar:GetProperty(Value)
				if not bw then
					continue
				end
				if type(bw) == "\116\97\98\108\101" then
					for _, bx in bw do
						bv = ar:FadeItem(Value, bx, not br, bs)
					end
				else
					bv = ar:FadeItem(Value, bw, not br, bs)
				end
			end
		end
		bl.AddToTheme = function(by, bz)
			if not by.Instance then
				return
			end
			a:AddToTheme(by, bz)
		end
		bl.ChangeItemTheme = function(ca, cb)
			if not ca.Instance or not a then
				return
			end
			a:ChangeItemTheme(ca, cb)
		end
		bl.Connect = function(cc, cd, ce, Name)
			if not cc.Instance then
				return
			end
			if not cc.Instance[cd] then
				return
			end
			return a:Connect(cc.Instance[cd], ce, Name)
		end
		bl.Tween = function(cf, cg, ch)
			if not cf.Instance then
				return
			end
			return ar:Create(cf, cg, ch)
		end
		bl.Disconnect = function(ci, Name)
			if not ci.Instance then
				return
			end
			return a:Disconnect(Name)
		end
		bl.Clean = function(cj)
			if not cj.Instance then
				return
			end
			cj.Instance:Destroy()
			cj = nil
		end
		bl.MakeDraggable = function(ck)
			if not ck.Instance then
				return
			end
			local cl = ck.Instance
			local cm = (not true)
			local cn
			local co
			local cp = function(Input)
				local cq = Input.Position - cn
				ck:Tween(TweenInfo.new(((0.16 * 2) / 2), Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(co.X.Scale, co.X.Offset + cq.X, co.Y.Scale, co.Y.Offset + cq.Y),
				})
			end
			local cr
			ck:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					cm = (not not true)
					cn = Input.Position
					co = cl.Position
					if cr then
						return
					end
					cr = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							cm = (not not false)
							cr:Disconnect()
							cr = nil
						end
					end)
				end
			end)
			a:Connect(c.InputChanged, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
					if cm then
						cp(Input)
					end
				end
			end)
			return cm
		end
		bl.MakeResizeable = function(cs, ct, cu)
			if not cs.Instance then
				return
			end
			local cv = cs.Instance
			local cw = (not true)
			local cx = s()
			local cy = s()
			local cz = cv.Parent.AbsoluteSize - cv.AbsoluteSize
			local da = bl:Create("\73\109\97\103\101\66\117\116\116\111\110", {
				Parent = cv,
				Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47",
				AnchorPoint = u(1, 1),
				BorderColor3 = l(0, 0, 0),
				Size = s(0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810), 0, (588 - 582)),
				Position = s(1, -(313 - 309), 1, -(3 + 1)),
				Name = "\0",
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ZIndex = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810),
				AutoButtonColor = (not true),
				Visible = (1 == 1),
			})
			da:AddToTheme({
				ImageColor3 = "\65\99\99\101\110\116",
			})
			local db
			da:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					cw = (1 == 1)
					cx = cv.Size - s(0, Input.Position.X, 0, Input.Position.Y)
					if db then
						return
					end
					db = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							cw = (not not false)
							db:Disconnect()
							db = nil
						end
					end)
				end
			end)
			a:Connect(c.InputChanged, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
					if cw then
						cz = cu or cv.Parent.AbsoluteSize - cv.AbsoluteSize
						cy = cx + s(0, Input.Position.X, 0, Input.Position.Y)
						cy = s(0, math.clamp(cy.X.Offset, ct.X, cz.X), 0, math.clamp(cy.Y.Offset, ct.Y, cz.Y))
						ar:Create(cv, TweenInfo.new(((0.17 * 2) / 2), Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
							Size = cy,
						}, (not not true))
					end
				end
			end)
			return cw
		end
		bl.OnHover = function(dc, dd)
			if not dc.Instance then
				return
			end
			return a:Connect(dc.Instance.MouseEnter, dd)
		end
		bl.OnHoverLeave = function(de, df)
			if not de.Instance then
				return
			end
			return a:Connect(de.Instance.MouseLeave, df)
		end
		bl.Border = function(dg, dh)
			if not dg.Instance then
				return
			end
			local di = dh == "\66\111\114\100\101\114" and a.Theme.Border or dh == "\79\117\116\108\105\110\101" and a.Theme.Outline
			local UIStroke = bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = dg.Instance,
				Color = di,
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Miter,
			})
			UIStroke:AddToTheme({
				Color = dh,
			})
			return UIStroke
		end
		bl.TextBorder = function(dj)
			if not dj.Instance then
				return
			end
			local UIStroke = bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = dj.Instance,
				Color = a.Theme["\84\101\120\116\32\83\116\114\111\107\101"],
				Thickness = 1,
				Transparency = ((0.6 * 5) / 5),
				LineJoinMode = Enum.LineJoinMode.Miter,
			})
			UIStroke:AddToTheme({
				Color = "\84\101\120\116\32\83\116\114\111\107\101",
			})
			return UIStroke
		end
		bl.Tooltip = function(dk, dl)
			if not dk.Instance then
				return
			end
			if dl.Text == nil then
				return
			end
			if type(dl.Text) ~= "\115\116\114\105\110\103" then
				return
			end
			local dm = dk.Instance
			local dn = c:GetMouseLocation()
			local dp
			local dq = {}
			do
				dq["\84\111\111\108\116\105\112"] = bl:Create("\70\114\97\109\101", {
					Parent = a.Holder.Instance,
					Name = "\0",
					Size = s(0, 0, 0, (-434 + 459)),
					Position = s(0, dm.AbsolutePosition.X, 0, dm.AbsolutePosition.Y),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (564 - 552)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					BackgroundColor3 = l((653 - 639), (-822 + 839), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				})
				dq["\84\111\111\108\116\105\112"]:AddToTheme({
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				dq["\85\73\83\116\114\111\107\101"] = bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = dq["\84\111\111\108\116\105\112"].Instance,
					Color = l(0, 0, 0),
					Thickness = 1,
					Transparency = 1,
					LineJoinMode = Enum.LineJoinMode.Miter,
				})
				dq["\85\73\83\116\114\111\107\101"]:AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = dq["\84\111\111\108\116\105\112"].Instance,
					Name = "\0",
					PaddingTop = t(0, (-667 + 672)),
					PaddingBottom = t(0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810)),
					PaddingRight = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
					PaddingLeft = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
				})
				dq["\84\105\116\108\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = dq["\84\111\111\108\116\105\112"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), (1182 - 927)),
					BorderColor3 = l(0, 0, 0),
					Text = dl.Text,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = (705 - 696),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-65 + 320)),
				})
				dq["\84\105\116\108\101"]:AddToTheme({
					TextColor3 = "\65\99\99\101\110\116",
				})
				dq["\85\73\83\116\114\111\107\101\50"] = dq["\84\105\116\108\101"]:TextBorder()
				dq["\85\73\83\116\114\111\107\101\50"].Instance.Transparency = 1
				dq["\68\101\115\99\114\105\112\116\105\111\110"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = dq["\84\111\111\108\116\105\112"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = dl.Description,
					Position = s(0, 0, 0, (-658 + 673)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					TextTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = (954 - 945),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				dq["\68\101\115\99\114\105\112\116\105\111\110"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				dq["\85\73\83\116\114\111\107\101\51"] = dq["\68\101\115\99\114\105\112\116\105\111\110"]:TextBorder()
				dq["\85\73\83\116\114\111\107\101\51"].Instance.Transparency = 1
			end
			a:Connect(dm.MouseEnter, function()
				dq["\84\111\111\108\116\105\112"].Instance.Position = s(0, dn.X + (-666 + 674), 0, dn.Y - (260 - 228))
				dq["\84\111\111\108\116\105\112"]:Tween(nil, {
					BackgroundTransparency = 0,
				})
				dq["\84\105\116\108\101"]:Tween(nil, {
					TextTransparency = 0,
				})
				dq["\68\101\115\99\114\105\112\116\105\111\110"]:Tween(nil, {
					TextTransparency = 0,
				})
				dq["\85\73\83\116\114\111\107\101"]:Tween(nil, {
					Transparency = 0,
				})
				dq["\85\73\83\116\114\111\107\101\50"]:Tween(nil, {
					Transparency = 0,
				})
				dq["\85\73\83\116\114\111\107\101\51"]:Tween(nil, {
					Transparency = 0,
				})
				dp = f.RenderStepped:Connect(function()
					dn = c:GetMouseLocation()
					dq["\84\111\111\108\116\105\112"]:Tween(nil, {
						Position = s(0, dn.X + (-74 + 82), 0, dn.Y - (873 - 838)),
					})
				end)
			end)
			a:Connect(dm.MouseLeave, function()
				dq["\84\111\111\108\116\105\112"]:Tween(nil, {
					BackgroundTransparency = 1,
				})
				dq["\84\105\116\108\101"]:Tween(nil, {
					TextTransparency = 1,
				})
				dq["\68\101\115\99\114\105\112\116\105\111\110"]:Tween(nil, {
					TextTransparency = 1,
				})
				dq["\85\73\83\116\114\111\107\101"]:Tween(nil, {
					Transparency = 1,
				})
				dq["\85\73\83\116\114\111\107\101\50"]:Tween(nil, {
					Transparency = 1,
				})
				dq["\85\73\83\116\114\111\107\101\51"]:Tween(nil, {
					Transparency = 1,
				})
				if dp then
					dp:Disconnect()
					dp = nil
				end
			end)
		end
	end
	local dr = {}
	do
		function dr:New(Name, ds, dt, du)
			if 5 ~= 5 then
				local _dc17744 = 816
			end
			if isfile(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110") then
				return Font.new(getcustomasset(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110"))
			end
			if not isfile(a.Folders.Assets .. "/" .. Name .. "\46\116\116\102") then
				if 10 < 1 then
					local _dc55171 = 356
					local _dc9744 = "dc526"
					local _dc20476 = 328
				end
				writefile(a.Folders.Assets .. "/" .. Name .. "\46\116\116\102", game:HttpGet(du.Url))
			end
			local dv = {
				name = Name,
				faces = {
					{
						name = "\82\101\103\117\108\97\114",
						weight = ds,
						style = dt,
						assetId = getcustomasset(a.Folders.Assets .. "/" .. Name .. "\46\116\116\102"),
					},
				},
			}
			writefile(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110", e:JSONEncode(dv))
			return Font.new(getcustomasset(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110"))
		end
		function dr:Get(Name)
			if isfile(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110") then
				return Font.new(getcustomasset(a.Folders.Assets .. "/" .. Name .. "\46\106\115\111\110"))
			end
		end
		dr:New("\77\111\110\97\99\111", (1180 - 780), "\82\101\103\117\108\97\114", {
			Url = "\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\104\97\104\97\97\104\97\104\97\104\104\97\104\97\104\97\104\97\104\47\109\105\115\97\107\105\45\104\117\98\47\114\97\119\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\108\105\98\114\97\114\121\47\102\111\110\116\115\47\77\111\110\97\99\111\46\116\116\102",
		})
		a.Font = dr:Get("\77\111\110\97\99\111")
	end
	a.Holder = bl:Create("\83\99\114\101\101\110\71\117\105", {
		Parent = gethui(),
		Name = "\0",
		ZIndexBehavior = Enum.ZIndexBehavior.Global,
		DisplayOrder = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
		ResetOnSpawn = (not not false),
	})
	a.UnusedHolder = bl:Create("\83\99\114\101\101\110\71\117\105", {
		Parent = gethui(),
		Name = "\0",
		ZIndexBehavior = Enum.ZIndexBehavior.Global,
		Enabled = (1 == 0),
		ResetOnSpawn = (not true),
	})
	a.NotifHolder = bl:Create("\70\114\97\109\101", {
		Parent = a.Holder.Instance,
		Name = "\0",
		BackgroundTransparency = 1,
		Size = s(0, 0, 1, 0),
		BorderColor3 = l(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-168 + 423), (906 - 651)),
	})
	bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
		Parent = a.NotifHolder.Instance,
		Name = "\0",
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = t(0, (372 - 360)),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	bl:Create("\85\73\80\97\100\100\105\110\103", {
		Parent = a.NotifHolder.Instance,
		Name = "\0",
		PaddingTop = t(0, (-387 + 399)),
		PaddingBottom = t(0, (-842 + 854)),
		PaddingRight = t(0, (-238 + 250)),
		PaddingLeft = t(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
	})
	a.Unload = function(dw)
		for Index, Value in dw.Connections do
			Value.Connection:Disconnect()
		end
		for Index, Value in dw.Threads do
			coroutine.close(Value)
		end
		if dw.Holder then
			dw.Holder:Clean()
		end
		a = nil
		c.MouseIconEnabled = (1 == 1)
	end
	a.GetImage = function(dx, dy)
		local dz = dx.Images[dy]
		if not dz then
			return
		end
		return getcustomasset(dx.Folders.Assets .. "/" .. dz[1])
	end
	a.Round = function(self, ea, eb)
		local ec = 1 / (eb or 1)
		return w(ea * ec) / ec
	end
	a.Thread = function(ed, ee)
		local ef = coroutine.create(ee)
		coroutine.wrap(function()
			coroutine.resume(ef)
		end)()
		z(ed.Threads, ef)
		return ef
	end
	a.SafeCall = function(self, eg, ...)
		local eh = {
			...,
		}
		local ei, ej = pcall(eg, ae(eh))
		if not ei then
			warn(ej)
			return (not true)
		end
		return ei
	end
	a.Connect = function(ek, el, em, Name)
		Name = Name or af("\67\111\110\110\101\99\116\105\111\110\37\115\37\115", ek.UnnamedConnections + 1, e:GenerateGUID((not not false)))
		local en = {
			Event = el,
			Callback = em,
			Name = Name,
			Connection = nil,
		}
		a:Thread(function()
			en.Connection = el:Connect(em)
		end)
		z(ek.Connections, en)
		return en
	end
	a.Disconnect = function(eo, Name)
		for _, ep in eo.Connections do
			if ep.Name == Name then
				ep.Connection:Disconnect()
				break
			end
		end
	end
	a.EscapePattern = function(self, eq)
		local er = (1 == 0)
		for Index, Value in am do
			if ag(eq, Value) then
				er = (not not true)
				break
			end
		end
		if er then
			return ah(eq, "\91\37\40\37\41\37\46\37\37\37\43\37\45\37\42\37\63\37\91\37\93\37\94\37\36\93", "\37\37\37\49")
		end
		return eq
	end
	a.NextFlag = function(es)
		local et = es.UnnamedFlags + 1
		return af("\102\108\97\103\95\110\117\109\98\101\114\95\37\115\95\37\115", et, e:GenerateGUID((not true)))
	end
	a.AddToTheme = function(eu, ev, ew)
		ev = ev.Instance or ev
		local ex = {
			Item = ev,
			Properties = ew,
		}
		for ey, Value in ex.Properties do
			if type(Value) == "\115\116\114\105\110\103" then
				ev[ey] = eu.Theme[Value]
			else
				ev[ey] = Value()
			end
		end
		z(eu.ThemeItems, ex)
		eu.ThemeMap[ev] = ex
	end
	a.ToRich = function(self, Text, ez)
		return `<font color="rgb({w(ez.R * bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))}, {w(ez.G * (-109 + 364))}, {w(ez.B * (228 + 27))})">{Text}</font>`
	end
	a.GetConfig = function(self)
		local fa = {}
		local Success, Result = a:SafeCall(function()
			for fb, Value in a.Flags do
				if type(Value) == "\116\97\98\108\101" and Value.Key then
					fa[fb] = {
						Key = tostring(Value.Key),
						Mode = Value.Mode,
					}
				elseif type(Value) == "\116\97\98\108\101" and Value.Color then
					fa[fb] = {
						Color = "#" .. Value.Color,
						Alpha = Value.Alpha,
					}
				else
					fa[fb] = Value
				end
			end
		end)
		return e:JSONEncode(fa)
	end
	a.LoadConfig = function(self, fc)
		local fd = e:JSONDecode(fc)
		local fe, ff = a:SafeCall(function()
			for fg, Value in fd do
				local fh = a.SetFlags[fg]
				if not fh then
					continue
				end
				if type(Value) == "\116\97\98\108\101" and Value.Key then
					fh(Value)
				elseif type(Value) == "\116\97\98\108\101" and Value.Color then
					fh(Value.Color, Value.Alpha)
				else
					fh(Value)
				end
			end
		end)
		return fe, ff
	end
	a.DeleteConfig = function(self, fi)
		if isfile(a.Folders.Configs .. "/" .. fi) then
			delfile(a.Folders.Configs .. "/" .. fi)
		end
	end
	a.RefreshConfigsList = function(self, Element)
		local fj = {}
		local List = {}
		local fk = ah(a.Folders.Configs, a.Folders.Directory .. "/", "")
		for fl, Value in listfiles(a.Folders.Configs) do
			local fm = ah(Value, a.Folders.Directory .. "\\" .. fk .. "\\", "")
			List[fl] = fm
		end
		local fn = #List ~= fj
		if not fn then
			for fo = 1, #List do
				if List[fo] ~= fj[fo] then
					fn = (not false)
					break
				end
			end
		else
			fj = List
			Element:Refresh(fj)
		end
	end
	a.ChangeItemTheme = function(fp, fq, fr)
		fq = fq.Instance or fq
		if not fp.ThemeMap[fq] then
			return
		end
		fp.ThemeMap[fq].Properties = fr
		fp.ThemeMap[fq] = fp.ThemeMap[fq]
	end
	a.ChangeTheme = function(fs, ft, fu)
		fs.Theme[ft] = fu
		for _, fv in fs.ThemeItems do
			for fw, Value in fv.Properties do
				if type(Value) == "\115\116\114\105\110\103" and Value == ft then
					fv.Item[fw] = fu
				elseif type(Value) == "\102\117\110\99\116\105\111\110" then
					fv.Item[fw] = Value()
				end
			end
		end
	end
	a.IsMouseOverFrame = function(self, fx, fy, fz)
		fx = fx.Instance
		fy = fy or 0
		fz = fz or 0
		local ga = u(k.X + fy, k.Y + fz)
		return ga.X >= fx.AbsolutePosition.X and ga.X <= fx.AbsolutePosition.X + fx.AbsoluteSize.X and ga.Y >= fx.AbsolutePosition.Y and ga.Y <= fx.AbsolutePosition.Y + fx.AbsoluteSize.Y
	end
	a.Lerp = function(self, gb, gc, gd)
		return gb + (gc - gb) * gd
	end
	local ge = {}
	do
		ge.Window = function(self, gf)
			local gg = {}
			do
				gg["\87\105\110\100\111\119"] = bl:Create("\70\114\97\109\101", {
					Parent = gf.Parent.Instance,
					Name = "\0",
					AnchorPoint = gf.AnchorPoint,
					Position = gf.Position,
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (159 - 147), (1008 - 996)),
					Size = gf.Size,
					BorderSizePixel = (-344 + 346),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(14, 1515870810), 1515870810), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), (396 - 381)),
				})
				gg["\87\105\110\100\111\119"]:AddToTheme({
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				if gf.Draggable then
					gg["\87\105\110\100\111\119"]:MakeDraggable()
				end
				if gf.Resizeable then
					gg["\87\105\110\100\111\119"]:MakeResizeable(u(gf.Size.X.Offset, gf.Size.Y.Offset), u(bit32.bxor(bit32.bxor(9999, 1515870810), 1515870810), (9493 + 506)))
				end
				gg["\85\73\83\116\114\111\107\101"] = gg["\87\105\110\100\111\119"]:Border("\79\117\116\108\105\110\101")
			end
			return gg
		end
		ge.AutosizingLabel = function(self, gh)
			local Label = {}
			local gi = {}
			do
				gi["\76\97\98\101\108"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = gh.Parent.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((-224 + 459), (-150 + 385), (124 + 111)),
					BorderColor3 = l(0, 0, 0),
					Text = gh.Text,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l((668 - 413), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-449 + 704)),
				})
				gi["\76\97\98\101\108"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				gi["\85\73\83\116\114\111\107\101"] = gi["\76\97\98\101\108"]:TextBorder()
			end
			function Label:SetProperty(gj, Value)
				gi["\76\97\98\101\108"].Instance[gj] = Value
			end
			return Label, gi
		end
		ge.WindowPage = function(self, gk)
			local Page = {
				Active = (not true),
				SubPages = {},
				Items = {},
				Window = gk.Window,
				ColumnsData = {},
			}
			local gl = {}
			do
				gl["\73\110\97\99\116\105\118\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = gk.Parent.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l((218 - 206), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-416 + 428)),
					Text = "",
					AutoButtonColor = (not true),
					BackgroundTransparency = ((0.6000000238418579 * 5) / 5),
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(25, 1515870810), 1515870810)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					TextSize = bit32.bxor(bit32.bxor(14, 1515870810), 1515870810),
					BackgroundColor3 = l((-340 + 365), (376 - 346), bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
				})
				gl["\73\110\97\99\116\105\118\101"]:AddToTheme({
					BackgroundColor3 = "\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				gl["\66\117\116\116\111\110\66\111\114\100\101\114"] = bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = gl["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(61, 1515870810), 1515870810), bit32.bxor(bit32.bxor(60, 1515870810), 1515870810), bit32.bxor(bit32.bxor(65, 1515870810), 1515870810)),
					Transparency = ((0.6 * 5) / 5),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				})
				gl["\66\117\116\116\111\110\66\111\114\100\101\114"]:AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				gl["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = gl["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(0, 1, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(25, 1515870810), 1515870810), (349 - 319), bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
				})
				gl["\76\105\110\101\114"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
				})
				gl["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = gl["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((1110 - 875), (-732 + 967), (849 - 614)),
					BorderColor3 = l(0, 0, 0),
					Text = gk.Name,
					AnchorPoint = u(0, ((0.5 * 4) / 4)),
					Size = s(0, 0, 0, (953 - 938)),
					BackgroundTransparency = 1,
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), ((0.5 * 5) / 5), 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l((605 - 350), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				gl["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				gl["\84\101\120\116\83\116\114\111\107\101"] = gl["\84\101\120\116"]:TextBorder()
				gl["\71\108\111\119"] = bl:Create("\70\114\97\109\101", {
					Parent = gl["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = l((-263 + 288), (732 - 702), bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
				})
				gl["\71\108\111\119"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
				})
				gl["\71\108\111\119\71\114\97\100\105\101\110\116"] = bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = gl["\71\108\111\119"].Instance,
					Name = "\0",
					Transparency = q({
						r(0, 0),
						r(((0.193 * 5) / 5), ((0.8687499761581421 * 4) / 4)),
						r(((0.504 * 10) / 10), ((0.96875 * 4) / 4)),
						r(1, 1),
					}),
				})
				gl["\80\97\103\101"] = bl:Create("\70\114\97\109\101", {
					Parent = gk.ContentHolder.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					Visible = (1 == 0),
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 1, 0),
					BackgroundColor3 = l((691 - 436), (925 - 670), (-398 + 653)),
				})
				if gk.SubPages then
					gl["\83\117\98\80\97\103\101\115"] = bl:Create("\70\114\97\109\101", {
						Parent = gl["\80\97\103\101"].Instance,
						Name = "\0",
						Size = s(0, 0, 0, (-549 + 584)),
						BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
						BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), (222 - 198), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
					})
					gl["\83\117\98\80\97\103\101\115"]:AddToTheme({
						BackgroundColor3 = "\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100",
						BorderColor3 = "\79\117\116\108\105\110\101",
					})
					gl["\83\117\98\80\97\103\101\115"]:Border("\66\111\114\100\101\114")
					bl:Create("\85\73\80\97\100\100\105\110\103", {
						Parent = gl["\83\117\98\80\97\103\101\115"].Instance,
						Name = "\0",
						PaddingRight = t(0, bit32.bxor(bit32.bxor(7, 1515870810), 1515870810)),
						PaddingLeft = t(0, bit32.bxor(bit32.bxor(7, 1515870810), 1515870810)),
					})
					bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
						Parent = gl["\83\117\98\80\97\103\101\115"].Instance,
						Name = "\0",
						VerticalAlignment = Enum.VerticalAlignment.Center,
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = t(0, (35 - 23)),
						SortOrder = Enum.SortOrder.LayoutOrder,
					})
					gl["\67\111\108\117\109\110\115"] = bl:Create("\70\114\97\109\101", {
						Parent = gl["\80\97\103\101"].Instance,
						Name = "\0",
						BackgroundTransparency = 1,
						Position = s(0, 0, 0, (-397 + 448)),
						BorderColor3 = l((890 - 848), (323 - 274), (380 - 335)),
						Size = s(1, 0, 1, -bit32.bxor(bit32.bxor(51, 1515870810), 1515870810)),
						BorderSizePixel = 0,
						BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-451 + 706), (-218 + 473)),
					})
				else
					bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
						Parent = gl["\80\97\103\101"].Instance,
						Name = "\0",
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalFlex = Enum.UIFlexAlignment.Fill,
						Padding = t(0, (-222 + 236)),
						SortOrder = Enum.SortOrder.LayoutOrder,
					})
					for gm = 1, gk.Columns do
						local gn = bl:Create("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", {
							Parent = gl["\80\97\103\101"].Instance,
							Name = "\0",
							ScrollBarImageColor3 = l(0, 0, 0),
							Active = (not false),
							AutomaticCanvasSize = Enum.AutomaticSize.Y,
							ScrollBarThickness = 0,
							BackgroundTransparency = 1,
							Size = s(1, 0, 1, 0),
							BackgroundColor3 = l((-679 + 934), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
							BorderColor3 = l(0, 0, 0),
							BorderSizePixel = 0,
							CanvasSize = s(0, 0, 0, 0),
						})
						bl:Create("\85\73\80\97\100\100\105\110\103", {
							Parent = gn.Instance,
							Name = "\0",
							PaddingTop = t(0, (917 - 915)),
							PaddingBottom = t(0, (111 - 109)),
							PaddingRight = t(0, (-323 + 325)),
							PaddingLeft = t(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
						})
						bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
							Parent = gn.Instance,
							Name = "\0",
							Padding = t(0, (-506 + 520)),
							SortOrder = Enum.SortOrder.LayoutOrder,
						})
						Page.ColumnsData[gm] = gn
					end
				end
				Page.Items = gl
			end
			local go = (1 == 0)
			function Page:Turn(gp)
				if go then
					return
				end
				Page.Active = gp
				go = (not not true)
				gl["\80\97\103\101"].Instance.Visible = gp
				gl["\80\97\103\101"].Instance.Parent = gp and gk.ContentHolder.Instance or a.UnusedHolder.Instance
				if Page.Active then
					gl["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gl["\66\117\116\116\111\110\66\111\114\100\101\114"]:Tween(nil, {
						Transparency = 0,
					})
					gl["\71\108\111\119"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gl["\76\105\110\101\114"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gl["\84\101\120\116"]:Tween(nil, {
						Position = s(0, bit32.bxor(bit32.bxor(13, 1515870810), 1515870810), ((0.5 * 10) / 10), 0),
					})
					a.CurrentPage = Page
				else
					gl["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundTransparency = ((0.6 * 4) / 4),
					})
					gl["\66\117\116\116\111\110\66\111\114\100\101\114"]:Tween(nil, {
						Transparency = ((0.6 * 2) / 2),
					})
					gl["\71\108\111\119"]:Tween(nil, {
						BackgroundTransparency = 1,
					})
					gl["\76\105\110\101\114"]:Tween(nil, {
						BackgroundTransparency = 1,
					})
					gl["\84\101\120\116"]:Tween(nil, {
						Position = s(0, (838 - 830), ((0.5 * 10) / 10), 0),
					})
				end
				local gq = gl["\80\97\103\101"].Instance:GetDescendants()
				z(gq, gl["\80\97\103\101"].Instance)
				local gr
				for Index, Value in gq do
					local gs = ar:GetProperty(Value)
					if not gs then
						continue
					end
					if type(gs) == "\116\97\98\108\101" then
						for _, gt in gs do
							gr = ar:FadeItem(Value, gt, gp, gk.Window.FadeTime)
						end
					else
						gr = ar:FadeItem(Value, gs, gp, gk.Window.FadeTime)
					end
				end
				a:Connect(gr.Tween.Completed, function()
					go = (not true)
				end)
			end
			gl["\73\110\97\99\116\105\118\101"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				for Index, Value in gk.Window.Pages do
					if Value == Page and Page.Active then
						return
					end
					Value:Turn(Value == Page)
				end
			end)
			gl["\73\110\97\99\116\105\118\101"]:OnHover(function()
				gl["\73\110\97\99\116\105\118\101"]:ChangeItemTheme({
					BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				gl["\73\110\97\99\116\105\118\101"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
				})
			end)
			gl["\73\110\97\99\116\105\118\101"]:OnHoverLeave(function()
				gl["\73\110\97\99\116\105\118\101"]:ChangeItemTheme({
					BackgroundColor3 = "\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				gl["\73\110\97\99\116\105\118\101"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100"],
				})
			end)
			if #gk.Window.Pages == 0 then
				Page:Turn((1 == 1))
			end
			z(gk.Window.Pages, Page)
			return Page, gl
		end
		ge.WindowSubPage = function(self, gu)
			local gv = {
				Active = (1 == 0),
				ColumnsData = {},
			}
			local gw = {}
			do
				gw["\73\110\97\99\116\105\118\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = gu.Page.Items["\83\117\98\80\97\103\101\115"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l((-596 + 608), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (67 - 55)),
					Text = "",
					AutoButtonColor = (1 == 0),
					BackgroundTransparency = 1,
					Size = s(0, 0, 0, (840 - 820)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = (-524 + 538),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(25, 1515870810), 1515870810), bit32.bxor(bit32.bxor(30, 1515870810), 1515870810), bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
				})
				gw["\73\110\97\99\116\105\118\101"]:AddToTheme({
					BackgroundColor3 = "\80\97\103\101\32\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				gw["\66\117\116\116\111\110\66\111\114\100\101\114"] = bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = gw["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(61, 1515870810), 1515870810), (-590 + 650), (-456 + 521)),
					Transparency = 1,
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				})
				gw["\66\117\116\116\111\110\66\111\114\100\101\114"]:AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				gw["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = gw["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((327 - 92), (-315 + 550), (253 - 18)),
					BorderColor3 = l(0, 0, 0),
					Text = gu.Name,
					AnchorPoint = u(((0.5 * 2) / 2), ((0.5 * 4) / 4)),
					Size = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					Position = s(((0.5 * 2) / 2), -(833 - 828), ((0.5 * 10) / 10), 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-680 + 935), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				gw["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				gw["\84\101\120\116\83\116\114\111\107\101"] = gw["\84\101\120\116"]:TextBorder()
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = gw["\84\101\120\116"].Instance,
					Name = "\0",
					PaddingRight = t(0, (269 - 261)),
					PaddingLeft = t(0, (-766 + 774)),
				})
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = gw["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					PaddingTop = t(0, (-699 + 701)),
					PaddingLeft = t(0, bit32.bxor(bit32.bxor(18, 1515870810), 1515870810)),
					PaddingRight = t(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				})
				gw["\71\108\111\119"] = bl:Create("\70\114\97\109\101", {
					Parent = gw["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					Position = s(0, -(500 - 482), 0, -(-204 + 206)),
					BorderColor3 = l(0, 0, 0),
					Size = s(0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), 1, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (204 + 39), (-461 + 716)),
				})
				gw["\71\108\111\119"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = gw["\71\108\111\119"].Instance,
					Name = "\0",
					Transparency = q({
						r(0, 0),
						r(((0.193 * 4) / 4), ((0.8687499761581421 * 10) / 10)),
						r(((0.504 * 2) / 2), ((0.96875 * 2) / 2)),
						r(1, 1),
					}),
				})
				gw["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = gw["\73\110\97\99\116\105\118\101"].Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					Position = s(0, -bit32.bxor(bit32.bxor(18, 1515870810), 1515870810), 0, -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Size = s(0, 1, 1, (-644 + 646)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				gw["\76\105\110\101\114"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
				})
				gw["\80\97\103\101"] = bl:Create("\70\114\97\109\101", {
					Parent = gu.Page.Items["\67\111\108\117\109\110\115"].Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					Position = s(0, -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 0, -(-413 + 415)),
					BorderColor3 = l(0, 0, 0),
					Size = s(1, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, 0),
					BorderSizePixel = 0,
					Visible = (1 == 0),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-341 + 596), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = gw["\80\97\103\101"].Instance,
					Name = "\0",
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					Padding = t(0, bit32.bxor(bit32.bxor(14, 1515870810), 1515870810)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
				for gx = 1, gu.Columns do
					local gy = bl:Create("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", {
						Parent = gw["\80\97\103\101"].Instance,
						Name = "\0",
						ScrollBarImageColor3 = l(0, 0, 0),
						Active = (not not true),
						AutomaticCanvasSize = Enum.AutomaticSize.Y,
						ScrollBarThickness = 0,
						BackgroundTransparency = 1,
						Size = s(1, 0, 1, 0),
						BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (96 + 159)),
						BorderColor3 = l(0, 0, 0),
						BorderSizePixel = 0,
						CanvasSize = s(0, 0, 0, 0),
					})
					bl:Create("\85\73\80\97\100\100\105\110\103", {
						Parent = gy.Instance,
						Name = "\0",
						PaddingTop = t(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
						PaddingBottom = t(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
						PaddingRight = t(0, (683 - 681)),
						PaddingLeft = t(0, (-642 + 644)),
					})
					bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
						Parent = gy.Instance,
						Name = "\0",
						Padding = t(0, bit32.bxor(bit32.bxor(14, 1515870810), 1515870810)),
						SortOrder = Enum.SortOrder.LayoutOrder,
					})
					gv.ColumnsData[gx] = gy
				end
			end
			local gz = (not true)
			a.SearchItems[gv] = {}
			function gv:Turn(ha)
				if gz then
					return
				end
				gv.Active = ha
				gz = (1 == 1)
				gw["\80\97\103\101"].Instance.Visible = ha
				gw["\80\97\103\101"].Instance.Parent = ha and gu.Page.Items["\67\111\108\117\109\110\115"].Instance or a.UnusedHolder.Instance
				if gv.Active then
					gw["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gw["\66\117\116\116\111\110\66\111\114\100\101\114"]:Tween(nil, {
						Transparency = 0,
					})
					gw["\76\105\110\101\114"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gw["\71\108\111\119"]:Tween(nil, {
						BackgroundTransparency = 0,
					})
					gw["\84\101\120\116"]:Tween(nil, {
						Position = s(((0.5 * 4) / 4), 0, ((0.5 * 10) / 10), 0),
					})
					a.CurrentPage = gv
				else
					gw["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundTransparency = 1,
					})
					gw["\66\117\116\116\111\110\66\111\114\100\101\114"]:Tween(nil, {
						Transparency = 1,
					})
					gw["\76\105\110\101\114"]:Tween(nil, {
						BackgroundTransparency = 1,
					})
					gw["\71\108\111\119"]:Tween(nil, {
						BackgroundTransparency = 1,
					})
					gw["\84\101\120\116"]:Tween(nil, {
						Position = s(((0.5 * 10) / 10), -bit32.bxor(bit32.bxor(5, 1515870810), 1515870810), ((0.5 * 10) / 10), 0),
					})
				end
				local hb = gw["\80\97\103\101"].Instance:GetDescendants()
				z(hb, gw["\80\97\103\101"].Instance)
				local hc
				for Index, Value in hb do
					local hd = ar:GetProperty(Value)
					if not hd then
						continue
					end
					if type(hd) == "\116\97\98\108\101" then
						for _, he in hd do
							hc = ar:FadeItem(Value, he, ha, gu.Window.FadeTime)
						end
					else
						hc = ar:FadeItem(Value, hd, ha, gu.Window.FadeTime)
					end
				end
				a:Connect(hc.Tween.Completed, function()
					gz = (not not false)
				end)
			end
			gw["\73\110\97\99\116\105\118\101"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				for Index, Value in gu.Page.SubPages do
					if Value == gv and gv.Active then
						return
					end
					Value:Turn(Value == gv)
				end
			end)
			if #gu.Page.SubPages == 0 then
				gv:Turn((1 == 1))
			end
			z(gu.Page.SubPages, gv)
			return gv
		end
		ge.Toggle = function(self, hf)
			local Toggle = {
				Value = (1 == 0),
				Flag = hf.Flag,
			}
			local hg = {}
			do
				hg["\84\111\103\103\108\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = hf.Parent.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l(0, 0, 0),
					Text = "",
					AutoButtonColor = (1 == 0),
					BackgroundTransparency = 1,
					Size = s(1, 0, 0, (-696 + 708)),
					BorderSizePixel = 0,
					TextSize = (-437 + 451),
					BackgroundColor3 = l((-582 + 837), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (371 - 116)),
				})
				hg["\73\110\100\105\99\97\116\111\114"] = bl:Create("\70\114\97\109\101", {
					Parent = hg["\84\111\103\103\108\101"].Instance,
					Name = "\0",
					AnchorPoint = u(0, ((0.5 * 10) / 10)),
					Position = s(0, 0, ((0.5 * 4) / 4), 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (953 - 941), (274 - 262)),
					Size = s(0, (283 - 271), 0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					BorderSizePixel = (-495 + 497),
					BackgroundColor3 = l((-496 + 526), bit32.bxor(bit32.bxor(36, 1515870810), 1515870810), (49 - 18)),
				})
				hg["\73\110\100\105\99\97\116\111\114"]:AddToTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = hg["\73\110\100\105\99\97\116\111\114"].Instance,
					Name = "\0",
					Color = l((518 - 476), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (1023 - 978)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = hg["\73\110\100\105\99\97\116\111\114"].Instance,
					Name = "\0",
					Rotation = -(-329 + 494),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (862 - 607), (1034 - 779))),
						p(1, l((317 - 109), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (68 + 140))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				hg["\67\104\101\99\107"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = hg["\73\110\100\105\99\97\116\111\114"].Instance,
					Name = "\0",
					ImageColor3 = l(0, 0, 0),
					ScaleType = Enum.ScaleType.Fit,
					ImageTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					AnchorPoint = u(((0.5 * 4) / 4), ((0.5 * 2) / 2)),
					Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\48\56\48\49\54\54\55\49\52\54\57\52\51\57",
					BackgroundTransparency = 1,
					Position = s(((0.5 * 4) / 4), 0, ((0.5 * 10) / 10), 0),
					Size = s(1, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (133 + 122)),
				})
				hg["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = hg["\84\111\103\103\108\101"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((43 + 192), (981 - 746), (-163 + 398)),
					BorderColor3 = l(0, 0, 0),
					Text = hf.Name,
					Size = s(0, 0, 0, (-852 + 867)),
					AnchorPoint = u(0, ((0.5 * 2) / 2)),
					Position = s(0, bit32.bxor(bit32.bxor(22, 1515870810), 1515870810), ((0.5 * 5) / 5), 0),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = (542 - 533),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (948 - 693), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				hg["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				hg["\84\101\120\116"]:TextBorder()
				hg["\83\117\98\69\108\101\109\101\110\116\115"] = bl:Create("\70\114\97\109\101", {
					Parent = hg["\84\111\103\103\108\101"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					BackgroundTransparency = 1,
					Position = s(0, hg["\84\101\120\116"].Instance.TextBounds.X + bit32.bxor(bit32.bxor(30, 1515870810), 1515870810), 0, 0),
					Size = s(0, 0, 1, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-561 + 816)),
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = hg["\83\117\98\69\108\101\109\101\110\116\115"].Instance,
					Name = "\0",
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = t(0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
				if hf.Tooltip then
					hg["\84\111\111\108\116\105\112\84\104\105\110\103"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
						Parent = hg["\83\117\98\69\108\101\109\101\110\116\115"].Instance,
						Name = "\0",
						FontFace = a.Font,
						TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-155 + 390), (944 - 709)),
						BorderColor3 = l(0, 0, 0),
						Text = "\40\63\41",
						Size = s(0, 0, 0, (311 - 296)),
						AnchorPoint = u(0, ((0.5 * 2) / 2)),
						Position = s(0, bit32.bxor(bit32.bxor(22, 1515870810), 1515870810), ((0.5 * 10) / 10), 0),
						BackgroundTransparency = 1,
						TextTransparency = ((0.4 * 10) / 10),
						TextXAlignment = Enum.TextXAlignment.Left,
						BorderSizePixel = 0,
						AutomaticSize = Enum.AutomaticSize.X,
						TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
						BackgroundColor3 = l((1040 - 785), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
					})
					hg["\84\111\111\108\116\105\112\84\104\105\110\103"]:AddToTheme({
						TextColor3 = "\84\101\120\116",
					})
					hg["\84\111\111\108\116\105\112\84\104\105\110\103"]:TextBorder()
					hg["\84\111\111\108\116\105\112\84\104\105\110\103"]:Tooltip({
						Text = hf.Tooltip.Name,
						Description = hf.Tooltip.Description,
					})
				end
			end
			function Toggle:Get()
				return Toggle.Value
			end
			function Toggle:SetText(Text)
				Text = tostring(Text)
				hg["\84\101\120\116"].Instance.Text = Text
			end
			function Toggle:Set(Value)
				Toggle.Value = Value
				a.Flags[Toggle.Flag] = Value
				if Toggle.Value then
					hg["\73\110\100\105\99\97\116\111\114"]:ChangeItemTheme({
						BackgroundColor3 = "\65\99\99\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hg["\73\110\100\105\99\97\116\111\114"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Accent,
					})
					task.wait(((0.05 * 5) / 5))
					hg["\67\104\101\99\107"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
						ImageTransparency = 0,
						Size = s(1, (536 - 534), 1, (-297 + 299)),
					})
				else
					hg["\73\110\100\105\99\97\116\111\114"]:ChangeItemTheme({
						BackgroundColor3 = "\69\108\101\109\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hg["\73\110\100\105\99\97\116\111\114"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Element,
					})
					task.wait(((0.05 * 10) / 10))
					hg["\67\104\101\99\107"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
						ImageTransparency = 1,
						Size = s(0, 0, 0, 0),
					})
				end
				if hf.Callback then
					a:SafeCall(hf.Callback, Toggle.Value)
				end
			end
			function Toggle:SetVisibility(hh)
				hg["\84\111\103\103\108\101"].Instance.Visible = hh
			end
			local hi = a.SearchItems[hf.Page]
			if hi then
				local hj = {
					Element = hg["\84\111\103\103\108\101"],
					Name = hf.Name,
				}
				z(hi, hj)
			end
			hg["\84\111\103\103\108\101"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				Toggle:Set(not Toggle.Value)
			end)
			hg["\84\111\103\103\108\101"]:OnHover(function()
				if Toggle.Value then
					return
				end
				hg["\73\110\100\105\99\97\116\111\114"]:ChangeItemTheme({
					BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				hg["\73\110\100\105\99\97\116\111\114"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
				})
			end)
			hg["\84\111\103\103\108\101"]:OnHoverLeave(function()
				if Toggle.Value then
					return
				end
				hg["\73\110\100\105\99\97\116\111\114"]:ChangeItemTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				hg["\73\110\100\105\99\97\116\111\114"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\69\108\101\109\101\110\116"],
				})
			end)
			Toggle:Set(hf.Default)
			a.SetFlags[Toggle.Flag] = function(Value)
				Toggle:Set(Value)
			end
			return Toggle, hg
		end
		ge.Button = function(self, hk)
			local Button = {}
			local hl = {}
			do
				hl["\66\117\116\116\111\110"] = bl:Create("\70\114\97\109\101", {
					Parent = hk.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = l((1142 - 887), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = hl["\66\117\116\116\111\110"].Instance,
					Name = "\0",
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
					Padding = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
			end
			function Button:Add(Name, hm)
				local NewButton = {}
				local hn = {}
				do
					hn["\78\101\119\66\117\116\116\111\110"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
						Parent = hl["\66\117\116\116\111\110"].Instance,
						Name = "\0",
						FontFace = a.Font,
						TextColor3 = l(0, 0, 0),
						BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-683 + 695)),
						Text = "",
						AutoButtonColor = (1 == 0),
						Size = s(1, 0, 0, (-56 + 76)),
						BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
						TextSize = bit32.bxor(bit32.bxor(14, 1515870810), 1515870810),
						BackgroundColor3 = l((-254 + 284), (273 - 237), (-277 + 308)),
					})
					hn["\78\101\119\66\117\116\116\111\110"]:AddToTheme({
						BackgroundColor3 = "\69\108\101\109\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					bl:Create("\85\73\71\114\97\100\105\101\110\116", {
						Parent = hn["\78\101\119\66\117\116\116\111\110"].Instance,
						Name = "\0",
						Rotation = -bit32.bxor(bit32.bxor(165, 1515870810), 1515870810),
						Color = o({
							p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-382 + 637), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
							p(1, l((556 - 348), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (908 - 700))),
						}),
					}):AddToTheme({
						Color = function()
							return o({
								p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
								p(1, a.Theme.Gradient),
							})
						end,
					})
					bl:Create("\85\73\83\116\114\111\107\101", {
						Parent = hn["\78\101\119\66\117\116\116\111\110"].Instance,
						Name = "\0",
						Color = l((93 - 51), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (988 - 943)),
						LineJoinMode = Enum.LineJoinMode.Miter,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					}):AddToTheme({
						Color = "\79\117\116\108\105\110\101",
					})
					hn["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
						Parent = hn["\78\101\119\66\117\116\116\111\110"].Instance,
						Name = "\0",
						FontFace = a.Font,
						TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (179 + 56)),
						BorderColor3 = l(0, 0, 0),
						Text = Name,
						BackgroundTransparency = 1,
						Size = s(1, 0, 1, 0),
						BorderSizePixel = 0,
						TextSize = (569 - 560),
						BackgroundColor3 = l((-302 + 557), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-138 + 393)),
					})
					hn["\84\101\120\116"]:AddToTheme({
						TextColor3 = "\84\101\120\116",
					})
					hn["\84\101\120\116"]:TextBorder()
				end
				function NewButton:Press()
					hn["\78\101\119\66\117\116\116\111\110"]:ChangeItemTheme({
						BackgroundColor3 = "\65\99\99\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hn["\78\101\119\66\117\116\116\111\110"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Accent,
					})
					a:SafeCall(hm)
					task.wait(((0.1 * 4) / 4))
					hn["\78\101\119\66\117\116\116\111\110"]:ChangeItemTheme({
						BackgroundColor3 = "\69\108\101\109\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hn["\78\101\119\66\117\116\116\111\110"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Element,
					})
				end
				function NewButton:SetVisibility(ho)
					hn["\78\101\119\66\117\116\116\111\110"].Instance.Visible = ho
				end
				local hp = a.SearchItems[hk.Page]
				if hp then
					local hq = {
						Element = hn["\78\101\119\66\117\116\116\111\110"],
						Name = Name,
					}
					z(hp, hq)
				end
				hn["\78\101\119\66\117\116\116\111\110"]:OnHover(function()
					hn["\78\101\119\66\117\116\116\111\110"]:ChangeItemTheme({
						BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hn["\78\101\119\66\117\116\116\111\110"]:Tween(nil, {
						BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
					})
				end)
				hn["\78\101\119\66\117\116\116\111\110"]:OnHoverLeave(function()
					hn["\78\101\119\66\117\116\116\111\110"]:ChangeItemTheme({
						BackgroundColor3 = "\69\108\101\109\101\110\116",
						BorderColor3 = "\66\111\114\100\101\114",
					})
					hn["\78\101\119\66\117\116\116\111\110"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Element,
					})
				end)
				hn["\78\101\119\66\117\116\116\111\110"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
					NewButton:Press()
				end)
				return NewButton
			end
			function Button:SetVisibility(hr)
				hl["\66\117\116\116\111\110"].Instance.Visible = hr
			end
			return Button, hl
		end
		ge.Slider = function(self, hs)
			local Slider = {
				Value = 0,
				Flag = hs.Flag,
				Sliding = (1 == 0),
			}
			local ht = {}
			do
				ht["\83\108\105\100\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = hs.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(28, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				ht["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = ht["\83\108\105\100\101\114"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (1092 - 857), (-168 + 403)),
					BorderColor3 = l(0, 0, 0),
					Text = hs.Name,
					BackgroundTransparency = 1,
					Size = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-94 + 349)),
				})
				ht["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				ht["\84\101\120\116"]:TextBorder()
				ht["\82\101\97\108\83\108\105\100\101\114"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = ht["\83\108\105\100\101\114"].Instance,
					AutoButtonColor = (not true),
					Text = "",
					Name = "\0",
					AnchorPoint = u(0, 1),
					Position = s(0, 0, 1, 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-607 + 619), (250 - 238)),
					Size = s(1, 0, 0, (988 - 978)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(30, 1515870810), 1515870810), bit32.bxor(bit32.bxor(36, 1515870810), 1515870810), bit32.bxor(bit32.bxor(31, 1515870810), 1515870810)),
				})
				ht["\82\101\97\108\83\108\105\100\101\114"]:AddToTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = ht["\82\101\97\108\83\108\105\100\101\114"].Instance,
					Name = "\0",
					Rotation = -(-2 + 167),
					Color = o({
						p(0, l((449 - 194), (228 + 27), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
						p(1, l((-713 + 921), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (501 - 293))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l((448 - 193), (-87 + 342), (251 + 4))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = ht["\82\101\97\108\83\108\105\100\101\114"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				ht["\65\99\99\101\110\116"] = bl:Create("\70\114\97\109\101", {
					Parent = ht["\82\101\97\108\83\108\105\100\101\114"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Size = s(((0.5 * 5) / 5), 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (837 - 594), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				ht["\65\99\99\101\110\116"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = ht["\65\99\99\101\110\116"].Instance,
					Name = "\0",
					Rotation = -(244 - 79),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
						p(1, l(bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (1095 - 887), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				ht["\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = ht["\65\99\99\101\110\116"].Instance,
					Name = "\0",
					AnchorPoint = u(1, ((0.5 * 4) / 4)),
					Position = s(1, 0, ((0.5 * 10) / 10), 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					Size = s(0, (-617 + 620), 1, (-30 + 33)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l((81 - 67), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				})
				ht["\68\114\97\103\103\101\114"]:AddToTheme({
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = ht["\68\114\97\103\103\101\114"].Instance,
					Name = "\0",
					Color = l((661 - 649), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-722 + 734)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				ht["\86\97\108\117\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = ht["\83\108\105\100\101\114"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((-232 + 467), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\53\48\37",
					AnchorPoint = u(1, 0),
					Size = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					Position = s(1, 0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l((-53 + 308), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (126 + 129)),
				})
				ht["\86\97\108\117\101"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				ht["\86\97\108\117\101"]:TextBorder()
			end
			function Slider:Get()
				return Slider.Value
			end
			function Slider:SetVisibility(hu)
				ht["\83\108\105\100\101\114"].Instance.Visible = hu
			end
			function Slider:Set(Value)
				Slider.Value = a:Round(v(Value, hs.Min, hs.Max), hs.Decimals)
				a.Flags[Slider.Flag] = Slider.Value
				ht["\65\99\99\101\110\116"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = s((Slider.Value - hs.Min) / (hs.Max - hs.Min), 0, 1, 0),
				})
				ht["\86\97\108\117\101"].Instance.Text = af("\37\115\37\115", tostring(Slider.Value), hs.Suffix)
				if hs.Callback then
					a:SafeCall(hs.Callback, Slider.Value)
				end
			end
			local hv
			ht["\82\101\97\108\83\108\105\100\101\114"]:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Slider.Sliding = (1 == 1)
					local hw = (k.X - ht["\82\101\97\108\83\108\105\100\101\114"].Instance.AbsolutePosition.X) / ht["\82\101\97\108\83\108\105\100\101\114"].Instance.AbsoluteSize.X
					local Value = ((hs.Max - hs.Min) * hw) + hs.Min
					Slider:Set(Value)
					if hv then
						return
					end
					hv = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							Slider.Sliding = (1 == 0)
							hv:Disconnect()
							hv = nil
						end
					end)
				end
			end)
			a:Connect(c.InputChanged, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
					if Slider.Sliding then
						local hx = (k.X - ht["\82\101\97\108\83\108\105\100\101\114"].Instance.AbsolutePosition.X) / ht["\82\101\97\108\83\108\105\100\101\114"].Instance.AbsoluteSize.X
						local Value = ((hs.Max - hs.Min) * hx) + hs.Min
						Slider:Set(Value)
					end
				end
			end)
			ht["\83\108\105\100\101\114"]:OnHover(function()
				ht["\82\101\97\108\83\108\105\100\101\114"]:ChangeItemTheme({
					BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				ht["\82\101\97\108\83\108\105\100\101\114"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
				})
			end)
			ht["\83\108\105\100\101\114"]:OnHoverLeave(function()
				ht["\82\101\97\108\83\108\105\100\101\114"]:ChangeItemTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				ht["\82\101\97\108\83\108\105\100\101\114"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\69\108\101\109\101\110\116"],
				})
			end)
			if hs.Default then
				Slider:Set(hs.Default)
			end
			a.SetFlags[Slider.Flag] = function(Value)
				Slider:Set(Value)
			end
			return Slider, ht
		end
		ge.Label = function(self, hy)
			local Label = {}
			local hz = {}
			do
				hz["\76\97\98\101\108"] = bl:Create("\70\114\97\109\101", {
					Parent = hy.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, (828 - 808)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-313 + 568), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				hz["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = hz["\76\97\98\101\108"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((-522 + 757), (848 - 613), (536 - 301)),
					BorderColor3 = l(0, 0, 0),
					Text = hy.Name,
					Size = s(0, 0, 0, (934 - 919)),
					AnchorPoint = u(0, ((0.5 * 10) / 10)),
					Position = s(0, 0, ((0.5 * 10) / 10), 0),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = (-812 + 821),
					BackgroundColor3 = l((574 - 319), (-478 + 733), (-381 + 636)),
				})
				hz["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				hz["\84\101\120\116"]:TextBorder()
				hz["\83\117\98\69\108\101\109\101\110\116\115"] = bl:Create("\70\114\97\109\101", {
					Parent = hz["\76\97\98\101\108"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					BackgroundTransparency = 1,
					Position = s(0, hz["\84\101\120\116"].Instance.TextBounds.X + (436 - 428), 0, 0),
					Size = s(0, 0, 1, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (19 + 236), (-215 + 470)),
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = hz["\83\117\98\69\108\101\109\101\110\116\115"].Instance,
					Name = "\0",
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = t(0, (-534 + 540)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
			end
			function Label:SetText(Text)
				Text = tostring(Text)
				hz["\84\101\120\116"].Instance.Text = Text
			end
			function Label:SetVisibility(ia)
				hz["\76\97\98\101\108"].Instance.Visible = ia
			end
			return Label, hz
		end
		ge.Dropdown = function(self, ib)
			local Dropdown = {
				Flag = ib.Flag,
				Value = {},
				Options = {},
				IsOpen = (not not false),
			}
			local ic = {}
			do
				ic["\68\114\111\112\100\111\119\110"] = bl:Create("\70\114\97\109\101", {
					Parent = ib.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, (1 + 39)),
					BorderSizePixel = 0,
					BackgroundColor3 = l((476 - 221), (-512 + 767), (574 - 319)),
				})
				ic["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = ic["\68\114\111\112\100\111\119\110"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-127 + 362)),
					BorderColor3 = l(0, 0, 0),
					Text = ib.Name,
					BackgroundTransparency = 1,
					Size = s(0, 0, 0, (229 - 214)),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = (695 - 686),
					BackgroundColor3 = l((-517 + 772), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				ic["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				ic["\84\101\120\116"]:TextBorder()
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = ic["\68\114\111\112\100\111\119\110"].Instance,
					AutoButtonColor = (not not false),
					Text = "",
					Name = "\0",
					AnchorPoint = u(0, 1),
					Position = s(0, 0, 1, 0),
					BorderColor3 = l((741 - 729), (684 - 672), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l((883 - 853), (-161 + 197), bit32.bxor(bit32.bxor(31, 1515870810), 1515870810)),
				})
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:AddToTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance,
					Name = "\0",
					Rotation = -bit32.bxor(bit32.bxor(165, 1515870810), 1515870810),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-700 + 955))),
						p(1, l((-482 + 690), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				ic["\86\97\108\117\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((1184 - 949), (106 + 129), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\45\45",
					AnchorPoint = u(0, ((0.5 * 5) / 5)),
					Size = s(1, -bit32.bxor(bit32.bxor(25, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), ((0.5 * 4) / 4), 0),
					BorderSizePixel = 0,
					TextSize = (903 - 894),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-80 + 335)),
				})
				ic["\86\97\108\117\101"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				ic["\86\97\108\117\101"]:TextBorder()
				ic["\73\99\111\110"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance,
					Name = "\0",
					ImageColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (642 - 399), (-64 + 319)),
					ScaleType = Enum.ScaleType.Fit,
					BorderColor3 = l(0, 0, 0),
					AnchorPoint = u(1, ((0.5 * 10) / 10)),
					Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\49\51\50\50\57\49\55\54\56\56\54\52\57\51",
					BackgroundTransparency = 1,
					Position = s(1, -(-474 + 476), ((0.5 * 4) / 4), 0),
					Size = s(0, (436 - 416), 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					BackgroundColor3 = l((-481 + 736), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1052 - 797)),
				})
				ic["\73\99\111\110"]:AddToTheme({
					ImageColor3 = "\65\99\99\101\110\116",
				})
				ic["\79\112\116\105\111\110\72\111\108\100\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = a.UnusedHolder.Instance,
					Name = "\0",
					Visible = (not not false),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (493 - 481), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					Position = s(0, 0, 1, (-48 + 56)),
					Size = s(1, 0, 0, (732 - 707)),
					ZIndex = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = l((156 - 136), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), (851 - 830)),
				})
				ic["\79\112\116\105\111\110\72\111\108\100\101\114"]:AddToTheme({
					BackgroundColor3 = "\73\110\108\105\110\101",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (418 - 369), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance,
					Name = "\0",
					PaddingTop = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
					PaddingBottom = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
					PaddingRight = t(0, (-384 + 389)),
					PaddingLeft = t(0, (-623 + 631)),
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance,
					Name = "\0",
					Padding = t(0, (368 - 365)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
			end
			function Dropdown:Get()
				return Dropdown.Value
			end
			local id = (1 == 0)
			local ie
			function Dropdown:SetOpen(ig)
				if id then
					return
				end
				Dropdown.IsOpen = ig
				id = (not false)
				if Dropdown.IsOpen then
					ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Visible = (1 == 1)
					ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Parent = a.Holder.Instance
					ic["\73\99\111\110"]:Tween(nil, {
						Rotation = -bit32.bxor(bit32.bxor(90, 1515870810), 1515870810),
					})
					ie = f.RenderStepped:Connect(function()
						ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Position = s(0, ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance.AbsolutePosition.X, 0, ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance.AbsolutePosition.Y + ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance.AbsoluteSize.Y + (-188 + 193))
						ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Size = s(0, ic["\82\101\97\108\68\114\111\112\100\111\119\110"].Instance.AbsoluteSize.X, 0, 0)
					end)
					if not id then
						for Index, Value in a.OpenFrames do
							if Value ~= Dropdown then
								Value:SetOpen((1 == 0))
							end
						end
						a.OpenFrames[Dropdown] = Dropdown
					end
				else
					if not id then
						if a.OpenFrames[Dropdown] then
							a.OpenFrames[Dropdown] = nil
						end
					end
					if ie then
						ie:Disconnect()
						ie = nil
					end
					ic["\73\99\111\110"]:Tween(nil, {
						Rotation = 0,
					})
				end
				local ih = ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance:GetDescendants()
				z(ih, ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance)
				local ii
				for Index, Value in ih do
					local ij = ar:GetProperty(Value)
					if not ij then
						continue
					end
					if type(ij) == "\116\97\98\108\101" then
						for _, ik in ij do
							ii = ar:FadeItem(Value, ik, ig, a.FadeSpeed)
						end
					else
						ii = ar:FadeItem(Value, ij, ig, a.FadeSpeed)
					end
				end
				ii.Tween.Completed:Connect(function()
					id = (not true)
					ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Visible = Dropdown.IsOpen
					task.wait(((0.2 * 10) / 10))
					ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance.Parent = not Dropdown.IsOpen and a.UnusedHolder.Instance or a.Holder.Instance
				end)
			end
			function Dropdown:SetVisibility(il)
				ic["\68\114\111\112\100\111\119\110"].Instance.Visible = il
			end
			function Dropdown:Set(im)
				if ib.Multi then
					if type(im) ~= "\116\97\98\108\101" then
						return
					end
					Dropdown.Value = im
					a.Flags[Dropdown.Flag] = im
					for Index, Value in im do
						local io = Dropdown.Options[Value]
						if not io then
							continue
						end
						io.Selected = (not not true)
						io:Toggle("\65\99\116\105\118\101")
					end
					ic["\86\97\108\117\101"].Instance.Text = ac(im, "\44\32")
				else
					if not Dropdown.Options[im] then
						return
					end
					local ip = Dropdown.Options[im]
					Dropdown.Value = im
					a.Flags[Dropdown.Flag] = im
					for Index, Value in Dropdown.Options do
						if Value ~= ip then
							Value.Selected = (not true)
							Value:Toggle("\73\110\97\99\116\105\118\101")
						else
							Value.Selected = (not false)
							Value:Toggle("\65\99\116\105\118\101")
						end
					end
					ic["\86\97\108\117\101"].Instance.Text = im
				end
				if ib.Callback then
					a:SafeCall(ib.Callback, Dropdown.Value)
				end
			end
			function Dropdown:Add(iq)
				local ir = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = ic["\79\112\116\105\111\110\72\111\108\100\101\114"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((617 - 382), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = iq,
					AutoButtonColor = (not not false),
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = s(1, 0, 0, (283 - 268)),
					ZIndex = (-459 + 464),
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l((1170 - 915), (862 - 607), (-401 + 656)),
				})
				ir:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				local is = {
					Button = ir,
					Name = iq,
					Selected = (1 == 0),
				}
				function is:Toggle(Status)
					if Status == "\65\99\116\105\118\101" then
						is.Button:ChangeItemTheme({
							TextColor3 = "\65\99\99\101\110\116",
						})
						is.Button:Tween(nil, {
							TextColor3 = a.Theme.Accent,
						})
					else
						is.Button:ChangeItemTheme({
							TextColor3 = "\84\101\120\116",
						})
						is.Button:Tween(nil, {
							TextColor3 = a.Theme.Text,
						})
					end
				end
				function is:Set()
					is.Selected = not is.Selected
					if ib.Multi then
						local it = aa(Dropdown.Value, is.Name)
						if it then
							ab(Dropdown.Value, it)
						else
							z(Dropdown.Value, is.Name)
						end
						is:Toggle(it and "\73\110\97\99\116\105\118\101" or "\65\99\116\105\118\101")
						a.Flags[Dropdown.Flag] = Dropdown.Value
						local iu = #Dropdown.Value > 0 and ac(Dropdown.Value, "\44\32") or "\45\45"
						ic["\86\97\108\117\101"].Instance.Text = iu
					else
						if is.Selected then
							Dropdown.Value = is.Name
							a.Flags[Dropdown.Flag] = is.Name
							is.Selected = (1 == 1)
							is:Toggle("\65\99\116\105\118\101")
							for Index, Value in Dropdown.Options do
								if Value ~= is then
									Value.Selected = (not not false)
									Value:Toggle("\73\110\97\99\116\105\118\101")
								end
							end
							ic["\86\97\108\117\101"].Instance.Text = is.Name
						else
							Dropdown.Value = nil
							a.Flags[Dropdown.Flag] = nil
							is.Selected = (not not false)
							is:Toggle("\73\110\97\99\116\105\118\101")
							ic["\86\97\108\117\101"].Instance.Text = "\45\45"
						end
					end
					if ib.Callback then
						a:SafeCall(ib.Callback, Dropdown.Value)
					end
				end
				is.Button:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
					is:Set()
				end)
				Dropdown.Options[is.Name] = is
				return is
			end
			function Dropdown:Remove(iv)
				if not Dropdown.Options[iv] then
					return
				end
				Dropdown.Options[iv].Button:Clean()
				Dropdown.Options[iv] = nil
			end
			function Dropdown:Refresh(List)
				for Index, Value in Dropdown.Options do
					Dropdown:Remove(Value.Name)
				end
				for Index, Value in List do
					Dropdown:Add(Value)
				end
			end
			ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				Dropdown:SetOpen(not Dropdown.IsOpen)
			end)
			ic["\68\114\111\112\100\111\119\110"]:OnHover(function()
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:ChangeItemTheme({
					BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
				})
			end)
			ic["\68\114\111\112\100\111\119\110"]:OnHoverLeave(function()
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:ChangeItemTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				ic["\82\101\97\108\68\114\111\112\100\111\119\110"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\69\108\101\109\101\110\116"],
				})
			end)
			a:Connect(c.InputBegan, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Dropdown.IsOpen then
						return
					end
					if a:IsMouseOverFrame(ic["\79\112\116\105\111\110\72\111\108\100\101\114"]) then
						return
					end
					Dropdown:SetOpen((not true))
				end
			end)
			for Index, Value in ib.Items do
				Dropdown:Add(Value)
			end
			if ib.Default then
				Dropdown:Set(ib.Default)
			end
			a.SetFlags[Dropdown.Flag] = function(Value)
				Dropdown:Set(Value)
			end
			return Dropdown, ic
		end
		ge.ColorpickerTab = function(self, iw)
			if not iw.Pages then
				return
			end
			local ix = {
				Name = iw.Name,
				Active = (1 == 0),
			}
			local iy = {}
			do
				iy["\73\110\97\99\116\105\118\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = iw.PageHolder.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((1173 - 938), (1079 - 844), (-712 + 947)),
					BorderColor3 = l(0, 0, 0),
					Text = ix.Name,
					AutoButtonColor = (not not false),
					Size = s(1, 0, 1, 0),
					BorderSizePixel = 0,
					TextSize = (951 - 942),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), (-321 + 345), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
				})
				iy["\73\110\97\99\116\105\118\101"]:AddToTheme({
					BackgroundColor3 = "\73\110\108\105\110\101",
				})
				iy["\73\110\97\99\116\105\118\101"]:TextBorder()
				iy["\80\97\103\101\67\111\110\116\101\110\116"] = bl:Create("\70\114\97\109\101", {
					Parent = iw.ContentHolder.Instance,
					Name = "\0",
					Visible = (1 == 0),
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (141 + 114)),
				})
			end
			function ix:Turn(iz)
				ix.Active = iz
				if ix.Active then
					iy["\80\97\103\101\67\111\110\116\101\110\116"].Instance.Visible = (not false)
					iy["\80\97\103\101\67\111\110\116\101\110\116"].Instance.Parent = iw.ContentHolder.Instance
					iy["\73\110\97\99\116\105\118\101"]:ChangeItemTheme({
						BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
					})
					iy["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Background,
					})
				else
					iy["\80\97\103\101\67\111\110\116\101\110\116"].Instance.Visible = (1 == 0)
					iy["\80\97\103\101\67\111\110\116\101\110\116"].Instance.Parent = a.UnusedHolder.Instance
					iy["\73\110\97\99\116\105\118\101"]:ChangeItemTheme({
						BackgroundColor3 = "\73\110\108\105\110\101",
					})
					iy["\73\110\97\99\116\105\118\101"]:Tween(nil, {
						BackgroundColor3 = a.Theme.Inline,
					})
				end
			end
			iy["\73\110\97\99\116\105\118\101"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				for Index, Value in iw.Stack do
					Value:Turn(Value == ix)
				end
			end)
			if #iw.Stack == 0 then
				ix:Turn((not false))
			end
			z(iw.Stack, ix)
			return ix, iy
		end
		ge.CreateSubPaletteItems = function(self, ja)
			ja["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Size = s(0, (839 - 668), 0, (-623 + 791))
			ja["\80\97\108\101\116\116\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
				Parent = ja["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(0, 0, 0),
				BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (858 - 809), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				Text = "",
				AutoButtonColor = (1 == 0),
				Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				Size = s(1, -(659 - 618), 1, -bit32.bxor(bit32.bxor(41, 1515870810), 1515870810)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				TextSize = bit32.bxor(bit32.bxor(14, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(157, 1515870810), 1515870810), bit32.bxor(bit32.bxor(175, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			ja["\80\97\108\101\116\116\101"]:AddToTheme({
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\80\97\108\101\116\116\101"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (975 - 963), (218 - 206)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			ja["\83\97\116\117\114\97\116\105\111\110"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = ja["\80\97\108\101\116\116\101"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Image = a:GetImage("\83\97\116\117\114\97\116\105\111\110"),
				BackgroundTransparency = 1,
				Size = s(1, 0, 1, 0),
				ZIndex = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BorderSizePixel = 0,
				BackgroundColor3 = l((409 - 154), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1055 - 800)),
			})
			ja["\86\97\108\117\101"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = ja["\80\97\108\101\116\116\101"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Size = s(1, (-966 + 968), 1, 0),
				Image = a:GetImage("\86\97\108\117\101"),
				BackgroundTransparency = 1,
				Position = s(0, -1, 0, 0),
				ZIndex = (2 + 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l((58 + 197), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1031 - 776)),
			})
			ja["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ja["\80\97\108\101\116\116\101"].Instance,
				Name = "\0",
				Position = s(0, (-455 + 463), 0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				ZIndex = (855 - 850),
				BorderColor3 = l(0, 0, 0),
				Size = s(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (962 - 707)),
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"].Instance,
				Name = "\0",
				Color = l((449 - 437), (-508 + 520), (-915 + 927)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			ja["\72\117\101"] = bl:Create("\70\114\97\109\101", {
				Parent = ja["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
				Name = "\0",
				Active = (1 == 1),
				BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (413 - 364), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				AnchorPoint = u(1, 0),
				Position = s(1, -bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (-441 + 449)),
				Size = s(0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810)),
				Selectable = (not false),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BackgroundColor3 = l((257 - 2), (978 - 723), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			ja["\72\117\101"]:AddToTheme({
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\72\117\101"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (880 - 868), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			ja["\72\117\101\73\110\108\105\110\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
				Parent = ja["\72\117\101"].Instance,
				Text = "",
				AutoButtonColor = (not not false),
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 1, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = l((1251 - 996), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (511 - 256)),
			})
			bl:Create("\85\73\71\114\97\100\105\101\110\116", {
				Parent = ja["\72\117\101\73\110\108\105\110\101"].Instance,
				Name = "\0",
				Rotation = (1047 - 957),
				Color = o({
					p(0, l((781 - 526), 0, 0)),
					p(((0.17 * 4) / 4), l((-171 + 426), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), 0)),
					p(((0.33 * 10) / 10), l(0, (-526 + 781), 0)),
					p(((0.5 * 4) / 4), l(0, (-118 + 373), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
					p(((0.67 * 10) / 10), l(0, 0, bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
					p(((0.83 * 10) / 10), l((-273 + 528), 0, (291 - 36))),
					p(1, l((121 + 134), 0, 0)),
				}),
			})
			ja["\72\117\101\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ja["\72\117\101"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\72\117\101\68\114\97\103\103\101\114"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (115 - 103), (-158 + 170)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			ja["\65\108\112\104\97"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
				Parent = ja["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(0, 0, 0),
				BorderColor3 = l((700 - 658), (824 - 775), (-354 + 399)),
				Text = "",
				AutoButtonColor = (not not false),
				AnchorPoint = u(0, 1),
				Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				Size = s(1, -bit32.bxor(bit32.bxor(41, 1515870810), 1515870810), 0, (752 - 737)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				TextSize = (112 - 98),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(157, 1515870810), 1515870810), bit32.bxor(bit32.bxor(175, 1515870810), 1515870810), (-455 + 710)),
			})
			ja["\65\108\112\104\97"]:AddToTheme({
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\65\108\112\104\97"].Instance,
				Name = "\0",
				Color = l((747 - 735), (-664 + 676), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			ja["\67\104\101\99\107\101\114\115"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = ja["\65\108\112\104\97"].Instance,
				Name = "\0",
				ScaleType = Enum.ScaleType.Tile,
				BorderColor3 = l(0, 0, 0),
				TileSize = s(0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810)),
				Image = a:GetImage("\67\104\101\99\107\101\114\115"),
				BackgroundTransparency = 1,
				Size = s(1, 0, 1, 0),
				ZIndex = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-200 + 455)),
			})
			bl:Create("\85\73\71\114\97\100\105\101\110\116", {
				Parent = ja["\67\104\101\99\107\101\114\115"].Instance,
				Name = "\0",
				Transparency = q({
					r(0, 1),
					r(((0.37 * 2) / 2), ((0.5 * 10) / 10)),
					r(1, 0),
				}),
			})
			ja["\65\108\112\104\97\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ja["\65\108\112\104\97"].Instance,
				Name = "\0",
				ZIndex = (307 - 302),
				BorderColor3 = l(0, 0, 0),
				Size = s(0, 1, 1, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = l((-34 + 289), (-103 + 358), (-561 + 816)),
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ja["\65\108\112\104\97\68\114\97\103\103\101\114"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-499 + 511), (545 - 533)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
		end
		ge.Colorpicker = function(self, jb)
			local jc = {
				IsOpen = (not not false),
				Hue = 0,
				Saturation = 0,
				Value = 0,
				Alpha = 0,
				Color = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-554 + 809)),
				HexValue = "\35\102\102\102\102\102\102",
				Pages = jb.Pages and {} or nil,
				Flag = jb.Flag,
			}
			local jd
			local je = {}
			do
				je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = jb.Parent.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-923 + 935)),
					Text = "",
					AutoButtonColor = (not not false),
					Position = s(0, -bit32.bxor(bit32.bxor(123, 1515870810), 1515870810), 0, 0),
					Size = s(0, (811 - 796), 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BorderSizePixel = (-204 + 206),
					TextSize = bit32.bxor(bit32.bxor(14, 1515870810), 1515870810),
					BackgroundColor3 = l((147 + 10), (-117 + 292), (-389 + 644)),
				})
				je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"]:AddToTheme({
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (-887 + 936), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110\73\110\108\105\110\101"] = bl:Create("\70\114\97\109\101", {
					Parent = je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"].Instance,
					Name = "\0",
					Position = s(0, 1, 0, 1),
					BorderColor3 = l(0, 0, 0),
					Size = s(1, -bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, -(920 - 918)),
					BorderSizePixel = 0,
					BackgroundColor3 = l((978 - 821), (27 + 148), (612 - 357)),
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110\73\110\108\105\110\101"].Instance,
					Name = "\0",
					Rotation = -(-714 + 879),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
						p(1, l(bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (1057 - 849))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l((-92 + 347), (830 - 575), (-357 + 612))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = a.UnusedHolder.Instance,
					Text = "",
					AutoButtonColor = (1 == 0),
					Name = "\0",
					Position = s(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					BorderColor3 = l((-811 + 823), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (520 - 508)),
					Size = s(0, bit32.bxor(bit32.bxor(266, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(258, 1515870810), 1515870810)),
					BorderSizePixel = (-211 + 213),
					BackgroundColor3 = l((-273 + 287), (-457 + 474), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				})
				je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"]:AddToTheme({
					BorderColor3 = "\66\111\114\100\101\114",
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
					Name = "\0",
					Color = l((-769 + 811), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (-533 + 578)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				if jb.Pages then
					je["\80\97\103\101\115"] = bl:Create("\70\114\97\109\101", {
						Parent = je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
						Name = "\0",
						BackgroundTransparency = 1,
						BorderColor3 = l(0, 0, 0),
						Size = s(1, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
						BorderSizePixel = 0,
						BackgroundColor3 = l((495 - 240), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (476 - 221)),
					})
					bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
						Parent = je["\80\97\103\101\115"].Instance,
						Name = "\0",
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalFlex = Enum.UIFlexAlignment.Fill,
					})
					je["\67\111\110\116\101\110\116"] = bl:Create("\70\114\97\109\101", {
						Parent = je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance,
						Name = "\0",
						BackgroundTransparency = 1,
						Position = s(0, 0, 0, (760 - 735)),
						BorderColor3 = l(0, 0, 0),
						Size = s(1, 0, 1, -(586 - 561)),
						BorderSizePixel = 0,
						BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-333 + 588)),
					})
				else
					ge:CreateSubPaletteItems(je)
				end
			end
			local jf, jg = ge:ColorpickerTab({
				ContentHolder = je["\67\111\110\116\101\110\116"],
				Pages = jc.Pages,
				PageHolder = je["\80\97\103\101\115"],
				Stack = jc.Pages,
				Name = "\67\111\108\111\114",
			})
			local jh, ji = ge:ColorpickerTab({
				ContentHolder = je["\67\111\110\116\101\110\116"],
				Pages = jc.Pages,
				PageHolder = je["\80\97\103\101\115"],
				Stack = jc.Pages,
				Name = "\65\110\105\109\97\116\105\111\110\115",
			})
			local jj, jk = ge:ColorpickerTab({
				ContentHolder = je["\67\111\110\116\101\110\116"],
				Pages = jc.Pages,
				PageHolder = je["\80\97\103\101\115"],
				Stack = jc.Pages,
				Name = "\79\116\104\101\114",
			})
			local jl = jc.Color
			local jm = jc.Alpha
			local jn
			local jo, jp
			local jq, jr
			local js, jt
			local ju, jv
			local jw, jx
			local jy, jz
			if jf then
				je["\80\97\108\101\116\116\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = jg["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (-13 + 62), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					Text = "",
					AutoButtonColor = (1 == 0),
					Position = s(0, (-25 + 33), 0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
					Size = s(1, -bit32.bxor(bit32.bxor(46, 1515870810), 1515870810), 1, -(235 - 189)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					TextSize = (346 - 332),
					BackgroundColor3 = l((790 - 633), bit32.bxor(bit32.bxor(175, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\80\97\108\101\116\116\101"]:AddToTheme({
					BorderColor3 = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\80\97\108\101\116\116\101"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-748 + 760), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				je["\83\97\116\117\114\97\116\105\111\110"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = je["\80\97\108\101\116\116\101"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Image = a:GetImage("\83\97\116\117\114\97\116\105\111\110"),
					BackgroundTransparency = 1,
					Size = s(1, 0, 1, 0),
					ZIndex = (-493 + 495),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\86\97\108\117\101"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = je["\80\97\108\101\116\116\101"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Size = s(1, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 1, 0),
					Image = a:GetImage("\86\97\108\117\101"),
					BackgroundTransparency = 1,
					Position = s(0, -1, 0, 0),
					ZIndex = (101 - 98),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-2 + 257), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = je["\80\97\108\101\116\116\101"].Instance,
					Name = "\0",
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (-891 + 899)),
					BorderColor3 = l(0, 0, 0),
					Size = s(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					ZIndex = bit32.bxor(bit32.bxor(5, 1515870810), 1515870810),
					BackgroundColor3 = l((361 - 106), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"].Instance,
					Name = "\0",
					Color = l((-938 + 950), (-554 + 566), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				je["\72\117\101"] = bl:Create("\70\114\97\109\101", {
					Parent = jg["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					Active = (not false),
					BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (686 - 641)),
					AnchorPoint = u(1, 0),
					Position = s(1, -bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (535 - 527)),
					Size = s(0, (537 - 517), 1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810)),
					Selectable = (not false),
					BorderSizePixel = (-19 + 21),
					BackgroundColor3 = l((1137 - 882), (-404 + 659), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\72\117\101"]:AddToTheme({
					BorderColor3 = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\72\117\101"].Instance,
					Name = "\0",
					Color = l((215 - 203), (-866 + 878), (399 - 387)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				je["\72\117\101\73\110\108\105\110\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = je["\72\117\101"].Instance,
					AutoButtonColor = (not true),
					Text = "",
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 1, 0),
					BorderSizePixel = 0,
					BackgroundColor3 = l((325 - 70), (309 - 54), (1126 - 871)),
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = je["\72\117\101\73\110\108\105\110\101"].Instance,
					Name = "\0",
					Rotation = bit32.bxor(bit32.bxor(90, 1515870810), 1515870810),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), 0, 0)),
						p(((0.17 * 10) / 10), l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1142 - 887), 0)),
						p(((0.33 * 2) / 2), l(0, bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), 0)),
						p(((0.5 * 4) / 4), l(0, bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
						p(((0.67 * 2) / 2), l(0, 0, (450 - 195))),
						p(((0.83 * 2) / 2), l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), 0, (-301 + 556))),
						p(1, l((1208 - 953), 0, 0)),
					}),
				})
				je["\72\117\101\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = je["\72\117\101"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, 1),
					BorderSizePixel = 0,
					BackgroundColor3 = l((1210 - 955), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (757 - 502)),
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\72\117\101\68\114\97\103\103\101\114"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-699 + 711), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				je["\65\108\112\104\97"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = jg["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(0, 0, 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (-372 + 421), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					Text = "",
					AutoButtonColor = (1 == 0),
					AnchorPoint = u(0, 1),
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
					Size = s(1, -(-681 + 727), 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					BorderSizePixel = (349 - 347),
					TextSize = (162 - 148),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(157, 1515870810), 1515870810), bit32.bxor(bit32.bxor(175, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\65\108\112\104\97"]:AddToTheme({
					BorderColor3 = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\65\108\112\104\97"].Instance,
					Name = "\0",
					Color = l((-210 + 222), (-222 + 234), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				je["\67\104\101\99\107\101\114\115"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = je["\65\108\112\104\97"].Instance,
					Name = "\0",
					ScaleType = Enum.ScaleType.Tile,
					BorderColor3 = l(0, 0, 0),
					TileSize = s(0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(6, 1515870810), 1515870810)),
					Image = a:GetImage("\67\104\101\99\107\101\114\115"),
					BackgroundTransparency = 1,
					Size = s(1, 0, 1, 0),
					ZIndex = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-31 + 286)),
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = je["\67\104\101\99\107\101\114\115"].Instance,
					Name = "\0",
					Transparency = q({
						r(0, 1),
						r(((0.37 * 10) / 10), ((0.5 * 10) / 10)),
						r(1, 0),
					}),
				})
				je["\65\108\112\104\97\68\114\97\103\103\101\114"] = bl:Create("\70\114\97\109\101", {
					Parent = je["\65\108\112\104\97"].Instance,
					Name = "\0",
					BorderColor3 = l(0, 0, 0),
					Size = s(0, 1, 1, 0),
					ZIndex = (650 - 645),
					BorderSizePixel = 0,
					BackgroundColor3 = l((663 - 408), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (419 - 164)),
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\65\108\112\104\97\68\114\97\103\103\101\114"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (235 - 223), (-898 + 910)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
			end
			if jh then
				jo, jp = ge:Dropdown({
					Parent = ji["\80\97\103\101\67\111\110\116\101\110\116"],
					Name = "\65\110\105\109\97\116\105\111\110\115",
					Items = {
						"\82\97\105\110\98\111\119",
						"\70\97\100\101",
						"\70\97\100\101\32\97\108\112\104\97",
						"\76\105\110\101\97\114",
					},
					Default = nil,
					Flag = jc.Flag .. "\65\110\105\109\97\116\105\111\110",
					Multi = (not not false),
					Debounce = jc,
					Callback = function(Value)
						jn = Value
						if Value == "\82\97\105\110\98\111\119" then
							if jq and js and jy then
								jq:SetVisibility((not not false))
								js:SetVisibility((not true))
								jz["\83\108\105\100\101\114"].Instance.Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (976 - 931))
							end
							jl = jc.Color
							a:Thread(function()
								while task.wait() do
									local ka = x(y(tick() * (jy.Value / (48 - 23))))
									local kb = m(ka, 1, 1)
									jc:Set(kb, jc.Alpha)
									jd((1 == 1))
									if jn ~= "\82\97\105\110\98\111\119" then
										jc:Set(jl, jc.Alpha)
										break
									end
								end
							end)
						elseif Value == "\70\97\100\101" then
							if jq and js and jy then
								jq:SetVisibility((not not true))
								js:SetVisibility((not true))
								jz["\83\108\105\100\101\114"].Instance.Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(65, 1515870810), 1515870810))
								jl = jc.Color
								a:Thread(function()
									while task.wait() do
										local kc = x(y(tick() * (jy.Value / bit32.bxor(bit32.bxor(25, 1515870810), 1515870810))))
										jc:Set(ju.Color:Lerp(l(0, 0, 0), kc), jc.Alpha)
										jd((1 == 1))
										if jn ~= "\70\97\100\101" then
											jc:Set(jl, jc.Alpha)
											break
										end
									end
								end)
							end
						elseif Value == "\70\97\100\101\32\97\108\112\104\97" then
							if jq and js then
								jq:SetVisibility((not not false))
								js:SetVisibility((not not false))
								jz["\83\108\105\100\101\114"].Instance.Position = s(0, (-914 + 922), 0, bit32.bxor(bit32.bxor(45, 1515870810), 1515870810))
								jm = jc.Alpha
								a:Thread(function()
									while task.wait() do
										local kd = x(y(tick() * (jy.Value / bit32.bxor(bit32.bxor(25, 1515870810), 1515870810))))
										jc:Set(jc.Color, kd)
										jd((not not true))
										if jn ~= "\70\97\100\101\32\97\108\112\104\97" then
											jc:Set(jc.Color, jm)
											break
										end
									end
								end)
							end
						elseif Value == "\76\105\110\101\97\114" then
							if jq and js then
								jq:SetVisibility((1 == 1))
								js:SetVisibility((1 == 1))
								jz["\83\108\105\100\101\114"].Instance.Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(85, 1515870810), 1515870810))
								jl = jc.Color
								a:Thread(function()
									while task.wait() do
										local ke = x(y(tick() * (jy.Value / bit32.bxor(bit32.bxor(25, 1515870810), 1515870810))))
										jc:Set(ju.Color:Lerp(jw.Color, ke), jc.Alpha)
										jd((not false))
										if jn ~= "\76\105\110\101\97\114" then
											jc:Set(jl, jc.Alpha)
											break
										end
									end
								end)
							end
						end
					end,
				})
				jp["\68\114\111\112\100\111\119\110"].Instance.Position = s(0, (352 - 344), 0, 0)
				jp["\68\114\111\112\100\111\119\110"].Instance.Size = s(1, -(19 - 3), 0, bit32.bxor(bit32.bxor(40, 1515870810), 1515870810))
				jq, jr = ge:Label({
					Parent = ji["\80\97\103\101\67\111\110\116\101\110\116"],
					Name = "\75\101\121\102\114\97\109\101\32\49",
				})
				jr["\76\97\98\101\108"].Instance.Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(45, 1515870810), 1515870810))
				jr["\76\97\98\101\108"].Instance.Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810))
				js, jt = ge:Label({
					Parent = ji["\80\97\103\101\67\111\110\116\101\110\116"],
					Name = "\75\101\121\102\114\97\109\101\32\50",
				})
				jt["\76\97\98\101\108"].Instance.Position = s(0, (-103 + 111), 0, bit32.bxor(bit32.bxor(65, 1515870810), 1515870810))
				jt["\76\97\98\101\108"].Instance.Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810))
				ju, jv = ge:Colorpicker({
					Parent = jr["\83\117\98\69\108\101\109\101\110\116\115"],
					Alpha = 0,
					Pages = (not not false),
					Default = Color3.fromRGB(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
					Flag = jc.Flag .. "\65\110\105\109\97\116\105\111\110" .. "\75\101\121\102\114\97\109\101\49",
					Debounce = jc,
				})
				jw, jx = ge:Colorpicker({
					Parent = jt["\83\117\98\69\108\101\109\101\110\116\115"],
					Alpha = 0,
					Pages = (not not false),
					Default = Color3.fromRGB(0, 0, 0),
					Debounce = jc,
					Flag = jc.Flag .. "\65\110\105\109\97\116\105\111\110" .. "\75\101\121\102\114\97\109\101\50",
				})
				jy, jz = ge:Slider({
					Parent = ji["\80\97\103\101\67\111\110\116\101\110\116"],
					Name = "\83\112\101\101\100",
					Flag = jc.Flag .. "\65\110\105\109\97\116\105\111\110\83\112\101\101\100",
					Min = 0,
					Max = (572 - 472),
					Decimals = ((0.1 * 10) / 10),
					Default = (783 - 763),
					Suffix = "%",
				})
				jz["\83\108\105\100\101\114"].Instance.Position = s(0, (329 - 321), 0, bit32.bxor(bit32.bxor(85, 1515870810), 1515870810))
				jz["\83\108\105\100\101\114"].Instance.Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(28, 1515870810), 1515870810))
			end
			local kf
			if jj then
				je["\67\117\114\114\101\110\116\67\111\108\111\114"] = bl:Create("\70\114\97\109\101", {
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
					BorderColor3 = l((-633 + 675), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (692 - 647)),
					Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(50, 1515870810), 1515870810)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l((51 + 106), bit32.bxor(bit32.bxor(175, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\67\117\114\114\101\110\116\67\111\108\111\114"]:AddToTheme({
					BorderColor3 = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = je["\67\117\114\114\101\110\116\67\111\108\111\114"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-717 + 729), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = je["\67\117\114\114\101\110\116\67\111\108\111\114"].Instance,
					Name = "\0",
					Rotation = bit32.bxor(bit32.bxor(82, 1515870810), 1515870810),
					Color = o({
						p(0, l((1010 - 755), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
						p(1, l((1136 - 982), (-447 + 601), (-632 + 786))),
					}),
				})
				je["\82\71\66\67\111\108\111\114"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((-402 + 637), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\82\71\66\58",
					Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					Position = s(0, (-493 + 501), 0, bit32.bxor(bit32.bxor(65, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					RichText = (not not true),
					TextSize = (-407 + 416),
					BackgroundColor3 = l((1212 - 957), (549 - 294), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				je["\72\69\88\67\111\108\111\114"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((1172 - 937), (809 - 574), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\72\69\88\58",
					Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					Position = s(0, (115 - 107), 0, bit32.bxor(bit32.bxor(85, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					RichText = (1 == 1),
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l((1198 - 943), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-347 + 602)),
				})
				je["\72\83\86\67\111\108\111\114"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((-610 + 845), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\72\83\86\58",
					Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, (613 - 598)),
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(105, 1515870810), 1515870810)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BorderSizePixel = 0,
					RichText = (not not true),
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1178 - 923), (194 + 61)),
				})
				local kg, kh = ge:Button({
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"],
				})
				kh["\66\117\116\116\111\110"].Instance.Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(145, 1515870810), 1515870810))
				kh["\66\117\116\116\111\110"].Instance.Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, (-679 + 699))
				kg:Add("\67\111\112\121", function()
					a.CopiedColor = jc.Color
				end)
				kg:Add("\80\97\115\116\101", function()
					if a.CopiedColor then
						jc:Set(a.CopiedColor)
					end
				end)
				local ki = {}
				kf = (1 == 0)
				local SyncColorpickersToggle, kj = ge:Toggle({
					Parent = jk["\80\97\103\101\67\111\110\116\101\110\116"],
					Flag = "\83\121\110\99\67\111\108\111\114\112\105\99\107\101\114\115" .. jc.Flag,
					Name = "\83\121\110\99\32\99\111\108\111\114\112\105\99\107\101\114\115",
					Default = (not true),
					Callback = function(Value)
						kf = Value
						if Value then
							for Index, Value in a.Colorpickers do
								ki[Value] = Value.Color
								Value:Set(jc.Color)
							end
						else
							for Index, Value in a.Colorpickers do
								if ki[Value] then
									Value:Set(ki[Value])
								end
							end
						end
					end,
				})
				kj["\84\111\103\103\108\101"].Instance.Position = s(0, (307 - 299), 0, (-598 + 723))
				kj["\84\111\103\103\108\101"].Instance.Size = s(1, -(25 - 9), 0, (-556 + 568))
			end
			local kk = (not not false)
			local kl
			function jc:SetOpen(km)
				if kk then
					return
				end
				jc.IsOpen = km
				kk = (not false)
				if jc.IsOpen then
					je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Visible = (1 == 1)
					je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Parent = a.Holder.Instance
					kl = f.RenderStepped:Connect(function()
						je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Position = s(0, je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"].Instance.AbsolutePosition.X, 0, je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"].Instance.AbsolutePosition.Y + je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"].Instance.AbsoluteSize.Y + (772 - 767))
					end)
					if not jb.Debounce then
						for Index, Value in a.OpenFrames do
							if Value ~= jc and Value ~= jp then
								Value:SetOpen((not not false))
							end
						end
						a.OpenFrames[jc] = jc
					end
				else
					if not jb.Debounce then
						if a.OpenFrames[jc] then
							a.OpenFrames[jc] = nil
						end
					end
					if kl then
						kl:Disconnect()
						kl = nil
					end
				end
				local kn = je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance:GetDescendants()
				z(kn, je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance)
				local ko
				for Index, Value in kn do
					local kp = ar:GetProperty(Value)
					if not kp then
						continue
					end
					if type(kp) == "\116\97\98\108\101" then
						for _, kq in kp do
							ko = ar:FadeItem(Value, kq, km, a.FadeSpeed)
						end
					else
						ko = ar:FadeItem(Value, kp, km, a.FadeSpeed)
					end
				end
				ko.Tween.Completed:Connect(function()
					kk = (not true)
					je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Visible = jc.IsOpen
					task.wait(((0.2 * 10) / 10))
					je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"].Instance.Parent = not jc.IsOpen and a.UnusedHolder.Instance or a.Holder.Instance
				end)
			end
			jd = function(kr)
				if kf and kr then
					for Index, Value in a.Colorpickers do
						if Value ~= jc and not ag(Value.Flag, "\84\104\101\109\101") then
							Value:Set(jc.Color)
						end
					end
				end
			end
			function jc:Update(ks, kt)
				local Hue, Saturation, Value = jc.Hue, jc.Saturation, jc.Value
				jc.Color = m(Hue, Saturation, Value)
				jc.HexValue = jc.Color:ToHex()
				a.Flags[jc.Flag] = {
					Alpha = jc.Alpha,
					Color = jc.HexValue,
				}
				je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"]:Tween(nil, {
					BackgroundColor3 = jc.Color,
				})
				je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110\73\110\108\105\110\101"]:Tween(nil, {
					BackgroundColor3 = jc.Color,
				})
				jd(kt)
				if jj then
					je["\67\117\114\114\101\110\116\67\111\108\111\114"]:Tween(nil, {
						BackgroundColor3 = jc.Color,
					})
					local ku = w(jc.Color.R * bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
					local kv = w(jc.Color.G * (163 + 92))
					local kw = w(jc.Color.B * bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))
					local kx = tostring(ku) .. "\44\32" .. tostring(kv) .. "\44\32" .. tostring(kw)
					local ky, kz, la = a:Round(Hue, ((0.01 * 4) / 4)), a:Round(Saturation, ((0.01 * 2) / 2)), a:Round(Value, ((0.01 * 4) / 4))
					je["\82\71\66\67\111\108\111\114"].Instance.Text = "\82\71\66\58\32" .. a:ToRich(kx, jc.Color)
					je["\72\83\86\67\111\108\111\114"].Instance.Text = `HSV: %{a:ToRich(ky, jc.Color)}, %{a:ToRich(kz, jc.Color)}, %{a:ToRich(la, jc.Color)}`
					je["\72\69\88\67\111\108\111\114"].Instance.Text = "\72\69\88\58\32" .. "#" .. a:ToRich(jc.HexValue, jc.Color)
				end
				je["\80\97\108\101\116\116\101"]:Tween(nil, {
					BackgroundColor3 = m(Hue, 1, 1),
				})
				if not ks then
					je["\65\108\112\104\97"]:Tween(nil, {
						BackgroundColor3 = jc.Color,
					})
				end
				if jb.Callback then
					a:SafeCall(jb.Callback, jc.Color, jc.Alpha)
				end
			end
			function jc:Set(lb, Alpha)
				if type(lb) == "\116\97\98\108\101" then
					lb = l(lb[1], lb[(-465 + 467)], lb[bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)])
					Alpha = lb[bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)]
				elseif type(lb) == "\115\116\114\105\110\103" then
					lb = n(lb)
				end
				jc.Hue, jc.Saturation, jc.Value = lb:ToHSV()
				jc.Alpha = Alpha or 0
				local lc = v(1 - jc.Saturation, 0, ((0.99 * 4) / 4))
				local ld = v(1 - jc.Value, 0, ((0.99 * 10) / 10))
				local le = v(jc.Alpha, 0, ((0.995 * 10) / 10))
				local lf = v(jc.Hue, 0, ((0.995 * 2) / 2))
				je["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(lc, 0, ld, 0),
				})
				je["\72\117\101\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(0, 0, lf, 0),
				})
				je["\65\108\112\104\97\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(le, 0, 0, 0),
				})
				jc:Update((not not true), (1 == 1))
			end
			je["\67\111\108\111\114\112\105\99\107\101\114\66\117\116\116\111\110"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				jc:SetOpen(not jc.IsOpen)
			end)
			local lg = (1 == 0)
			local lh
			function jc:SlidePalette(Input)
				if not Input or not lg then
					return
				end
				local li = v(1 - (Input.Position.X - je["\80\97\108\101\116\116\101"].Instance.AbsolutePosition.X) / je["\80\97\108\101\116\116\101"].Instance.AbsoluteSize.X, 0, 1)
				local lj = v(1 - (Input.Position.Y - je["\80\97\108\101\116\116\101"].Instance.AbsolutePosition.Y) / je["\80\97\108\101\116\116\101"].Instance.AbsoluteSize.Y, 0, 1)
				jc.Saturation = li
				jc.Value = lj
				local lk = v((Input.Position.X - je["\80\97\108\101\116\116\101"].Instance.AbsolutePosition.X) / je["\80\97\108\101\116\116\101"].Instance.AbsoluteSize.X, 0, ((0.99 * 4) / 4))
				local ll = v((Input.Position.Y - je["\80\97\108\101\116\116\101"].Instance.AbsolutePosition.Y) / je["\80\97\108\101\116\116\101"].Instance.AbsoluteSize.Y, 0, ((0.99 * 10) / 10))
				je["\80\97\108\101\116\116\101\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(lk, 0, ll, 0),
				})
				jc:Update((not true), (not not true))
			end
			local lm = (not true)
			local ln
			function jc:SlideHue(Input)
				if not Input or not lm then
					return
				end
				local lo = v((Input.Position.Y - je["\72\117\101"].Instance.AbsolutePosition.Y) / je["\72\117\101"].Instance.AbsoluteSize.Y, 0, 1)
				jc.Hue = lo
				local lp = v((Input.Position.Y - je["\72\117\101"].Instance.AbsolutePosition.Y) / je["\72\117\101"].Instance.AbsoluteSize.Y, 0, ((0.995 * 4) / 4))
				je["\72\117\101\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(0, 0, lp, 0),
				})
				jc:Update((1 == 0), (1 == 1))
			end
			local lq = (not not false)
			local lr
			function jc:SlideAlpha(Input)
				if not Input or not lq then
					return
				end
				local ls = v((Input.Position.X - je["\65\108\112\104\97"].Instance.AbsolutePosition.X) / je["\65\108\112\104\97"].Instance.AbsoluteSize.X, 0, 1)
				jc.Alpha = ls
				local lt = v((Input.Position.X - je["\65\108\112\104\97"].Instance.AbsolutePosition.X) / je["\65\108\112\104\97"].Instance.AbsoluteSize.X, 0, ((0.995 * 10) / 10))
				je["\65\108\112\104\97\68\114\97\103\103\101\114"]:Tween(TweenInfo.new(a.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Position = s(lt, 0, 0, 0),
				})
				jc:Update((not false), (not false))
			end
			je["\80\97\108\101\116\116\101"]:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					lg = (not false)
					jc:SlidePalette(Input)
					if lh then
						return
					end
					lh = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							lg = (not not false)
							lh:Disconnect()
							lh = nil
						end
					end)
				end
			end)
			je["\72\117\101\73\110\108\105\110\101"]:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					lm = (not false)
					jc:SlideHue(Input)
					if ln then
						return
					end
					ln = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							lm = (1 == 0)
							ln:Disconnect()
							ln = nil
						end
					end)
				end
			end)
			je["\65\108\112\104\97"]:Connect("\73\110\112\117\116\66\101\103\97\110", function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					lq = (not false)
					jc:SlideAlpha(Input)
					if lr then
						return
					end
					lr = Input.Changed:Connect(function()
						if Input.UserInputState == Enum.UserInputState.End then
							lq = (not not false)
							lr:Disconnect()
							lr = nil
						end
					end)
				end
			end)
			a:Connect(c.InputChanged, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseMovement then
					if lg then
						jc:SlidePalette(Input)
					end
					if lm then
						jc:SlideHue(Input)
					end
					if lq then
						jc:SlideAlpha(Input)
					end
				end
			end)
			a:Connect(c.InputBegan, function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not jc.IsOpen then
						return
					end
					if a:IsMouseOverFrame(je["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"]) then
						return
					end
					if jq and js then
						if a:IsMouseOverFrame(jv["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"]) then
							return
						end
						if a:IsMouseOverFrame(jx["\67\111\108\111\114\112\105\99\107\101\114\87\105\110\100\111\119"]) then
							return
						end
					end
					jc:SetOpen((1 == 0))
				end
			end)
			if jb.Default then
				jc:Set(jb.Default, jb.Alpha)
				jl = jc.Color
			end
			a.Colorpickers[jc] = jc
			a.SetFlags[jc.Flag] = function(Value, Alpha)
				jc:Set(Value, Alpha)
			end
			return jc, je
		end
		ge.Keybind = function(self, lu)
			local lv = {
				IsOpen = (1 == 0),
				Key = "",
				Value = "",
				Flag = lu.Flag,
				Mode = "",
				Toggled = (not true),
				Picking = (not true),
			}
			local lw
			if a.KeyList then
				lw = a.KeyList:Add("", "", "")
			end
			local lx = {}
			do
				lx["\75\101\121\66\117\116\116\111\110"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = lu.Parent.Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					TextTransparency = ((0.4000000059604645 * 5) / 5),
					Text = "\77\66\50",
					AutoButtonColor = (not not false),
					Size = s(0, 0, 1, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					BorderColor3 = l(0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				lx["\75\101\121\66\117\116\116\111\110"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				lx["\75\101\121\66\117\116\116\111\110"]:TextBorder()
				lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"] = bl:Create("\70\114\97\109\101", {
					Parent = a.UnusedHolder.Instance,
					Name = "\0",
					Position = s(((0.007692307699471712 * 2) / 2), 0, ((0.35323384404182434 * 10) / 10), 0),
					BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
					Size = s(0, bit32.bxor(bit32.bxor(70, 1515870810), 1515870810), 0, (-628 + 718)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l((-985 + 999), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				})
				lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"]:AddToTheme({
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				lx["\84\111\103\103\108\101"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((255 - 20), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\84\111\103\103\108\101",
					AutoButtonColor = (not true),
					Position = s(0, (-939 + 947), 0, (827 - 819)),
					Size = s(1, -(1016 - 1000), 0, (141 - 121)),
					BorderSizePixel = 0,
					TextSize = (7 + 2),
					BackgroundColor3 = l((-709 + 911), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				lx["\84\111\103\103\108\101"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
					TextColor3 = "\84\101\120\116",
				})
				lx["\84\111\103\103\108\101"]:TextBorder()
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance,
					Name = "\0",
					Color = l((459 - 417), (-525 + 574), (-584 + 629)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				lx["\72\111\108\100"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((438 - 203), (148 + 87), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
					BorderColor3 = l(0, 0, 0),
					Text = "\72\111\108\100",
					AutoButtonColor = (not not false),
					BackgroundTransparency = 1,
					Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (94 - 56)),
					Size = s(1, -bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, (176 - 156)),
					BorderSizePixel = 0,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				lx["\72\111\108\100"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
					TextColor3 = "\84\101\120\116",
				})
				lx["\72\111\108\100"]:TextBorder()
				lx["\65\108\119\97\121\115"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-396 + 631)),
					BorderColor3 = l(0, 0, 0),
					Text = "\65\108\119\97\121\115",
					AutoButtonColor = (1 == 0),
					BackgroundTransparency = 1,
					Position = s(0, (610 - 602), 0, (878 - 810)),
					Size = s(1, -(468 - 452), 0, (964 - 944)),
					BorderSizePixel = 0,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (162 + 81), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				lx["\65\108\119\97\121\115"]:AddToTheme({
					BackgroundColor3 = "\65\99\99\101\110\116",
					TextColor3 = "\84\101\120\116",
				})
				lx["\65\108\119\97\121\115"]:TextBorder()
			end
			local ly = {
				["\84\111\103\103\108\101"] = lx["\84\111\103\103\108\101"],
				["\72\111\108\100"] = lx["\72\111\108\100"],
				["\65\108\119\97\121\115"] = lx["\65\108\119\97\121\115"],
			}
			local lz = function()
				if lw then
					lw:SetText(lv.Value, lu.Name, lv.Mode)
					lw:SetStatus(lv.Toggled)
				end
			end
			function lv:Get()
				return lv.Key, lv.Mode, lv.Toggled
			end
			function lv:Set(ma)
				if ag(tostring(ma), "\69\110\117\109") then
					lv.Key = tostring(ma)
					ma = ma.Name == "\66\97\99\107\115\112\97\99\101" and "\78\111\110\101" or ma.Name
					local mb = al[lv.Key] or ah(ma, "\69\110\117\109\46", "") or "\78\111\110\101"
					local mc = ah(ah(mb, "\75\101\121\67\111\100\101\46", ""), "\85\115\101\114\73\110\112\117\116\84\121\112\101\46", "") or "\78\111\110\101"
					lv.Value = mc
					lx["\75\101\121\66\117\116\116\111\110"].Instance.Text = mc
					a.Flags[lv.Flag] = {
						Mode = lv.Mode,
						Key = lv.Key,
						Toggled = lv.Toggled,
					}
					if lu.Callback then
						a:SafeCall(lu.Callback, lv.Toggled)
					end
					lz()
				elseif type(ma) == "\116\97\98\108\101" then
					local md = ma.Key == "\66\97\99\107\115\112\97\99\101" and "\78\111\110\101" or ma.Key
					lv.Key = tostring(ma.Key)
					if ma.Mode then
						lv.Mode = ma.Mode
						lv:SetMode(ma.Mode)
					else
						lv.Mode = "\84\111\103\103\108\101"
						lv:SetMode("\84\111\103\103\108\101")
					end
					local me = al[lv.Key] or ah(tostring(md), "\69\110\117\109\46", "") or md
					local mf = me and ah(ah(me, "\75\101\121\67\111\100\101\46", ""), "\85\115\101\114\73\110\112\117\116\84\121\112\101\46", "") or "\78\111\110\101"
					mf = ah(ah(me, "\75\101\121\67\111\100\101\46", ""), "\85\115\101\114\73\110\112\117\116\84\121\112\101\46", "")
					lv.Value = mf
					lx["\75\101\121\66\117\116\116\111\110"].Instance.Text = mf
					if lu.Callback then
						a:SafeCall(lu.Callback, lv.Toggled)
					end
					lz()
				elseif aa({
					"\84\111\103\103\108\101",
					"\72\111\108\100",
					"\65\108\119\97\121\115",
				}, ma) then
					lv.Mode = ma
					lv:SetMode(lv.Mode)
					if lu.Callback then
						a:SafeCall(lu.Callback, lv.Toggled)
					end
					lz()
				end
				lv.Picking = (not not false)
			end
			local mg = (not true)
			local mh
			function lv:SetOpen(mi)
				if mg then
					return
				end
				lv.IsOpen = mi
				mg = (not not true)
				if lv.IsOpen then
					lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance.Visible = (1 == 1)
					lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance.Parent = a.Holder.Instance
					mh = f.RenderStepped:Connect(function()
						lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance.Position = s(0, lx["\75\101\121\66\117\116\116\111\110"].Instance.AbsolutePosition.X, 0, lx["\75\101\121\66\117\116\116\111\110"].Instance.AbsolutePosition.Y + lx["\75\101\121\66\117\116\116\111\110"].Instance.AbsoluteSize.Y + bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
					end)
					if not mg then
						for Index, Value in a.OpenFrames do
							if Value ~= lv then
								Value:SetOpen((not true))
							end
						end
						a.OpenFrames[lv] = lv
					end
				else
					if not mg then
						if a.OpenFrames[lv] then
							a.OpenFrames[lv] = nil
						end
					end
					if mh then
						mh:Disconnect()
						mh = nil
					end
				end
				local mj = lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance:GetDescendants()
				z(mj, lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance)
				local mk
				for Index, Value in mj do
					local ml = ar:GetProperty(Value)
					if not ml then
						continue
					end
					if type(ml) == "\116\97\98\108\101" then
						for _, mm in ml do
							mk = ar:FadeItem(Value, mm, mi, a.FadeSpeed)
						end
					else
						mk = ar:FadeItem(Value, ml, mi, a.FadeSpeed)
					end
				end
				mk.Tween.Completed:Connect(function()
					mg = (1 == 0)
					lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance.Visible = lv.IsOpen
					task.wait(((0.2 * 10) / 10))
					lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"].Instance.Parent = not lv.IsOpen and a.UnusedHolder.Instance or a.Holder.Instance
				end)
			end
			function lv:SetMode(mn)
				for mo, Value in ly do
					if mo == mn then
						Value:Tween(nil, {
							BackgroundTransparency = 0,
						})
					else
						Value:Tween(nil, {
							BackgroundTransparency = 1,
						})
					end
				end
				a.Flags[lv.Flag] = {
					Mode = lv.Mode,
					Key = lv.Key,
					Toggled = lv.Toggled,
				}
				if lu.Callback then
					a:SafeCall(lu.Callback, lv.Toggled)
				end
				lz()
			end
			function lv:Press(mp)
				if lv.Mode == "\84\111\103\103\108\101" then
					lv.Toggled = not lv.Toggled
				elseif lv.Mode == "\72\111\108\100" then
					lv.Toggled = mp
				elseif lv.Mode == "\65\108\119\97\121\115" then
					lv.Toggled = (not not true)
				end
				a.Flags[lv.Flag] = {
					Mode = lv.Mode,
					Key = lv.Key,
					Toggled = lv.Toggled,
				}
				if lu.Callback then
					a:SafeCall(lu.Callback, lv.Toggled)
				end
				lz()
			end
			lx["\75\101\121\66\117\116\116\111\110"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\67\108\105\99\107", function()
				lv.Picking = (not not true)
				lx["\75\101\121\66\117\116\116\111\110"].Instance.Text = "."
				a:Thread(function()
					local mq = 1
					while (not false) do
						if not lv.Picking then
							break
						end
						if mq == (-274 + 278) then
							mq = 1
						end
						lx["\75\101\121\66\117\116\116\111\110"].Instance.Text = mq == 1 and "." or mq == (145 - 143) and "\46\46" or mq == bit32.bxor(bit32.bxor(3, 1515870810), 1515870810) and "\46\46\46"
						mq += 1
						task.wait(((0.5 * 2) / 2))
					end
				end)
				local mr
				mr = c.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.Keyboard then
						lv:Set(Input.KeyCode)
					else
						lv:Set(Input.UserInputType)
					end
					mr:Disconnect()
					mr = nil
				end)
			end)
			lx["\75\101\121\66\117\116\116\111\110"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\50\68\111\119\110", function()
				lv:SetOpen(not lv.IsOpen)
			end)
			a:Connect(c.InputBegan, function(Input)
				if lv.Value == "\78\111\110\101" then
					return
				end
				if tostring(Input.KeyCode) == lv.Key then
					if lv.Mode == "\84\111\103\103\108\101" then
						lv:Press()
					elseif lv.Mode == "\72\111\108\100" then
						lv:Press((not not true))
					elseif lv.Mode == "\65\108\119\97\121\115" then
						lv:Press((1 == 1))
					end
				elseif tostring(Input.UserInputType) == lv.Key then
					if lv.Mode == "\84\111\103\103\108\101" then
						lv:Press()
					elseif lv.Mode == "\72\111\108\100" then
						lv:Press((1 == 1))
					elseif lv.Mode == "\65\108\119\97\121\115" then
						lv:Press((not not true))
					end
				end
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not lv.IsOpen then
						return
					end
					if a:IsMouseOverFrame(lx["\75\101\121\98\105\110\100\87\105\110\100\111\119"]) then
						return
					end
					lv:SetOpen((not not false))
				end
			end)
			a:Connect(c.InputEnded, function(Input)
				if lv.Value == "\78\111\110\101" then
					return
				end
				if tostring(Input.KeyCode) == lv.Key then
					if lv.Mode == "\72\111\108\100" then
						lv:Press((1 == 0))
					elseif lv.Mode == "\65\108\119\97\121\115" then
						lv:Press((not not true))
					end
				elseif tostring(Input.UserInputType) == lv.Key then
					if lv.Mode == "\72\111\108\100" then
						lv:Press((not true))
					elseif lv.Mode == "\65\108\119\97\121\115" then
						lv:Press((not not true))
					end
				end
			end)
			lx["\84\111\103\103\108\101"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				lv.Mode = "\84\111\103\103\108\101"
				lv:SetMode("\84\111\103\103\108\101")
			end)
			lx["\72\111\108\100"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				lv.Mode = "\72\111\108\100"
				lv:SetMode("\72\111\108\100")
			end)
			lx["\65\108\119\97\121\115"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				lv.Mode = "\65\108\119\97\121\115"
				lv:SetMode("\65\108\119\97\121\115")
			end)
			if lu.Default then
				lv:Set({
					Key = lu.Default,
					Mode = lu.Mode or "\84\111\103\103\108\101",
				})
			end
			a.SetFlags[lv.Flag] = function(Value)
				lv:Set(Value)
			end
			return lv, lx
		end
		ge.Textbox = function(self, ms)
			local Textbox = {
				Flag = ms.Flag,
				Value = "",
			}
			local mt = {}
			do
				mt["\84\101\120\116\98\111\120"] = bl:Create("\70\114\97\109\101", {
					Parent = ms.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(40, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (267 - 12), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				mt["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
					Parent = mt["\84\101\120\116\98\111\120"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (218 + 17), (916 - 681)),
					BorderColor3 = l(0, 0, 0),
					Text = ms.Name,
					BackgroundTransparency = 1,
					Size = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.X,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-138 + 393), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				mt["\84\101\120\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				mt["\84\101\120\116"]:TextBorder()
				mt["\66\97\99\107\103\114\111\117\110\100"] = bl:Create("\70\114\97\109\101", {
					Parent = mt["\84\101\120\116\98\111\120"].Instance,
					Name = "\0",
					AnchorPoint = u(0, 1),
					Position = s(0, 0, 1, 0),
					BorderColor3 = l((591 - 579), (175 - 163), (-722 + 734)),
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(30, 1515870810), 1515870810), bit32.bxor(bit32.bxor(36, 1515870810), 1515870810), (-766 + 797)),
				})
				mt["\66\97\99\107\103\114\111\117\110\100"]:AddToTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = mt["\66\97\99\107\103\114\111\117\110\100"].Instance,
					Name = "\0",
					Rotation = -bit32.bxor(bit32.bxor(165, 1515870810), 1515870810),
					Color = o({
						p(0, l((327 - 72), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (813 - 558))),
						p(1, l((1073 - 865), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (544 - 336))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l((-347 + 602), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1008 - 753))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = mt["\66\97\99\107\103\114\111\117\110\100"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (469 - 424)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				mt["\73\110\112\117\116"] = bl:Create("\84\101\120\116\66\111\120", {
					Parent = mt["\66\97\99\107\103\114\111\117\110\100"].Instance,
					Name = "\0",
					FontFace = a.Font,
					PlaceholderColor3 = l(bit32.bxor(bit32.bxor(185, 1515870810), 1515870810), (324 - 139), bit32.bxor(bit32.bxor(185, 1515870810), 1515870810)),
					PlaceholderText = ms.Placeholder,
					TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
					Size = s(1, 0, 1, 0),
					ClipsDescendants = (not not true),
					BorderColor3 = l(0, 0, 0),
					Text = "",
					TextColor3 = l((14 + 221), (585 - 350), (371 - 136)),
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = s(0, 0, 0, 0),
					ClearTextOnFocus = (not not false),
					BorderSizePixel = 0,
					BackgroundColor3 = l((739 - 484), (-382 + 637), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				mt["\73\110\112\117\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
					PlaceholderColor3 = "\80\108\97\99\101\104\111\108\100\101\114\32\84\101\120\116",
				})
				mt["\73\110\112\117\116"]:TextBorder()
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = mt["\73\110\112\117\116"].Instance,
					Name = "\0",
					PaddingLeft = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
					PaddingRight = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				})
			end
			function Textbox:Get()
				return Textbox.Value
			end
			function Textbox:SetVisibility(mu)
				mt["\84\101\120\116\98\111\120"].Instance.Visible = mu
			end
			function Textbox:Set(Value)
				if ms.Numeric then
					if (not tonumber(Value)) and aj(tostring(Value)) > 0 then
						Value = Textbox.Value
					end
				end
				Textbox.Value = Value
				mt["\73\110\112\117\116"].Instance.Text = Value
				a.Flags[Textbox.Flag] = Value
				if ms.Callback then
					a:SafeCall(ms.Callback, Value)
				end
			end
			if ms.Finished then
				mt["\73\110\112\117\116"]:Connect("\70\111\99\117\115\76\111\115\116", function(mv)
					if mv then
						Textbox:Set(mt["\73\110\112\117\116"].Instance.Text)
					end
				end)
			else
				mt["\73\110\112\117\116"].Instance:GetPropertyChangedSignal("\84\101\120\116"):Connect(function()
					Textbox:Set(mt["\73\110\112\117\116"].Instance.Text)
				end)
			end
			if ms.Default then
				Textbox:Set(ms.Default)
			end
			a.SetFlags[Textbox.Flag] = function(Value)
				Textbox:Set(Value)
			end
			return Textbox, mt
		end
		ge.Searchbox = function(self, mw)
			local Dropdown = {
				Flag = mw.Flag,
				Value = {},
				Options = {},
				IsOpen = (1 == 0),
			}
			local mx = {}
			do
				mx["\76\105\115\116\98\111\120"] = bl:Create("\70\114\97\109\101", {
					Parent = mw.Parent.Instance,
					Name = "\0",
					BackgroundTransparency = 1,
					BorderColor3 = l(0, 0, 0),
					Size = s(1, 0, 0, (998 - 813)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1025 - 770), (754 - 499)),
				})
				mx["\83\101\97\114\99\104"] = bl:Create("\70\114\97\109\101", {
					Parent = mx["\76\105\115\116\98\111\120"].Instance,
					Name = "\0",
					BackgroundTransparency = ((0.4000000059604645 * 5) / 5),
					Size = s(0, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					BorderColor3 = l((-244 + 256), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-86 + 98)),
					BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = l((246 - 232), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), (159 - 144)),
				})
				mx["\83\101\97\114\99\104"]:AddToTheme({
					BorderColor3 = "\66\111\114\100\101\114",
					BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = mx["\83\101\97\114\99\104"].Instance,
					Name = "\0",
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Transparency = ((0.4000000059604645 * 5) / 5),
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (980 - 931), (318 - 273)),
					LineJoinMode = Enum.LineJoinMode.Miter,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				mx["\73\99\111\110"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = mx["\83\101\97\114\99\104"].Instance,
					Name = "\0",
					ScaleType = Enum.ScaleType.Fit,
					BorderColor3 = l(0, 0, 0),
					AnchorPoint = u(0, ((0.5 * 10) / 10)),
					Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\55\49\49\57\55\57\52\54\49\51\53\49\53\48",
					BackgroundTransparency = 1,
					Position = s(0, 0, ((0.5 * 2) / 2), 0),
					Size = s(0, bit32.bxor(bit32.bxor(16, 1515870810), 1515870810), 0, (-899 + 915)),
					BorderSizePixel = 0,
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-538 + 793)),
				})
				mx["\73\99\111\110"]:AddToTheme({
					ImageColor3 = "\84\101\120\116",
				})
				mx["\73\110\112\117\116"] = bl:Create("\84\101\120\116\66\111\120", {
					Parent = mx["\83\101\97\114\99\104"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l((311 - 76), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (557 - 322)),
					BorderColor3 = l(0, 0, 0),
					Text = "",
					Size = s(0, 0, 1, 0),
					Position = s(0, (-589 + 611), 0, 0),
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					PlaceholderColor3 = l((1035 - 850), bit32.bxor(bit32.bxor(185, 1515870810), 1515870810), bit32.bxor(bit32.bxor(185, 1515870810), 1515870810)),
					AutomaticSize = Enum.AutomaticSize.X,
					PlaceholderText = "\115\101\97\114\99\104\46\46",
					TextSize = (-559 + 568),
					BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (182 + 73), (84 + 171)),
				})
				mx["\73\110\112\117\116"]:AddToTheme({
					TextColor3 = "\84\101\120\116",
					PlaceholderColor3 = "\80\108\97\99\101\104\111\108\100\101\114\32\84\101\120\116",
				})
				mx["\73\110\112\117\116"]:TextBorder()
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = mx["\83\101\97\114\99\104"].Instance,
					Name = "\0",
					PaddingRight = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
					PaddingLeft = t(0, (31 - 28)),
				})
				mx["\82\101\97\108\76\105\115\116\98\111\120"] = bl:Create("\70\114\97\109\101", {
					Parent = mx["\76\105\115\116\98\111\120"].Instance,
					Name = "\0",
					ClipsDescendants = (1 == 1),
					BorderColor3 = l((-804 + 816), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (71 - 59)),
					Size = s(1, 0, 1, -(73 - 45)),
					SelectionGroup = (not false),
					Position = s(0, 0, 0, (995 - 967)),
					Selectable = (not false),
					Active = (not not true),
					BorderSizePixel = (-182 + 184),
					BackgroundColor3 = l((-717 + 747), bit32.bxor(bit32.bxor(36, 1515870810), 1515870810), (-679 + 710)),
				})
				mx["\82\101\97\108\76\105\115\116\98\111\120"]:AddToTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				bl:Create("\85\73\83\116\114\111\107\101", {
					Parent = mx["\82\101\97\108\76\105\115\116\98\111\120"].Instance,
					Name = "\0",
					Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (981 - 932), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
					LineJoinMode = Enum.LineJoinMode.Miter,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				}):AddToTheme({
					Color = "\79\117\116\108\105\110\101",
				})
				bl:Create("\85\73\71\114\97\100\105\101\110\116", {
					Parent = mx["\82\101\97\108\76\105\115\116\98\111\120"].Instance,
					Name = "\0",
					Rotation = -(437 - 272),
					Color = o({
						p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (627 - 372))),
						p(1, l((-514 + 722), bit32.bxor(bit32.bxor(208, 1515870810), 1515870810), (973 - 765))),
					}),
				}):AddToTheme({
					Color = function()
						return o({
							p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810))),
							p(1, a.Theme.Gradient),
						})
					end,
				})
				mx["\76\105\115\116"] = bl:Create("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", {
					Parent = mx["\82\101\97\108\76\105\115\116\98\111\120"].Instance,
					Name = "\0",
					Active = (not not true),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					BorderSizePixel = 0,
					CanvasSize = s(0, 0, 0, 0),
					ScrollBarImageColor3 = l((45 + 157), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
					MidImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\54\52\49\57\52\55\52\51\56\49\57\54\53",
					BorderColor3 = l(0, 0, 0),
					ScrollBarThickness = (967 - 965),
					Size = s(1, -(820 - 808), 1, -bit32.bxor(bit32.bxor(10, 1515870810), 1515870810)),
					Position = s(0, bit32.bxor(bit32.bxor(3, 1515870810), 1515870810), 0, (541 - 536)),
					TopImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\54\52\49\57\52\55\52\51\56\49\57\54\53",
					CanvasPosition = u(0, bit32.bxor(bit32.bxor(57, 1515870810), 1515870810)),
					BottomImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\49\51\54\52\49\57\52\55\52\51\56\49\57\54\53",
					BackgroundTransparency = 1,
					BackgroundColor3 = l((739 - 484), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				})
				mx["\76\105\115\116"]:AddToTheme({
					ScrollBarImageColor3 = "\65\99\99\101\110\116",
				})
				bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
					Parent = mx["\76\105\115\116"].Instance,
					Name = "\0",
					Padding = t(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
				bl:Create("\85\73\80\97\100\100\105\110\103", {
					Parent = mx["\76\105\115\116"].Instance,
					Name = "\0",
					PaddingBottom = t(0, (480 - 472)),
					PaddingLeft = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
				})
			end
			function Dropdown:Get()
				return Dropdown.Value
			end
			function Dropdown:SetVisibility(my)
				mx["\76\105\115\116\98\111\120"].Instance.Visible = my
			end
			function Dropdown:Set(mz)
				if mw.Multi then
					if type(mz) ~= "\116\97\98\108\101" then
						return
					end
					Dropdown.Value = mz
					a.Flags[Dropdown.Flag] = mz
					for Index, Value in mz do
						local na = Dropdown.Options[Value]
						if not na then
							continue
						end
						na.Selected = (not false)
						na:Toggle("\65\99\116\105\118\101")
					end
				else
					if not Dropdown.Options[mz] then
						return
					end
					local nb = Dropdown.Options[mz]
					Dropdown.Value = mz
					a.Flags[Dropdown.Flag] = mz
					for Index, Value in Dropdown.Options do
						if Value ~= nb then
							Value.Selected = (not true)
							Value:Toggle("\73\110\97\99\116\105\118\101")
						else
							Value.Selected = (not false)
							Value:Toggle("\65\99\116\105\118\101")
						end
					end
				end
				if mw.Callback then
					a:SafeCall(mw.Callback, Dropdown.Value)
				end
			end
			function Dropdown:Add(nc)
				local nd = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
					Parent = mx["\76\105\115\116"].Instance,
					Name = "\0",
					FontFace = a.Font,
					TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (257 - 22)),
					BorderColor3 = l(0, 0, 0),
					Text = nc,
					AutoButtonColor = (not true),
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = s(1, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
					ZIndex = 1,
					TextSize = (-758 + 767),
					BackgroundColor3 = l((516 - 261), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1206 - 951)),
				})
				nd:AddToTheme({
					TextColor3 = "\84\101\120\116",
				})
				nd:TextBorder()
				local ne = {
					Button = nd,
					Name = nc,
					Selected = (1 == 0),
				}
				function ne:Toggle(Status)
					if Status == "\65\99\116\105\118\101" then
						ne.Button:ChangeItemTheme({
							TextColor3 = "\65\99\99\101\110\116",
						})
						ne.Button:Tween(nil, {
							TextColor3 = a.Theme.Accent,
						})
					else
						ne.Button:ChangeItemTheme({
							TextColor3 = "\84\101\120\116",
						})
						ne.Button:Tween(nil, {
							TextColor3 = a.Theme.Text,
						})
					end
				end
				function ne:Set()
					ne.Selected = not ne.Selected
					if mw.Multi then
						local nf = aa(Dropdown.Value, ne.Name)
						if nf then
							ab(Dropdown.Value, nf)
						else
							z(Dropdown.Value, ne.Name)
						end
						ne:Toggle(nf and "\73\110\97\99\116\105\118\101" or "\65\99\116\105\118\101")
						a.Flags[Dropdown.Flag] = Dropdown.Value
					else
						if ne.Selected then
							Dropdown.Value = ne.Name
							a.Flags[Dropdown.Flag] = ne.Name
							ne.Selected = (1 == 1)
							ne:Toggle("\65\99\116\105\118\101")
							for Index, Value in Dropdown.Options do
								if Value ~= ne then
									Value.Selected = (not not false)
									Value:Toggle("\73\110\97\99\116\105\118\101")
								end
							end
						else
							Dropdown.Value = nil
							a.Flags[Dropdown.Flag] = nil
							ne.Selected = (not not false)
							ne:Toggle("\73\110\97\99\116\105\118\101")
						end
					end
					if mw.Callback then
						a:SafeCall(mw.Callback, Dropdown.Value)
					end
				end
				ne.Button:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
					ne:Set()
				end)
				Dropdown.Options[ne.Name] = ne
				return ne
			end
			function Dropdown:Remove(ng)
				if not Dropdown.Options[ng] then
					return
				end
				Dropdown.Options[ng].Button:Clean()
				Dropdown.Options[ng] = nil
			end
			function Dropdown:Refresh(List)
				for Index, Value in Dropdown.Options do
					Dropdown:Remove(Value.Name)
				end
				for Index, Value in List do
					Dropdown:Add(Value)
				end
			end
			mx["\76\105\115\116\98\111\120"]:OnHover(function()
				mx["\76\105\115\116\98\111\120"]:ChangeItemTheme({
					BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				mx["\76\105\115\116\98\111\120"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
				})
			end)
			mx["\76\105\115\116\98\111\120"]:OnHoverLeave(function()
				mx["\76\105\115\116\98\111\120"]:ChangeItemTheme({
					BackgroundColor3 = "\69\108\101\109\101\110\116",
					BorderColor3 = "\66\111\114\100\101\114",
				})
				mx["\76\105\115\116\98\111\120"]:Tween(nil, {
					BackgroundColor3 = a.Theme["\69\108\101\109\101\110\116"],
				})
			end)
			local nh
			mx["\73\110\112\117\116"]:Connect("\70\111\99\117\115\101\100", function()
				nh = f.RenderStepped:Connect(function()
					for Index, Value in Dropdown.Options do
						if mx["\73\110\112\117\116"].Instance.Text ~= "" then
							if ag(ai(Value.Name), ai(mx["\73\110\112\117\116"].Instance.Text)) then
								Value.Button.Instance.Visible = (not not true)
							else
								Value.Button.Instance.Visible = (not not false)
							end
						else
							Value.Button.Instance.Visible = (1 == 1)
						end
					end
				end)
			end)
			mx["\73\110\112\117\116"]:Connect("\70\111\99\117\115\76\111\115\116", function()
				if nh then
					nh:Disconnect()
					nh = nil
				end
			end)
			for Index, Value in mw.Items do
				Dropdown:Add(Value)
			end
			if mw.Default then
				Dropdown:Set(mw.Default)
			end
			a.SetFlags[Dropdown.Flag] = function(Value)
				Dropdown:Set(Value)
			end
			return Dropdown, mx
		end
	end
	a.Watermark = function(self, Name)
		local Watermark = {}
		local ni = {}
		do
			ni["\87\97\116\101\114\109\97\114\107"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				AnchorPoint = u(1, 0),
				Position = s(1, -bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				BorderColor3 = l((161 - 149), (277 - 265), (-288 + 300)),
				BorderSizePixel = (963 - 961),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(14, 1515870810), 1515870810), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
			})
			ni["\87\97\116\101\114\109\97\114\107"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			ni["\87\97\116\101\114\109\97\114\107"]:MakeDraggable()
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ni["\87\97\116\101\114\109\97\114\107"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (808 - 759), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = ni["\87\97\116\101\114\109\97\114\107"].Instance,
				Name = "\0",
				PaddingTop = t(0, (358 - 353)),
				PaddingBottom = t(0, bit32.bxor(bit32.bxor(7, 1515870810), 1515870810)),
				PaddingRight = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
				PaddingLeft = t(0, (854 - 849)),
			})
			ni["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = ni["\87\97\116\101\114\109\97\114\107"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((283 - 48), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-134 + 369)),
				BorderColor3 = l(0, 0, 0),
				Text = Name,
				Position = s(0, 0, 0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l((1024 - 769), (-165 + 420), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			ni["\84\101\120\116"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			ni["\84\101\120\116"]:TextBorder()
			ni["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ni["\87\97\116\101\114\109\97\114\107"].Instance,
				Name = "\0",
				Position = s(0, -(617 - 612), 0, -(-369 + 374)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, (42 - 32), 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			ni["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
		end
		function Watermark:SetVisibility(nj)
			ni["\87\97\116\101\114\109\97\114\107"].Instance.Visible = nj
		end
		function Watermark:SetText(Text)
			ni["\84\101\120\116"].Instance.Text = Text
		end
		return Watermark
	end
	a.KeybindList = function(self)
		local KeybindList = {}
		a.KeyList = KeybindList
		local nk = {}
		do
			nk["\75\101\121\98\105\110\100\76\105\115\116"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				AnchorPoint = u(0, 0),
				Position = s(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), ((0.5 * 4) / 4), -(886 - 836)),
				BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				Size = s(0, (-319 + 469), 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				ClipsDescendants = (1 == 1),
				BorderSizePixel = (330 - 328),
				BackgroundColor3 = l((-654 + 668), (980 - 963), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
			})
			nk["\75\101\121\98\105\110\100\76\105\115\116"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			nk["\75\101\121\98\105\110\100\76\105\115\116"]:MakeDraggable()
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance,
				Name = "\0",
				Color = l((333 - 291), (-502 + 551), (-261 + 306)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}):AddToTheme({
				Color = "\79\117\116\108\105\110\101",
			})
			nk["\84\105\116\108\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((-717 + 952), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-762 + 997)),
				BorderColor3 = l(0, 0, 0),
				Text = "\75\101\121\98\105\110\100\115",
				Size = s(0, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
				BackgroundTransparency = 1,
				Position = s(0, 0, 0, -bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.X,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-650 + 905), (-287 + 542)),
			})
			nk["\84\105\116\108\101"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			nk["\84\105\116\108\101"]:TextBorder()
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance,
				Name = "\0",
				PaddingTop = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				PaddingBottom = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				PaddingRight = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				PaddingLeft = t(0, (-444 + 452)),
			})
			nk["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance,
				Name = "\0",
				Position = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			nk["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
			nk["\67\111\110\116\101\110\116"] = bl:Create("\70\114\97\109\101", {
				Parent = nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				BackgroundTransparency = 1,
				Position = s(0, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
				Size = s(1, 0, 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (139 + 116), (-314 + 569)),
			})
			bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
				Parent = nk["\67\111\110\116\101\110\116"].Instance,
				Name = "\0",
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
		end
		function KeybindList:Add(nl, Name, nm)
			local nn = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = nk["\67\111\110\116\101\110\116"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "" .. nl .. "\32\45\32" .. Name .. "\32\40" .. nm .. ")",
				BackgroundTransparency = 1,
				Size = s(0, 0, 0, (42 - 27)),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.X,
				TextTransparency = 1,
				Visible = (1 == 0),
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l((-414 + 669), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (910 - 655)),
			})
			nn:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			nn:TextBorder()
			function nn:SetText(no, Name, np)
				nn.Instance.Text = "" .. no .. "\32\45\32" .. Name .. "\32\40" .. np .. ")"
			end
			function nn:SetStatus(nq)
				if nq then
					nn.Instance.Visible = (1 == 1)
					nn:Tween(nil, {
						TextTransparency = 0,
					})
				else
					nn:Tween(nil, {
						TextTransparency = 1,
					}).Tween.Completed:Connect(function()
						nn.Instance.Visible = (not not false)
					end)
				end
			end
			return nn
		end
		function KeybindList:SetVisibility(nr)
			nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance.Visible = nr
		end
		nk["\75\101\121\98\105\110\100\76\105\115\116"].Instance.Visible = (not not false)
		return KeybindList
	end
	a.Notification = function(self, Title, Description, ns)
		local nt = {}
		do
			nt["\78\111\116\105\102\105\99\97\116\105\111\110"] = bl:Create("\70\114\97\109\101", {
				Parent = a.NotifHolder.Instance,
				Name = "\0",
				Size = s(0, 0, 0, bit32.bxor(bit32.bxor(25, 1515870810), 1515870810)),
				BorderColor3 = l((170 - 158), (322 - 310), (-179 + 191)),
				BorderSizePixel = (-576 + 578),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = l((-839 + 853), (871 - 854), (-271 + 286)),
			})
			nt["\78\111\116\105\102\105\99\97\116\105\111\110"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			nt["\85\73\83\116\114\111\107\101\49"] = bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance,
				Name = "\0",
				Color = l((-28 + 70), (-777 + 826), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			})
			nt["\85\73\83\116\114\111\107\101\49"]:AddToTheme({
				Color = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance,
				Name = "\0",
				PaddingTop = t(0, (-353 + 358)),
				PaddingBottom = t(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810)),
				PaddingRight = t(0, bit32.bxor(bit32.bxor(5, 1515870810), 1515870810)),
				PaddingLeft = t(0, (-2 + 7)),
			})
			nt["\84\105\116\108\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = Title,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-428 + 683), (1229 - 974)),
			})
			nt["\84\105\116\108\101"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			nt["\85\73\83\116\114\111\107\101\50"] = nt["\84\105\116\108\101"]:TextBorder()
			nt["\68\101\115\99\114\105\112\116\105\111\110"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				TextTransparency = ((0.4000000059604645 * 5) / 5),
				Text = Description,
				Position = s(0, 0, 0, (-328 + 343)),
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				BorderColor3 = l(0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = (-685 + 694),
				BackgroundColor3 = l((683 - 428), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			nt["\68\101\115\99\114\105\112\116\105\111\110"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			nt["\85\73\83\116\114\111\107\101\51"] = nt["\68\101\115\99\114\105\112\116\105\111\110"]:TextBorder()
			nt["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance,
				Name = "\0",
				Position = s(0, 0, 1, (-267 + 275)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), (383 - 128)),
			})
			nt["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
		end
		local nu = nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance.AbsoluteSize
		for Index, Value in nt do
			if Value.Instance:IsA("\70\114\97\109\101") then
				Value.Instance.BackgroundTransparency = 1
			elseif Value.Instance:IsA("\84\101\120\116\76\97\98\101\108") then
				Value.Instance.TextTransparency = 1
			elseif Value.Instance:IsA("\85\73\83\116\114\111\107\101") then
				Value.Instance.Transparency = 1
			end
		end
		nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance.AutomaticSize = Enum.AutomaticSize.Y
		a:Thread(function()
			for nv, Value in nt do
				if Value and Value.Instance then
					if Value.Instance:IsA("\70\114\97\109\101") then
						Value:Tween(nil, {
							BackgroundTransparency = 0,
						})
					elseif Value.Instance:IsA("\84\101\120\116\76\97\98\101\108") and nv ~= "\68\101\115\99\114\105\112\116\105\111\110" then
						Value:Tween(nil, {
							TextTransparency = 0,
						})
					elseif Value.Instance:IsA("\84\101\120\116\76\97\98\101\108") and nv == "\68\101\115\99\114\105\112\116\105\111\110" then
						Value:Tween(nil, {
							TextTransparency = ((0.4 * 4) / 4),
						})
					elseif Value.Instance:IsA("\85\73\83\116\114\111\107\101") then
						Value:Tween(nil, {
							Transparency = 0,
						})
					end
				end
			end
			if nt["\78\111\116\105\102\105\99\97\116\105\111\110"] and nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance then
				nt["\78\111\116\105\102\105\99\97\116\105\111\110"]:Tween(nil, {
					Size = s(0, nu.X, 0, 0),
				})
			end
			if nt["\76\105\110\101\114"] and nt["\76\105\110\101\114"].Instance then
				nt["\76\105\110\101\114"]:Tween(TweenInfo.new(ns, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
					Size = s(0, 0, 0, 1),
				})
			end
			task.delay(ns + ((0.1 * 2) / 2), function()
				for Index, Value in nt do
					if Value and Value.Instance then
						if Value.Instance:IsA("\70\114\97\109\101") then
							Value:Tween(nil, {
								BackgroundTransparency = 1,
							})
						elseif Value.Instance:IsA("\84\101\120\116\76\97\98\101\108") then
							Value:Tween(nil, {
								TextTransparency = 1,
							})
						elseif Value.Instance:IsA("\85\73\83\116\114\111\107\101") then
							Value:Tween(nil, {
								Transparency = 1,
							})
						end
					end
				end
				if nt["\78\111\116\105\102\105\99\97\116\105\111\110"] and nt["\78\111\116\105\102\105\99\97\116\105\111\110"].Instance then
					nt["\78\111\116\105\102\105\99\97\116\105\111\110"]:Tween(nil, {
						Size = s(0, 0, 0, 0),
					})
					task.wait(((0.5 * 5) / 5))
					nt["\78\111\116\105\102\105\99\97\116\105\111\110"]:Clean()
				end
			end)
		end)
	end
	a.LoadingPopup = function(self, nw)
		nw = nw or {}
		local Camera = b.CurrentCamera
		local nx = {
			IsOpen = (not false),
			Progress = 0,
		}
		local ny = {}
		do
			ny["\79\118\101\114\108\97\121"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				Size = s(1, 0, 1, 0),
				BackgroundColor3 = l(0, 0, 0),
				BackgroundTransparency = ((0.4 * 10) / 10),
				BorderSizePixel = 0,
				ZIndex = (10799 - 801),
			})
			ny["\67\111\110\116\97\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				AnchorPoint = u(((0.5 * 5) / 5), ((0.5 * 4) / 4)),
				Position = s(((0.5 * 5) / 5), 0, ((0.5 * 5) / 5), 0),
				Size = s(0, bit32.bxor(bit32.bxor(280, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(190, 1515870810), 1515870810)),
				BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (565 - 553), (-972 + 984)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BackgroundColor3 = l((-889 + 903), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				ZIndex = bit32.bxor(bit32.bxor(9999, 1515870810), 1515870810),
			})
			ny["\67\111\110\116\97\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			ny["\83\116\114\111\107\101"] = bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
				Name = "\0",
				Color = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (1021 - 972), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				LineJoinMode = Enum.LineJoinMode.Miter,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			})
			ny["\83\116\114\111\107\101"]:AddToTheme({
				Color = "\79\117\116\108\105\110\101",
			})
			if nw.Logo and nw.Logo ~= "" then
				ny["\76\111\103\111"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
					Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
					Name = "\0",
					ImageColor3 = l((263 - 61), (1173 - 930), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = u(((0.5 * 2) / 2), 0),
					Image = nw.Logo,
					BackgroundTransparency = 1,
					Position = s(((0.5 * 5) / 5), 0, 0, (-397 + 417)),
					Size = s(0, bit32.bxor(bit32.bxor(60, 1515870810), 1515870810), 0, (144 - 84)),
					BorderSizePixel = 0,
					BackgroundColor3 = l((1071 - 816), (634 - 379), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
					ZIndex = (9224 + 776),
				})
				ny["\76\111\103\111"]:AddToTheme({
					ImageColor3 = "\65\99\99\101\110\116",
				})
			end
			ny["\83\116\97\116\117\115"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((-258 + 493), (14 + 221), (-591 + 826)),
				Text = nw.Status or "\76\111\97\100\105\110\103\46\46\46",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Center,
				AnchorPoint = u(((0.5 * 2) / 2), 0),
				Position = s(((0.5 * 10) / 10), 0, 0, (-416 + 511)),
				Size = s(1, -(638 - 618), 0, (990 - 970)),
				BorderSizePixel = 0,
				TextSize = (128 - 119),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (550 - 295), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				ZIndex = bit32.bxor(bit32.bxor(10000, 1515870810), 1515870810),
			})
			ny["\83\116\97\116\117\115"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			ny["\83\116\97\116\117\115\83\116\114\111\107\101"] = ny["\83\116\97\116\117\115"]:TextBorder()
			ny["\66\97\114\79\117\116\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
				Name = "\0",
				AnchorPoint = u(((0.5 * 4) / 4), 0),
				Position = s(((0.5 * 2) / 2), 0, 0, (-729 + 854)),
				Size = s(0, (-486 + 706), 0, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)),
				BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), (-586 + 635), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
				BorderSizePixel = 1,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
				ZIndex = (9583 + 417),
			})
			ny["\66\97\114\79\117\116\101\114"]:AddToTheme({
				BackgroundColor3 = "\73\110\108\105\110\101",
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			ny["\66\97\114\70\105\108\108"] = bl:Create("\70\114\97\109\101", {
				Parent = ny["\66\97\114\79\117\116\101\114"].Instance,
				Name = "\0",
				Size = s(0, 0, 1, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				ZIndex = (10187 - 186),
			})
			ny["\66\97\114\70\105\108\108"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
			ny["\80\101\114\99\101\110\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (372 - 137)),
				TextTransparency = ((0.4 * 10) / 10),
				Text = "\48\37",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Center,
				AnchorPoint = u(((0.5 * 2) / 2), 0),
				Position = s(((0.5 * 4) / 4), 0, 0, (-413 + 551)),
				Size = s(1, -bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), 0, (893 - 877)),
				BorderSizePixel = 0,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l((-18 + 273), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				ZIndex = (10666 - 666),
			})
			ny["\80\101\114\99\101\110\116"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			ny["\80\101\114\99\101\110\116\83\116\114\111\107\101"] = ny["\80\101\114\99\101\110\116"]:TextBorder()
			ny["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = ny["\67\111\110\116\97\105\110\101\114"].Instance,
				Name = "\0",
				AnchorPoint = u(((0.5 * 10) / 10), 1),
				Position = s(((0.5 * 4) / 4), 0, 1, -(239 - 231)),
				Size = s(1, -(690 - 670), 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (-146 + 389), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				ZIndex = (9812 + 188),
			})
			ny["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
		end
		function nx:SetStatus(nz)
			if ny["\83\116\97\116\117\115"] and ny["\83\116\97\116\117\115"].Instance then
				ny["\83\116\97\116\117\115"].Instance.Text = nz
			end
		end
		function nx:SetProgress(oa)
			oa = v(oa, 0, 1)
			nx.Progress = oa
			if ny["\66\97\114\70\105\108\108"] and ny["\66\97\114\70\105\108\108"].Instance then
				ny["\66\97\114\70\105\108\108"]:Tween(TweenInfo.new(((0.15 * 4) / 4), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
					Size = s(oa, 0, 1, 0),
				})
			end
			if ny["\80\101\114\99\101\110\116"] and ny["\80\101\114\99\101\110\116"].Instance then
				ny["\80\101\114\99\101\110\116"].Instance.Text = w(oa * (588 - 488)) .. "%"
			end
		end
		function nx:Dismiss()
			if not nx.IsOpen then
				return
			end
			nx.IsOpen = (1 == 0)
			for _, Value in ny do
				if Value and Value.Instance then
					if Value.Instance:IsA("\70\114\97\109\101") then
						Value:Tween(nil, {
							BackgroundTransparency = 1,
						})
					elseif Value.Instance:IsA("\84\101\120\116\76\97\98\101\108") then
						Value:Tween(nil, {
							TextTransparency = 1,
						})
					elseif Value.Instance:IsA("\73\109\97\103\101\76\97\98\101\108") then
						Value:Tween(nil, {
							ImageTransparency = 1,
						})
					elseif Value.Instance:IsA("\85\73\83\116\114\111\107\101") then
						Value:Tween(nil, {
							Transparency = 1,
						})
					end
				end
			end
			task.delay(a.Tween.Time + ((0.1 * 2) / 2), function()
				for _, Value in ny do
					if Value and Value.Instance then
						pcall(function()
							Value.Instance:Destroy()
						end)
					end
				end
			end)
		end
		return nx
	end
	a.Window = function(ob, oc)
		oc = oc or {}
		local Window = {
			Logo = oc.Logo or oc.logo or "",
			FadeTime = oc.FadeTime or oc.fadetime or ((0.4 * 4) / 4),
			Size = oc.Size or oc.size or s(0, (1251 - 500), 0, (934 - 395)),
			Pages = {},
			Items = {},
			IsOpen = (not true),
		}
		local od = ge:Window({
			Parent = a.Holder,
			Draggable = (not false),
			Resizeable = (1 == 1),
			AnchorPoint = u(0, 0),
			Position = s(0, j.ViewportSize.X / ((3.3 * 10) / 10), 0, j.ViewportSize.Y / ((3.3 * 2) / 2)),
			Size = Window.Size,
		})
		do
			od["\83\105\100\101"] = bl:Create("\70\114\97\109\101", {
				Parent = od["\87\105\110\100\111\119"].Instance,
				Name = "\0",
				Position = s(0, bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), 0, (13 - 1)),
				BorderColor3 = l((643 - 601), (-645 + 694), (-724 + 769)),
				Size = s(0, bit32.bxor(bit32.bxor(200, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(24, 1515870810), 1515870810)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), (-146 + 167)),
			})
			od["\83\105\100\101"]:AddToTheme({
				BackgroundColor3 = "\73\110\108\105\110\101",
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			od["\83\105\100\101"]:Border("\66\111\114\100\101\114")
			od["\87\105\110\100\111\119"].Instance.Visible = (not not false)
			od["\76\111\103\111"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = od["\83\105\100\101"].Instance,
				Name = "\0",
				ImageColor3 = l((-170 + 372), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				ScaleType = Enum.ScaleType.Fit,
				BorderColor3 = l(0, 0, 0),
				AnchorPoint = u(((0.5 * 2) / 2), 0),
				Image = Window.Logo,
				BackgroundTransparency = 1,
				Position = s(((0.5 * 2) / 2), 0, 0, (-953 + 965)),
				Size = s(0, (-256 + 331), 0, (645 - 570)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (42 + 213), (-44 + 299)),
			})
			od["\76\111\103\111"]:AddToTheme({
				ImageColor3 = "\65\99\99\101\110\116",
			})
			od["\83\101\97\114\99\104"] = bl:Create("\70\114\97\109\101", {
				Parent = od["\83\105\100\101"].Instance,
				Name = "\0",
				BorderColor3 = l(bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), bit32.bxor(bit32.bxor(12, 1515870810), 1515870810), (-194 + 206)),
				AnchorPoint = u(0, 1),
				BackgroundTransparency = ((0.4000000059604645 * 4) / 4),
				Position = s(0, (-648 + 654), 1, -(817 - 811)),
				Size = s(0, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
				BorderSizePixel = (-133 + 135),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(14, 1515870810), 1515870810), bit32.bxor(bit32.bxor(17, 1515870810), 1515870810), (705 - 690)),
			})
			od["\83\101\97\114\99\104"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			od["\83\101\97\114\99\104\83\116\114\111\107\101"] = od["\83\101\97\114\99\104"]:Border("\79\117\116\108\105\110\101")
			od["\73\99\111\110"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = od["\83\101\97\114\99\104"].Instance,
				Name = "\0",
				ScaleType = Enum.ScaleType.Fit,
				BorderColor3 = l(0, 0, 0),
				AnchorPoint = u(0, ((0.5 * 10) / 10)),
				Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\55\49\49\57\55\57\52\54\49\51\53\49\53\48",
				BackgroundTransparency = 1,
				Position = s(0, 0, ((0.5 * 5) / 5), 0),
				Size = s(0, (-318 + 334), 0, bit32.bxor(bit32.bxor(16, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (437 - 182), (-250 + 505)),
			})
			od["\73\110\112\117\116"] = bl:Create("\84\101\120\116\66\111\120", {
				Parent = od["\83\101\97\114\99\104"].Instance,
				Name = "\0",
				FontFace = a.Font,
				CursorPosition = -1,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (-124 + 359), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "",
				Size = s(0, 0, 1, 0),
				Position = s(0, (-684 + 706), 0, 0),
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				PlaceholderColor3 = l((-389 + 574), (-349 + 534), (-95 + 280)),
				AutomaticSize = Enum.AutomaticSize.X,
				PlaceholderText = "\46\46",
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l((296 - 41), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (168 + 87)),
			})
			od["\73\110\112\117\116"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
				PlaceholderColor3 = "\80\108\97\99\101\104\111\108\100\101\114\32\84\101\120\116",
			})
			od["\73\110\112\117\116"]:TextBorder()
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = od["\83\101\97\114\99\104"].Instance,
				Name = "\0",
				PaddingRight = t(0, (-827 + 832)),
				PaddingLeft = t(0, bit32.bxor(bit32.bxor(3, 1515870810), 1515870810)),
			})
			od["\80\97\103\101\115"] = bl:Create("\70\114\97\109\101", {
				Parent = od["\83\105\100\101"].Instance,
				Name = "\0",
				BackgroundTransparency = 1,
				Position = s(0, 0, 0, (-580 + 680)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 1, -(1076 - 941)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (1219 - 964)),
			})
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = od["\80\97\103\101\115"].Instance,
				Name = "\0",
				PaddingRight = t(0, (306 - 298)),
				PaddingLeft = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
			})
			bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
				Parent = od["\80\97\103\101\115"].Instance,
				Name = "\0",
				Padding = t(0, (547 - 539)),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			local Content, _ = d:GetUserThumbnailAsync(i.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			od["\65\118\97\116\97\114"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = od["\83\105\100\101"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				AnchorPoint = u(1, 1),
				Image = Content,
				BackgroundTransparency = 1,
				Position = s(1, -bit32.bxor(bit32.bxor(6, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(6, 1515870810), 1515870810)),
				Size = s(0, (307 - 282), 0, (721 - 696)),
				BorderSizePixel = 0,
				BackgroundColor3 = l((928 - 673), (266 - 11), (605 - 350)),
			})
			od["\65\118\97\116\97\114"]:Border("\79\117\116\108\105\110\101").Instance.LineJoinMode = Enum.LineJoinMode.Round
			bl:Create("\85\73\67\111\114\110\101\114", {
				Parent = od["\65\118\97\116\97\114"].Instance,
				Name = "\0",
				CornerRadius = t(1, 0),
			})
			od["\67\111\110\116\101\110\116"] = bl:Create("\70\114\97\109\101", {
				Parent = od["\87\105\110\100\111\119"].Instance,
				Name = "\0",
				BackgroundTransparency = 1,
				Position = s(0, bit32.bxor(bit32.bxor(226, 1515870810), 1515870810), 0, (-819 + 831)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, -bit32.bxor(bit32.bxor(238, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(24, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (998 - 743)),
			})
			od["\77\111\117\115\101\66\97\99\107\103\114\111\117\110\100"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				BackgroundTransparency = 1,
				Position = s(0, 0, 0, 0),
				BorderColor3 = l(0, 0, 0),
				Size = s(0, (-910 + 926), 0, bit32.bxor(bit32.bxor(16, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				ZIndex = bit32.bxor(bit32.bxor(9999, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			od["\77\111\117\115\101\73\109\97\103\101"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = od["\77\111\117\115\101\66\97\99\107\103\114\111\117\110\100"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\55\54\54\51\49\54\54\48\49\49\52\49\57\54",
				BackgroundTransparency = 1,
				Size = s(1, 0, 1, 0),
				BorderSizePixel = 0,
				ZIndex = bit32.bxor(bit32.bxor(9999, 1515870810), 1515870810),
				BackgroundColor3 = l((45 + 210), (210 + 45), (1034 - 779)),
			})
			od["\77\111\117\115\101\73\109\97\103\101"]:AddToTheme({
				ImageColor3 = "\65\99\99\101\110\116",
			})
			bl:Create("\85\73\71\114\97\100\105\101\110\116", {
				Parent = od["\77\111\117\115\101\73\109\97\103\101"].Instance,
				Name = "\0",
				Rotation = bit32.bxor(bit32.bxor(90, 1515870810), 1515870810),
				Color = o({
					p(0, l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-100 + 355))),
					p(1, l(bit32.bxor(bit32.bxor(99, 1515870810), 1515870810), bit32.bxor(bit32.bxor(108, 1515870810), 1515870810), bit32.bxor(bit32.bxor(117, 1515870810), 1515870810))),
				}),
			})
			c.MouseIconEnabled = (not not false)
			Window.Items = od
		end
		local oe = (1 == 0)
		od["\73\110\112\117\116"]:Connect("\70\111\99\117\115\101\100", function()
			od["\83\101\97\114\99\104"]:Tween(nil, {
				BackgroundTransparency = 0,
			})
			od["\83\101\97\114\99\104\83\116\114\111\107\101"]:Tween(nil, {
				Transparency = 0,
			})
		end)
		od["\73\110\112\117\116"]:Connect("\70\111\99\117\115\76\111\115\116", function()
			od["\83\101\97\114\99\104"]:Tween(nil, {
				BackgroundTransparency = ((0.4 * 5) / 5),
			})
			od["\83\101\97\114\99\104\83\116\114\111\107\101"]:Tween(nil, {
				Transparency = ((0.4 * 10) / 10),
			})
		end)
		od["\73\110\112\117\116"]:OnHover(function()
			od["\83\101\97\114\99\104"]:ChangeItemTheme({
				BackgroundColor3 = "\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			od["\83\101\97\114\99\104"]:Tween(nil, {
				BackgroundColor3 = a.Theme["\72\111\118\101\114\101\100\32\69\108\101\109\101\110\116"],
			})
		end)
		od["\73\110\112\117\116"]:OnHoverLeave(function()
			od["\83\101\97\114\99\104"]:ChangeItemTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			od["\83\101\97\114\99\104"]:Tween(nil, {
				BackgroundColor3 = a.Theme.Background,
			})
		end)
		a:Connect(f.RenderStepped, function()
			local of = c:GetMouseLocation()
			od["\77\111\117\115\101\66\97\99\107\103\114\111\117\110\100"].Instance.Position = s(0, of.X - 1, 0, of.Y - (-478 + 534))
		end)
		local og = {}
		function Window:AddToOldSizes(oh, oi)
			if not og[oh] then
				og[oh] = oi
			end
		end
		function Window:GetOldSize(oj)
			if og[oj] then
				return og[oj]
			end
		end
		function Window:SetOpen(ok)
			if oe then
				return
			end
			Window.IsOpen = ok
			oe = (not false)
			if Window.IsOpen then
				od["\87\105\110\100\111\119"].Instance.Visible = (1 == 1)
			end
			local ol = od["\87\105\110\100\111\119"].Instance:GetDescendants()
			z(ol, od["\87\105\110\100\111\119"].Instance)
			local om
			for Index, Value in ol do
				local on = ar:GetProperty(Value)
				if not on then
					continue
				end
				if type(on) == "\116\97\98\108\101" then
					for _, oo in on do
						om = ar:FadeItem(Value, oo, ok, a.FadeSpeed)
					end
				else
					om = ar:FadeItem(Value, on, ok, a.FadeSpeed)
				end
			end
			om.Tween.Completed:Connect(function()
				oe = (not not false)
				od["\87\105\110\100\111\119"].Instance.Visible = Window.IsOpen
				if Window.IsOpen then
					od["\77\111\117\115\101\66\97\99\107\103\114\111\117\110\100"].Instance.Visible = (not not true)
					c.MouseIconEnabled = (1 == 0)
				else
					od["\77\111\117\115\101\66\97\99\107\103\114\111\117\110\100"].Instance.Visible = (1 == 0)
					c.MouseIconEnabled = (1 == 1)
				end
			end)
		end
		a:Connect(c.InputBegan, function(Input)
			if tostring(Input.KeyCode) == a.MenuKeybind or tostring(Input.UserInputType) == a.MenuKeybind then
				Window:SetOpen(not Window.IsOpen)
			end
		end)
		local op
		od["\73\110\112\117\116"]:Connect("\70\111\99\117\115\101\100", function()
			local oq = a.SearchItems[a.CurrentPage]
			if not oq then
				return
			end
			op = f.RenderStepped:Connect(function()
				for Index, Value in oq do
					local Name = Value.Name
					local Element = Value.Element
					if ag(ai(Name), ai(od["\73\110\112\117\116"].Instance.Text)) then
						if od["\73\110\112\117\116"].Instance.Text ~= "" then
							Element.Instance.Visible = (1 == 1)
							Element:Tween(TweenInfo.new(((0.08 * 5) / 5), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								Size = Window:GetOldSize(Element),
							})
						else
							Element.Instance.Visible = (not false)
							Element:Tween(TweenInfo.new(((0.08 * 5) / 5), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								Size = Window:GetOldSize(Element),
							})
						end
					else
						Window:AddToOldSizes(Element, Element.Instance.Size)
						Element:Tween(TweenInfo.new(((0.08 * 10) / 10), Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							Size = s(Window:GetOldSize(Element).X.Scale, Window:GetOldSize(Element).X.Offset, 0, 0),
						})
						task.wait(((0.1 * 5) / 5))
						Element.Instance.Visible = (1 == 0)
					end
				end
			end)
		end)
		od["\73\110\112\117\116"]:Connect("\70\111\99\117\115\76\111\115\116", function()
			if op then
				op:Disconnect()
				op = nil
			end
		end)
		Window:SetOpen((1 == 1))
		return setmetatable(Window, ob)
	end
	a.Page = function(ot, ou)
		ou = ou or {}
		local Page = {
			Window = ot,
			Name = ou.Name or ou.name or "\80\97\103\101",
			Columns = ou.Columns or ou.columns or (997 - 995),
			SubPages = ou.SubPages or ou.subpages or (not not false),
		}
		a.SearchItems[Page] = {}
		local ov, Items = ge:WindowPage({
			Name = Page.Name,
			ContentHolder = Page.Window.Items["\67\111\110\116\101\110\116"],
			Stack = Page.Window.Pages,
			Parent = Page.Window.Items["\80\97\103\101\115"],
			Columns = Page.Columns,
			SubPages = Page.SubPages,
			FadeTime = Page.Window.FadeTime,
			Window = Page.Window,
		})
		return setmetatable(ov, a.Pages)
	end
	a.Pages.SubPage = function(ow, ox)
		ox = ox or {}
		local oy = {
			Window = ow.Window,
			Page = ow,
			Name = ox.Name or ox.name or "\83\117\98\80\97\103\101",
			Columns = ox.Columns or ox.columns or (178 - 176),
		}
		a.SearchItems[oy] = {}
		local oz, Items = ge:WindowSubPage({
			Page = oy.Page,
			Name = oy.Name,
			Columns = oy.Columns,
			Window = oy.Page.Window,
		})
		return setmetatable(oz, a.Pages)
	end
	a.Pages.Playerlist = function(pa, pb)
		local Playerlist = {
			Window = pa.Window,
			Page = pa,
			CurrentPlayer = nil,
			Players = {},
		}
		local pc = {}
		do
			Playerlist.Page.Items.Page.Instance:FindFirstChildOfClass("\85\73\76\105\115\116\76\97\121\111\117\116"):Destroy()
			pc["\80\108\97\121\101\114\108\105\115\116"] = bl:Create("\70\114\97\109\101", {
				Parent = Playerlist.Page.Items["\80\97\103\101"].Instance,
				Name = "\0",
				Position = s(0, 0, 0, 1),
				BorderColor3 = l((-15 + 57), (-593 + 642), (67 - 22)),
				Size = s(1, 0, 0, bit32.bxor(bit32.bxor(460, 1515870810), 1515870810)),
				BorderSizePixel = (-827 + 829),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
			})
			pc["\80\108\97\121\101\114\108\105\115\116"]:AddToTheme({
				BackgroundColor3 = "\73\110\108\105\110\101",
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				LineJoinMode = Enum.LineJoinMode.Miter,
				Color = l((1102 - 900), (433 - 190), (-601 + 856)),
				Thickness = 1,
			}):AddToTheme({
				Color = "\66\111\114\100\101\114",
			})
			pc["\82\101\97\108\80\108\97\121\101\114\108\105\115\116"] = bl:Create("\70\114\97\109\101", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 0, (-972 + 980)),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, -(-240 + 256), 0, (26 + 339)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(14, 1515870810), 1515870810), (356 - 339), (512 - 497)),
			})
			pc["\82\101\97\108\80\108\97\121\101\114\108\105\115\116"]:AddToTheme({
				BackgroundColor3 = "\66\97\99\107\103\114\111\117\110\100",
				BorderColor3 = "\66\111\114\100\101\114",
			})
			bl:Create("\85\73\83\116\114\111\107\101", {
				Parent = pc["\82\101\97\108\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				LineJoinMode = Enum.LineJoinMode.Miter,
				Color = l((139 + 63), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				Thickness = 1,
			}):AddToTheme({
				Color = "\79\117\116\108\105\110\101",
			})
			pc["\80\108\97\121\101\114\72\111\108\100\101\114"] = bl:Create("\83\99\114\111\108\108\105\110\103\70\114\97\109\101", {
				Parent = pc["\82\101\97\108\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				Active = (1 == 1),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				BorderSizePixel = 0,
				CanvasSize = s(0, 0, 0, 0),
				ScrollBarImageColor3 = l(bit32.bxor(bit32.bxor(202, 1515870810), 1515870810), (336 - 93), (250 + 5)),
				MidImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\56\54\57\49\56\55\51\54\56\57\52\57\50\55",
				BorderColor3 = l(0, 0, 0),
				ScrollBarThickness = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				Size = s(1, -(-127 + 143), 1, -bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
				BackgroundTransparency = 1,
				Position = s(0, (514 - 506), 0, bit32.bxor(bit32.bxor(4, 1515870810), 1515870810)),
				BottomImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\56\54\57\49\56\55\51\54\56\57\52\57\50\55",
				TopImage = "\114\98\120\97\115\115\101\116\105\100\58\47\47\56\54\57\49\56\55\51\54\56\57\52\57\50\55",
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (212 + 43), (1094 - 839)),
			})
			pc["\80\108\97\121\101\114\72\111\108\100\101\114"]:AddToTheme({
				ScrollBarImageColor3 = "\65\99\99\101\110\116",
			})
			bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
				Parent = pc["\80\108\97\121\101\114\72\111\108\100\101\114"].Instance,
				Name = "\0",
				Padding = t(0, (54 - 50)),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = pc["\80\108\97\121\101\114\72\111\108\100\101\114"].Instance,
				Name = "\0",
				PaddingTop = t(0, (408 - 406)),
				PaddingBottom = t(0, (769 - 767)),
				PaddingRight = t(0, (-682 + 694)),
				PaddingLeft = t(0, bit32.bxor(bit32.bxor(2, 1515870810), 1515870810)),
			})
			pc["\80\108\97\121\101\114\65\118\97\116\97\114"] = bl:Create("\73\109\97\103\101\76\97\98\101\108", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				AnchorPoint = u(0, 1),
				Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\56\50\48\48\51\56\55\55\54\49\55\52\52",
				BackgroundTransparency = 1,
				Position = s(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810), 1, -bit32.bxor(bit32.bxor(10, 1515870810), 1515870810)),
				Size = s(0, bit32.bxor(bit32.bxor(65, 1515870810), 1515870810), 0, bit32.bxor(bit32.bxor(65, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (915 - 660)),
			})
			pc["\80\108\97\121\101\114\85\115\101\114\73\68"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((1214 - 979), (-373 + 608), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "\63\63\63",
				AutomaticSize = Enum.AutomaticSize.X,
				Size = s(0, 0, 0, (9 + 6)),
				BackgroundTransparency = 1,
				Position = s(0, bit32.bxor(bit32.bxor(80, 1515870810), 1515870810), 1, -(1059 - 999)),
				BorderSizePixel = 0,
				ZIndex = (479 - 477),
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l((-680 + 935), (1088 - 833), (139 + 116)),
			})
			pc["\80\108\97\121\101\114\85\115\101\114\73\68"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			pc["\80\108\97\121\101\114\85\115\101\114\73\68"]:TextBorder()
			pc["\80\108\97\121\101\114\65\99\99\111\117\110\116\65\103\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "\63\63\63",
				AutomaticSize = Enum.AutomaticSize.X,
				Size = s(0, 0, 0, (-606 + 621)),
				BackgroundTransparency = 1,
				Position = s(0, bit32.bxor(bit32.bxor(80, 1515870810), 1515870810), 1, -(407 - 367)),
				BorderSizePixel = 0,
				ZIndex = (71 - 69),
				TextSize = (-192 + 201),
				BackgroundColor3 = l((-593 + 848), (772 - 517), (617 - 362)),
			})
			pc["\80\108\97\121\101\114\65\99\99\111\117\110\116\65\103\101"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			pc["\80\108\97\121\101\114\65\99\99\111\117\110\116\65\103\101"]:TextBorder()
			pc["\80\108\97\121\101\114\85\115\101\114\110\97\109\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pc["\80\108\97\121\101\114\108\105\115\116"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((160 + 75), (618 - 383), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "\63\63\63",
				AutomaticSize = Enum.AutomaticSize.X,
				Size = s(0, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				BackgroundTransparency = 1,
				Position = s(0, bit32.bxor(bit32.bxor(80, 1515870810), 1515870810), 1, -(655 - 577)),
				BorderSizePixel = 0,
				ZIndex = (157 - 155),
				TextSize = (-893 + 902),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (866 - 611), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			pc["\80\108\97\121\101\114\85\115\101\114\110\97\109\101"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			pc["\80\108\97\121\101\114\85\115\101\114\110\97\109\101"]:TextBorder()
		end
		local Dropdown, pd = ge:Dropdown({
			Parent = pc["\80\108\97\121\101\114\108\105\115\116"],
			Name = "\83\116\97\116\117\115",
			Flag = "\80\108\97\121\101\114\108\105\115\116\83\116\97\116\117\115",
			Items = {
				"\78\101\117\116\114\97\108",
				"\80\114\105\111\114\105\116\121",
				"\70\114\105\101\110\100\108\121",
			},
			Default = "\78\101\117\116\114\97\108",
			Multi = (not true),
			Callback = function(Value)
				if Playerlist.Player then
					if Playerlist.Player == i then
						return
					end
					if Value == "\78\101\117\116\114\97\108" then
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus:Tween(nil, {
							TextColor3 = a.Theme["\84\101\120\116"],
						})
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus.Instance.Text = "\78\101\117\116\114\97\108"
					elseif Value == "\80\114\105\111\114\105\116\121" then
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus:Tween(nil, {
							TextColor3 = l((1084 - 849), (-215 + 291), (-408 + 456)),
						})
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus.Instance.Text = "\80\114\105\111\114\105\116\121"
					elseif Value == "\70\114\105\101\110\100\108\121" then
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus:Tween(nil, {
							TextColor3 = l(bit32.bxor(bit32.bxor(134, 1515870810), 1515870810), (154 + 81), (941 - 885)),
						})
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus.Instance.Text = "\70\114\105\101\110\100\108\121"
					else
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus:Tween(nil, {
							TextColor3 = a.Theme["\84\101\120\116"],
						})
						Playerlist.Players[Playerlist.Player.Name].PlayerStatus.Instance.Text = "\78\101\117\116\114\97\108"
					end
				end
			end,
		})
		pd["\68\114\111\112\100\111\119\110"].Instance.AnchorPoint = u(1, 1)
		pd["\68\114\111\112\100\111\119\110"].Instance.Position = s(1, -(-729 + 737), 1, -bit32.bxor(bit32.bxor(25, 1515870810), 1515870810))
		pd["\68\114\111\112\100\111\119\110"].Instance.Size = s(0, (-349 + 549), 0, (166 - 126))
		function Playerlist:Add(pe)
			local pf = {}
			pf["\78\101\119\80\108\97\121\101\114"] = bl:Create("\84\101\120\116\66\117\116\116\111\110", {
				Parent = pc["\80\108\97\121\101\114\72\111\108\100\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(0, 0, 0),
				BorderColor3 = l(0, 0, 0),
				Text = "",
				AutoButtonColor = (1 == 0),
				BackgroundTransparency = 1,
				Size = s(1, 0, 0, bit32.bxor(bit32.bxor(20, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				TextSize = (364 - 350),
				BackgroundColor3 = l((-728 + 983), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			pf["\78\97\109\101"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pf["\78\101\119\80\108\97\121\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((-717 + 952), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (377 - 142)),
				BorderColor3 = l(0, 0, 0),
				Text = pe.Name,
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = s(((0.3499999940395355 * 2) / 2), 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				TextSize = (179 - 170),
				BackgroundColor3 = l((-314 + 569), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (89 + 166)),
			})
			pf["\78\97\109\101"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			local Team = pe.Team ~= nil and pe.Team.Name or "\78\111\110\101"
			local pg = pe.TeamColor ~= nil and BrickColor.new(tostring(pe.TeamColor)).Color or Color3.new(1, 1, 1)
			pf["\84\101\97\109"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pf["\78\101\119\80\108\97\121\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = pg,
				BorderColor3 = l(0, 0, 0),
				Text = Team,
				AnchorPoint = u(((0.5 * 10) / 10), 0),
				BackgroundTransparency = 1,
				Position = s(((0.5 * 5) / 5), 0, 0, 0),
				Size = s(((0.3499999940395355 * 2) / 2), 0, 0, (-321 + 336)),
				BorderSizePixel = 0,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-193 + 448)),
			})
			pf["\83\116\97\116\117\115"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pf["\78\101\119\80\108\97\121\101\114"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((665 - 430), (1017 - 782), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = "\78\101\117\116\114\97\108",
				Size = s(((0.3499999940395355 * 10) / 10), 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Right,
				Position = s(((0.6499999761581421 * 4) / 4), 0, 0, 0),
				BorderSizePixel = 0,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (412 - 157)),
			})
			pf["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = pf["\78\101\119\80\108\97\121\101\114"].Instance,
				Name = "\0",
				AnchorPoint = u(0, 1),
				Position = s(0, 0, 1, -1),
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l((632 - 590), (330 - 281), bit32.bxor(bit32.bxor(45, 1515870810), 1515870810)),
			})
			pf["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\79\117\116\108\105\110\101",
			})
			if pe == i then
				pf["\83\116\97\116\117\115"].Instance.TextColor3 = a.Theme.Accent
				pf["\83\116\97\116\117\115"].Instance.Text = "\76\111\99\97\108\80\108\97\121\101\114"
				pf["\83\116\97\116\117\115"]:AddToTheme({
					TextColor3 = "\65\99\99\101\110\116",
				})
			end
			local ph = {
				Name = pe.Name,
				Selected = (1 == 0),
				PlayerButton = pf["\78\101\119\80\108\97\121\101\114"],
				PlayerName = pf["\78\97\109\101"],
				PlayerTeam = pf["\84\101\97\109"],
				PlayerStatus = pf["\83\116\97\116\117\115"],
				Player = pe,
			}
			function ph:Toggle(Status)
				if Status == "\65\99\116\105\118\101" then
					pf["\78\97\109\101"]:ChangeItemTheme({
						TextColor3 = "\65\99\99\101\110\116",
					})
					pf["\78\97\109\101"]:Tween(nil, {
						TextColor3 = a.Theme.Accent,
					})
				else
					pf["\78\97\109\101"]:ChangeItemTheme({
						TextColor3 = "\84\101\120\116",
					})
					pf["\78\97\109\101"]:Tween(nil, {
						TextColor3 = a.Theme.Text,
					})
				end
			end
			function ph:Set()
				ph.Selected = not ph.Selected
				if ph.Selected then
					Playerlist.Player = ph.Player
					for Index, Value in Playerlist.Players do
						Value.Selected = (1 == 0)
						Value:Toggle("\73\110\97\99\116\105\118\101")
					end
					ph:Toggle("\65\99\116\105\118\101")
					local PlayerAvatar = d:GetUserThumbnailAsync(Playerlist.Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					pc["\80\108\97\121\101\114\65\118\97\116\97\114"].Instance.Image = PlayerAvatar
					pc["\80\108\97\121\101\114\85\115\101\114\110\97\109\101"].Instance.Text = Playerlist.Player.DisplayName .. "\32\40\64" .. Playerlist.Player.Name .. ")"
					pc["\80\108\97\121\101\114\85\115\101\114\73\68"].Instance.Text = tostring(Playerlist.Player.UserId)
					pc["\80\108\97\121\101\114\65\99\99\111\117\110\116\65\103\101"].Instance.Text = tostring(Playerlist.Player.AccountAge) .. "\32\100\97\121\115\32\111\108\100"
				else
					Playerlist.Player = nil
					ph:Toggle("\73\110\97\99\116\105\118\101")
					pc["\80\108\97\121\101\114\65\118\97\116\97\114"].Instance.Image = "\114\98\120\97\115\115\101\116\105\100\58\47\47\57\56\50\48\48\51\56\55\55\54\49\55\52\52"
					pc["\80\108\97\121\101\114\85\115\101\114\110\97\109\101"].Instance.Text = "\78\111\110\101"
					pc["\80\108\97\121\101\114\85\115\101\114\73\68"].Instance.Text = "\78\111\110\101"
					pc["\80\108\97\121\101\114\65\99\99\111\117\110\116\65\103\101"].Instance.Text = "\78\111\110\101"
				end
				if pb.Callback then
					a:SafeCall(pb.Callback, Playerlist.Player, ph.PlayerStatus.Instance.Text, ph.PlayerTeam.Instance.Text)
				end
			end
			pf["\78\101\119\80\108\97\121\101\114"]:Connect("\77\111\117\115\101\66\117\116\116\111\110\49\68\111\119\110", function()
				ph:Set()
			end)
			Playerlist.Players[pe.Name] = ph
			return ph
		end
		function Playerlist:Remove(Name)
			if Playerlist.Players[Name] then
				Playerlist.Players[Name].PlayerButton:Clean()
			end
			Playerlist.Players[Name] = nil
		end
		for Index, Value in d:GetPlayers() do
			Playerlist:Add(Value)
		end
		a:Connect(d.PlayerRemoving, function(pi)
			if Playerlist.Players[pi.Name] then
				Playerlist:Remove(pi.Name)
			end
		end)
		a:Connect(d.PlayerAdded, function(pj)
			Playerlist:Add(pj)
		end)
		return Playerlist
	end
	a.Pages.Section = function(pk, pl)
		pl = pl or {}
		local Section = {
			Window = pk.Window,
			Page = pk,
			Name = pl.Name or pl.name or "\83\101\99\116\105\111\110",
			Side = pl.Side or pl.side or 1,
			Items = {},
		}
		local pm = {}
		do
			pm["\83\101\99\116\105\111\110"] = bl:Create("\70\114\97\109\101", {
				Parent = Section.Page.ColumnsData[Section.Side].Instance,
				Name = "\0",
				Size = s(1, 0, 0, bit32.bxor(bit32.bxor(25, 1515870810), 1515870810)),
				BorderColor3 = l(bit32.bxor(bit32.bxor(42, 1515870810), 1515870810), bit32.bxor(bit32.bxor(49, 1515870810), 1515870810), (-406 + 451)),
				BorderSizePixel = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), bit32.bxor(bit32.bxor(24, 1515870810), 1515870810), bit32.bxor(bit32.bxor(21, 1515870810), 1515870810)),
			})
			pm["\83\101\99\116\105\111\110"]:AddToTheme({
				BackgroundColor3 = "\73\110\108\105\110\101",
				BorderColor3 = "\79\117\116\108\105\110\101",
			})
			pm["\83\101\99\116\105\111\110"]:Border("\66\111\114\100\101\114")
			pm["\76\105\110\101\114"] = bl:Create("\70\114\97\109\101", {
				Parent = pm["\83\101\99\116\105\111\110"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, 1),
				BorderSizePixel = 0,
				BackgroundColor3 = l((868 - 666), (-551 + 794), (821 - 566)),
			})
			pm["\76\105\110\101\114"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
			pm["\71\108\111\119"] = bl:Create("\70\114\97\109\101", {
				Parent = pm["\83\101\99\116\105\111\110"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, bit32.bxor(bit32.bxor(15, 1515870810), 1515870810)),
				BorderSizePixel = 0,
				BackgroundColor3 = l((-668 + 870), bit32.bxor(bit32.bxor(243, 1515870810), 1515870810), (311 - 56)),
			})
			pm["\71\108\111\119"]:AddToTheme({
				BackgroundColor3 = "\65\99\99\101\110\116",
			})
			bl:Create("\85\73\71\114\97\100\105\101\110\116", {
				Parent = pm["\71\108\111\119"].Instance,
				Name = "\0",
				Rotation = bit32.bxor(bit32.bxor(90, 1515870810), 1515870810),
				Transparency = q({
					r(0, 0),
					r(((0.193 * 4) / 4), ((0.8687499761581421 * 5) / 5)),
					r(((0.504 * 4) / 4), ((0.96875 * 2) / 2)),
					r(1, 1),
				}),
			})
			pm["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = pm["\83\101\99\116\105\111\110"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l((1074 - 839), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = Section.Name,
				Size = s(0, 0, 0, (-948 + 963)),
				BackgroundTransparency = 1,
				Position = s(0, (995 - 989), 0, (394 - 389)),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.X,
				TextSize = (389 - 380),
				BackgroundColor3 = l((706 - 451), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), (-31 + 286)),
			})
			pm["\84\101\120\116"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			pm["\84\101\120\116"]:TextBorder()
			bl:Create("\85\73\80\97\100\100\105\110\103", {
				Parent = pm["\83\101\99\116\105\111\110"].Instance,
				Name = "\0",
				PaddingBottom = t(0, bit32.bxor(bit32.bxor(8, 1515870810), 1515870810)),
			})
			pm["\67\111\110\116\101\110\116"] = bl:Create("\70\114\97\109\101", {
				Parent = pm["\83\101\99\116\105\111\110"].Instance,
				Name = "\0",
				BorderColor3 = l(0, 0, 0),
				BackgroundTransparency = 1,
				Position = s(0, (-416 + 426), 0, bit32.bxor(bit32.bxor(26, 1515870810), 1515870810)),
				Size = s(1, -bit32.bxor(bit32.bxor(20, 1515870810), 1515870810), 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = l((1196 - 941), (-606 + 861), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			bl:Create("\85\73\76\105\115\116\76\97\121\111\117\116", {
				Parent = pm["\67\111\110\116\101\110\116"].Instance,
				Name = "\0",
				Padding = t(0, (677 - 669)),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			Section.Items = pm
		end
		return setmetatable(Section, a.Sections)
	end
	a.Sections.Toggle = function(pn, po)
		po = po or {}
		local Toggle = {
			Window = pn.Window,
			Page = pn.Page,
			Section = pn,
			Name = po.Name or po.name or "\84\111\103\103\108\101",
			Tooltip = po.ToolTip or po.tooltip or nil,
			Flag = po.Flag or po.flag or a:NextFlag(),
			Default = po.Default or po.default or (1 == 0),
			Callback = po.Callback or po.callback or function()
			end,
		}
		local pp, pq = ge:Toggle({
			Name = Toggle.Name,
			Parent = Toggle.Section.Items["\67\111\110\116\101\110\116"],
			Tooltip = Toggle.Tooltip,
			Flag = Toggle.Flag,
			Default = Toggle.Default,
			Page = Toggle.Page,
			Callback = Toggle.Callback,
		})
		function pp:Colorpicker(pr)
			local ps = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Flag = pr.Flag or pr.flag or a:NextFlag(),
				Default = pr.Default or pr.default or Color3.fromRGB((687 - 432), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				Callback = pr.Callback or pr.callback or function()
				end,
				Alpha = pr.Alpha or pr.alpha or 0,
			}
			local pt, ColorpickerItems = ge:Colorpicker({
				Name = ps.Name,
				Parent = pq["\83\117\98\69\108\101\109\101\110\116\115"],
				Pages = (not false),
				Page = ps.Page,
				Flag = ps.Flag,
				Default = ps.Default,
				Alpha = ps.Alpha,
				Callback = ps.Callback,
			})
			return pt
		end
		function pp:Keybind(pu)
			pu = pu or {}
			local pv = {
				Window = self.Window,
				Page = self.Page,
				Section = self.Section,
				Flag = pu.Flag or pu.flag or a:NextFlag(),
				Default = pu.Default or pu.default or Enum.KeyCode.RightShift,
				Callback = pu.Callback or pu.callback or function()
				end,
				Mode = pu.Mode or pu.mode or "\84\111\103\103\108\101",
			}
			local pw, KeybindItems = ge:Keybind({
				Name = Toggle.Name,
				Parent = pq["\83\117\98\69\108\101\109\101\110\116\115"],
				Page = pv.Page,
				Flag = pv.Flag,
				Default = pv.Default,
				Mode = pv.Mode,
				Callback = pv.Callback,
			})
			return pw
		end
		return pp
	end
	a.Sections.Button = function(px)
		local Button = {
			Window = px.Window,
			Page = px.Page,
			Section = px,
		}
		local NewButton, ButtonItems = ge:Button({
			Parent = Button.Section.Items["\67\111\110\116\101\110\116"],
			Page = Button.Page,
		})
		return NewButton
	end
	a.Sections.Slider = function(py, pz)
		pz = pz or {}
		local Slider = {
			Window = py.Window,
			Page = py.Page,
			Section = py,
			Name = pz.Name or pz.name or "\83\108\105\100\101\114",
			Flag = pz.Flag or pz.flag or a:NextFlag(),
			Min = pz.Min or pz.min or 0,
			Decimals = pz.Decimals or pz.decimals or 1,
			Suffix = pz.Suffix or pz.suffix or "",
			ToolTip = pz.ToolTip or pz.tooltip or nil,
			Max = pz.Max or pz.max or bit32.bxor(bit32.bxor(100, 1515870810), 1515870810),
			Default = pz.Default or pz.Default or 0,
			Callback = pz.Callback or pz.callback or function()
			end,
		}
		local qa, qb = ge:Slider({
			Name = Slider.Name,
			Parent = Slider.Section.Items["\67\111\110\116\101\110\116"],
			Flag = Slider.Flag,
			Min = Slider.Min,
			Page = Slider.Page,
			Decimals = Slider.Decimals,
			Suffix = Slider.Suffix,
			Max = Slider.Max,
			Default = Slider.Default,
			Callback = Slider.Callback,
		})
		if Slider.ToolTip then
			qb["\83\108\105\100\101\114"]:Tooltip({
				Text = Slider.ToolTip.Name,
				Description = Slider.ToolTip.Description,
			})
		end
		local qc = a.SearchItems[Slider.Page]
		if qc then
			local qd = {
				Element = qb["\83\108\105\100\101\114"],
				Name = Slider.Name,
			}
			z(qc, qd)
		end
		return qa
	end
	a.Sections.Dropdown = function(qe, qf)
		qf = qf or {}
		local Dropdown = {
			Window = qe.Window,
			Page = qe.Page,
			Section = qe,
			Name = qf.Name or qf.name or "\68\114\111\112\100\111\119\110",
			Flag = qf.Flag or qf.flag or a:NextFlag(),
			Items = qf.Items or qf.items or {},
			Default = qf.Default or qf.default or nil,
			ToolTip = qf.ToolTip or qf.tooltip or nil,
			Multi = qf.Multi or qf.multi or (not true),
			Callback = qf.Callback or qf.callback or function()
			end,
		}
		local qg, qh = ge:Dropdown({
			Name = Dropdown.Name,
			Parent = Dropdown.Section.Items["\67\111\110\116\101\110\116"],
			Flag = Dropdown.Flag,
			Items = Dropdown.Items,
			Page = Dropdown.Page,
			Default = Dropdown.Default,
			Multi = Dropdown.Multi,
			Callback = Dropdown.Callback,
		})
		if Dropdown.ToolTip then
			qh["\68\114\111\112\100\111\119\110"]:Tooltip({
				Text = Dropdown.ToolTip.Name,
				Description = Dropdown.ToolTip.Description,
			})
		end
		local qi = a.SearchItems[Dropdown.Page]
		if qi then
			local qj = {
				Element = qh["\68\114\111\112\100\111\119\110"],
				Name = Dropdown.Name,
			}
			z(qi, qj)
		end
		return qg
	end
	a.Sections.Label = function(qk, Name, Tooltip)
		local Label = {
			Window = qk.Window,
			Page = qk.Page,
			Section = qk,
			Name = Name or "\76\97\98\101\108",
		}
		local ql, qm = ge:Label({
			Name = Label.Name,
			Parent = Label.Section.Items["\67\111\110\116\101\110\116"],
			Page = Label.Page,
		})
		if Tooltip then
			qm["\76\97\98\101\108"]:Tooltip({
				Text = Tooltip.Name,
				Description = Tooltip.Description,
			})
		end
		function ql:Colorpicker(qn)
			qn = qn or {}
			local qo = {
				Window = self.Window,
				Page = self.Page,
				Section = self.Section,
				Flag = qn.Flag or qn.flag or a:NextFlag(),
				Default = qn.Default or qn.default or Color3.fromRGB((529 - 274), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
				Callback = qn.Callback or qn.callback or function()
				end,
				Alpha = qn.Alpha or qn.alpha or 0,
			}
			local qp, ColorpickerItems = ge:Colorpicker({
				Name = qo.Name,
				Parent = qm["\83\117\98\69\108\101\109\101\110\116\115"],
				Pages = (1 == 1),
				Page = qo.Page,
				Flag = qo.Flag,
				Default = qo.Default,
				Alpha = qo.Alpha,
				Callback = qo.Callback,
			})
			return qp
		end
		function ql:Keybind(qq)
			qq = qq or {}
			local qr = {
				Window = self.Window,
				Page = self.Page,
				Section = self.Section,
				Flag = qq.Flag or qq.flag or a:NextFlag(),
				Default = qq.Default or qq.default or Enum.KeyCode.RightShift,
				Callback = qq.Callback or qq.callback or function()
				end,
				Mode = qq.Mode or qq.mode or "\84\111\103\103\108\101",
			}
			local qs, KeybindItems = ge:Keybind({
				Name = Label.Name,
				Parent = qm["\83\117\98\69\108\101\109\101\110\116\115"],
				Page = qr.Page,
				Flag = qr.Flag,
				Default = qr.Default,
				Mode = qr.Mode,
				Callback = qr.Callback,
			})
			return qs
		end
		local qt = a.SearchItems[Label.Page]
		if qt then
			local qu = {
				Element = qm["\76\97\98\101\108"],
				Name = Label.Name,
			}
			z(qt, qu)
		end
		return ql
	end
	a.Sections.Textbox = function(qv, qw)
		qw = qw or {}
		local Textbox = {
			Window = qv.Window,
			Page = qv.Page,
			Section = qv,
			Name = qw.Name or qw.name or "\84\101\120\116\98\111\120",
			Flag = qw.Flag or qw.flag or a:NextFlag(),
			Default = qw.Default or qw.default or "",
			Numeric = qw.Numeric or qw.numeric or (1 == 0),
			Finished = qw.Finished or qw.finished or (not not false),
			Placeholder = qw.Placeholder or qw.placeholder or "\46\46\46",
			ToolTip = qw.ToolTip or qw.tooltip or nil,
			Callback = qw.Callback or qw.callback or function()
			end,
		}
		local qx, qy = ge:Textbox({
			Name = Textbox.Name,
			Placeholder = Textbox.Placeholder,
			Parent = Textbox.Section.Items["\67\111\110\116\101\110\116"],
			Flag = Textbox.Flag,
			Page = Textbox.Page,
			Default = Textbox.Default,
			Numeric = Textbox.Numeric,
			Finished = Textbox.Finished,
			Callback = Textbox.Callback,
		})
		if Textbox.ToolTip then
			qy["\84\101\120\116\98\111\120"]:Tooltip({
				Text = Textbox.ToolTip.Name,
				Description = Textbox.ToolTip.Description,
			})
		end
		local qz = a.SearchItems[Textbox.Page]
		if qz then
			local ra = {
				Element = qy["\84\101\120\116\98\111\120"],
				Name = Textbox.Name,
			}
			z(qz, ra)
		end
		return qx
	end
	a.Sections.Searchbox = function(rb, rc)
		rc = rc or {}
		local rd = {
			Window = rb.Window,
			Page = rb.Page,
			Section = rb,
			Name = rc.Name or rc.name or "\83\101\97\114\99\104\98\111\120",
			Flag = rc.Flag or rc.flag or a:NextFlag(),
			Items = rc.Items or rc.items or {},
			Default = rc.Default or rc.default or nil,
			Multi = rc.Multi or rc.multi or (not true),
			Callback = rc.Callback or rc.callback or function()
			end,
		}
		local re, rf = ge:Searchbox({
			Parent = rd.Section.Items["\67\111\110\116\101\110\116"],
			Flag = rd.Flag,
			Items = rd.Items,
			Page = rd.Page,
			Default = rd.Default,
			Multi = rd.Multi,
			Callback = rd.Callback,
		})
		local rg = a.SearchItems[rd.Page]
		if rg then
			local rh = {
				Element = rf["\76\105\115\116\98\111\120"],
				Name = rd.Name,
			}
			z(rg, rh)
		end
		return re
	end
	a.BlankElement = function(self, ri)
		local BlankElement = {
			Name = ri.Name or ri.name or "\66\108\97\110\107",
			Size = ri.Size or ri.size or (866 - 848),
		}
		local rj = {}
		do
			rj["\66\108\97\110\107\69\108\101\109\101\110\116"] = bl:Create("\70\114\97\109\101", {
				Parent = a.Holder.Instance,
				Name = "\0",
				BackgroundTransparency = 1,
				BorderColor3 = l(0, 0, 0),
				Size = s(1, 0, 0, BlankElement.Size),
				BorderSizePixel = 0,
				BackgroundColor3 = l((771 - 516), (-627 + 882), (945 - 690)),
			})
			rj["\84\101\120\116"] = bl:Create("\84\101\120\116\76\97\98\101\108", {
				Parent = rj["\76\97\98\101\108"].Instance,
				Name = "\0",
				FontFace = a.Font,
				TextColor3 = l(bit32.bxor(bit32.bxor(235, 1515870810), 1515870810), (269 - 34), bit32.bxor(bit32.bxor(235, 1515870810), 1515870810)),
				BorderColor3 = l(0, 0, 0),
				Text = BlankElement.Name,
				Size = s(0, 0, 0, (729 - 714)),
				AnchorPoint = u(0, ((0.5 * 4) / 4)),
				Position = s(0, 0, ((0.5 * 5) / 5), 0),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.X,
				TextSize = bit32.bxor(bit32.bxor(9, 1515870810), 1515870810),
				BackgroundColor3 = l(bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810), bit32.bxor(bit32.bxor(255, 1515870810), 1515870810)),
			})
			rj["\84\101\120\116"]:AddToTheme({
				TextColor3 = "\84\101\120\116",
			})
			rj["\84\101\120\116"]:TextBorder()
		end
		return BlankElement, rj
	end
	a.CreateSettingsPage = function(self, Window, Watermark, KeybindList)
		local rk = Window:Page({
			Name = "\83\101\116\116\105\110\103\115",
			SubPages = (not false),
		})
		do
			local rl = rk:SubPage({
				Name = "\84\104\101\109\105\110\103",
				Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				local rm = rl:Section({
					Name = "\84\104\101\109\101\115",
					Side = 1,
				})
				do
					for rn, Value in a.Theme do
						rm:Label(rn):Colorpicker({
							Name = rn,
							Flag = rn .. "\84\104\101\109\101",
							Default = Value,
							Callback = function(Value)
								a.Theme[rn] = Value
								a:ChangeTheme(rn, Value)
							end,
						})
					end
				end
			end
			local ro = rk:SubPage({
				Name = "\67\111\110\102\105\103\115",
				Columns = bit32.bxor(bit32.bxor(2, 1515870810), 1515870810),
			})
			do
				local rp = ro:Section({
					Name = "\67\111\110\102\105\103\115",
					Side = 1,
				})
				do
					local rq
					local rr
					local rs = rp:Searchbox({
						Name = "\83\101\97\114\99\104\98\111\120\67\111\110\102\105\103\115",
						Flag = "\67\111\110\102\105\103\115\83\101\97\114\99\104\111\98\120",
						Items = {},
						Multi = (1 == 0),
						Callback = function(Value)
							rr = Value
						end,
					})
					rp:Textbox({
						Name = "\67\111\110\102\105\103\32\110\97\109\101",
						Default = "",
						Flag = "\67\111\110\102\105\103\78\97\109\101",
						Placeholder = "\69\110\116\101\114\32\116\101\120\116",
						Callback = function(Value)
							rq = Value
						end,
					})
					local rt = rp:Button()
					rt:Add("\67\114\101\97\116\101", function()
						if rq and rq ~= "" then
							if not isfile(a.Folders.Configs .. "/" .. rq .. "\46\106\115\111\110") then
								writefile(a.Folders.Configs .. "/" .. rq .. "\46\106\115\111\110", a:GetConfig())
								a:Notification("\83\117\99\99\101\115\115", "\67\114\101\97\116\101\100\32\99\111\110\102\105\103\32" .. rq .. "\32\115\117\99\99\101\115\102\117\108\108\121", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
								a:RefreshConfigsList(rs)
							else
								a:Notification("\69\114\114\111\114", "\67\111\110\102\105\103\32\119\105\116\104\32\116\104\101\32\110\97\109\101\32" .. rq .. "\32\97\108\114\101\97\100\121\32\101\120\105\115\116\115", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
								return
							end
						end
					end)
					rt:Add("\68\101\108\101\116\101", function()
						if rr then
							a:DeleteConfig(rr)
							a:Notification("\83\117\99\99\101\115\115", "\68\101\108\101\116\101\100\32\99\111\110\102\105\103\32" .. rr .. "\32\115\117\99\99\101\115\102\117\108\108\121", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
							a:RefreshConfigsList(rs)
						end
					end)
					local ru = rp:Button()
					ru:Add("\76\111\97\100", function()
						if rr then
							local rv, rw = a:LoadConfig(readfile(a.Folders.Configs .. "/" .. rr))
							if rv then
								a:Notification("\83\117\99\99\101\115\115", "\76\111\97\100\101\100\32\99\111\110\102\105\103\32" .. rr .. "\32\115\117\99\99\101\115\102\117\108\108\121", (429 - 424))
							else
								a:Notification("\69\114\114\111\114", "\70\97\105\108\101\100\32\116\111\32\108\111\97\100\32\99\111\110\102\105\103\32" .. rr .. "\32\114\101\112\111\114\116\32\116\104\105\115\32\116\111\32\116\104\101\32\100\101\118\115\58\10" .. rw, (127 - 122))
							end
						end
					end)
					ru:Add("\83\97\118\101", function()
						if rq and rq ~= "" then
							writefile(a.Folders.Configs .. "/" .. rq .. "\46\106\115\111\110", a:GetConfig())
							a:Notification("\83\117\99\99\101\115\115", "\83\97\118\101\100\32\99\111\110\102\105\103\32" .. rq .. "\32\115\117\99\99\101\115\102\117\108\108\121", bit32.bxor(bit32.bxor(5, 1515870810), 1515870810))
							a:RefreshConfigsList(rs)
						end
					end)
					a:RefreshConfigsList(rs)
				end
			end
			local rx = rk:SubPage({
				Name = "\83\101\116\116\105\110\103\115",
				Columns = (-641 + 643),
			})
			do
				local ry = rx:Section({
					Name = "\83\101\116\116\105\110\103\115",
					Side = 1,
				})
				do
					ry:Toggle({
						Name = "\87\97\116\101\114\109\97\114\107",
						Flag = "\87\97\116\101\114\109\97\114\107",
						Default = (not not true),
						Callback = function(Value)
							Watermark:SetVisibility(Value)
						end,
					})
					ry:Toggle({
						Name = "\75\101\121\98\105\110\100\32\108\105\115\116",
						Flag = "\75\101\121\98\105\110\100\32\108\105\115\116",
						Default = (not true),
						Callback = function(Value)
							KeybindList:SetVisibility(Value)
						end,
					})
					ry:Slider({
						Name = "\70\97\100\101\32\116\105\109\101",
						Flag = "\70\97\100\101\84\105\109\101",
						Default = a.FadeSpeed,
						Min = 0,
						Max = 1,
						Decimals = ((0.01 * 5) / 5),
						Callback = function(Value)
							a.FadeSpeed = Value
						end,
					})
					ry:Slider({
						Name = "\84\119\101\101\110\32\116\105\109\101",
						Flag = "\84\119\101\101\110\84\105\109\101",
						Default = a.Tween.Time,
						Min = 0,
						Max = 1,
						Decimals = ((0.01 * 4) / 4),
						Callback = function(Value)
							a.Tween.Time = Value
						end,
					})
					ry:Dropdown({
						Name = "\84\119\101\101\110\32\115\116\121\108\101",
						Flag = "\84\119\101\101\110\32\115\116\121\108\101",
						Items = {
							"\76\105\110\101\97\114",
							"\81\117\97\100",
							"\81\117\97\114\116",
							"\66\97\99\107",
							"\66\111\117\110\99\101",
							"\67\105\114\99\117\108\97\114",
							"\67\117\98\105\99",
							"\69\108\97\115\116\105\99",
							"\69\120\112\111\110\101\110\116\105\97\108",
							"\83\105\110\101",
							"\81\117\105\110\116",
						},
						Default = "\67\117\98\105\99",
						Callback = function(Value)
							a.Tween.Style = Enum.EasingStyle[Value]
						end,
					})
					ry:Dropdown({
						Name = "\84\119\101\101\110\32\100\105\114\101\99\116\105\111\110",
						Flag = "\84\119\101\101\110\32\100\105\114\101\99\116\105\111\110",
						Items = {
							"\73\110",
							"\79\117\116",
							"\73\110\79\117\116",
						},
						Default = "\79\117\116",
						Callback = function(Value)
							a.Tween.Direction = Enum.EasingDirection[Value]
						end,
					})
					ry:Button():Add("\85\110\108\111\97\100", function()
						a:Unload()
					end)
					ry:Label("\85\73\32\75\101\121\98\105\110\100"):Keybind({
						Name = "\77\101\110\117\32\107\101\121\98\105\110\100",
						Flag = "\85\73\75\101\121\98\105\110\100",
						Default = a.MenuKeybind,
						Mode = "\84\111\103\103\108\101",
						Callback = function()
							a.MenuKeybind = a.Flags["\85\73\75\101\121\98\105\110\100"].Key
						end,
					})
				end
			end
		end
		return rk
	end
end
return a
