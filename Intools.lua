script_name('Inst Tools')
script_version(2.8)
test_version = "2.8"
script_author('Violet_Koneko')
local sf = require 'sampfuncs'                                                                           
local key = require "vkeys"
local inicfg = require 'inicfg'
local sampev, sp = require 'lib.samp.events'
local lsg, sf               = pcall(require, 'sampfuncs')
local lkey, key             = pcall(require, 'vkeys')
local lsampev, sp           = pcall(require, 'lib.samp.events')
local lsphere, Sphere       = pcall(require, 'Sphere')
local lcrypto, crypto       = pcall(require, 'crypto_lua')
assert(lcrypto, "not found crypto lib")
local lhttp, http           = pcall(require, 'copas.http')
assert(lhttp, "not found copas.http lib")
local lrkeys, rkeys         = pcall(require, 'rkeys')
local limadd, imadd         = pcall(require, 'imgui_addons')
local dlstatus              = require('moonloader').download_status
local limgui, imgui         = pcall(require, 'imgui')
local lcopas, copas       = pcall(require, 'copas')
local lhttp, http         = pcall(require, 'copas.http')
local lrequests, requests   = pcall(require, 'requests')
local wm                    = require 'lib.windows.message'
local gk                    = require 'game.keys'
local encoding              = require 'encoding'
local imgui = require 'imgui' -- ��������� ����������
local encoding = require 'encoding' -- ��������� ����������
local wm = require 'lib.windows.message'
local gk = require 'game.keys'
local dlstatus = require('moonloader').download_status
local lmem, memory = pcall(require, 'memory')
                     assert(lmem, 'Library \'memory\' not found')
local second_window = imgui.ImBool(false)
local third_window = imgui.ImBool(false)
local first_window = imgui.ImBool(false)
local btn_size = imgui.ImBool(false)
local bMainWindow = imgui.ImBool(false)                              
local sInputEdit = imgui.ImBuffer(128)
local bIsEnterEdit = imgui.ImBool(false)
local memw = imgui.ImBool(false)
local helps = imgui.ImBool(false)
local infbar = imgui.ImBool(false)
local updwindows = imgui.ImBool(false)
local tEditData = {
	id = -1,
	inputActive = false
}
encoding.default = 'CP1251' -- ��������� ��������� �� ���������, ��� ������ ��������� � ���������� �����. CP1251 - ��� Windows-1251
u8 = encoding.UTF8
require 'lib.sampfuncs'
seshsps = 1
ctag = "Inst Tools {ffffff}|"
players1 = {'{ffffff}���\t{ffffff}����'}
players2 = {'{ffffff}���� ��������\t{ffffff}���\t{ffffff}����\t{ffffff}������'}
frak = nil
rang = nil
ttt = nil
dostavka = false
rabden = false
tload = false
changetextpos = false
tLastKeys = {}
prava = 0
pilot = 0
kater = 0
gun = 0
ribolov = 0
biznes = 0
departament = {}
tMembers = {}
Player = {}
vixodid = {}
local config_keys = {
    fastsms = { v = {}}
}
function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

local fileb = getWorkingDirectory() .. "\\config\\instools.bind"
local help = {
    {
        cmd = '/it',
        desc = '������� ���� �������',
        use = '/it'
    },
    {
        cmd = '/vig',
        desc = '������ ������� �� �����',
        use = '/vig [id] [�������]'
    },
    {
        cmd = '/unvig',
        desc = '����� ������� �� �����',
        use = '/unvig [id] [�������]'
    },
    {
        cmd = '/dmb',
        desc = '������� /members � �������',
        use = '/dmb'
    },
    {
        cmd = '/where',
        desc = '��������� �������������� �� �����',
        use = '/where [id]'
    },
	{
        cmd = '/timegov',
        desc = '�������� ���.����� �� ����������� �����',
        use = '/timegov [�����]'
    },
    {
        cmd = '/dlog',
        desc = '������� ��� 25 ��������� ��������� � �����������',
        use = '/dlog'
    },
    {
        cmd = '/sethud',
        desc = '���������� ������� ����-����',
        use = '/sethud'
    },
    {
        cmd = '/cchat',
        desc = '������� ���',
        use = '/cchat'
    },
    {
        cmd = '/blag',
        desc = '�������� ������ ������������� � �����������',
        use = '/blag [id] [�������] [�������]'
    },
    {
        cmd = '/nick',
        desc = '�������� ��� ������ �� ��� id. �������� 0 �������� �����, 1 �������� ����� ���',
        use = '/nick [id] [0-1]'
    }
}

local vars = {
    settingsVars = {
        show = 1
    },
	
	isWorking = false,
	
	webData = {
        isLogin = false,
        isDownloaded = false,
        isAccess = false,
        isAdmin = false,
        isOnline = false,
        canupdate = false,
        online = {}
    },
    updateAFK = os.time(),
}

local tBindList = {}
if doesFileExist(fileb) then
	local f = io.open(fileb, "r")
	if f then
		tBindList = decodeJson(f:read())
		f:close()
	end
else
	tBindList = {
        [1] = {
            text = "/time",
            v = {key.VK_NONE}
        }
	}
end

local lectures = {}

local lecturesVars = {
    name = imgui.ImBuffer(256),
    text = imgui.ImBuffer(20480),
    wait = imgui.ImInt(0)
}

local govs = {}

local govsVars = {
    name = imgui.ImBuffer(256),
    text = imgui.ImBuffer(20480),
    wait = imgui.ImInt(8000)
}

local imguiVars = {
    cmdtext = imgui.ImBuffer(4096),
    cmdwait = imgui.ImInt(0),
    cmdint = imgui.ImInt(0),
    isCmdsLoaded = false,
    logsNick = imgui.ImBuffer(256),
    logsInt = imgui.ImInt(0)
}

local shporList = {}

local shporiVars = {
    shpname   = imgui.ImBuffer(256),
    shpbuff   = imgui.ImBuffer(50960),
    shpedit   = imgui.ImBool(false),
    shpsearch = imgui.ImBuffer(256),
    shpint    = imgui.ImInt(0)
}

local windows = {
    lectures = imgui.ImBool(false),
	gov = imgui.ImBool(false),
	shpori = imgui.ImBool(false),
	online = imgui.ImBool(false),
	myOnline = imgui.ImBool(false),
}

local online = {
    dayOnline = 0,
    weekOnline = 0,
    dayAFK = 0,
    weekAFK = 0
}

local bimaindustries = {
    loadCfg = function(t, f)
        if doesFileExist(f) then
            local file = io.open(f, "r")
            local dora = {}
            if file then
                dora = decodeJson(file:read("*a"))
                file:close()
            else
                local file = io.open(f, "w")
                file:write(encodeJson(t))
                file:close()
                dora = t
            end
            return dora
        else
            local file = io.open(f, "w")
            file:write(encodeJson(t))
            file:close()
            return t
        end
    end,
    saveCfg = function(t, f)
        local file = io.open(f, "w")
        file:write(encodeJson(t))
        file:close()
    end,
    loadPreloadedText = function(t, f)
        if not doesFileExist(f) then
            local file = io.open(f, "w")
            file:write(t)
            file:close()
        end
    end
}

local cfg =
{
  main =
  {
    posX = 1358,
    posY = 974,
    widehud = 320,
	male = true,
    tar = '������',
	clistB = false,
	clisto = false,
    clist = 0,
	aTag = false,
    tag = "",
	autoPass = false,
    pass = "",
	autocar = false,
  },
  commands = 
  {
    ticket = false,
	zaderjka = 5
  },
   keys =
  {
	tload = 97,
	tazer = 97,
	fastmenu = 113
  }
}
cfg = bimaindustries.loadCfg(cfg, "moonloader/instools/config.json")
lectures = bimaindustries.loadCfg(lectures, "moonloader/instools/lectures.json")
govs = bimaindustries.loadCfg(govs, "moonloader/instools/govs.json")
shporList = bimaindustries.loadCfg(shporList, "moonloader/instools/shapgalka.json")
commands = bimaindustries.loadCfg(commands, "moonloader/instools/commands.json")

if cfg.main.chat_t == nil then cfg.main.chat_t = false end
if cfg.main.autoPass == nil then cfg.main.autoPass = false
        cfg.main.pass = ""
    end

local libs = {'sphere.lua', 'rkeys.lua', 'imcustom/hotkey.lua', 'imgui.lua', 'MoonImGui.dll', 'imgui_addons.lua'}
function main()
  while not isSampAvailable() do wait(1000) end
  if seshsps == 1 then
    ftext("Inst Tools ������� ����������. �������: /it ��� �������� ���� �������", -1)
    ftext("�� ����������� ������ ������� - "..test_version)
  end
  if not doesDirectoryExist('moonloader/lib/imcustom') then createDirectory('moonloader/lib/imcustom') end
  for k, v in pairs(libs) do
        if not doesFileExist('moonloader/lib/'..v) then
            downloadUrlToFile('https://raw.githubusercontent.com/WhackerH/kirya/master/lib/'..v, getWorkingDirectory()..'\\lib\\'..v)
            print('����������� ���������� '..v)
        end
    end
	if not doesFileExist("moonloader/instools/keys.json") then
        local fa = io.open("moonloader/instools/keys.json", "w")
        fa:close()
    else
        local fa = io.open("moonloader/instools/keys.json", 'r')
        if fa then
            config_keys = decodeJson(fa:read('*a'))
        end
    end
  while not doesFileExist('moonloader\\lib\\rkeys.lua') or not doesFileExist('moonloader\\lib\\imcustom\\hotkey.lua') or not doesFileExist('moonloader\\lib\\imgui.lua') or not doesFileExist('moonloader\\lib\\MoonImGui.dll') or not doesFileExist('moonloader\\lib\\imgui_addons.lua') do wait(0) end
  if not doesDirectoryExist('moonloader/instools') then createDirectory('moonloader/instools') end
  hk = require 'lib.imcustom.hotkey'
  imgui.HotKey = require('imgui_addons').HotKey
  rkeys = require 'rkeys'
  imgui.ToggleButton = require('imgui_addons').ToggleButton
  while not sampIsLocalPlayerSpawned() do wait(0) end
  local _, myid = sampGetPlayerIdByCharHandle(playerPed)
  local name, surname = string.match(sampGetPlayerNickname(myid), '(.+)_(.+)')
  sip, sport = sampGetCurrentServerAddress()
  sampSendChat('/stats')
  while not sampIsDialogActive() do wait(0) end
  proverkk = sampGetDialogText()
  local frakc = proverkk:match('.+�����������%s+(.+)%s+���������')
  local rang = proverkk:match('.+���������%s+%d+ %((.+)%)%s+������')
  local telephone = proverkk:match('.+�������%s+(.+)%s+�����������������')
  rank = rang
  frac = frakc
  tel = telephone
  sampCloseCurrentDialogWithButton(1)
  print(frakc)
  print(rang)
  print(telephone)
  update()
  sampCreate3dTextEx(641, '{ffffff}����� ��� ������� ��������', 4294927974, 2346.1362,1666.7819,3040.9387, 3, true, -1, -1)
  local spawned = sampIsLocalPlayerSpawned()
  sampRegisterChatCommand('r', r)
  sampRegisterChatCommand('f', f)
  sampRegisterChatCommand('dlog', dlog)
  sampRegisterChatCommand('dcol', cmd_color)
  sampRegisterChatCommand('dmb', dmb)
  sampRegisterChatCommand('smsjob', smsjob)
  sampRegisterChatCommand('where', where)
  sampRegisterChatCommand('it', it)
  sampRegisterChatCommand('vig', vig)
  sampRegisterChatCommand('unvig', unvig)
  sampRegisterChatCommand('giverank', giverank)
  sampRegisterChatCommand('blag', blag)
  sampRegisterChatCommand('cchat', cmd_cchat)
  sampRegisterChatCommand('invite', invite)
  sampRegisterChatCommand("timegov", zgov)
  sampRegisterChatCommand('nick', nick)
  sampRegisterChatCommand('uninvite', uninvite)
  
      while sampGetGamestate() ~= 3 do wait(0) end
    local ip, port = sampGetCurrentServerAddress()
    local serverAddress = ip..":"..port
    local requestDone = false
    if serverAddress == "185.169.134.67:7777" then
        local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        local time = os.date("%d.%m.%Y %H:%M")
        local hashstr = ("romagay-"..nick.."-"..time)
        local hash = string.lower(crypto.sha256(hashstr))

        httpRequest("http://l99922zn.beget.tech/web/login.php", ("nick=%s&date=%s&hash=%s"):format(nick, time, hash), function(response, code, headers, status)
            if response then
                vars.webData.isLogin = true
                vars.webData.isDownloaded = true
                local info = decodeJson(response)
                if info.access then
                    vars.webData.isAccess = true
                    sampRegisterChatCommand("addOnline", addOnline)
                    sampRegisterChatCommand("delOnline", delOnline)
                    sampRegisterChatCommand("getOnline", getOnline)
                    if info.access.admin then
                        vars.webData.isAdmin = true
                        sampRegisterChatCommand("resetOnline", resetOnline)
                        sampRegisterChatCommand("addModer", addModer)
                        sampRegisterChatCommand("delModer", delModer)
                    end
                end
                if info.online then               
                    vars.webData.isOnline = true
                    online = info.online
                end
                requestDone = true
            else
                print("������ ����������� � �������")
                print(code)
                requestDone = true
            end
        end)

        while not requestDone do wait(0) end
        if vars.webData.isOnline then calculateOnline() end

    end
	
	
  while true do wait(0)
    if #departament > 25 then table.remove(departament, 1) end
	    local myhp = getCharHealth(PLAYER_PED)
        local valid, ped = getCharPlayerIsTargeting(PLAYER_HANDLE)
    if wasKeyPressed(cfg.keys.fastmenu) and not sampIsDialogActive() and not sampIsChatInputActive() then
    submenus_show(fastmenu(id), "{139BEC}Inst Tools {ffffff}| ������� ����")
    end
          if valid and doesCharExist(ped) then
            local result, id = sampGetPlayerIdByCharHandle(ped)
            if result and wasKeyPressed(key.VK_Z) then
                gmegafhandle = ped
                gmegafid = id
                gmegaflvl = sampGetPlayerScore(id)
                gmegaffrak = getFraktionBySkin(id)
			    local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
                --[[ftext(gmegafid)
                ftext(gmegaflvl)
                ftext(gmegaffrak)]]
				megaftimer = os.time() + 300
                submenus_show(pkmmenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] {ffffff}������� - "..sampGetPlayerScore(id).." ")
            end
        end
	if cfg.main.givra == true then
      infbar.v = true
      imgui.ShowCursor = false
    end
    if cfg.main.givra == false then
      infbar.v = false
      imgui.ShowCursor = false
    end
		if changetextpos then
            sampToggleCursor(true)
            local CPX, CPY = getCursorPos()
            cfg.main.posX = CPX
            cfg.main.posY = CPY
        end
		imgui.Process = second_window.v or third_window.v or bMainWindow.v or updwindows.v or infbar.v or memw.v or windows.online.v
  end
  function rkeys.onHotKey(id, keys)
	if sampIsChatInputActive() or sampIsDialogActive() or isSampfuncsConsoleActive() then
		return false
	end

    while true do wait(0)

        if sampGetGamestate() ~= 3 and vars.isWorking == true then -- ����� ���������� ����� ��
            vars.isWorking = false
        end

    end
end
end

function httpRequest(request, body, handler) -- copas.http

    local ip, port = sampGetCurrentServerAddress()
    local serverAddress = ip..":"..port

    if sampGetGamestate() == 3 and serverAddress == "185.169.134.67:7777" then
        -- start polling task
        if not copas.running then
            copas.running = true
            lua_thread.create(function()
                wait(0)
                while not copas.finished() do
                    local ok, err = copas.step(0)
                    if ok == nil then error(err) end
                    wait(0)
                end
                copas.running = false
            end)
        end
        -- do request
        if handler then
            return copas.addthread(function(r, b, h)
                copas.setErrorHandler(function(err) h(nil, err) end)
                h(http.request(r, b))
            end, request, body, handler)
        else
            local results
            local thread = copas.addthread(function(r, b)
                copas.setErrorHandler(function(err) results = {nil, err} end)
                results = table.pack(http.request(r, b))
            end, request, body)
            while coroutine.status(thread) ~= 'dead' do wait(0) end
            return table.unpack(results)
        end
    end
end

function sampGetFraktionBySkin(id)
    local skin = 0
    local t = '�����������'
    --if sampIsPlayerConnected(id) then
        local result, ped = sampGetCharHandleBySampPlayerId(id)
        if result then
            skin = getCharModel(ped)
        else
            skin = getCharModel(PLAYER_PED)
        end
        if skin == 102 or skin == 103 or skin == 104 or skin == 195 or skin == 21 then t = 'Ballas Gang' end
        if skin == 105 or skin == 106 or skin == 107 or skin == 269 or skin == 270 or skin == 271 or skin == 86 or skin == 149 or skin == 297 then t = 'Grove Gang' end
        if skin == 108 or skin == 109 or skin == 110 or skin == 190 or skin == 47 then t = 'Vagos Gang' end
        if skin == 114 or skin == 115 or skin == 116 or skin == 48 or skin == 44 or skin == 41 or skin == 292 then t = 'Aztec Gang' end
        if skin == 173 or skin == 174 or skin == 175 or skin == 193 or skin == 226 or skin == 30 or skin == 119 then t = 'Rifa Gang' end
        if skin == 191 or skin == 252 or skin == 287 or skin == 61 or skin == 179 or skin == 255 or skin == 73 then t = 'Army' end
        if skin == 57 or skin == 98 or skin == 147 or skin == 150 or skin == 187 or skin == 216 then t = '�����' end
        if skin == 59 or skin == 172 or skin == 189 or skin == 240 then t = '���������' end
        if skin == 201 or skin == 247 or skin == 248 or skin == 254 or skin == 248 or skin == 298 then t = '�������' end
        if skin == 272 or skin == 112 or skin == 125 or skin == 214 or skin == 111  or skin == 126 then t = '������� �����' end
        if skin == 113 or skin == 124 or skin == 214 or skin == 223 then t = 'La Cosa Nostra' end
        if skin == 120 or skin == 123 or skin == 169 or skin == 186 then t = 'Yakuza' end
        if skin == 211 or skin == 217 or skin == 250 or skin == 261 then t = 'News' end
        if skin == 70 or skin == 219 or skin == 274 or skin == 275 or skin == 276 or skin == 308 or skin == 148 then t = '������' end
        if skin == 286 or skin == 141 or skin == 163 or skin == 164 or skin == 165 or skin == 166 then t = 'FBI' end
        if skin == 280 or skin == 265 or skin == 266 or skin == 267 or skin == 281 or skin == 282 or skin == 288 or skin == 284 or skin == 285 or skin == 304 or skin == 305 or skin == 306 or skin == 307 or skin == 309 or skin == 283 or skin == 303 then t = '�������' end
    --end
    return t
end

function dmb()
    lua_thread.create(function()
        if sampIsDialogActive() then
            if sampIsDialogClientside() then
                tMembers = {}
                status = true
                sampSendChat('/members')
                while not gotovo do wait(0) end
                memw.v = true
                gosmb = false
                krimemb = false
                gotovo = false
                status = true
                gcount = nil
            end
        else
            tMembers = {}
            status = true
            sampSendChat('/members')
            while not gotovo do wait(0) end
            memw.v = true
            gosmb = false
            krimemb = false
            gotovo = false
            status = true
            gcount = nil
        end
	end)
end


function sampev.onShowDialog(id, style, title, button1, button2, text)
    if id == 1 and cfg.main.autoPass and #tostring(cfg.main.pass) >= 6 then
        sampSendDialogResponse(id, 1, _, tostring(cfg.main.pass))
        return false
    end
end
        
function blag(pam)
    local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local myname = sampGetPlayerNickname(myid)
    local id, frack, pric = pam:match('(%d+) (%a+) (.+)')
    if id and frack and pric and sampIsPlayerConnected(id) then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/d %s, ��������� %s �� %s. ������!", frack, rpname, pric))
    else
        ftext("�������: /blag [ID] [�������] [�������]", -1)
        ftext("������� ������ �������� ��� ��������� '�� � ��', �������� '���������������, �������� �����'")
        ftext("����� �� ���� �������� � ��� � ����� ��������� ������� ����� '�' � ��������� ������.")
		ftext("��������� ��� ����� ��� - /d Inst, ��������� "..myname:gsub('_', ' ').." �� ���������������. ������! ", -1)
    end
end

function cmd_cchat()
  memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
  memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
  memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function dmch()
	lua_thread.create(function()
		statusc = true
		players3 = {'{ffffff}���\t{ffffff}����\t{ffffff}������'}
		sampSendChat('/members')
		while not gotovo do wait(0) end
		if gosmb then
			sampShowDialog(716, "{139BEC}Inst Tools {ffffff}| {ae433d}���������� ��� ����� {ffffff}| Time: "..os.date("%H:%M:%S"), table.concat(players3, "\n"), "x", _, 5) -- ���������� ����������.
		end
		gosmb = false
		krimemb = false
		gotovo = false
		statusc = false
	end)
end

local russian_characters = {
    [168] = '�', [184] = '�', [192] = '�', [193] = '�', [194] = '�', [195] = '�', [196] = '�', [197] = '�', [198] = '�', [199] = '�', [200] = '�', [201] = '�', [202] = '�', [203] = '�', [204] = '�', [205] = '�', [206] = '�', [207] = '�', [208] = '�', [209] = '�', [210] = '�', [211] = '�', [212] = '�', [213] = '�', [214] = '�', [215] = '�', [216] = '�', [217] = '�', [218] = '�', [219] = '�', [220] = '�', [221] = '�', [222] = '�', [223] = '�', [224] = '�', [225] = '�', [226] = '�', [227] = '�', [228] = '�', [229] = '�', [230] = '�', [231] = '�', [232] = '�', [233] = '�', [234] = '�', [235] = '�', [236] = '�', [237] = '�', [238] = '�', [239] = '�', [240] = '�', [241] = '�', [242] = '�', [243] = '�', [244] = '�', [245] = '�', [246] = '�', [247] = '�', [248] = '�', [249] = '�', [250] = '�', [251] = '�', [252] = '�', [253] = '�', [254] = '�', [255] = '�',
}
function string.rlower(s)
    s = s:lower()
    local strlen = s:len()
    if strlen == 0 then return s end
    s = s:lower()
    local output = ''
    for i = 1, strlen do
        local ch = s:byte(i)
        if ch >= 192 and ch <= 223 then
            output = output .. russian_characters[ch + 32]
        elseif ch == 168 then
            output = output .. russian_characters[184]
        else
            output = output .. string.char(ch)
        end
    end
    return output
end
function string.rupper(s)
    s = s:upper()
    local strlen = s:len()
    if strlen == 0 then return s end
    s = s:upper()
    local output = ''
    for i = 1, strlen do
        local ch = s:byte(i)
        if ch >= 224 and ch <= 255 then
            output = output .. russian_characters[ch - 32]
        elseif ch == 184 then
            output = output .. russian_characters[168]
        else
            output = output .. string.char(ch)
        end
    end
    return output
end

function vig(pam)
  local id, pric = string.match(pam, '(%d+)%s+(.+)')
if rank == '��.��������' or rank == '��.��������' or  rank == '��������' or  rank == '�����������' then
  if id == nil then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| �������: /vig [id] [�������]", -1)
  end
  if id ~=nil and not sampIsPlayerConnected(id) then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| ����� � ID: "..id.." �� ��������� � �������.", -1)
  end
  if id ~= nil and sampIsPlayerConnected(id) then
      if pric == nil then
        sampAddChatMessage("{139BEC}Inst Tools {ffffff}| /vig [id] [�������]", -1)
      end
      if pric ~= nil then
	   if cfg.main.aTag then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/r [%s]: %s - �������� ������� �� �������: %s.", cfg.main.tag, rpname, pric))
		else 
		name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
		sampSendChat(string.format("/r %s - �������� ������� �� �������: %s.", rpname, pric))
      end
  end
end
end
end

function unvig(pam)
  local id, pric = string.match(pam, '(%d+)%s+(.+)')
  if rank == '��.��������' or rank == '��.��������' or  rank == '��������' or  rank == '�����������' then
  if id == nil then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| �������: /unvig ID �������", -1)
  end
  if id ~=nil and not sampIsPlayerConnected(id) then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| ����� � ID: "..id.." �� ��������� � �������.", -1)
  end
  if id ~= nil and sampIsPlayerConnected(id) then
      if pric == nil then
        sampAddChatMessage("{139BEC}Inst Tools {ffffff}| �������: /unvig [id] [�������]", -1)
      end
      if pric ~= nil then
	   if cfg.main.aTag then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/r [%s]: %s - �������� c����� �������� �� �������: %s.", cfg.main.tag, rpname, pric))
		else 
		name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
		sampSendChat(string.format("/r %s - �������� c����� �������� �� �������: %s.", rpname, pric))
      end
  end
end
end
end

function where(params) -- ������ ��������������
   if rank == '��.��������' or rank == '��.��������' or  rank == '��������' or  rank == '�����������' then
	if params:match("^%d+") then
		params = tonumber(params:match("^(%d+)"))
		if sampIsPlayerConnected(params) then
			local name = string.gsub(sampGetPlayerNickname(params), "_", " ")
			 if cfg.main.aTag then
			    sampSendChat(string.format("/r [%s]: %s, �������� ���� ��������������. �� ����� 20 ������.", cfg.main.tag, name))
			else
			sampSendChat(string.format("/r %s, �������� ���� ��������������. �� ����� 20 ������.", name))
			end
			else
			ftext('{FFFFFF} ����� � ������ ID �� ��������� � ������� ��� ������ ��� ID.', 0x046D63)
		end
		else
		ftext('{FFFFFF} �����������: /where [ID].', 0x046D63)
		end
		else
		ftext('{FFFFFF}������ ������� �������� � 7 �����.', 0x046D63)
	end
end

function getrang(rangg)
local ranks = 
        {
		['1'] = '������',
		['2'] = '������������',
		['3'] = '������������',
		['4'] = '��.�����������',
		['5'] = '�����������',
		['6'] = '������������',
		['7'] = '��.���������',
		['8'] = '��.���������',
		['9'] = '���������'
		}
	return ranks[rangg]
end

function giverank(pam)
    lua_thread.create(function()
    local id, rangg, plus = pam:match('(%d+) (%d+)%s+(.+)')
	if sampIsPlayerConnected(id) then
	  if rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' then
        if id and rangg then
		if plus == '-' or plus == '+' then
		ranks = getrang(rangg)
		        local _, handle = sampGetCharHandleBySampPlayerId(id)
				if doesCharExist(handle) then
				local x, y, z = getCharCoordinates(handle)
				local mx, my, mz = getCharCoordinates(PLAYER_PED)
				local dist = getDistanceBetweenCoords3d(mx, my, mz, x, y, z)	
				if dist <= 5 then
				if cfg.main.male == true then
				sampSendChat('/me ���� ������ ������� � �������� �������� ��������')
				wait(1500)
				sampSendChat('/me ����� ������ ������� � ������')
				wait(1500)
                sampSendChat(string.format('/me ������ ����� ������� %s', ranks))
				wait(1500)
				sampSendChat('/me �������� �� ������� �������� �������� ����� �������')
				wait(1500)
				else
				sampSendChat('/me ����� ������ ������� � �������� �������� ��������')
				wait(1500)
				sampSendChat('/me ������ ������ ������� � ������')
				wait(1500)
                sampSendChat(string.format('/me ������� ����� ������� %s', ranks))
				wait(1500)
				sampSendChat('/me ��������� �� ������� �������� �������� ����� �������')
				wait(1500)
				end
				end
				end
				sampSendChat(string.format('/giverank %s %s', id, rangg))
				wait(1500)
				if cfg.main.aTag then
                sampSendChat(string.format('/r [%s]: '..sampGetPlayerNickname(id):gsub('_', ' ')..' - %s � ��������� �� %s%s.', cfg.main.tag, plus == '+' and '�������(�)' or '�������(�)', ranks, plus == '+' and ', ����������' or ''))
                else
				sampSendChat(string.format('/r '..sampGetPlayerNickname(id):gsub('_', ' ')..' - %s � ��������� �� %s%s.', plus == '+' and '�������(�)' or '�������(�)', ranks, plus == '+' and ', ����������' or ''))
            end
			else 
			ftext('�� ����� �������� ��� [+/-]')
		end
		else 
			ftext('�������: /giverank [id] [����] [+/-]')
		end
		else 
			ftext('������ ������� �������� � 7 �����')
	  end
	  else 
			ftext('����� � ������ ID �� ��������� � ������� ��� ������ ��� ID')
	  end
   end)
 end
 
 function string.split(inputstr, sep, limit)
    if limit == nil then limit = 0 end
    if sep == nil then sep = "%s" end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        if i >= limit and limit > 0 then
            if t[i] == nil then
                t[i] = ""..str
            else
                t[i] = t[i]..sep..str
            end
        else
            t[i] = str
            i = i + 1
        end
    end
    return t
end

function returnCommand(key)
    local i = 1
    for k, v in pairs(commands) do
        if i == key then return k end
        i = i + 1
    end
end

function invite(pam)
    lua_thread.create(function()
        local id = pam:match('(%d+)')
	  if rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' then
        if id then
		if sampIsPlayerConnected(id) then
                sampSendChat('/me ������(�) ������� � �������(�) ��� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
				wait(1500)
				sampSendChat(string.format('/invite %s', id))
			else 
			ftext('����� � ������ ID �� ��������� � ������� ��� ������ ��� ID')
		end
		else 
			ftext('�������: /invite [id]')
		end
		else 
			ftext('������ ������� �������� � 9 �����')
	  end
   end)
 end
 
 function zgov(pam)
    if #pam > 0 then
        local myid = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))
        sampSendChat("/d OG, ���. ����� �� "..pam.." ������ �� �������������.")
    else
        ftext("�����������: /timegov [�����]")
    end
end
   
function nick(args)
  if #args == 0 then ftext("�������: /nick [id] [0 - RP nick, 1 - NonRP nick]") return end
  args = string.split(args, " ")
  if #args == 1 then
    cmd_nick(args[1].." 0")
  elseif #args == 2 then
    local getID = tonumber(args[1])
    if getID == nil then ftext("�������� ID ������!") return end
    if not sampIsPlayerConnected(getID) then ftext("����� �������!") return end 
    getID = sampGetPlayerNickname(getID)
    if tonumber(args[2]) == 1 then
      ftext("��� \""..getID.."\" ������� ���������� � ����� ������.")
    else
      getID = string.gsub(getID, "_", " ")
      ftext("�� ��� \""..getID.."\" ������� ���������� � ����� ������.")
    end
    setClipboardText(getID)
  else
    ftext("�������: /nick [id] [0 - RP nick, 1 - NonRP nick]")
    return
  end 
end
 
 function uninvite(pam)
    lua_thread.create(function()
        local id, pri4ina = pam:match('(%d+)%s+(.+)')
	  if rank == "��.��������" or rank ==  '��.��������' or rank == '��������' or  rank == '�����������' then
        if id and pri4ina then
		if sampIsPlayerConnected(id) then
                sampSendChat('/me ������(�) ����� � ������� � '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
				wait(2000)
				sampSendChat(string.format('/uninvite %s %s', id, pri4ina))
			else 
			ftext('����� � ������ ID �� ��������� � ������� ��� ������ ��� ID')
		end
		else 
			ftext('�������: /uninvite [id] [�������]')
		end
		else 
			ftext('������ ������� �������� � 7 �����')
	  end
   end)
 end

function fastmenu(id)
 return
{
   {
   title = "{FFFFFF}���� �������",
    onclick = function()
	if cfg.main.aTag then
	submenus_show(otmenu(id), "{139BEC}Inst Tools {ffffff}| ���� �������")
	else
	ftext('�������� ������� � ����������')
	end
	end
   },
   {
   title = "{FFFFFF}���� �������������",
    onclick = function()
	submenus_show(sobes(id), "{139BEC}Inst Tools {ffffff}| ���� �������������")
	end
   },
   {
   title = "{FFFFFF}������� ���������� ������� � ��������� � /d{ff0000} (��� 4+ �����)",
    onclick = function()
	if rank == '��.����������' or rank == '����������' or rank == '�����������' or rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' then
	sampSendChat(string.format('/d SFPD, �������� ���������� � ���������, �������!'))
	else
	ftext('��� ���� ������������ �����')
	end
	end
   },
   {
   title = "{FFFFFF}�������� �������� � ����� ����� ����� � /d{ff0000} (��� 4+ �����)",
    onclick = function()
	if rank == '��.����������' or rank == '����������' or rank == '�����������' or rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' then
	sampSendChat(string.format('/d OG, �������������� �������� �������� � ����� ����� �����. ���: %s.', tel))
	else
	ftext('��� ���� ������������ �����')
	end
	end
   },
   {
   title = "{FFFFFF}������ ����������� ����������� �� � �����",
    onclick = function()
	pX, pY, pZ = getCharCoordinates(playerPed)
	if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
	dmch()
	else
	ftext('�� ������ ���������� � �����')
	end
	end
   },
   {
   title = "{FFFFFF}�������� � ����� � �������� �������� {ff0000}(����������� ��� ��������)",
    onclick = function()
    if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: ������(�) �� �������� ��������.', cfg.main.tag))
        else
        sampSendChat(string.format('/r ������(�) �� �������� ��������.'))
        end
		dostavka = true
	end
   },
}
end

function sobes(id)
    return
    {
      {
        title = '{ffffff}� ����������� � �������.',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("�����������, �������� ���������� ���� �������, � ���.�����")
        wait(1500)
        sampSendChat("/b /showpass "..myid..", /me �������(�) ���.����� �������� ��������") 
		end
      },
      {
        title = '{ffffff}� �������� �������� � ���.�����',
        onclick = function()
        sampSendChat("/me ����(�) ������� � ���� � ���.�����, ����� �����(�) ��������� �����������")
        wait(4000)
        sampSendChat("/do ������� � ���.����� � ����.")
		end
      },
      {
        title = '{ffffff}� ���������� � ����',
        onclick = function()
        local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("������, ���������� � ���� ����������.")
        end
      },
      {
        title = '{ffffff}� ������� ����� ������',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("������, ������ ���-������ ��������? ���� ��, ������� ���, ���� �� ������.")
		end
      },
      {
        title = '{ffffff}� ���� � ����� ���������',
        onclick = function()
        sampSendChat("������, ����� ������ ���� � ����� ����� ��� ���������?")
		end
      },
      {
        title = '{ffffff}� ����� � ���������',
        onclick = function()
        sampSendChat("������, � � �����...")
        wait(4000)
        sampSendChat("�� ��� ���������! ������ ��� ������� ����� � �������.")
		end
      },
      {
        title = '{ffffff}� ����� � ���������',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("������, � � �����...")
        wait(4000)
        sampSendChat("� ���������, �� ��� �� ���������!")
		end
      }            
    }
end

function otmenu(id)
 return
{
  {
   title = "{FFFFFF}���� ������ � ����� (���) {ff0000}(��� ����/����� ������)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: ��������� ����������, ��������� ��������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: � ����� �������������� ����� ������������ ���������� �����������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: �������� � ����� ����� � ��������� "��.����������".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: ��� ��������� ���������� ������ �� �.'..myid..'.', cfg.main.tag))
	end
   },
    {
   title = "{FFFFFF}���� ������ � ����� (���) {ff0000}(��� ����/����� ������)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: ��������� ����������, ��������� ��������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: � ������������ - ����������� ����� ������������ ���������� �����������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: �������� � ����� ����� � ��������� "�����������".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: ��� ��������� ���������� ������ �� �.'..myid..'.', cfg.main.tag))
	end
   },
   {
   title = "{FFFFFF}���� ������ � ����� (OOC) {ff0000}(��� ����/����� ������)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: ��������� ����������, ��������� ��������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: � ����� �������� ����������� ������������ ���������� �����������.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: �������� � ����� ����� � ��������� "�����".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: ��� ��������� ���������� ������ �� �.'..myid..'.', cfg.main.tag))
	end
   },
   {
   title = "{FFFFFF}���.������ ���� ���.�����������",
    onclick = function()
	if cfg.main.male == true then
	sampSendChat("/me ������� ������ � ����������� ���.�����������")
    wait(3500)
    sampSendChat("/me ����� ����������� ������� ��������� ����������")
    wait(3500)
    sampSendChat("/me ������ �����")
    wait(3500)
    sampSendChat("/do ����� ������.")
	wait(3500)
	sampSendChat("/me ������ � �������� ��� ������������ ������� � ����� ����������� ���������")
	wait(3500)
	sampSendChat("/try ��������� � �����")
	wait(3500)
	sampSendChat("/me ����� ��������� �������� � �����.")
	wait(3500)
	sampSendChat("/try �������� � �����")
	wait(3500)
	sampSendChat("/me ��������� ���������� �� ������� �����������")
	wait(3500)
	sampSendChat("/try ����������� �� ����������")
	wait(3500)
	sampSendChat("/me ������ ������� � ������, ����� ���� ������� ��� ���������� ��������")
	wait(3500)
	sampSendChat("/me �������� ������� � ������ �������")
	wait(1200)
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
	end
	if cfg.main.male == false then
	sampSendChat("/me �������� ������ � ����������� ���.�����������")
    wait(3500)
    sampSendChat("/me ������ ����������� ������� ��������� ����������")
    wait(3500)
    sampSendChat("/me ������� �����")
    wait(3500)
    sampSendChat("/do ����� ������.")
	wait(3500)
	sampSendChat("/me ������� � �������� ��� ������������ ������� � ������ ����������� ���������")
	wait(3500)
	sampSendChat("/try ��������� � �����")
	wait(3500)
	sampSendChat("/me ������ ��������� �������� � �����.")
	wait(3500)
	sampSendChat("/try �������� � �����")
	wait(3500)
	sampSendChat("/me ��������� ���������� �� ������� �����������")
	wait(3500)
	sampSendChat("/try ����������� �� ����������")
	wait(3500)
	sampSendChat("/me ������� ������� � ������, ����� ���� �������� ��� ���������� ��������")
	wait(3500)
	sampSendChat("/me ��������� ������� � ������� �������")
	wait(1200)
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
	end
	end
   }
}
end

function fastsmsk()
	if lastnumber ~= nil then
		sampSetChatInputEnabled(true)
		sampSetChatInputText("/t "..lastnumber.." ")
	else
		ftext("�� ����� �� �������� �������� ���������.", 0x046D63)
	end
end

do

function imgui.OnDrawFrame()
   if first_window.v then
	imgui.SetNextWindowSize(imgui.ImVec2(1161, 436), imgui.Cond.FirstUseEver)
	local screenx, screeny = getScreenResolution()
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            
            imgui.Begin(u8 "Inst Tools | ���������", first_window, imgui.WindowFlags.NoResize)

            imgui.BeginChild('##set', imgui.ImVec2(140, 400), true)
            if imgui.Selectable(u8 "��������", vars.settingsVars.show == 1) then vars.settingsVars.show = 1 end
            imgui.EndChild()
            imgui.SameLine()
			imgui.BeginChild('##set1', imgui.ImVec2(1000, 400), true)
			
			 if vars.settingsVars.show == 1 then
	         local clistB = imgui.ImBool(cfg.main.clistB)
			 local clist = imgui.ImInt(cfg.main.clist)
			 local tagB = imgui.ImBool(cfg.main.aTag)
			 local tag = imgui.ImBuffer(u8(cfg.main.tag), 256)
			 local autopassB = imgui.ImBool(cfg.main.autoPass)
             local passB = imgui.ImBuffer(tostring(cfg.main.pass), 256)
			 local chat_tB = imgui.ImBool(cfg.main.chat_t)
			 local carb = imgui.ImBool(cfg.main.autocar)
			 local stateb = imgui.ImBool(cfg.main.male)
             local iScreenWidth, iScreenHeight = getScreenResolution()
	         local screenx, screeny = getScreenResolution()
	         local btn_size = imgui.ImVec2(-0.1, 0)
			 
			 if imgui.Checkbox(u8 "���������", clistB) then cfg.main.clistB = clistB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
			 imgui.SameLine()
             imgui.TextQuestion(u8 "������ ��������� ����� ������ ���, ����� �� �������� ��� ����� ��������� �����")
                if clistB.v then
                    if imgui.SliderInt(u8 "������� ����� ������", clist, 0, 33) then cfg.main.clist = clist.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                end
				
				if imgui.Checkbox(u8 "�������", tagB) then cfg.main.aTag = tagB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "������ ����� ����� ��� ��� � �����, ������� �� �������� � ������")
                if tagB.v then
                    if imgui.InputText(u8 "������� ��� ���", tag) then cfg.main.tag = u8:decode(tag.v) bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                end
				
				if imgui.Checkbox(u8 "���������", autopassB) then cfg.main.autoPass = autopassB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "����������� �������� �� ������ ��� ���� ��� ����� ������")
                if autopassB.v then
                    if imgui.InputText(u8 "������� ������", passB, imgui.InputTextFlags.Password) then cfg.main.pass = u8:decode(passB.v) bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                    if imgui.Button(u8'������ ������') then ftext('��� ������: {eb6b56}'..cfg.main.pass) end	
                end
				
				if imgui.Checkbox(u8 "��������� ��� �� T", chat_tB) then cfg.main.chat_t = chat_tB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "�� ������� ��������� ��� �� ����� � �� ���������� ��������� ��� � �� �������")
				
				 if imgui.Checkbox(u8 '������������� �������� ����', carb) then cfg.main.autocar = carb.v saveData(cfg, 'moonloader/instools/config.json') end
				 imgui.SameLine()
                imgui.TextQuestion(u8 "������� ������ ��� ������ ������� �� ������� \"2\"")
				
				if imgui.Checkbox(u8 '������� ���������', stateb) then cfg.main.male = stateb.v saveData(cfg, 'moonloader/instools/config.json') end
				 imgui.SameLine()
                imgui.TextQuestion(u8 "������� ������ ��� ������ ������� �� ������� \"2\"")
				
   end
            imgui.EndChild()

            imgui.End()
        end
		
   chatkey = rkeys.registerHotKey({VK_T}, true, function()
        if cfg.main.chat_t then
            if wasKeyPressed(VK_T) then sampSetChatInputEnabled(true) end
        end
    end)
  if second_window.v then
    imgui.ShowCursor = true
            local x, y = getScreenResolution()
            local btn_size = imgui.ImVec2(-0.1, 0)
            imgui.SetNextWindowSize(imgui.ImVec2(300, 300), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.Begin('Inst Tools | Main Menu ', second_window, mainw,  imgui.WindowFlags.NoResize)
	if imgui.Button(u8'������', btn_size) then
                bMainWindow.v = not bMainWindow.v
            end
	if imgui.Button(u8"��������������� �����", btn_size) then windows.gov.v = not windows.gov.v end
    if imgui.Button(u8" ������", btn_size) then windows.lectures.v = not windows.lectures.v end
	if imgui.Button(u8" ���������", btn_size) then windows.shpori.v = not windows.shpori.v end
            if imgui.Button(u8'������� �������', btn_size) then
      helps.v = not helps.v
    end
    if imgui.Button(u8'��������� �������', btn_size) then
                first_window.v = not first_window.v
            end
    if imgui.Button(u8 '�������� �� ������/����', btn_size) then os.execute('explorer "https://vk.me/umbrellakonstrukt"')
    btn_size = not btn_size
    end
	if imgui.CollapsingHeader(u8" �������� �� ��������") then
            if imgui.Button(u8" ������������� ������", btn_size) then showCursor(false) thisScript():reload() end
            if imgui.Button(u8" ��������� ������", btn_size) then imgui.OpenPopup(u8 "Inst Tools | ����������") end
            if imgui.BeginPopupModal(u8 "Inst Tools | ����������", _, imgui.WindowFlags.NoResize) then
                local size = imgui.ImVec2(230, 25)

                imgui.CentrText(u8 "�� ������������� ������ ��������� ������?")
                imgui.CentrText(doesFileExist("moonloader/reload_all.lua") and u8 "����� ������� ����������������� ������� ������� ����� \"CTRL + R\"" or u8 "������ ����� �� �������� �� ����������� ����.")

                imgui.Spacing()

                if imgui.Button(u8 "���������", size) then
                    showCursor(false)
                    imgui.CloseCurrentPopup()
                    thisScript():unload()
                end

                imgui.SameLine()

                if imgui.Button(u8 "������##����������", size) then
                    imgui.CloseCurrentPopup()
                end

                imgui.EndPopup()
            end
        end
				if vars.webData.isOnline then
            imgui.Separator()
            if imgui.Button(u8 " �������� ���������� �������", btn_size) then windows.myOnline.v = not windows.myOnline.v end
	end
	imgui.End()
	end
        if windows.myOnline.v then
            local spacing = 165.0
			local screenx, screeny = getScreenResolution()

            imgui.SetNextWindowSize(imgui.ImVec2(285, 150), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Inst Tools | ��� ��������� ������", windows.myOnline, imgui.WindowFlags.NoResize)
            
            imgui.Text(u8 "���:") imgui.SameLine(spacing) imgui.Text(tostring(sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))))
            imgui.Text(u8 "������: ") imgui.SameLine(spacing) imgui.Text(vars.isWorking and u8"�� ������" or u8"��������")
            imgui.Separator()
            imgui.Text(u8 "������ �� ����:") imgui.SameLine(spacing) imgui.Text(secToTime(online.dayOnline))
            imgui.Text(u8 "������ �� ������:") imgui.SameLine(spacing) imgui.Text(secToTime(online.weekOnline))
            imgui.Separator()
            imgui.Text(u8 "AFK �� ����:") imgui.SameLine(spacing) imgui.Text(secToTime(online.dayAFK))
            imgui.Text(u8 "AFK �� ������:") imgui.SameLine(spacing) imgui.Text(secToTime(online.weekAFK))

            imgui.End()
        end
  if helps.v then
                local x, y = getScreenResolution()
                imgui.SetNextWindowSize(imgui.ImVec2(500, 500), imgui.Cond.FirstUseEver)
                imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
                imgui.Begin(u8'Inst Tools | �������', helps, second_window, mainw,  imgui.WindowFlags.NoResize)
                for k, v in ipairs(help) do
                    if imgui.CollapsingHeader(v['cmd']..'##'..k) then
                        imgui.TextWrapped(u8('��������: %s'):format(u8(v['desc'])))
                        imgui.TextWrapped(u8("�������������: %s"):format(u8(v['use'])))
                    end
                end
                imgui.End()
            end
            if memw.v then
            imgui.ShowCursor = true
            local sw, sh = getScreenResolution()
            --imgui.SetWindowPos('##' .. thisScript().name, imgui.ImVec2(sw/2 - imgui.GetWindowSize().x/2, sh/2 - imgui.GetWindowSize().y/2))
            --imgui.SetWindowSize('##' .. thisScript().name, imgui.ImVec2(670, 500))
            imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.SetNextWindowSize(imgui.ImVec2(670, 330), imgui.Cond.FirstUseEver)
            imgui.Begin(u8('Inst Tools | ������ ����������� [�����: %s]'):format(#tMembers), memw)
            imgui.BeginChild('##1', imgui.ImVec2(670, 300))
            imgui.Columns(5, _)
            imgui.SetColumnWidth(-1, 180) imgui.Text(u8 '��� ������'); imgui.NextColumn()
            imgui.SetColumnWidth(-1, 190) imgui.Text(u8 '���������');  imgui.NextColumn()
            imgui.SetColumnWidth(-1, 80) imgui.Text(u8 '������') imgui.NextColumn()
            imgui.SetColumnWidth(-1, 120) imgui.Text(u8 '���� ������') imgui.NextColumn() 
            imgui.SetColumnWidth(-1, 70) imgui.Text(u8 'AFK') imgui.NextColumn() 
            imgui.Separator()
            for _, v in ipairs(tMembers) do
                imgui.TextColored(imgui.ImVec4(getColor(v.id)), u8('%s[%s]'):format(v.nickname, v.id))
                if imgui.IsItemHovered() then
                    imgui.BeginTooltip();
                    imgui.PushTextWrapPos(450.0);
                    imgui.TextColored(imgui.ImVec4(getColor(v.id)), u8("%s\n�������: %s"):format(v.nickname, sampGetPlayerScore(v.id)))
                    imgui.PopTextWrapPos();
                    imgui.EndTooltip();
                end
                imgui.NextColumn()
                imgui.Text(('%s [%s]'):format(v.sRang, v.iRang))
                imgui.NextColumn()
                if v.status ~= u8("�� ������") then
                    imgui.TextColored(imgui.ImVec4(0.80, 0.00, 0.00, 1.00), v.status);
                else
                    imgui.TextColored(imgui.ImVec4(0.00, 0.80, 0.00, 1.00), v.status);
                end
                imgui.NextColumn()
                imgui.Text(v.invite)
                imgui.NextColumn()
                if v.sec ~= 0 then
                    if v.sec < 360 then 
                        imgui.TextColored(getColorForSeconds(v.sec), tostring(v.sec .. u8(' ���.')));
                    else          
                        imgui.TextColored(getColorForSeconds(v.sec), tostring("360+" .. u8(' ���.')));
                    end
                else
                    imgui.TextColored(imgui.ImVec4(0.00, 0.80, 0.00, 1.00), u8("���"));
                end
                imgui.NextColumn()
            end
            imgui.Columns(1)
            imgui.EndChild()
            imgui.End()
        end
  	if infbar.v then
                _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
                imgui.SetNextWindowPos(imgui.ImVec2(cfg.main.posX, cfg.main.posY), imgui.ImVec2(0.5, 0.5))
                imgui.SetNextWindowSize(imgui.ImVec2(cfg.main.widehud, 140), imgui.Cond.FirstUseEver)
                imgui.Begin('������� ��������', infbar, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar) 
                imgui.CentrText(u8'������� �������� �� �����:') 
                imgui.Separator()
                imgui.Text(u8 '������� ������������ ����:') imgui.SameLine() imgui.Text(u8 ''..prava..'')
				imgui.Text(u8 '������� �������� ������:') imgui.SameLine() imgui.Text(u8 ''..pilot..'')
				imgui.Text(u8 '������� �������� �� ������:') imgui.SameLine() imgui.Text(u8 ''..kater..'')
				imgui.Text(u8 '������� �������� ��������:') imgui.SameLine() imgui.Text(u8 ''..ribolov..'')
				imgui.Text(u8 '������� �������� �� ������:') imgui.SameLine() imgui.Text(u8 ''..gun..'')
				imgui.Text(u8 '������� �������� �� ������:') imgui.SameLine() imgui.Text(u8 ''..biznes..'')
                imgui.End()
    end
	if windows.online.v then
	local screenx, screeny = getScreenResolution()

        imgui.SetNextWindowPos(imgui.ImVec2(screenx / 2, screeny / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(500, 280), imgui.Cond.FirstUseEver)

        imgui.Begin(u8 'Inst Tools | ������ �����������', windows.online, imgui.WindowFlags.NoResize)
        imgui.Columns(5, _)
        imgui.SetColumnWidth(-1, 170) imgui.Text(u8 '��� ������'); imgui.NextColumn()
        imgui.SetColumnWidth(-1, 80) imgui.Text(u8 'dayOnline');  imgui.NextColumn()
        imgui.SetColumnWidth(-1, 80) imgui.Text(u8 'weekOnline') imgui.NextColumn()
        imgui.SetColumnWidth(-1, 80) imgui.Text(u8 'dayAFK') imgui.NextColumn() 
        imgui.SetColumnWidth(-1, 80) imgui.Text(u8 'weekAFK') imgui.NextColumn() 
        imgui.Separator()
        for k, v in pairs(vars.webData.online) do
            imgui.Text(v['nick'])
            imgui.NextColumn()
            imgui.Text(secToTime(tonumber(v['dayOnline'])))
            imgui.NextColumn()
            imgui.Text(secToTime(tonumber(v['weekOnline'])))
            imgui.NextColumn()
            imgui.Text(secToTime(tonumber(v['dayAFK'])))
            imgui.NextColumn()
            imgui.Text(secToTime(tonumber(v['weekAFK'])))
            imgui.NextColumn()
        end
        imgui.Columns(1)
        imgui.End()
    end
	if windows.gov.v then
	local btn_size = imgui.ImVec2(-0.1, 0)
	local screenx, screeny = getScreenResolution()
            imgui.SetNextWindowSize(imgui.ImVec2(350, 340), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Ints Tools | ��������������� �����", windows.gov, imgui.WindowFlags.NoResize)
            for k, v in pairs(govs) do
                if imgui.Button(u8(("%s##%s����� �����"):format(v.name, k)), btn_size) then 
                    imgui.OpenPopup("��� ������ � ���� ������##�����"..k)
                end
                if imgui.BeginPopup("��� ������ � ���� ������##�����"..k) then
                    if imgui.Button(u8 "���������##"..k, imgui.ImVec2(95, 20)) then
                        imgui.OpenPopup(u8 "��������� �����?##"..k)
                        --imgui.CloseCurrentPopup()
                    end
                    if imgui.BeginPopupModal(u8 "��������� �����?##"..k, _, imgui.WindowFlags.NoResize) then
                        imgui.CentrText(u8 "�� ����� ������ ��������� �����?")

                        local size = imgui.ImVec2(150, 25)

                        if imgui.Button(u8 "���������##�����������"..k, size) then
                            lua_thread.create(function()
                                for line in v.text:gmatch('[^\r\n]+') do
                                    sampSendChat("/gov " .. line)
                                    wait(v.wait)
                                end
                            end)
                            imgui.CloseCurrentPopup()
                        end

                        imgui.SameLine()

                        if imgui.Button(u8 "������##�����������", size) then
                            imgui.CloseCurrentPopup()
                        end
                        
                        imgui.EndPopup()
                    end
                    if imgui.Button(u8 "�������������##"..k, imgui.ImVec2(95, 20)) then
                        govsVars.name.v = u8(v.name)
                        govsVars.text.v = u8(v.text)
                        govsVars.wait.v = v.wait
                        imgui.OpenPopup(u8 "Ints Tools | �������������� �����##�����"..k)
                    end
                    if imgui.BeginPopupModal(u8 "Ints Tools | �������������� �����##�����"..k, _, imgui.WindowFlags.NoResize) then

                        imgui.Text(u8 "������� �������� �����:")
                        imgui.InputText("##������� �������� �����", govsVars.name)
                        imgui.Text(u8 "������� �������� ����� ��������:")
                        imgui.InputInt("##������� �������� ����� ��������", govsVars.wait)
                        imgui.Text(u8 "������� ����� �����:")
                        imgui.Text(u8 "[!] /gov � ������ ������ ������ �� �����, ������ ������� ��� ������������� [!]")
                        imgui.InputTextMultiline("##������� ����� �����", govsVars.text, imgui.ImVec2(700, 200))
    
                        local size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20)
                        if imgui.Button(u8 "���������##�����", size) then
                            govs[k].name = u8:decode(govsVars.name.v)
                            govs[k].text = u8:decode(govsVars.text.v)
                            govs[k].wait = govsVars.wait.v
                            bimaindustries.saveCfg(govs, "moonloader/instools/govs.json")
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "������##�����", size) then
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "�������##�����", size) then
                            imgui.CloseCurrentPopup()
                            table.remove(govs, k)
                            bimaindustries.saveCfg(govs, "moonloader/instools/govs.json")
                        end
    
                        imgui.EndPopup()
                    end
                    imgui.EndPopup()
                end
                
            end
            imgui.Separator()
            if imgui.Button(u8 "�������� �����", btn_size) then
                govsVars.name.v = ""
                govsVars.text.v = ""
                govsVars.wait.v = 5000
                imgui.OpenPopup(u8 "�������� �����")
            end
            if imgui.BeginPopupModal(u8 "�������� �����", _, imgui.WindowFlags.NoResize) then

                imgui.Text(u8 "������� �������� �����:")
                imgui.InputText("##������� �������� �����", govsVars.name)
                imgui.Text(u8 "������� �������� ����� ��������:")
                imgui.InputInt("##������� �������� ����� �������������", govsVars.wait)
                imgui.Text(u8 "������� ����� �����:")
                imgui.Text(u8 "[!] /gov � ������ ������ ������ �� �����, ������ ������� ��� ������������� [!]")
                imgui.InputTextMultiline("##������� ����� �����", govsVars.text, imgui.ImVec2(700, 200))
                local size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)
                if imgui.Button(u8 "���������##�����", size) then
                    table.insert(govs, {name = u8:decode(govsVars.name.v), text = u8:decode(govsVars.text.v), wait = govsVars.wait.v})
                    bimaindustries.saveCfg(govs, "moonloader/instools/govs.json")
                    imgui.CloseCurrentPopup()
                end
                imgui.SameLine()
                if imgui.Button(u8 "������##�����", size) then
                    imgui.CloseCurrentPopup()
                end

                imgui.EndPopup()
            end
            imgui.End()
        end
	if windows.lectures.v then
	local btn_size = imgui.ImVec2(-0.1, 0)
	local screenx, screeny = getScreenResolution()
            imgui.SetNextWindowSize(imgui.ImVec2(350, 340), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Inst Tools | ������", windows.lectures, imgui.WindowFlags.NoResize)
            for k, v in pairs(lectures) do
                if imgui.Button(u8(("%s##%s������ �����"):format(v.name, k)), btn_size) then 
                    imgui.OpenPopup("��� ������ � ���� ������##"..k)
                end
                if imgui.BeginPopup("��� ������ � ���� ������##"..k) then
                    if imgui.Button(u8 "���������##"..k, imgui.ImVec2(95, 20)) then
                        lua_thread.create(function()
                            for line in v.text:gmatch('[^\r\n]+') do
                                sampSendChat(line)
                                wait(v.wait)
                            end
                        end)
                        imgui.CloseCurrentPopup()
                    end
                    if imgui.Button(u8 "�������������##"..k, imgui.ImVec2(95, 20)) then
                        lecturesVars.name.v = u8(v.name)
                        lecturesVars.text.v = u8(v.text)
                        lecturesVars.wait.v = v.wait
                        imgui.OpenPopup(u8 "Inst Tools | �������������� ������##"..k)
                    end
                    if imgui.BeginPopupModal(u8 "Inst Tools | �������������� ������##"..k, _, imgui.WindowFlags.NoResize) then

                        imgui.Text(u8 "������� �������� ������:")
                        imgui.InputText("##������� �������� ������", lecturesVars.name)
                        imgui.Text(u8 "������� �������� ����� ��������:")
                        imgui.InputInt("##������� �������� ����� ��������", lecturesVars.wait)
                        imgui.Text(u8 "������� ����� ������:")
                        imgui.InputTextMultiline("##������� ����� ������", lecturesVars.text, imgui.ImVec2(700, 200))
    
                        local size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20)
                        if imgui.Button(u8 "���������##������", size) then
                            lectures[k].name = u8:decode(lecturesVars.name.v)
                            lectures[k].text = u8:decode(lecturesVars.text.v)
                            lectures[k].wait = lecturesVars.wait.v
                            bimaindustries.saveCfg(lectures, "moonloader/instools/lectures.json")
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "������##������", size) then
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "�������##������", size) then
                            imgui.CloseCurrentPopup()
                            table.remove(lectures, k)
                            bimaindustries.saveCfg(lectures, "moonloader/instools/lectures.json")
                        end
    
                        imgui.EndPopup()
                    end
                    imgui.EndPopup()
                end
                
            end
            imgui.Separator()
            if imgui.Button(u8 "�������� ������", btn_size) then
                lecturesVars.name.v = ""
                lecturesVars.text.v = ""
                lecturesVars.wait.v = 1400
                imgui.OpenPopup(u8 "�������� ������")
            end
            if imgui.BeginPopupModal(u8 "�������� ������", _, imgui.WindowFlags.NoResize) then

                imgui.Text(u8 "������� �������� ������:")
                imgui.InputText("##������� �������� ������", lecturesVars.name)
                imgui.Text(u8 "������� �������� ����� ��������:")
                imgui.InputInt("##������� �������� ����� ��������", lecturesVars.wait)
                imgui.Text(u8 "������� ����� ������:")
                imgui.InputTextMultiline("##������� ����� ������", lecturesVars.text, imgui.ImVec2(700, 200))
                local size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)
                if imgui.Button(u8 "���������##������", size) then
                    table.insert(lectures, {name = u8:decode(lecturesVars.name.v), text = u8:decode(lecturesVars.text.v), wait = lecturesVars.wait.v})
                    bimaindustries.saveCfg(lectures, "moonloader/instools/lectures.json")
                    imgui.CloseCurrentPopup()
                end
                imgui.SameLine()
                if imgui.Button(u8 "������##������", size) then
                    imgui.CloseCurrentPopup()
                end

                imgui.EndPopup()
            end
            imgui.End()
        end
		if windows.shpori.v then
		    local screenx, screeny = getScreenResolution()
            local shpori = {u8("�� �������")}

            imgui.SetNextWindowSize(imgui.ImVec2(800, 500), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Inst Tools | ���������", windows.shpori, imgui.WindowFlags.NoResize)
            for k, v in pairs(shporList) do
                table.insert(shpori, u8(v.name))
            end
            table.insert(shpori, u8("�������� �����"))
            if imgui.Combo(u8 "�������� ���������", shporiVars.shpint, shpori) then
                if shporiVars.shpint.v ~= 0 then
                    if shporiVars.shpint.v ~= #shpori - 1 then
                        shporiVars.shpname.v = u8(shporList[shporiVars.shpint.v].name)
                        shporiVars.shpbuff.v = u8(shporList[shporiVars.shpint.v].text)
                        shporiVars.shpedit.v = false
                    else
                        shporiVars.shpname.v = ""
                        shporiVars.shpbuff.v = ""
                        shporiVars.shpedit.v = true
                    end
                end
            end
            if shporiVars.shpint.v ~= 0 then       
                if not shporiVars.shpedit.v then
                    if imgui.Button(u8 "�������������") then shporiVars.shpedit.v = true end
                    imgui.Separator()
                    imgui.InputText(u8 "����� �� ���������", shporiVars.shpsearch)
                    for line in shporiVars.shpbuff.v:gmatch('[^\r\n]+') do
                        if shporiVars.shpsearch.v:len() > 0 then
                            if string.rlower(line):find(string.rlower(shporiVars.shpsearch.v)) then
                                imgui.TextWrapped(line)
                                if imgui.IsItemClicked() then
                                    sampSetChatInputText(u8:decode(line))
                                    sampSetChatInputEnabled(true)
                                end
                            end
                        else
                            imgui.TextWrapped(line)
                            if imgui.IsItemClicked() then
                                sampSetChatInputText(u8:decode(line))
                                sampSetChatInputEnabled(true)
                            end
                        end
                    end
                end
                if shporiVars.shpedit.v then
                    imgui.Text(u8 "������� �������� ���������")
                    imgui.Spacing()
                    imgui.InputText(u8 "##������� �������� ���������", shporiVars.shpname)
                    imgui.NewLine()
                    imgui.Text(u8 "������� ����� ���������")
                    imgui.Spacing()
                    imgui.InputTextMultiline(u8 "##������� ����� ���������", shporiVars.shpbuff, imgui.ImVec2(785, 330))
                    local size
                    if shporiVars.shpint.v == #shpori - 1 then size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)  else size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20) end
                    if imgui.Button(u8 "���������##���������", size) then
                        if u8:decode(shporiVars.shpname.v):len() > 0 then
                            if shporiVars.shpint.v ~= #shpori - 1 then
                                shporList[shporiVars.shpint.v].name = u8:decode(shporiVars.shpname.v)
                                shporList[shporiVars.shpint.v].text = u8:decode(shporiVars.shpbuff.v)
                                shporiVars.shpedit.v = false
                            else
                                table.insert(shporList, {name = u8:decode(shporiVars.shpname.v), text = u8:decode(shporiVars.shpbuff.v)})
                            end
                            bimaindustries.saveCfg(shporList, "moonloader/instools/shapgalka.json")
                        else
                            ftext("�� �� ����� �������� ���������")
                        end
                    end
                    imgui.SameLine()
                    if imgui.Button(u8 "������##���������", size) then
                        shporiVars.shpedit.v = false
                    end
                    if shporiVars.shpint.v ~= #shpori - 1 then
                        imgui.SameLine()
                        if imgui.Button(u8 "�������##���������", size) then                       
                            table.remove(shporList, shporiVars.shpint.v)
                            shporiVars.shpint.v = 0
                            shporiVars.shpedit.v = false
                            bimaindustries.saveCfg(shporList, "moonloader/instools/shapgalka.json")
                        end
                    end
                end
            end
            imgui.End()
        end
    if updwindows.v then
                local updlist = ttt
                imgui.LockPlayer = true
                imgui.ShowCursor = true
                local iScreenWidth, iScreenHeight = getScreenResolution()
                imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
                imgui.SetNextWindowSize(imgui.ImVec2(700, 330), imgui.Cond.FirstUseEver)
                imgui.Begin(u8('Inst Tools | ����������'), updwindows, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
                imgui.Text(u8('����� ���������� ������� Inst Tools �� ������ '..updversion..'. ��� �� ���������� ������� ������ �����.'))
                imgui.Separator()
                imgui.BeginChild("uuupdate", imgui.ImVec2(690, 200))
                for line in ttt:gmatch('[^\r\n]+') do
                    imgui.Text(line)
                end
                imgui.EndChild()
                imgui.Separator()
                imgui.PushItemWidth(305)
                if imgui.Button(u8("��������"), imgui.ImVec2(339, 25)) then
                    lua_thread.create(goupdate)
                    updwindows.v = false
                end
                imgui.SameLine()
                if imgui.Button(u8("�������� ����������"), imgui.ImVec2(339, 25)) then
                    updwindows.v = false
                end
                imgui.End()
            end
  if bMainWindow.v then
  local iScreenWidth, iScreenHeight = getScreenResolution()
	local tLastKeys = {}
   
   imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
   imgui.SetNextWindowSize(imgui.ImVec2(800, 530), imgui.Cond.FirstUseEver)

   imgui.Begin(u8("IT | ������##main"), bMainWindow, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
	imgui.BeginChild("##bindlist", imgui.ImVec2(795, 442))
	for k, v in ipairs(tBindList) do
		if hk.HotKey("##HK" .. k, v, tLastKeys, 100) then
			if not rkeys.isHotKeyDefined(v.v) then
				if rkeys.isHotKeyDefined(tLastKeys.v) then
					rkeys.unRegisterHotKey(tLastKeys.v)
				end
				rkeys.registerHotKey(v.v, true, onHotKey)
			end
		end
		imgui.SameLine()
		if tEditData.id ~= k then
			local sText = v.text:gsub("%[enter%]$", "")
			imgui.BeginChild("##cliclzone" .. k, imgui.ImVec2(500, 21))
			imgui.AlignTextToFramePadding()
			if sText:len() > 0 then
				imgui.Text(u8(sText))
			else
				imgui.TextDisabled(u8("������ ��������� ..."))
			end
			imgui.EndChild()
			if imgui.IsItemClicked() then
				sInputEdit.v = sText:len() > 0 and u8(sText) or ""
				bIsEnterEdit.v = string.match(v.text, "(.)%[enter%]$") ~= nil
				tEditData.id = k
				tEditData.inputActve = true
			end
		else
			imgui.PushAllowKeyboardFocus(false)
			imgui.PushItemWidth(500)
			local save = imgui.InputText("##Edit" .. k, sInputEdit, imgui.InputTextFlags.EnterReturnsTrue)
			imgui.PopItemWidth()
			imgui.PopAllowKeyboardFocus()
			imgui.SameLine()
			imgui.Checkbox(u8("����") .. "##editCH" .. k, bIsEnterEdit)
			if save then
				tBindList[tEditData.id].text = u8:decode(sInputEdit.v) .. (bIsEnterEdit.v and "[enter]" or "")
				tEditData.id = -1
			end
			if tEditData.inputActve then
				tEditData.inputActve = false
				imgui.SetKeyboardFocusHere(-1)
			end
		end
	end
	imgui.EndChild()

	imgui.Separator()

	if imgui.Button(u8"�������� �������") then
		tBindList[#tBindList + 1] = {text = "", v = {}}
	end

   imgui.End()
  end
  end
end

function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function onReceivePacket(id)
	if id == 33 or id == 32 then
		vars.isWorking = false
	end
end

function calculateOnline()
    lua_thread.create(function()
        local updatecount = 0
        while true do wait(1000)
            if isPlayerPlaying(PLAYER_PED) then
                local myid = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))
                if sampGetFraktionBySkin(myid) == "���������" then
                    if vars.webData.isOnline then
                        local ip, port = sampGetCurrentServerAddress()
                        local serverAddress = ip..":"..port
                        if serverAddress == "185.169.134.67:7777" then
                            online.dayOnline = online.dayOnline + 1
                            online.weekOnline = online.weekOnline + 1
                            online.dayAFK = online.dayAFK + (os.time() - vars.updateAFK - 1)
                            online.weekAFK = online.weekAFK + (os.time() - vars.updateAFK - 1)
                            if updatecount >= 5 then 
                                --[[vars.webData.canUpdate = true
                                updatecount = -1 ]]
                                updateOnline()
                                updatecount = 0
                            end
                            updatecount = updatecount + 1
                        end
                    end
                end
            end
            vars.updateAFK = os.time()
        end
    end)
end

function updateOnline()
    if isPlayerPlaying(PLAYER_PED) then
        local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        local time = os.date("%d.%m.%Y %H:%M")

        local hashstr = "romagay-"..nick.."-"..time.."-"..online.dayOnline.."-"..online.weekOnline.."-"..online.dayAFK.."-"..online.weekAFK
        local hash = string.lower(crypto.sha256(hashstr))

        httpRequest("http://l99922zn.beget.tech/web/updateOnline.php", ("nick=%s&date=%s&dayOnline=%s&weekOnline=%s&dayAFK=%s&weekAFK=%s&hash=%s"):format(nick, time, online.dayOnline, online.weekOnline, online.dayAFK, online.weekAFK, hash), function(response, code, headers, status)
            if response then
                local info = decodeJson(response)

                if not info.success then
                    print("��������� ������ �������� �������")
                    print("����� ������: "..u8:decode(info.error))
                else
                    if info.isNew then
                        online.dayOnline = 5
                        online.weekOnline = 5
                        online.dayAFK = 0
                        online.weekAFK = 0
                        ftext("��������� ������ �������, ������� ������� ����� ������")
                    end
                    if info.newDay then 
                        online.dayOnline = 5
                        online.dayAFK = 0
                    end
                end
            else
                print("��������� ������ ����������� � �������")
            end
        end)
    end
end

function addModer(pam)
    if vars.webData.isAdmin then
        if #pam > 0 then
            local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
            local time = os.date("%d.%m.%Y %H:%M")
            local player = pam:gsub(" ","")
            
            local hashstr = "romagay-"..nick.."-"..player.."-givemoder-"..time
            local hash = string.lower(crypto.sha256(hashstr))

            httpRequest("http://l99922zn.beget.tech/web/cp/controlModers.php", ("nick=%s&player=%s&action=givemoder&date=%s&hash=%s"):format(nick, player, time, hash), function(response, code, headers, status)
                if response then
                    local info = decodeJson(response)
                    if info.success then
                        ftext("������� ������� ������")
                    else
                        ftext("��������� ������ ������ �������")
                        ftext("����� ������: "..u8:decode(info.error))
                    end
                else
                    ftext("������ ����������� � �������")
                end
            end)
        else
            ftext("�����������: /addmoder [nick]")
        end
    end
end

function delModer(pam)
    if vars.webData.isAdmin then
        if #pam > 0 then
            local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
            local time = os.date("%d.%m.%Y %H:%M")
            local player = pam:gsub(" ","")
            
            local hashstr = "romagay-"..nick.."-"..player.."-delmoder-"..time
            local hash = string.lower(crypto.sha256(hashstr))

            httpRequest("http://l99922zn.beget.tech/web/cp/controlModers.php", ("nick=%s&player=%s&action=delmoder&date=%s&hash=%s"):format(nick, player, time, hash), function(response, code, headers, status)
                if response then
                    local info = decodeJson(response)
                    if info.success then
                        ftext("������� ������� ������������")
                    else
                        ftext("��������� ������ ������������� �������")
                        ftext("����� ������: "..u8:decode(info.error))
                    end
                else
                    ftext("������ ����������� � �������")
                end
            end)
        else
            ftext("�����������: /delmoder [nick]")
        end
    end
end

function resetOnline()
    if vars.webData.isAdmin then
        local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        local time = os.date("%d.%m.%Y %H:%M")

        local hashstr = ("romagay-"..nick.."-"..time)
        local hash = string.lower(crypto.sha256(hashstr))

        httpRequest("http://l99922zn.beget.tech/web/cp/resetOnline.php", ("nick=%s&date=%s&hash=%s"):format(nick, time, hash), function(response, code, headers, status)
            if response then
                local info = decodeJson(response)
                if info.success then
                    ftext("��������� ������ ������� �������")
                else
                    ftext("������ ������ �������")
                    ftext("����� ������: "..u8:decode(info.error))
                end
            else
                ftext("������ ����������� � �������")
            end
        end)
    end
end

function addOnline(pam)
    if vars.webData.isAccess then
        if #pam > 0 then
            local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
            local time = os.date("%d.%m.%Y %H:%M")
            local player = pam:gsub(" ","")
            
            local hashstr = "romagay-"..nick.."-"..player.."-giveaccess-"..time
            local hash = string.lower(crypto.sha256(hashstr))

            httpRequest("http://l99922zn.beget.tech/web/cp/playersAccess.php", ("nick=%s&player=%s&action=giveaccess&date=%s&hash=%s"):format(nick, player, time, hash), function(response, code, headers, status)
                if response then
                    local info = decodeJson(response)
                    if info.success then
                        ftext("������� ���������� ������� ��� ������ ������� �������")
                    else
                        ftext("��������� ������ ������ �������� ���������� �������")
                        ftext("����� ������: "..u8:decode(info.error))
                    end
                else
                    ftext("������ ����������� � �������")
                end
            end)
        else
            ftext("�����������: /addonline [nick]")
        end
    end
end

function delOnline(pam)
    if vars.webData.isAccess then
        if #pam > 0 then
            local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
            local time = os.date("%d.%m.%Y %H:%M")
            local player = pam:gsub(" ","")
            
            local hashstr = "romagay-"..nick.."-"..player.."-delaccess-"..time
            local hash = string.lower(crypto.sha256(hashstr))

            httpRequest("http://l99922zn.beget.tech/web/cp/playersAccess.php", ("nick=%s&player=%s&action=delaccess&date=%s&hash=%s"):format(nick, player, time, hash), function(response, code, headers, status)
                if response then
                    local info = decodeJson(response)
                    if info.success then
                        ftext("������� ���������� ������� ��� ������ ������� ��������")
                    else
                        ftext("��������� ������ ���������� �������� ���������� �������")
                        ftext("����� ������: "..u8:decode(info.error))
                    end
                else
                    ftext("������ ����������� � �������")
                end
            end)
        else
            ftext("�����������: /delonline [nick]")
        end
    end
end

function getOnline()
    if vars.webData.isAccess then
        local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
        local time = os.date("%d.%m.%Y %H:%M")

        local hashstr = ("romagay-"..nick.."-"..time)
        local hash = string.lower(crypto.sha256(hashstr))

        httpRequest("http://l99922zn.beget.tech/web/cp/getOnline.php", ("nick=%s&date=%s&hash=%s"):format(nick, time, hash), function(response, code, headers, status)
            if response then
                info = decodeJson(response)
                if info.success then
                    vars.webData.online = info.online
                    windows.online.v = true
                else
                    ftext("��������� ������ ��������� �������")
                    ftext("����� ������: "..u8:decode(info.error))
                end
            else
                ftext("������ ����������� � �������")
            end
        end)
    end
end

function onHotKey(id, keys)
	local sKeys = tostring(table.concat(keys, " "))
	for k, v in pairs(tBindList) do
		if sKeys == tostring(table.concat(v.v, " ")) then
			if tostring(v.text):len() > 0 then
				local bIsEnter = string.match(v.text, "(.)%[enter%]$") ~= nil
				if bIsEnter then
					sampProcessChatInput(v.text:gsub("%[enter%]$", ""))
				else
					sampSetChatInputText(v.text)
					sampSetChatInputEnabled(true)
				end
			end
		end
	end
end

function onScriptTerminate(scr)
	if scr == script.this then
		if doesFileExist(fileb) then
			os.remove(fileb)
		end
		local f = io.open(fileb, "w")
		if f then
			f:write(encodeJson(tBindList))
			f:close()
		end
		local fa = io.open("moonloader/instools/keys.json", "w")
        if fa then
            fa:write(encodeJson(config_keys))
            fa:close()
        end
	end
end

function onWindowMessage(msg, wparam, lparam)
    if msg == 0x100 or msg == 0x101 then
        if wparam == VK_ESCAPE and (second_window.v or updwindows.v or memw.v or bMainWindow.v or helps.v or first_window.v or windows.lectures.v or windows.gov.v or windows.online.v) and not isPauseMenuActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() and not sampIsChatInputActive() then
            consumeWindowMessage(true, false)
            if msg == 0x101 then
                second_window.v      = false
                updwindows.v    = false
				second_window.v    = false
				updwindows.v     = false
				memw.v    = false
				bMainWindow.v    = false
				helps.v    = false
				first_window.v     = false
				windows.lectures.v    = false
				windows.gov.v    = false
				windows.shpori.v    = false
				windows.online.v    = false
            end
        end
    end
end

function submenus_show(menu, caption, select_button, close_button, back_button)
    select_button, close_button, back_button = select_button or '�', close_button or 'x', back_button or '�'
    prev_menus = {}
    function display(menu, id, caption)
        local string_list = {}
        for i, v in ipairs(menu) do
            table.insert(string_list, type(v.submenu) == 'table' and v.title .. ' �' or v.title)
        end
        sampShowDialog(id, caption, table.concat(string_list, '\n'), select_button, (#prev_menus > 0) and back_button or close_button, sf.DIALOG_STYLE_LIST)
        repeat
            wait(0)
            local result, button, list = sampHasDialogRespond(id)
            if result then
                if button == 1 and list ~= -1 then
                    local item = menu[list + 1]
                    if type(item.submenu) == 'table' then -- submenu
                        table.insert(prev_menus, {menu = menu, caption = caption})
                        if type(item.onclick) == 'function' then
                            item.onclick(menu, list + 1, item.submenu)
                        end
                        return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
                    elseif type(item.onclick) == 'function' then
                        local result = item.onclick(menu, list + 1)
                        if not result then return result end
                        return display(menu, id, caption)
                    end
                else -- if button == 0
                    if #prev_menus > 0 then
                        local prev_menu = prev_menus[#prev_menus]
                        prev_menus[#prev_menus] = nil
                        return display(prev_menu.menu, id - 1, prev_menu.caption)
                    end
                    return false
                end
            end
        until result
    end
    return display(menu, 31337, caption or menu.title)
end

function r(pam)
    if #pam ~= 0 then
        if cfg.main.aTag then
            sampSendChat(string.format('/r [%s]: %s', cfg.main.tag, pam))
        else
            sampSendChat(string.format('/r %s', pam))
        end
    else
        ftext('������� /r [�����]')
    end
end
function ftext(message)
    sampAddChatMessage(string.format('%s %s', ctag, message), 0x139BEC)
end

function it()
  second_window.v = not second_window.v
end	

function tloadtk()
    if tload == true then
     sampSendChat('/tload'..u8(cfg.main.norma))
    else if tload == false then
     sampSendChat("/tunload")
    end
  end
end
function imgui.CentrText(text)
            local width = imgui.GetWindowWidth()
            local calc = imgui.CalcTextSize(text)
            imgui.SetCursorPosX( width / 2 - calc.x / 2 )
            imgui.Text(text)
        end
            function imgui.CustomButton(name, color, colorHovered, colorActive, size)
            local clr = imgui.Col
            imgui.PushStyleColor(clr.Button, color)
            imgui.PushStyleColor(clr.ButtonHovered, colorHovered)
            imgui.PushStyleColor(clr.ButtonActive, colorActive)
            if not size then size = imgui.ImVec2(0, 0) end
            local result = imgui.Button(name, size)
            imgui.PopStyleColor(3)
            return result
        end
		
		function secToTime(sec)
    local hour, minute, second = sec / 3600, math.floor(sec / 60), sec % 60
    return string.format("%02d:%02d:%02d", math.floor(hour) ,  minute - (math.floor(hour) * 60), second)
end
        
function imgui.TextColoredRGB(text)
  local style = imgui.GetStyle()
  local colors = style.Colors
  local ImVec4 = imgui.ImVec4

  local explode_argb = function(argb)
    local a = bit.band(bit.rshift(argb, 24), 0xFF)
    local r = bit.band(bit.rshift(argb, 16), 0xFF)
    local g = bit.band(bit.rshift(argb, 8), 0xFF)
    local b = bit.band(argb, 0xFF)
    return a, r, g, b
  end

  local getcolor = function(color)
      if color:sub(1, 6):upper() == 'SSSSSS' then
          local r, g, b = colors[1].x, colors[1].y, colors[1].z
          local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
          return ImVec4(r, g, b, a / 255)
      end
      local color = type(color) == 'string' and tonumber(color, 16) or color
      if type(color) ~= 'number' then return end
      local r, g, b, a = explode_argb(color)
      return imgui.ImColor(r, g, b, a):GetVec4()
  end

  local render_text = function(text_)
      for w in text_:gmatch('[^\r\n]+') do
          local text, colors_, m = {}, {}, 1
          w = w:gsub('{(......)}', '{%1FF}')
          while w:find('{........}') do
              local n, k = w:find('{........}')
              local color = getcolor(w:sub(n + 1, k - 1))
              if color then
                  text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                  colors_[#colors_ + 1] = color
                  m = n
              end
              w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
          end
          if text[0] then
              for i = 0, #text do
                  imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                  imgui.SameLine(nil, 0)
              end
              imgui.NewLine()
          else imgui.Text(u8(w)) end
      end
  end
  render_text(text)
end

function apply_custom_style()
  imgui.SwitchContext()
  local style = imgui.GetStyle()
  local colors = style.Colors
  local clr = imgui.Col
  local ImVec4 = imgui.ImVec4
  local ImVec2 = imgui.ImVec2

  style.WindowPadding = imgui.ImVec2(10, 10)
  style.FramePadding = imgui.ImVec2(4, 4)
  style.WindowRounding = 0
  style.ChildWindowRounding = 0
  style.ItemSpacing = imgui.ImVec2(8.0, 5.0)
  style.ItemInnerSpacing = imgui.ImVec2(8, 6)
  style.ScrollbarSize = 13.0
  style.ScrollbarRounding = 0
  style.IndentSpacing = 25.0

  colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
  colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
  colors[clr.WindowBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
  colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.PopupBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
  colors[clr.Border] = ImVec4(0.86, 0.86, 0.86, 1.00)
  colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.FrameBg] = ImVec4(0.21, 0.20, 0.21, 0.60)
  colors[clr.FrameBgHovered] = ImVec4(0.68, 0.25, 0.25, 0.75)
  colors[clr.FrameBgActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.TitleBg] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.TitleBgCollapsed] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.TitleBgActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.MenuBarBg] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.ScrollbarBg] = ImVec4(0.56, 0.56, 0.58, 0.00)
  colors[clr.ScrollbarGrab] = ImVec4(0.56, 0.56, 0.58, 0.44)
  colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 0.74)
  colors[clr.ScrollbarGrabActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.ComboBg] = ImVec4(0.15, 0.14, 0.15, 1.00)
  colors[clr.CheckMark] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.SliderGrab] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.SliderGrabActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.Button] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.ButtonHovered] = ImVec4(0.68, 0.25, 0.25, 0.75)
  colors[clr.ButtonActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.Header] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.HeaderHovered] = ImVec4(0.68, 0.25, 0.25, 0.75)
  colors[clr.HeaderActive] = ImVec4(0.68, 0.25, 0.25, 1.00)
  colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.30)
  colors[clr.ResizeGripHovered] = ImVec4(1.00, 1.00, 1.00, 0.60)
  colors[clr.ResizeGripActive] = ImVec4(1.00, 1.00, 1.00, 0.90)
  colors[clr.CloseButton] = ImVec4(0.56, 0.56, 0.58, 0.75)
  colors[clr.CloseButtonHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.CloseButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
  colors[clr.PlotLines] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.PlotLinesHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.PlotHistogram] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.PlotHistogramHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.TextSelectedBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
  colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.00)
end

function pkmmenu(id)
    local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
    return
    {
      {
        title = "{ffffff}� ����������",
        onclick = function()
        pID = tonumber(args)
        submenus_show(instmenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
	  {
        title = "{ffffff}� ���� ��������",
        onclick = function()
        pID = tonumber(args)
	    pX, pY, pZ = getCharCoordinates(playerPed)
	    if sampGetPlayerNickname(Damien_Requeste) or dostavka or rank == '��.��������' or rank == '��.��������' or rank == '��������' or rank == '�����������' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(pricemenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('�� ������ ���������� �� �������')
		end
        end
      },
      {
        title = "{ffffff}� �������",
        onclick = function()
        pID = tonumber(args)
		pX, pY, pZ = getCharCoordinates(playerPed)
		if sampGetPlayerNickname(Damien_Requeste) or rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(questimenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('�� ������ ���������� �� �������')
		end
        end
      },
      {
        title = "{ffffff}� ����������",
        onclick = function()
        pID = tonumber(args)
		pX, pY, pZ = getCharCoordinates(playerPed)
		if sampGetPlayerNickname(Damien_Requeste) or dostavka or rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(oformenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('�� ������ ���������� �� �������')
        end
		end
      },
	  {
        title = "{ffffff}� ������� �������",
        onclick = function()
		if cfg.main.male == true then
        sampSendChat("/me ���� ����� � �����")
        wait(1500)
        sampSendChat("/itazer")
        wait(1500)
        sampSendChat("/me ������� ����� �� ����")
        end
	    if cfg.main.male == false then
        sampSendChat("/me ����� ����� � �����")
        wait(1500)
        sampSendChat("/itazer")
        wait(1500)
        sampSendChat("/me �������� ����� �� ����")
        end
		end
      }
    }
end

function questimenu(args)
    return
    {
      {
        title = '{5b83c2}� ������ �������� �� ��� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� ���� ��������',
        onclick = function()
          sampSendChat("������ � ����� ��� ���� �������� �� ���. ������?")
		end
      },
      {
        title = '{ffffff}� �����{ff0000} 50 ��/�',
        onclick = function()
        sampSendChat("����� ������������ �������� ��������� � ������?")
        end
      },
      {
        title = '{ffffff}� ����� ���������{ff0000} 30 ��/�',
        onclick = function()
        sampSendChat("����� ������������ �������� ��������� � ����� ���������?")
        end
      },
      {
        title = '{ffffff}� �����{ff0000} � ����� �������.',
        onclick = function()
        sampSendChat("� ����� ������� �������� �����?")
        end
      },
      {
        title = '{ffffff}� ���',
        onclick = function()
        sampSendChat("�� ������ � ���. ���� ��������?")
		wait(1500)
		ftext("{FFFFFF}- ���������� �����: {A52A2A}������� ������ ������ ������������. ������� ��� � �� � ����� �� ��������.", -1)
        end
      },
	  {
        title = '{ffffff}� �������� ��� ���������',
        onclick = function()
        sampSendChat("�� ���� ���� ���������� � ���������� �������. ���� ��������?")
		wait(1500)
		ftext("{FFFFFF}- ���������� �����: {A52A2A}������� �������� � ��������� � �������.", -1)
        end
      },
	  {
        title = '{5b83c2}� ������ ������ ��������',
        onclick = function()
        end
      },
      {
        title = '{ffffff}���� ������� ������',
        onclick = function()
        sampSendChat("����� ��� �������� �� ������?")
        end
      },
	  {
        title = '{ffffff}�������� ������',
        onclick = function()
        sampSendChat("��� �� ������ ������� ������?")
        end
      }
    }
end

function oformenu(id)
    return
    {
      {
        title = '{5b83c2}� ������ ���������� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� �����.',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������(�) ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me ��������(�) ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
		  sampSendChat("/givelicense "..id)
		  wait(1700)
		  sampCloseCurrentDialogWithButton(1)

		  if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		  end
		end
      },
      {
        title = '{ffffff}� �������',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������(�) ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me ��������(�) ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
		sampSendChat("/givelicense "..id)
		wait(1700)
		sampSetCurrentDialogListItem(2)
		wait(1700)
		sampCloseCurrentDialogWithButton(1)
		if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		end
        end
      },
      {
        title = '{ffffff}� �����',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������ ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me ��������(�) ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
		sampSendChat("/givelicense "..id)
		wait(1700)
		sampSetCurrentDialogListItem(1)
		wait(1700)
		sampCloseCurrentDialogWithButton(1)
		if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		end
        end
      },
      {
        title = '{ffffff}� ������{ff0000} �� 2 ������.',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������(�) ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me ��������(�) ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
		sampSendChat("/givelicense "..id)
		wait(1700)
		sampSetCurrentDialogListItem(4)
		wait(1700)
		sampCloseCurrentDialogWithButton(1)
		if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		end
        end
      },
      {
        title = '{ffffff}� �����',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������ ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me �������� ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
		sampSendChat("/givelicense "..id)
		wait(1700)
		sampSetCurrentDialogListItem(3)
		wait(1700)
		sampCloseCurrentDialogWithButton(1)
		if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		end
        end
      },
      {
        title = '{ffffff}� ������',
        onclick = function()
          sampSendChat("/do ���� � ����������� � ����� �����������.")
		  wait(1700)
		  sampSendChat("/me ���������(�) ����, ����� ���� ������(�) ������ ����� � ����� ��� ���������")
		  wait(1700)
		  sampSendChat("/me �������(�) ���������� ������ ����������")
		  wait(1700)
		  sampSendChat("/do �������� � ����.")
		  wait(1700)
		  sampSendChat('/me ��������(�) ������ "Autoschool San Fierro" � �������(�) �������� '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
		  wait(1700)
        sampSendChat("/givelicense "..id)
		wait(1700)
		sampSetCurrentDialogListItem(5)
		wait(1700)
		sampCloseCurrentDialogWithButton(1)
		if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
		  dostavka = false
		end
        end
      },
    }
end

function saveData(table, path)
	if doesFileExist(path) then os.remove(path) end
    local sfa = io.open(path, "w")
    if sfa then
        sfa:write(encodeJson(table))
        sfa:close()
    end
end

function pricemenu(args)
    return
    {
      {
        title = '{5b83c2}� ������ ��������� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� �����.',
        onclick = function()
		if gmegaflvl <= 2 then
          sampSendChat("/todo ������, ����� ��� ������������ � ������ �� ����� * ���������� �����-���� �������� �������� ")
		  wait(1500)
		  sampSendChat("/do �� �����-����� ��������:")
          wait(1200)
		  sampSendChat("/do 1-2 ���� ���������� � �����: ��������� �������� - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 ��� ���������� � �����: ��������� �������� - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 ��� ���������� � �����: ��������� �������� - 10000$")
          wait(1200)
		  sampSendChat("/do 16 � ����� ��� ���������� � �����: ��������� �������� - 30000$")
          wait(1200)
          sampSendChat("����� ��������, ���������� ���������� ������� ��������� ��������!")		  
		else if gmegaflvl <= 5 then
		  sampSendChat("/todo ������, ����� ��� ������������ � ������ �� ����� * ���������� �����-���� �������� �������� ")
		  wait(1500)
		  sampSendChat("/do �� �����-����� ��������:")
          wait(1200)
		  sampSendChat("/do 1-2 ���� ���������� � �����: ��������� �������� - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 ��� ���������� � �����: ��������� �������� - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 ��� ���������� � �����: ��������� �������� - 10000$")
          wait(1200)
		  sampSendChat("/do 16 � ����� ��� ���������� � �����: ��������� �������� - 30000$")
          wait(1200)
          sampSendChat("����� ��������, ���������� ���������� ������� ��������� ��������!") 
		else if gmegaflvl <= 15 then
		  sampSendChat("/todo ������, ����� ��� ������������ � ������ �� ����� * ���������� �����-���� �������� �������� ")
		  wait(1500)
		  sampSendChat("/do �� �����-����� ��������:")
          wait(1200)
		  sampSendChat("/do 1-2 ���� ���������� � �����: ��������� �������� - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 ��� ���������� � �����: ��������� �������� - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 ��� ���������� � �����: ��������� �������� - 10000$")
          wait(1200)
		  sampSendChat("/do 16 � ����� ��� ���������� � �����: ��������� �������� - 30000$")
          wait(1200)
          sampSendChat("����� ��������, ���������� ���������� ������� ��������� ��������!") 
		else if gmegaflvl >= 16 then
		  sampSendChat("/todo ������, ����� ��� ������������ � ������ �� ����� * ���������� �����-���� �������� �������� ")
		  wait(1500)
		  sampSendChat("/do �� �����-����� ��������:")
          wait(1200)
		  sampSendChat("/do 1-2 ���� ���������� � �����: ��������� �������� - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 ��� ���������� � �����: ��������� �������� - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 ��� ���������� � �����: ��������� �������� - 10000$")
          wait(1200)
		  sampSendChat("/do 16 � ����� ��� ���������� � �����: ��������� �������� - 30000$")
          wait(1200)
          sampSendChat("����� ��������, ���������� ���������� ������� ��������� ��������!")
        end
		end
		end
		end
		end
      },
      {
        title = '{ffffff}� �������',
        onclick = function()
		sampSendChat("/todo ������, ����� ��� ������������ � ����� �� ������� * ���������� �����-���� �������� �������� ")
		wait(1500)
		sampSendChat("/do �� �����-����� ��������:")
		wait(1000)
        sampSendChat("/do ��������� �������� �� ������� ���������� - 2.000$")
        end
      },
      {
        title = '{ffffff}� �����',
        onclick = function()
		sampSendChat("/todo ������, ����� ��� ������������ � ����� �� ������������� * ���������� �����-���� �������� �������� ")
		wait(1500)
		sampSendChat("/do �� �����-����� ��������:")
		wait(1200)
        sampSendChat("/do ��������� �������� �� ������������� ���������� - 10.000$")
        end
      },
      {
        title = '{ffffff}� ������{ff0000} �� 2 ������.',
        onclick = function()
		if gmegaflvl > 1 then
		sampSendChat("/todo ������, ����� ��� ������������ � ����� �� ������ * ���������� �����-���� �������� �������� ")
		wait(1500)
		sampSendChat("/do �� �����-����� ��������:")
		wait(1200)
        sampSendChat("/do ��������� �������� �� ������ ���������� - 50.000$")
		else
		sampSendChat("������ �������� ����� ���������� � 2-� ��� � �����.")
		end
        end
      },
	  {
        title = '{ffffff}� ������{ff0000} ��� ������� �������.',
        onclick = function()
		sampSendChat("/todo ������, ����� ��� ������������ � ����� �� ������ * ���������� �����-���� �������� �������� ")
		wait(1500)
		sampSendChat("/do �� �����-����� ��������:")
		wait(1200)
        sampSendChat("/do ��������� �������� �� ������ ���������� - 100.000$")
        end
      },
      {
        title = '{ffffff}� �����',
        onclick = function()
		sampSendChat("/todo ������, ����� ��� ������������ � ����� �� ������ ��������� * ���������� �����-���� �������� �������� ")
		wait(1500)
		sampSendChat("/do �� �����-����� ��������:")
		wait(1200)
        sampSendChat("/do ��������� �������� �� ������ ���������� ���������� - 5.000$")
        end
      },
    }
end

function instmenu(id)
    return
    {
      {
        title = '{5b83c2}� ������ ����������� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� �����������.',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("������������. � ��������� ��������� "..myname:gsub('_', ' ')..", ��� ���� ������?")
		wait(1500)
		sampSendChat('/do �� ������� ������� � �������� "'..rank..' | '..myname:gsub('_', ' ')..'".')  
		end
      },
      {
        title = '{ffffff}� �������',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        sampSendChat("��� �������, ����������.")
		wait(1500)
		sampSendChat("/b /showpass "..myid.."")
        end
      },
	  {
        title = '{ffffff}� ����������� � ��������',
        onclick = function()
        sampSendChat("������� �� �������, ����� ��� �������.")
        end
      }
    }
end

function getFraktionBySkin(playerid)
    fraks = {
        [0] = '�����������',
        [1] = '�����������',
        [2] = '�����������',
        [3] = '�����������',
        [4] = '�����������',
        [5] = '�����������',
        [6] = '�����������',
        [7] = '�����������',
        [8] = '�����������',
        [9] = '�����������',
        [10] = '�����������',
        [11] = '�����������',
        [12] = '�����������',
        [13] = '�����������',
        [14] = '�����������',
        [15] = '�����������',
        [16] = '�����������',
        [17] = '�����������',
        [18] = '�����������',
        [19] = '�����������',
        [20] = '�����������',
        [21] = 'Ballas',
        [22] = '�����������',
        [23] = '�����������',
        [24] = '�����������',
        [25] = '�����������',
        [26] = '�����������',
        [27] = '�����������',
        [28] = '�����������',
        [29] = '�����������',
        [30] = 'Rifa',
        [31] = '�����������',
        [32] = '�����������',
        [33] = '�����������',
        [34] = '�����������',
        [35] = '�����������',
        [36] = '�����������',
        [37] = '�����������',
        [38] = '�����������',
        [39] = '�����������',
        [40] = '�����������',
        [41] = 'Aztec',
        [42] = '�����������',
        [43] = '�����������',
        [44] = 'Aztec',
        [45] = '�����������',
        [46] = '�����������',
        [47] = 'Vagos',
        [48] = 'Aztec',
        [49] = '�����������',
        [50] = '�����������',
        [51] = '�����������',
        [52] = '�����������',
        [53] = '�����������',
        [54] = '�����������',
        [55] = '�����������',
        [56] = 'Grove',
        [57] = '�����',
        [58] = '�����������',
        [59] = '���������',
        [60] = '�����������',
        [61] = '�����',
        [62] = '�����������',
        [63] = '�����������',
        [64] = '�����������',
        [65] = '�����������', -- ��� ��������
        [66] = '�����������',
        [67] = '�����������',
        [68] = '�����������',
        [69] = '�����������',
        [70] = '���',
        [71] = '�����������',
        [72] = '�����������',
        [73] = 'Army',
        [74] = '�����������',
        [75] = '�����������',
        [76] = '�����������',
        [77] = '�����������',
        [78] = '�����������',
        [79] = '�����������',
        [80] = '�����������',
        [81] = '�����������',
        [82] = '�����������',
        [83] = '�����������',
        [84] = '�����������',
        [85] = '�����������',
        [86] = 'Grove',
        [87] = '�����������',
        [88] = '�����������',
        [89] = '�����������',
        [90] = '�����������',
        [91] = '�����������', -- ��� ��������
        [92] = '�����������',
        [93] = '�����������',
        [94] = '�����������',
        [95] = '�����������',
        [96] = '�����������',
        [97] = '�����������',
        [98] = '�����',
        [99] = '�����������',
        [100] = '������',
        [101] = '�����������',
        [102] = 'Ballas',
        [103] = 'Ballas',
        [104] = 'Ballas',
        [105] = 'Grove',
        [106] = 'Grove',
        [107] = 'Grove',
        [108] = 'Vagos',
        [109] = 'Vagos',
        [110] = 'Vagos',
        [111] = 'RM',
        [112] = 'RM',
        [113] = 'LCN',
        [114] = 'Aztec',
        [115] = 'Aztec',
        [116] = 'Aztec',
        [117] = 'Yakuza',
        [118] = 'Yakuza',
        [119] = 'Rifa',
        [120] = 'Yakuza',
        [121] = '�����������',
        [122] = '�����������',
        [123] = 'Yakuza',
        [124] = 'LCN',
        [125] = 'RM',
        [126] = 'RM',
        [127] = 'LCN',
        [128] = '�����������',
        [129] = '�����������',
        [130] = '�����������',
        [131] = '�����������',
        [132] = '�����������',
        [133] = '�����������',
        [134] = '�����������',
        [135] = '�����������',
        [136] = '�����������',
        [137] = '�����������',
        [138] = '�����������',
        [139] = '�����������',
        [140] = '�����������',
        [141] = 'FBI',
        [142] = '�����������',
        [143] = '�����������',
        [144] = '�����������',
        [145] = '�����������',
        [146] = '�����������',
        [147] = '�����',
        [148] = '�����������',
        [149] = 'Grove',
        [150] = '�����',
        [151] = '�����������',
        [152] = '�����������',
        [153] = '�����������',
        [154] = '�����������',
        [155] = '�����������',
        [156] = '�����������',
        [157] = '�����������',
        [158] = '�����������',
        [159] = '�����������',
        [160] = '�����������',
        [161] = '�����������',
        [162] = '�����������',
        [163] = 'FBI',
        [164] = 'FBI',
        [165] = 'FBI',
        [166] = 'FBI',
        [167] = '�����������',
        [168] = '�����������',
        [169] = 'Yakuza',
        [170] = '�����������',
        [171] = '�����������',
        [172] = '�����������',
        [173] = 'Rifa',
        [174] = 'Rifa',
        [175] = 'Rifa',
        [176] = '�����������',
        [177] = '�����������',
        [178] = '�����������',
        [179] = 'Army',
        [180] = '�����������',
        [181] = '������',
        [182] = '�����������',
        [183] = '�����������',
        [184] = '�����������',
        [185] = '�����������',
        [186] = 'Yakuza',
        [187] = '�����',
        [188] = '���',
        [189] = '�����������',
        [190] = 'Vagos',
        [191] = 'Army',
        [192] = '�����������',
        [193] = 'Aztec',
        [194] = '�����������',
        [195] = 'Ballas',
        [196] = '�����������',
        [197] = '�����������',
        [198] = '�����������',
        [199] = '�����������',
        [200] = '�����������',
        [201] = '�����������',
        [202] = '�����������',
        [203] = '�����������',
        [204] = '�����������',
        [205] = '�����������',
        [206] = '�����������',
        [207] = '�����������',
        [208] = 'Yakuza',
        [209] = '�����������',
        [210] = '�����������',
        [211] = '���',
        [212] = '�����������',
        [213] = '�����������',
        [214] = 'LCN',
        [215] = '�����������',
        [216] = '�����������',
        [217] = '���',
        [218] = '�����������',
        [219] = '���',
        [220] = '�����������',
        [221] = '�����������',
        [222] = '�����������',
        [223] = 'LCN',
        [224] = '�����������',
        [225] = '�����������',
        [226] = 'Rifa',
        [227] = '�����',
        [228] = '�����������',
        [229] = '�����������',
        [230] = '�����������',
        [231] = '�����������',
        [232] = '�����������',
        [233] = '�����������',
        [234] = '�����������',
        [235] = '�����������',
        [236] = '�����������',
        [237] = '�����������',
        [238] = '�����������',
        [239] = '�����������',
        [240] = '���������',
        [241] = '�����������',
        [242] = '�����������',
        [243] = '�����������',
        [244] = '�����������',
        [245] = '�����������',
        [246] = '������',
        [247] = '������',
        [248] = '������',
        [249] = '�����������',
        [250] = '���',
        [251] = '�����������',
        [252] = 'Army',
        [253] = '�����������',
        [254] = '������',
        [255] = 'Army',
        [256] = '�����������',
        [257] = '�����������',
        [258] = '�����������',
        [259] = '�����������',
        [260] = '�����������',
        [261] = '���',
        [262] = '�����������',
        [263] = '�����������',
        [264] = '�����������',
        [265] = '�������',
        [266] = '�������',
        [267] = '�������',
        [268] = '�����������',
        [269] = 'Grove',
        [270] = 'Grove',
        [271] = 'Grove',
        [272] = 'RM',
        [273] = '�����������', -- ���� ��������
        [274] = '���',
        [275] = '���',
        [276] = '���',
        [277] = '�����������',
        [278] = '�����������',
        [279] = '�����������',
        [280] = '�������',
        [281] = '�������',
        [282] = '�������',
        [283] = '�������',
        [284] = '�������',
        [285] = '�������',
        [286] = 'FBI',
        [287] = 'Army',
        [288] = '�������',
        [289] = '�����������',
        [290] = '�����������',
        [291] = '�����������',
        [292] = 'Aztec',
        [293] = '�����������',
        [294] = '�����������',
        [295] = '�����������',
        [296] = '�����������',
        [297] = 'Grove',
        [298] = '�����������',
        [299] = '�����������',
        [300] = '�������',
        [301] = '�������',
        [302] = '�������',
        [303] = '�������',
        [304] = '�������',
        [305] = '�������',
        [306] = '�������',
        [307] = '�������',
        [308] = '���',
        [309] = '�������',
        [310] = '�������',
        [311] = '�������'
    }
    if sampIsPlayerConnected(playerid) then
        local result, handle = sampGetCharHandleBySampPlayerId(playerid)
        local skin = getCharModel(handle)
        return fraks[skin]
    end
end

function update()
	local fpath = os.getenv('TEMP') .. '\\update.json'
	downloadUrlToFile('https://raw.githubusercontent.com/Misanthrope123/myprojec/master/update.json', fpath, function(id, status, p1, p2)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            local f = io.open(fpath, 'r')
            if f then
			    local info = decodeJson(f:read('*a'))
                updatelink = info.updateurl
                updlist1 = info.updlist
				updversion = info.latest
                ttt = updlist1
			    if info and info.latest then
                    version = tonumber(info.latest)
                    if version > tonumber(thisScript().version) then
                        ftext('���������� ���������� �� ������ '..updversion..'.')
					    updwindows.v = true
                        canupdate = true
                    else
                        print('���������� ������� �� ����������. �������� ����.')
                        update = false
				    end
			    end
		    end
	    end
    end)
end


function smsjob()
  if rank == '��.��������' or rank == '��.��������' or rank == '��������' or  rank == '�����������' then
    lua_thread.create(function()
        vixodid = {}
		status = true
		sampSendChat('/members')
        while not gotovo do wait(0) end
        wait(1200)
        for k, v in pairs(vixodid) do
            sampSendChat('/sms '..v..' �� ������ ������ ����������� �� ������ ����. ������� ������� ���� �� ������!')
            wait(1200)
        end
        players2 = {'{ffffff}���\t{ffffff}����\t{ffffff}������'}
		players1 = {'{ffffff}���\t{ffffff}����'}
		gotovo = false
        status = false
        vixodid = {}
	end)
	else 
	ftext('������ ������� �������� � 7 �����')
	end
end

function goupdate()
    ftext('�������� ���������� ����������. ������ �������������� ����� ���� ������.', -1)
    wait(300)
    downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
    if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
        showCursor(false)
	    thisScript():reload()
    end
end)
end

function cmd_color() -- ������� ��������� ����� ������, �� ����� ��� ���, �� ����� �� ����
	local text, prefix, color, pcolor = sampGetChatString(99)
	sampAddChatMessage(string.format("���� ��������� ������ ���� - {934054}[%d] (���������� � ����� ������)",color),-1)
	setClipboardText(color)
end

function getcolor(id)
local colors = 
        {
		[1] = '������',
		[2] = '������-������',
		[3] = '����-������',
		[4] = '���������',
		[5] = 'Ƹ���-������',
		[6] = '�����-������',
		[7] = '����-������',
		[8] = '�������',
		[9] = '����-�������',
		[10] = '���������',
		[11] = '����������',
		[12] = 'Ҹ���-�������',
		[13] = '����-�������',
		[14] = 'Ƹ���-���������',
		[15] = '���������',
		[16] = '�������',
		[17] = '�����',
		[18] = '�������',
		[19] = '����� �����',
		[20] = '����-������',
		[21] = 'Ҹ���-�����',
		[22] = '����������',
		[23] = '������',
		[24] = '����-�����',
		[25] = 'Ƹ����',
		[26] = '����������',
		[27] = '�������',
		[28] = '������ ������',
		[29] = '���������',
		[30] = '�����',
		[31] = '�������',
		[32] = '������',
		[33] = '�����',
		}
	return colors[id]
end

function Player:new(id, sRang, iRang, status, invite, afk, sec, nick)
	local obj = {
		id = id,
		nickname = nick,
		iRang = tonumber(iRang),
		sRang = u8(sRang),
		status = u8(status),
		invite = invite,
		afk = afk,
		sec = tonumber(sec)
	}

	setmetatable(obj, self)
	self.__index = self

	return obj
end
function getColorForSeconds(sec)
	if sec > 0 and sec <= 50 then
		return imgui.ImVec4(1, 1, 0, 1)
	elseif sec > 50 and sec <= 100 then
		return imgui.ImVec4(1, 159/255, 32/255, 1)
	elseif sec > 100 and sec <= 200 then
		return imgui.ImVec4(1, 93/255, 24/255, 1)
	elseif sec > 200 and sec <= 300 then
		return imgui.ImVec4(1, 43/255, 43/255, 1)
	elseif sec > 300 then
		return imgui.ImVec4(1, 0, 0, 1)
	end
end
function getColor(ID)
	PlayerColor = sampGetPlayerColor(ID)
	a, r, g, b = explode_argb(PlayerColor)
	return r/255, g/255, b/255, 1
end
function explode_argb(argb)
    local a = bit.band(bit.rshift(argb, 24), 0xFF)
    local r = bit.band(bit.rshift(argb, 16), 0xFF)
    local g = bit.band(bit.rshift(argb, 8), 0xFF)
    local b = bit.band(argb, 0xFF)
    return a, r, g, b
end

function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end

function sampev.onSendSpawn()
    pX, pY, pZ = getCharCoordinates(playerPed)
    if cfg.main.clistB	and getDistanceBetweenCoords3d(pX, pY, pZ, 2337.3574,1666.1699,3040.9524) < 20 then
        lua_thread.create(function()
            wait(1200)
			sampSendChat('/clist '..tonumber(cfg.main.clist))
			wait(500)
			local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			local color = ("%06X"):format(bit.band(sampGetPlayerColor(myid), 0xFFFFFF))
			colors = getcolor(cfg.main.clist)
            ftext('���� ���� ������ ��: {'..color..'}'..cfg.main.clist..' ['..colors..']')
        end)
    end
end

function sampev.onServerMessage(color, text)
        if text:find('������� ���� �����') and color ~= -1 then
		vars.isWorking = true
        if cfg.main.clistB then
		if rabden == false then
            lua_thread.create(function()
                wait(100)
				sampSendChat('/clist '..tonumber(cfg.main.clist))
				wait(500)
                local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			    local color = ("%06X"):format(bit.band(sampGetPlayerColor(myid), 0xFFFFFF))
                colors = getcolor(cfg.main.clist)
                ftext('���� ���� ������ ��: {'..color..'}'..cfg.main.clist..' ['..colors..']')
                rabden = true
				wait(1000)
				if cfg.main.clisto then
				local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
                local myname = sampGetPlayerNickname(myid)
				if cfg.main.male == true then
				sampSendChat("/me ������ �������")
                wait(1500)
                sampSendChat("/me ���� ���� ������, ����� ���� ������ �� � ����")
                wait(1500)
                sampSendChat("/me ���� ������� ������, ����� ���������� � ���")
                wait(1500)
                sampSendChat("/me ������� ������� �� �������")
                wait(1500)
                sampSendChat('/do �� ������� ������� � �������� "'..rank..' | '..myname:gsub('_', ' ')..'".')  
				end
				if cfg.main.male == false then
				sampSendChat("/me ������� �������")
                wait(1500)
                sampSendChat("/me ����� ���� ������, ����� ���� ������� �� � ����")
                wait(1500)
                sampSendChat("/me ����� ������� ������, ����� ����������� � ���")
                wait(1500)
                sampSendChat("/me �������� ������� �� �������")
                wait(1500)
                sampSendChat('/do �� ������� ������� � �������� "'..rank..' | '..myname:gsub('_', ' ')..'".')
				end
			end
            end)
        end
	  end
    end
	if text:find('SMS:') and text:find('�����������:') then
		wordsSMS, nickSMS = string.match(text, 'SMS: (.+) �����������: (.+)');
		local idsms = nickSMS:match('.+%[(%d+)%]')
		lastnumber = idsms
	end
	if text:find('{00AB06}����� ������� ���������, ������� ������� {FFFFFF}"2"{00AB06} ��� ������� ������� {FFFFFF}"/en"') then
            if cfg.main.autocar then
                lua_thread.create(function()
                    while not isCharInAnyCar(PLAYER_PED) do wait(0) end
                    if not isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) then
                        while sampIsChatInputActive() or sampIsDialogActive() or isSampfuncsConsoleActive() do wait(0) end
                        setVirtualKeyDown(key.VK_2, true)
                        wait(150)
                        setVirtualKeyDown(key.VK_2, false)
                    end
                end)
            end
        end
    if text:find('������� ���� �������') and color ~= -1 then
	vars.isWorking = false
        rabden = false
    end
	if text:find('�������� �������� �� ��������� ���������') then
        local Nicks = text:match('����� (.+) �������� �������� �� ��������� ���������. ����� ��������� � ��������.')
		pilot = pilot + 1
	end
   	if text:find('�������� ������������ �����') then
        local Nicks = text:match('����� (.+) �������� ������������ �����. ����� ��������� � ��������.')
		prava = prava + 1
	end
   	if text:find('�������� �������� �� �����������') then
        local Nicks = text:match('����� (.+) �������� �������� �� �����������. ����� ��������� � ��������.')
		ribolov = ribolov + 1
	end
   	if text:find('�������� �������� �� ������� ���������') then
        local Nicks = text:match('����� (.+) �������� �������� �� ������� ���������. ����� ��������� � ��������.')
		kater = kater + 1
	end
   	if text:find('�������� �������� �� ������') then
        local Nicks = text:match('����� (.+) �������� �������� �� ������. ����� ��������� � ��������.')
		gun = gun + 1
	end
   	if text:find('�������� �������� �� ������') then
        local Nicks = text:match('����� (.+) �������� �������� �� �������� �������. ����� ��������� � ��������.')
		biznes = biznes + 1
	end
	if text:find('�� ������� (.+) �� �����������. �������: (.+)') then
        local un1, un2 = text:match('�� ������� (.+) �� �����������. �������: (.+)')
		lua_thread.create(function()
		wait(3000)
		if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: %s - ������(�) �� ������� "%s".', cfg.main.tag, un1:gsub('_', ' '), un2))
        else
		sampSendChat(string.format('/r %s - ������(�) �� ������� "%s".', un1:gsub('_', ' '), un2))
		end
		end)
    end
	if text:find('�������(- �) ������������� (.+)') then
        local inv1, inv2 = text:match('�������(- �) ������������� (.+)')
		lua_thread.create(function()
		wait(5000)
		if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: ����� ��������� ��������� - %s. ����� ����������.', cfg.main.tag, inv1:gsub('_', ' '), inv2))
        else
		sampSendChat(string.format('/r %s ����� ��������� ��������� - %s. ����� ����������.', inv1:gsub('_', ' '), inv2))
		end
		end)
    end
	if color == -8224086 then
        local colors = ("{%06X}"):format(bit.rshift(color, 8))
        table.insert(departament, os.date(colors.."[%H:%M:%S] ") .. text)
    end
	if statusc then
		if text:match('ID: .+ | .+: .+ %- .+') and not fstatus then
			gosmb = true
			local id, nick, rang, stat = text:match('ID: (%d+) | (.+): (.+) %- (.+)')
			local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
		    src_good = ""
            src_bad = ""
			local _, myid = sampGetPlayerIdByCharHandle(playerPed)
			local _, handle = sampGetCharHandleBySampPlayerId(id)
			local myname = sampGetPlayerNickname(myid)
				if doesCharExist(handle) then
					local x, y, z = getCharCoordinates(handle)
					local mx, my, mz = getCharCoordinates(PLAYER_PED)
					local dist = getDistanceBetweenCoords3d(mx, my, mz, x, y, z)
					
					if dist <= 50 then
						src_good = src_good ..sampGetPlayerNickname(id).. ""
					end
					else
						src_bad = src_bad ..sampGetPlayerNickname(id).. ""
			if src_bad ~= myname then
			table.insert(players3, string.format('{'..color..'}%s[%s]{ffffff}\t%s\t%s', src_bad, id, rang, stat))
			return false
		end
		end
		end
		if text:match('�����: %d+ �������') then
			local count = text:match('�����: (%d+) �������')
			gcount = count
			gotovo = true
			return false
		end
		if color == -1 then
			return false
		end
		if color == 647175338 then
			return false
        end
        if text:match('ID: .+ | .+: .+') and not fstatus then
			krimemb = true
			local id, nick, rang = text:match('ID: (%d+) | (.+): (.+)')
			local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
			table.insert(players1, string.format('{'..color..'}%s[%s]{ffffff}\t%s', nick, id, rang))
			return false
        end
    end
    if statusk then
		if text:match('ID: .+ | .+ | .+: .+ %- .+') and not fstatus then
			gosmb = true
			local id, data, nick, rang, stat = text:match('ID: (%d+) | (.+) | (.+): (.+) %- (.+)')
			local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
			local nmrang = rang:match('.+%[(%d+)%]')
            if stat:find('��������') and tonumber(nmrang) < 7 then
                table.insert(vixodid, id)
            end
			table.insert(players2, string.format('{ffffff}%s\t {'..color..'}%s[%s]{ffffff}\t%s\t%s', data, nick, id, rang, stat))
			return false
		end
		if text:match('�����: %d+ �������') then
			local count = text:match('�����: (%d+) �������')
			gcount = count
			gotovo = true
			return false
		end
		if color == -1 then
			return false
		end
		if color == 647175338 then
			return false
        end
        if text:match('ID: .+ | .+: .+') and not fstatus then
			krimemb = true
			local id, nick, rang = text:match('ID: (%d+) | (.+): (.+)')
			local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
			table.insert(players1, string.format('{'..color..'}%s[%s]{ffffff}\t%s', nick, id, rang))
			return false
        end
    end
	if status then
            if text:find("ID: %d+ | .+ | %g+: .+%[%d+%] %- %{......%}.+%{......%}") then
                if not text:find("AFK") then
                    local id, invDate, nickname, sRang, iRang, status = text:match("ID: (%d+) | (.+) | (%g+): (.+)%[(%d+)%] %- %{.+%}(.+)%{.+%}")
                    table.insert(tMembers, Player:new(id, sRang, iRang, status, invDate, false, 0, nickname))
                else
                    local id, invDate, nickname, sRang, iRang, status, sec = text:match("ID: (%d+) | (.+) | (%g+): (.+)%[(%d+)%] %- %{.+%}(.+)%{.+%} | %{.+%}%[AFK%]: (%d+).+")
                    table.insert(tMembers, Player:new(id, sRang, iRang, status, invDate, true, sec, nickname))
                end
                return false
            end
            if text:find("ID: %d+ | .+ | %g+: .+%[%d+%]") then
                if not text:find("AFK") then
                    local id, invDate, nickname, sRang, iRang = text:match("ID: (%d+) | (.+) | (%g+): (.+)%[(%d+)%]")
                    table.insert(tMembers, Player:new(id, sRang, iRang, "����������", invDate, false, 0, nickname))
                else
                    local id, invDate, nickname, sRang, iRang, sec = text:match("ID: (%d+) | (.+) | (%g+): (.+)%[(%d+)%] | %{.+%}%[AFK%]: (%d+).+")
                    table.insert(tMembers, Player:new(id, sRang, iRang, "����������", invDate, true, sec, nickname))
                end
                return false
            end
            if text:match('�����: %d+ �������') then
                gotovo = true
                return false
            end
            if color == -1 then
                return false
            end
            if color == 647175338 then
                return false
            end
        end
end