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
local imgui = require 'imgui' -- загружаем библиотеку
local encoding = require 'encoding' -- загружаем библиотеку
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
encoding.default = 'CP1251' -- указываем кодировку по умолчанию, она должна совпадать с кодировкой файла. CP1251 - это Windows-1251
u8 = encoding.UTF8
require 'lib.sampfuncs'
seshsps = 1
ctag = "Inst Tools {ffffff}|"
players1 = {'{ffffff}Ник\t{ffffff}Ранг'}
players2 = {'{ffffff}Дата принятия\t{ffffff}Ник\t{ffffff}Ранг\t{ffffff}Статус'}
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
        desc = 'Открыть меню скрипта',
        use = '/it'
    },
    {
        cmd = '/vig',
        desc = 'Выдать выговор по рации',
        use = '/vig [id] [Причина]'
    },
    {
        cmd = '/unvig',
        desc = 'Снять выговор по рации',
        use = '/unvig [id] [Причина]'
    },
    {
        cmd = '/dmb',
        desc = 'Открыть /members в диалоге',
        use = '/dmb'
    },
    {
        cmd = '/where',
        desc = 'Запросить местоположение по рации',
        use = '/where [id]'
    },
	{
        cmd = '/timegov',
        desc = 'Занимает гос.волну на определённое время',
        use = '/timegov [Время]'
    },
    {
        cmd = '/dlog',
        desc = 'Открыть лог 25 последних сообщений в департамент',
        use = '/dlog'
    },
    {
        cmd = '/sethud',
        desc = 'Установить позицию инфо-бара',
        use = '/sethud'
    },
    {
        cmd = '/cchat',
        desc = 'Очищает чат',
        use = '/cchat'
    },
    {
        cmd = '/blag',
        desc = 'Выразить игроку благодарность в департамент',
        use = '/blag [id] [Фракция] [Причина]'
    },
    {
        cmd = '/nick',
        desc = 'Копирует ник игрока по его id. Параметр 0 копирует РПник, 1 копирует НОНрп ник',
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
    tar = 'Стажер',
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
    ftext("Inst Tools успешно загрузился. Введите: /it для открытия меню скрипта", -1)
    ftext("Вы используете версию скрипта - "..test_version)
  end
  if not doesDirectoryExist('moonloader/lib/imcustom') then createDirectory('moonloader/lib/imcustom') end
  for k, v in pairs(libs) do
        if not doesFileExist('moonloader/lib/'..v) then
            downloadUrlToFile('https://raw.githubusercontent.com/WhackerH/kirya/master/lib/'..v, getWorkingDirectory()..'\\lib\\'..v)
            print('Загружается библиотека '..v)
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
  local frakc = proverkk:match('.+Организация%s+(.+)%s+Должность')
  local rang = proverkk:match('.+Должность%s+%d+ %((.+)%)%s+Работа')
  local telephone = proverkk:match('.+Телефон%s+(.+)%s+Законопослушность')
  rank = rang
  frac = frakc
  tel = telephone
  sampCloseCurrentDialogWithButton(1)
  print(frakc)
  print(rang)
  print(telephone)
  update()
  sampCreate3dTextEx(641, '{ffffff}Место для продажи лицензий', 4294927974, 2346.1362,1666.7819,3040.9387, 3, true, -1, -1)
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
                print("Ошибка подключения к серверу")
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
    submenus_show(fastmenu(id), "{139BEC}Inst Tools {ffffff}| Быстрое меню")
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
                submenus_show(pkmmenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] {ffffff}Уровень - "..sampGetPlayerScore(id).." ")
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

        if sampGetGamestate() ~= 3 and vars.isWorking == true then -- Вдруг заработает когда то
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
    local t = 'Гражданский'
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
        if skin == 57 or skin == 98 or skin == 147 or skin == 150 or skin == 187 or skin == 216 then t = 'Мэрия' end
        if skin == 59 or skin == 172 or skin == 189 or skin == 240 then t = 'Автошкола' end
        if skin == 201 or skin == 247 or skin == 248 or skin == 254 or skin == 248 or skin == 298 then t = 'Байкеры' end
        if skin == 272 or skin == 112 or skin == 125 or skin == 214 or skin == 111  or skin == 126 then t = 'Русская мафия' end
        if skin == 113 or skin == 124 or skin == 214 or skin == 223 then t = 'La Cosa Nostra' end
        if skin == 120 or skin == 123 or skin == 169 or skin == 186 then t = 'Yakuza' end
        if skin == 211 or skin == 217 or skin == 250 or skin == 261 then t = 'News' end
        if skin == 70 or skin == 219 or skin == 274 or skin == 275 or skin == 276 or skin == 308 or skin == 148 then t = 'Медики' end
        if skin == 286 or skin == 141 or skin == 163 or skin == 164 or skin == 165 or skin == 166 then t = 'FBI' end
        if skin == 280 or skin == 265 or skin == 266 or skin == 267 or skin == 281 or skin == 282 or skin == 288 or skin == 284 or skin == 285 or skin == 304 or skin == 305 or skin == 306 or skin == 307 or skin == 309 or skin == 283 or skin == 303 then t = 'Полиция' end
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
        sampSendChat(string.format("/d %s, благодарю %s за %s. Цените!", frack, rpname, pric))
    else
        ftext("Введите: /blag [ID] [Фракция] [Причина]", -1)
        ftext("Причина должна состоять без приставок 'за и тд', например 'транспортировку, спасение жизни'")
        ftext("Чтобы не было вопросов к Вам в конце пытайтесь ставить букву 'У' в некоторых словах.")
		ftext("Выглядеть это будет так - /d Inst, благодарю "..myname:gsub('_', ' ').." за транспортировку. Цените! ", -1)
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
		players3 = {'{ffffff}Ник\t{ffffff}Ранг\t{ffffff}Статус'}
		sampSendChat('/members')
		while not gotovo do wait(0) end
		if gosmb then
			sampShowDialog(716, "{139BEC}Inst Tools {ffffff}| {ae433d}Сотрудники вне офиса {ffffff}| Time: "..os.date("%H:%M:%S"), table.concat(players3, "\n"), "x", _, 5) -- Показываем информацию.
		end
		gosmb = false
		krimemb = false
		gotovo = false
		statusc = false
	end)
end

local russian_characters = {
    [168] = 'Ё', [184] = 'ё', [192] = 'А', [193] = 'Б', [194] = 'В', [195] = 'Г', [196] = 'Д', [197] = 'Е', [198] = 'Ж', [199] = 'З', [200] = 'И', [201] = 'Й', [202] = 'К', [203] = 'Л', [204] = 'М', [205] = 'Н', [206] = 'О', [207] = 'П', [208] = 'Р', [209] = 'С', [210] = 'Т', [211] = 'У', [212] = 'Ф', [213] = 'Х', [214] = 'Ц', [215] = 'Ч', [216] = 'Ш', [217] = 'Щ', [218] = 'Ъ', [219] = 'Ы', [220] = 'Ь', [221] = 'Э', [222] = 'Ю', [223] = 'Я', [224] = 'а', [225] = 'б', [226] = 'в', [227] = 'г', [228] = 'д', [229] = 'е', [230] = 'ж', [231] = 'з', [232] = 'и', [233] = 'й', [234] = 'к', [235] = 'л', [236] = 'м', [237] = 'н', [238] = 'о', [239] = 'п', [240] = 'р', [241] = 'с', [242] = 'т', [243] = 'у', [244] = 'ф', [245] = 'х', [246] = 'ц', [247] = 'ч', [248] = 'ш', [249] = 'щ', [250] = 'ъ', [251] = 'ы', [252] = 'ь', [253] = 'э', [254] = 'ю', [255] = 'я',
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
if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or  rank == 'Директор' or  rank == 'Управляющий' then
  if id == nil then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| Введите: /vig [id] [причина]", -1)
  end
  if id ~=nil and not sampIsPlayerConnected(id) then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| Игрок с ID: "..id.." не подключен к серверу.", -1)
  end
  if id ~= nil and sampIsPlayerConnected(id) then
      if pric == nil then
        sampAddChatMessage("{139BEC}Inst Tools {ffffff}| /vig [id] [причина]", -1)
      end
      if pric ~= nil then
	   if cfg.main.aTag then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/r [%s]: %s - Получает выговор по причине: %s.", cfg.main.tag, rpname, pric))
		else 
		name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
		sampSendChat(string.format("/r %s - Получает выговор по причине: %s.", rpname, pric))
      end
  end
end
end
end

function unvig(pam)
  local id, pric = string.match(pam, '(%d+)%s+(.+)')
  if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or  rank == 'Директор' or  rank == 'Управляющий' then
  if id == nil then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| Введите: /unvig ID Причина", -1)
  end
  if id ~=nil and not sampIsPlayerConnected(id) then
    sampAddChatMessage("{139BEC}Inst Tools {ffffff}| Игрок с ID: "..id.." не подключен к серверу.", -1)
  end
  if id ~= nil and sampIsPlayerConnected(id) then
      if pric == nil then
        sampAddChatMessage("{139BEC}Inst Tools {ffffff}| Введите: /unvig [id] [причина]", -1)
      end
      if pric ~= nil then
	   if cfg.main.aTag then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/r [%s]: %s - Получает cнятие выговора по причине: %s.", cfg.main.tag, rpname, pric))
		else 
		name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
		sampSendChat(string.format("/r %s - Получает cнятие выговора по причине: %s.", rpname, pric))
      end
  end
end
end
end

function where(params) -- запрос местоположения
   if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or  rank == 'Директор' or  rank == 'Управляющий' then
	if params:match("^%d+") then
		params = tonumber(params:match("^(%d+)"))
		if sampIsPlayerConnected(params) then
			local name = string.gsub(sampGetPlayerNickname(params), "_", " ")
			 if cfg.main.aTag then
			    sampSendChat(string.format("/r [%s]: %s, доложите свое местоположение. На ответ 20 секунд.", cfg.main.tag, name))
			else
			sampSendChat(string.format("/r %s, доложите свое местоположение. На ответ 20 секунд.", name))
			end
			else
			ftext('{FFFFFF} Игрок с данным ID не подключен к серверу или указан ваш ID.', 0x046D63)
		end
		else
		ftext('{FFFFFF} Используйте: /where [ID].', 0x046D63)
		end
		else
		ftext('{FFFFFF}Данная команда доступна с 7 ранга.', 0x046D63)
	end
end

function getrang(rangg)
local ranks = 
        {
		['1'] = 'Стажёра',
		['2'] = 'Консультанта',
		['3'] = 'Экзаменатора',
		['4'] = 'Мл.Инструктора',
		['5'] = 'Инструктора',
		['6'] = 'Координатора',
		['7'] = 'Мл.Менеджера',
		['8'] = 'Ст.Менеджера',
		['9'] = 'Директора'
		}
	return ranks[rangg]
end

function giverank(pam)
    lua_thread.create(function()
    local id, rangg, plus = pam:match('(%d+) (%d+)%s+(.+)')
	if sampIsPlayerConnected(id) then
	  if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
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
				sampSendChat('/me снял старый бейджик с человека напротив стоящего')
				wait(1500)
				sampSendChat('/me убрал старый бейджик в карман')
				wait(1500)
                sampSendChat(string.format('/me достал новый бейджик %s', ranks))
				wait(1500)
				sampSendChat('/me закрепил на рубашку человеку напротив новый бейджик')
				wait(1500)
				else
				sampSendChat('/me сняла старый бейджик с человека напротив стоящего')
				wait(1500)
				sampSendChat('/me убрала старый бейджик в карман')
				wait(1500)
                sampSendChat(string.format('/me достала новый бейджик %s', ranks))
				wait(1500)
				sampSendChat('/me закрепила на рубашку человеку напротив новый бейджик')
				wait(1500)
				end
				end
				end
				sampSendChat(string.format('/giverank %s %s', id, rangg))
				wait(1500)
				if cfg.main.aTag then
                sampSendChat(string.format('/r [%s]: '..sampGetPlayerNickname(id):gsub('_', ' ')..' - %s в должности до %s%s.', cfg.main.tag, plus == '+' and 'Повышен(а)' or 'Понижен(а)', ranks, plus == '+' and ', поздравляю' or ''))
                else
				sampSendChat(string.format('/r '..sampGetPlayerNickname(id):gsub('_', ' ')..' - %s в должности до %s%s.', plus == '+' and 'Повышен(а)' or 'Понижен(а)', ranks, plus == '+' and ', поздравляю' or ''))
            end
			else 
			ftext('Вы ввели неверный тип [+/-]')
		end
		else 
			ftext('Введите: /giverank [id] [ранг] [+/-]')
		end
		else 
			ftext('Данная команда доступна с 7 ранга')
	  end
	  else 
			ftext('Игрок с данным ID не подключен к серверу или указан ваш ID')
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
	  if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
        if id then
		if sampIsPlayerConnected(id) then
                sampSendChat('/me достал(а) бейджик и передал(а) его '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
				wait(1500)
				sampSendChat(string.format('/invite %s', id))
			else 
			ftext('Игрок с данным ID не подключен к серверу или указан ваш ID')
		end
		else 
			ftext('Введите: /invite [id]')
		end
		else 
			ftext('Данная команда доступна с 9 ранга')
	  end
   end)
 end
 
 function zgov(pam)
    if #pam > 0 then
        local myid = select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))
        sampSendChat("/d OG, гос. волна на "..pam.." занята за Инструкторами.")
    else
        ftext("Используйте: /timegov [время]")
    end
end
   
function nick(args)
  if #args == 0 then ftext("Введите: /nick [id] [0 - RP nick, 1 - NonRP nick]") return end
  args = string.split(args, " ")
  if #args == 1 then
    cmd_nick(args[1].." 0")
  elseif #args == 2 then
    local getID = tonumber(args[1])
    if getID == nil then ftext("Неверный ID игрока!") return end
    if not sampIsPlayerConnected(getID) then ftext("Игрок оффлайн!") return end 
    getID = sampGetPlayerNickname(getID)
    if tonumber(args[2]) == 1 then
      ftext("Ник \""..getID.."\" успешно скопирован в буфер обмена.")
    else
      getID = string.gsub(getID, "_", " ")
      ftext("РП Ник \""..getID.."\" успешно скопирован в буфер обмена.")
    end
    setClipboardText(getID)
  else
    ftext("Введите: /nick [id] [0 - RP nick, 1 - NonRP nick]")
    return
  end 
end
 
 function uninvite(pam)
    lua_thread.create(function()
        local id, pri4ina = pam:match('(%d+)%s+(.+)')
	  if rank == "Мл.Менеджер" or rank ==  'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
        if id and pri4ina then
		if sampIsPlayerConnected(id) then
                sampSendChat('/me забрал(а) форму и бейджик у '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
				wait(2000)
				sampSendChat(string.format('/uninvite %s %s', id, pri4ina))
			else 
			ftext('Игрок с данным ID не подключен к серверу или указан ваш ID')
		end
		else 
			ftext('Введите: /uninvite [id] [причина]')
		end
		else 
			ftext('Данная команда доступна с 7 ранга')
	  end
   end)
 end

function fastmenu(id)
 return
{
   {
   title = "{FFFFFF}Меню отделов",
    onclick = function()
	if cfg.main.aTag then
	submenus_show(otmenu(id), "{139BEC}Inst Tools {ffffff}| Меню отделов")
	else
	ftext('Включите автотег в настройках')
	end
	end
   },
   {
   title = "{FFFFFF}Меню собеседования",
    onclick = function()
	submenus_show(sobes(id), "{139BEC}Inst Tools {ffffff}| Меню собеседования")
	end
   },
   {
   title = "{FFFFFF}Вызвать сотрудника полиции в Автошколу в /d{ff0000} (Для 4+ ранга)",
    onclick = function()
	if rank == 'Мл.Инструктор' or rank == 'Инструктор' or rank == 'Координатор' or rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
	sampSendChat(string.format('/d SFPD, пришлите сотрудника в Автошколу, спасибо!'))
	else
	ftext('Ваш ранг недостаточно высок')
	end
	end
   },
   {
   title = "{FFFFFF}Доставка лицензий в любую точку штата в /d{ff0000} (Для 4+ ранга)",
    onclick = function()
	if rank == 'Мл.Инструктор' or rank == 'Инструктор' or rank == 'Координатор' or rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
	sampSendChat(string.format('/d OG, Осуществляется доставка лицензий в любую точку штата. Тел: %s.', tel))
	else
	ftext('Ваш ранг недостаточно высок')
	end
	end
   },
   {
   title = "{FFFFFF}Список сотрудников находящихся не в офисе",
    onclick = function()
	pX, pY, pZ = getCharCoordinates(playerPed)
	if getDistanceBetweenCoords3d(pX, pY, pZ, 2351.8020, 1660.9800, 3041.0605) < 50 then
	dmch()
	else
	ftext('Вы должны находиться в офисе')
	end
	end
   },
   {
   title = "{FFFFFF}Доложить в рацию о доставке лицензии {ff0000}(обязательно при доставке)",
    onclick = function()
    if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: Выехал(а) на доставку лицензий.', cfg.main.tag))
        else
        sampSendChat(string.format('/r Выехал(а) на доставку лицензий.'))
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
        title = '{ffffff}» Приветствие и паспорт.',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("Приветствую, покажите пожалуйста свой паспорт, и мед.карту")
        wait(1500)
        sampSendChat("/b /showpass "..myid..", /me передал(а) мед.карту человеку напротив") 
		end
      },
      {
        title = '{ffffff}» Просмотр паспорта и мед.карты',
        onclick = function()
        sampSendChat("/me взял(а) паспорт в руки и мед.карту, после начал(а) вниматель осматривать")
        wait(4000)
        sampSendChat("/do Паспорт и мед.карта в руке.")
		end
      },
      {
        title = '{ffffff}» Информация о себе',
        onclick = function()
        local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("Хорошо, расскажите о себе пожалуйста.")
        end
      },
      {
        title = '{ffffff}» Прошлое место работы',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("Хорошо, раньше где-нибудь работали? Если да, скажите где, если не сложно.")
		end
      },
      {
        title = '{ffffff}» Опыт в сфере Автошколы',
        onclick = function()
        sampSendChat("Хорошо, имели раньше опыт в такой сфере как автошкола?")
		end
      },
      {
        title = '{ffffff}» Добро в Автошколу',
        onclick = function()
        sampSendChat("Хорошо, и я думаю...")
        wait(4000)
        sampSendChat("Вы нам подходите! Сейчас вам выдадут форму и бейджик.")
		end
      },
      {
        title = '{ffffff}» Отказ в Автошколу',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("Хорошо, и я думаю...")
        wait(4000)
        sampSendChat("К сожалению, Вы нам не подходите!")
		end
      }            
    }
end

function otmenu(id)
 return
{
  {
   title = "{FFFFFF}Пиар отдела в рацию (ОДУ) {ff0000}(Для глав/замов отдела)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: Уважаемые сотрудники, минуточку внимания.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: В Отдел Дополнительных Услуг производится пополнение сотрудников.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Вступить в отдел можно с должности "Мл.Инструктор".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Для подробной информации пишите на п.'..myid..'.', cfg.main.tag))
	end
   },
    {
   title = "{FFFFFF}Пиар отдела в рацию (ИТО) {ff0000}(Для глав/замов отдела)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: Уважаемые сотрудники, минуточку внимания.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: В Инспекционно - Технический отдел производится пополнение сотрудников.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Вступить в отдел можно с должности "Экзаменатор".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Для подробной информации пишите на п.'..myid..'.', cfg.main.tag))
	end
   },
   {
   title = "{FFFFFF}Пиар отдела в рацию (OOC) {ff0000}(Для глав/замов отдела)",
    onclick = function()
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	sampSendChat(string.format('/r [%s]: Уважаемые сотрудники, минуточку внимания.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: В Отдел Обучения Сотрудников производится пополнение сотрудников.', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Вступить в отдел можно с должности "Стажёр".', cfg.main.tag))
    wait(5000)
    sampSendChat(string.format('/r [%s]: Для подробной информации пишите на п.'..myid..'.', cfg.main.tag))
	end
   },
   {
   title = "{FFFFFF}Тех.осмотр авто гос.организаций",
    onclick = function()
	if cfg.main.male == true then
	sampSendChat("/me записал данные о проверяемой гос.организации")
    wait(3500)
    sampSendChat("/me начал осматривать внешнее состояние автомобиля")
    wait(3500)
    sampSendChat("/me открыл капот")
    wait(3500)
    sampSendChat("/do Капот открыт.")
	wait(3500)
	sampSendChat("/me достал с чемодана для инструментов фонарик и начал осматривать двигатель")
	wait(3500)
	sampSendChat("/try двигатель в норме")
	wait(3500)
	sampSendChat("/me начал проверять давление в шинах.")
	wait(3500)
	sampSendChat("/try давление в норме")
	wait(3500)
	sampSendChat("/me проверяет автомобиль на наличие повреждений")
	wait(3500)
	sampSendChat("/try повреждения не обнаружены")
	wait(3500)
	sampSendChat("/me достал блокнот с ручкой, после чего записал все результаты проверки")
	wait(3500)
	sampSendChat("/me поставил подпись и закрыл блокнот")
	wait(1200)
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
	end
	if cfg.main.male == false then
	sampSendChat("/me записала данные о проверяемой гос.организации")
    wait(3500)
    sampSendChat("/me начала осматривать внешнее состояние автомобиля")
    wait(3500)
    sampSendChat("/me открыла капот")
    wait(3500)
    sampSendChat("/do Капот открыт.")
	wait(3500)
	sampSendChat("/me достала с чемодана для инструментов фонарик и начала осматривать двигатель")
	wait(3500)
	sampSendChat("/try двигатель в норме")
	wait(3500)
	sampSendChat("/me начала проверять давление в шинах.")
	wait(3500)
	sampSendChat("/try давление в норме")
	wait(3500)
	sampSendChat("/me проверяет автомобиль на наличие повреждений")
	wait(3500)
	sampSendChat("/try повреждения не обнаружены")
	wait(3500)
	sampSendChat("/me достала блокнот с ручкой, после чего записала все результаты проверки")
	wait(3500)
	sampSendChat("/me поставила подпись и закрыла блокнот")
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
		ftext("Вы ранее не получали входящих сообщений.", 0x046D63)
	end
end

do

function imgui.OnDrawFrame()
   if first_window.v then
	imgui.SetNextWindowSize(imgui.ImVec2(1161, 436), imgui.Cond.FirstUseEver)
	local screenx, screeny = getScreenResolution()
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            
            imgui.Begin(u8 "Inst Tools | Настройки", first_window, imgui.WindowFlags.NoResize)

            imgui.BeginChild('##set', imgui.ImVec2(140, 400), true)
            if imgui.Selectable(u8 "Основные", vars.settingsVars.show == 1) then vars.settingsVars.show = 1 end
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
			 
			 if imgui.Checkbox(u8 "Автоклист", clistB) then cfg.main.clistB = clistB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
			 imgui.SameLine()
             imgui.TextQuestion(u8 "Ставит выбранный клист каждый раз, когда вы умираете или когда надеваете форму")
                if clistB.v then
                    if imgui.SliderInt(u8 "Введите номер клиста", clist, 0, 33) then cfg.main.clist = clist.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                end
				
				if imgui.Checkbox(u8 "Автотег", tagB) then cfg.main.aTag = tagB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "Скрипт сразу пишет ваш тег в рацию, который Вы написали в скрипт")
                if tagB.v then
                    if imgui.InputText(u8 "Введите ваш тег", tag) then cfg.main.tag = u8:decode(tag.v) bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                end
				
				if imgui.Checkbox(u8 "Автологин", autopassB) then cfg.main.autoPass = autopassB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "Возможность заходить на сервер без окна для ввода пароля")
                if autopassB.v then
                    if imgui.InputText(u8 "Введите пароль", passB, imgui.InputTextFlags.Password) then cfg.main.pass = u8:decode(passB.v) bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
                    if imgui.Button(u8'Узнать пароль') then ftext('Ваш пароль: {eb6b56}'..cfg.main.pass) end	
                end
				
				if imgui.Checkbox(u8 "Открывать чат на T", chat_tB) then cfg.main.chat_t = chat_tB.v bimaindustries.saveCfg(cfg, "moonloader/instools/config.json") end
				imgui.SameLine()
                imgui.TextQuestion(u8 "Вы сможете открывать чат на букву Т на английской раскладке так и на русской")
				
				 if imgui.Checkbox(u8 'Автоматически заводить авто', carb) then cfg.main.autocar = carb.v saveData(cfg, 'moonloader/instools/config.json') end
				 imgui.SameLine()
                imgui.TextQuestion(u8 "Заводит машину без вашего нажатия на клавишу \"2\"")
				
				if imgui.Checkbox(u8 'Мужские отыгровки', stateb) then cfg.main.male = stateb.v saveData(cfg, 'moonloader/instools/config.json') end
				 imgui.SameLine()
                imgui.TextQuestion(u8 "Заводит машину без вашего нажатия на клавишу \"2\"")
				
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
	if imgui.Button(u8'Биндер', btn_size) then
                bMainWindow.v = not bMainWindow.v
            end
	if imgui.Button(u8"Государственная волна", btn_size) then windows.gov.v = not windows.gov.v end
    if imgui.Button(u8" Лекции", btn_size) then windows.lectures.v = not windows.lectures.v end
	if imgui.Button(u8" Шпаргалка", btn_size) then windows.shpori.v = not windows.shpori.v end
            if imgui.Button(u8'Команды скрипта', btn_size) then
      helps.v = not helps.v
    end
    if imgui.Button(u8'Настройки скрипта', btn_size) then
                first_window.v = not first_window.v
            end
    if imgui.Button(u8 'Сообщить об ошибке/идеи', btn_size) then os.execute('explorer "https://vk.me/umbrellakonstrukt"')
    btn_size = not btn_size
    end
	if imgui.CollapsingHeader(u8" Действия со скриптом") then
            if imgui.Button(u8" Перезагрузить скрипт", btn_size) then showCursor(false) thisScript():reload() end
            if imgui.Button(u8" Отключить скрипт", btn_size) then imgui.OpenPopup(u8 "Inst Tools | Выключение") end
            if imgui.BeginPopupModal(u8 "Inst Tools | Выключение", _, imgui.WindowFlags.NoResize) then
                local size = imgui.ImVec2(230, 25)

                imgui.CentrText(u8 "Вы действительно хотите отключить скрипт?")
                imgui.CentrText(doesFileExist("moonloader/reload_all.lua") and u8 "Чтобы вернуть работоспособность скрипта нажмите потом \"CTRL + R\"" or u8 "Скрипт будет не доступен до перезапуска игры.")

                imgui.Spacing()

                if imgui.Button(u8 "Выключить", size) then
                    showCursor(false)
                    imgui.CloseCurrentPopup()
                    thisScript():unload()
                end

                imgui.SameLine()

                if imgui.Button(u8 "Отмена##выключение", size) then
                    imgui.CloseCurrentPopup()
                end

                imgui.EndPopup()
            end
        end
				if vars.webData.isOnline then
            imgui.Separator()
            if imgui.Button(u8 " Просмотр недельного онлайна", btn_size) then windows.myOnline.v = not windows.myOnline.v end
	end
	imgui.End()
	end
        if windows.myOnline.v then
            local spacing = 165.0
			local screenx, screeny = getScreenResolution()

            imgui.SetNextWindowSize(imgui.ImVec2(285, 150), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Inst Tools | Мой недельный онлайн", windows.myOnline, imgui.WindowFlags.NoResize)
            
            imgui.Text(u8 "Ник:") imgui.SameLine(spacing) imgui.Text(tostring(sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))))
            imgui.Text(u8 "Статус: ") imgui.SameLine(spacing) imgui.Text(vars.isWorking and u8"На работе" or u8"Выходной")
            imgui.Separator()
            imgui.Text(u8 "Онлайн за день:") imgui.SameLine(spacing) imgui.Text(secToTime(online.dayOnline))
            imgui.Text(u8 "Онлайн за неделю:") imgui.SameLine(spacing) imgui.Text(secToTime(online.weekOnline))
            imgui.Separator()
            imgui.Text(u8 "AFK за день:") imgui.SameLine(spacing) imgui.Text(secToTime(online.dayAFK))
            imgui.Text(u8 "AFK за неделю:") imgui.SameLine(spacing) imgui.Text(secToTime(online.weekAFK))

            imgui.End()
        end
  if helps.v then
                local x, y = getScreenResolution()
                imgui.SetNextWindowSize(imgui.ImVec2(500, 500), imgui.Cond.FirstUseEver)
                imgui.SetNextWindowPos(imgui.ImVec2(x/2, y/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
                imgui.Begin(u8'Inst Tools | Команды', helps, second_window, mainw,  imgui.WindowFlags.NoResize)
                for k, v in ipairs(help) do
                    if imgui.CollapsingHeader(v['cmd']..'##'..k) then
                        imgui.TextWrapped(u8('Описание: %s'):format(u8(v['desc'])))
                        imgui.TextWrapped(u8("Использование: %s"):format(u8(v['use'])))
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
            imgui.Begin(u8('Inst Tools | Список сотрудников [Всего: %s]'):format(#tMembers), memw)
            imgui.BeginChild('##1', imgui.ImVec2(670, 300))
            imgui.Columns(5, _)
            imgui.SetColumnWidth(-1, 180) imgui.Text(u8 'Ник игрока'); imgui.NextColumn()
            imgui.SetColumnWidth(-1, 190) imgui.Text(u8 'Должность');  imgui.NextColumn()
            imgui.SetColumnWidth(-1, 80) imgui.Text(u8 'Статус') imgui.NextColumn()
            imgui.SetColumnWidth(-1, 120) imgui.Text(u8 'Дата приема') imgui.NextColumn() 
            imgui.SetColumnWidth(-1, 70) imgui.Text(u8 'AFK') imgui.NextColumn() 
            imgui.Separator()
            for _, v in ipairs(tMembers) do
                imgui.TextColored(imgui.ImVec4(getColor(v.id)), u8('%s[%s]'):format(v.nickname, v.id))
                if imgui.IsItemHovered() then
                    imgui.BeginTooltip();
                    imgui.PushTextWrapPos(450.0);
                    imgui.TextColored(imgui.ImVec4(getColor(v.id)), u8("%s\nУровень: %s"):format(v.nickname, sampGetPlayerScore(v.id)))
                    imgui.PopTextWrapPos();
                    imgui.EndTooltip();
                end
                imgui.NextColumn()
                imgui.Text(('%s [%s]'):format(v.sRang, v.iRang))
                imgui.NextColumn()
                if v.status ~= u8("На работе") then
                    imgui.TextColored(imgui.ImVec4(0.80, 0.00, 0.00, 1.00), v.status);
                else
                    imgui.TextColored(imgui.ImVec4(0.00, 0.80, 0.00, 1.00), v.status);
                end
                imgui.NextColumn()
                imgui.Text(v.invite)
                imgui.NextColumn()
                if v.sec ~= 0 then
                    if v.sec < 360 then 
                        imgui.TextColored(getColorForSeconds(v.sec), tostring(v.sec .. u8(' сек.')));
                    else          
                        imgui.TextColored(getColorForSeconds(v.sec), tostring("360+" .. u8(' сек.')));
                    end
                else
                    imgui.TextColored(imgui.ImVec4(0.00, 0.80, 0.00, 1.00), u8("Нет"));
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
                imgui.Begin('Продано лицензий', infbar, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar) 
                imgui.CentrText(u8'Продано лицензий за сеанс:') 
                imgui.Separator()
                imgui.Text(u8 'Продано водительских прав:') imgui.SameLine() imgui.Text(u8 ''..prava..'')
				imgui.Text(u8 'Продано лицензий пилота:') imgui.SameLine() imgui.Text(u8 ''..pilot..'')
				imgui.Text(u8 'Продано лицензий на катера:') imgui.SameLine() imgui.Text(u8 ''..kater..'')
				imgui.Text(u8 'Продано лицензий рыболова:') imgui.SameLine() imgui.Text(u8 ''..ribolov..'')
				imgui.Text(u8 'Продано лицензий на оружие:') imgui.SameLine() imgui.Text(u8 ''..gun..'')
				imgui.Text(u8 'Продано лицензий на бизнес:') imgui.SameLine() imgui.Text(u8 ''..biznes..'')
                imgui.End()
    end
	if windows.online.v then
	local screenx, screeny = getScreenResolution()

        imgui.SetNextWindowPos(imgui.ImVec2(screenx / 2, screeny / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(500, 280), imgui.Cond.FirstUseEver)

        imgui.Begin(u8 'Inst Tools | Онлайн сотрудников', windows.online, imgui.WindowFlags.NoResize)
        imgui.Columns(5, _)
        imgui.SetColumnWidth(-1, 170) imgui.Text(u8 'Ник игрока'); imgui.NextColumn()
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
            imgui.Begin(u8 "Ints Tools | Государственная волна", windows.gov, imgui.WindowFlags.NoResize)
            for k, v in pairs(govs) do
                if imgui.Button(u8(("%s##%sговки нахуй"):format(v.name, k)), btn_size) then 
                    imgui.OpenPopup("что делать с этой хуйней##говки"..k)
                end
                if imgui.BeginPopup("что делать с этой хуйней##говки"..k) then
                    if imgui.Button(u8 "Запустить##"..k, imgui.ImVec2(95, 20)) then
                        imgui.OpenPopup(u8 "Запустить говку?##"..k)
                        --imgui.CloseCurrentPopup()
                    end
                    if imgui.BeginPopupModal(u8 "Запустить говку?##"..k, _, imgui.WindowFlags.NoResize) then
                        imgui.CentrText(u8 "Вы точно хотите запустить говку?")

                        local size = imgui.ImVec2(150, 25)

                        if imgui.Button(u8 "Запустить##запускговки"..k, size) then
                            lua_thread.create(function()
                                for line in v.text:gmatch('[^\r\n]+') do
                                    sampSendChat("/gov " .. line)
                                    wait(v.wait)
                                end
                            end)
                            imgui.CloseCurrentPopup()
                        end

                        imgui.SameLine()

                        if imgui.Button(u8 "Отмена##запускговки", size) then
                            imgui.CloseCurrentPopup()
                        end
                        
                        imgui.EndPopup()
                    end
                    if imgui.Button(u8 "Редактировать##"..k, imgui.ImVec2(95, 20)) then
                        govsVars.name.v = u8(v.name)
                        govsVars.text.v = u8(v.text)
                        govsVars.wait.v = v.wait
                        imgui.OpenPopup(u8 "Ints Tools | Редактирование говки##говки"..k)
                    end
                    if imgui.BeginPopupModal(u8 "Ints Tools | Редактирование говки##говки"..k, _, imgui.WindowFlags.NoResize) then

                        imgui.Text(u8 "Введите название говки:")
                        imgui.InputText("##Введите название говки", govsVars.name)
                        imgui.Text(u8 "Введите задержку между строками:")
                        imgui.InputInt("##Введите задержку между строками", govsVars.wait)
                        imgui.Text(u8 "Введите текст говки:")
                        imgui.Text(u8 "[!] /gov в начале строки писать НЕ НУЖНО, скрипт вставит это АВТОМАТИЧЕСКИ [!]")
                        imgui.InputTextMultiline("##Введите текст говки", govsVars.text, imgui.ImVec2(700, 200))
    
                        local size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20)
                        if imgui.Button(u8 "Сохранить##говки", size) then
                            govs[k].name = u8:decode(govsVars.name.v)
                            govs[k].text = u8:decode(govsVars.text.v)
                            govs[k].wait = govsVars.wait.v
                            bimaindustries.saveCfg(govs, "moonloader/instools/govs.json")
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "Отмена##говки", size) then
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "Удалить##говки", size) then
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
            if imgui.Button(u8 "Добавить говку", btn_size) then
                govsVars.name.v = ""
                govsVars.text.v = ""
                govsVars.wait.v = 5000
                imgui.OpenPopup(u8 "Добавить говку")
            end
            if imgui.BeginPopupModal(u8 "Добавить говку", _, imgui.WindowFlags.NoResize) then

                imgui.Text(u8 "Введите название говки:")
                imgui.InputText("##Введите название говки", govsVars.name)
                imgui.Text(u8 "Введите задержку между строками:")
                imgui.InputInt("##Введите задержку между строкамиговка", govsVars.wait)
                imgui.Text(u8 "Введите текст говки:")
                imgui.Text(u8 "[!] /gov в начале строки писать НЕ НУЖНО, скрипт вставит это АВТОМАТИЧЕСКИ [!]")
                imgui.InputTextMultiline("##Введите текст говки", govsVars.text, imgui.ImVec2(700, 200))
                local size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)
                if imgui.Button(u8 "Сохранить##говки", size) then
                    table.insert(govs, {name = u8:decode(govsVars.name.v), text = u8:decode(govsVars.text.v), wait = govsVars.wait.v})
                    bimaindustries.saveCfg(govs, "moonloader/instools/govs.json")
                    imgui.CloseCurrentPopup()
                end
                imgui.SameLine()
                if imgui.Button(u8 "Отмена##говки", size) then
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
            imgui.Begin(u8 "Inst Tools | Лекции", windows.lectures, imgui.WindowFlags.NoResize)
            for k, v in pairs(lectures) do
                if imgui.Button(u8(("%s##%sлекции нахуй"):format(v.name, k)), btn_size) then 
                    imgui.OpenPopup("что делать с этой хуйней##"..k)
                end
                if imgui.BeginPopup("что делать с этой хуйней##"..k) then
                    if imgui.Button(u8 "Запустить##"..k, imgui.ImVec2(95, 20)) then
                        lua_thread.create(function()
                            for line in v.text:gmatch('[^\r\n]+') do
                                sampSendChat(line)
                                wait(v.wait)
                            end
                        end)
                        imgui.CloseCurrentPopup()
                    end
                    if imgui.Button(u8 "Редактировать##"..k, imgui.ImVec2(95, 20)) then
                        lecturesVars.name.v = u8(v.name)
                        lecturesVars.text.v = u8(v.text)
                        lecturesVars.wait.v = v.wait
                        imgui.OpenPopup(u8 "Inst Tools | Редактирование лекции##"..k)
                    end
                    if imgui.BeginPopupModal(u8 "Inst Tools | Редактирование лекции##"..k, _, imgui.WindowFlags.NoResize) then

                        imgui.Text(u8 "Введите название лекции:")
                        imgui.InputText("##Введите название лекции", lecturesVars.name)
                        imgui.Text(u8 "Введите задержку между строками:")
                        imgui.InputInt("##Введите задержку между строками", lecturesVars.wait)
                        imgui.Text(u8 "Введите текст лекции:")
                        imgui.InputTextMultiline("##Введите текст лекции", lecturesVars.text, imgui.ImVec2(700, 200))
    
                        local size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20)
                        if imgui.Button(u8 "Сохранить##лекции", size) then
                            lectures[k].name = u8:decode(lecturesVars.name.v)
                            lectures[k].text = u8:decode(lecturesVars.text.v)
                            lectures[k].wait = lecturesVars.wait.v
                            bimaindustries.saveCfg(lectures, "moonloader/instools/lectures.json")
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "Отмена##лекции", size) then
                            imgui.CloseCurrentPopup()
                        end
                        imgui.SameLine()
                        if imgui.Button(u8 "Удалить##лекции", size) then
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
            if imgui.Button(u8 "Добавить лекцию", btn_size) then
                lecturesVars.name.v = ""
                lecturesVars.text.v = ""
                lecturesVars.wait.v = 1400
                imgui.OpenPopup(u8 "Добавить лекцию")
            end
            if imgui.BeginPopupModal(u8 "Добавить лекцию", _, imgui.WindowFlags.NoResize) then

                imgui.Text(u8 "Введите название лекции:")
                imgui.InputText("##Введите название лекции", lecturesVars.name)
                imgui.Text(u8 "Введите задержку между строками:")
                imgui.InputInt("##Введите задержку между строками", lecturesVars.wait)
                imgui.Text(u8 "Введите текст лекции:")
                imgui.InputTextMultiline("##Введите текст лекции", lecturesVars.text, imgui.ImVec2(700, 200))
                local size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)
                if imgui.Button(u8 "Сохранить##лекции", size) then
                    table.insert(lectures, {name = u8:decode(lecturesVars.name.v), text = u8:decode(lecturesVars.text.v), wait = lecturesVars.wait.v})
                    bimaindustries.saveCfg(lectures, "moonloader/instools/lectures.json")
                    imgui.CloseCurrentPopup()
                end
                imgui.SameLine()
                if imgui.Button(u8 "Отмена##лекции", size) then
                    imgui.CloseCurrentPopup()
                end

                imgui.EndPopup()
            end
            imgui.End()
        end
		if windows.shpori.v then
		    local screenx, screeny = getScreenResolution()
            local shpori = {u8("Не выбрано")}

            imgui.SetNextWindowSize(imgui.ImVec2(800, 500), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowPos(imgui.ImVec2(screenx/2, screeny/2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.Begin(u8 "Inst Tools | Шпаргалка", windows.shpori, imgui.WindowFlags.NoResize)
            for k, v in pairs(shporList) do
                table.insert(shpori, u8(v.name))
            end
            table.insert(shpori, u8("Добавить новую"))
            if imgui.Combo(u8 "Выберите шпаргалку", shporiVars.shpint, shpori) then
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
                    if imgui.Button(u8 "Редактировать") then shporiVars.shpedit.v = true end
                    imgui.Separator()
                    imgui.InputText(u8 "Поиск по шпаргалке", shporiVars.shpsearch)
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
                    imgui.Text(u8 "Введите название шпаргалки")
                    imgui.Spacing()
                    imgui.InputText(u8 "##Введите название шпаргалки", shporiVars.shpname)
                    imgui.NewLine()
                    imgui.Text(u8 "Введите текст шпаргалки")
                    imgui.Spacing()
                    imgui.InputTextMultiline(u8 "##Введите текст шпаргалки", shporiVars.shpbuff, imgui.ImVec2(785, 330))
                    local size
                    if shporiVars.shpint.v == #shpori - 1 then size = imgui.ImVec2(imgui.GetWindowWidth() / 2 - 10, 20)  else size = imgui.ImVec2(imgui.GetWindowWidth() / 3 - 8.3, 20) end
                    if imgui.Button(u8 "Сохранить##шпаргалки", size) then
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
                            ftext("Вы не ввели название шпаргалки")
                        end
                    end
                    imgui.SameLine()
                    if imgui.Button(u8 "Отмена##шпаргалки", size) then
                        shporiVars.shpedit.v = false
                    end
                    if shporiVars.shpint.v ~= #shpori - 1 then
                        imgui.SameLine()
                        if imgui.Button(u8 "Удалить##шпаргалки", size) then                       
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
                imgui.Begin(u8('Inst Tools | Обновление'), updwindows, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
                imgui.Text(u8('Вышло обновление скрипта Inst Tools до версии '..updversion..'. Что бы обновиться нажмите кнопку внизу.'))
                imgui.Separator()
                imgui.BeginChild("uuupdate", imgui.ImVec2(690, 200))
                for line in ttt:gmatch('[^\r\n]+') do
                    imgui.Text(line)
                end
                imgui.EndChild()
                imgui.Separator()
                imgui.PushItemWidth(305)
                if imgui.Button(u8("Обновить"), imgui.ImVec2(339, 25)) then
                    lua_thread.create(goupdate)
                    updwindows.v = false
                end
                imgui.SameLine()
                if imgui.Button(u8("Отложить обновление"), imgui.ImVec2(339, 25)) then
                    updwindows.v = false
                end
                imgui.End()
            end
  if bMainWindow.v then
  local iScreenWidth, iScreenHeight = getScreenResolution()
	local tLastKeys = {}
   
   imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
   imgui.SetNextWindowSize(imgui.ImVec2(800, 530), imgui.Cond.FirstUseEver)

   imgui.Begin(u8("IT | Биндер##main"), bMainWindow, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
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
				imgui.TextDisabled(u8("Пустое сообщение ..."))
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
			imgui.Checkbox(u8("Ввод") .. "##editCH" .. k, bIsEnterEdit)
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

	if imgui.Button(u8"Добавить клавишу") then
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
                if sampGetFraktionBySkin(myid) == "Автошкола" then
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
                    print("Произошла ошибка отправки онлайна")
                    print("Текст ошибки: "..u8:decode(info.error))
                else
                    if info.isNew then
                        online.dayOnline = 5
                        online.weekOnline = 5
                        online.dayAFK = 0
                        online.weekAFK = 0
                        ftext("Недельный онлайн сброшен, начался подсчет новой недели")
                    end
                    if info.newDay then 
                        online.dayOnline = 5
                        online.dayAFK = 0
                    end
                end
            else
                print("Произошла ошибка подключения к серверу")
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
                        ftext("Модерка успешно выдана")
                    else
                        ftext("Произошла ошибка выдачи модерки")
                        ftext("Текст ошибки: "..u8:decode(info.error))
                    end
                else
                    ftext("Ошибка подключения к серверу")
                end
            end)
        else
            ftext("Используйте: /addmoder [nick]")
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
                        ftext("Модерка успешно аннулирована")
                    else
                        ftext("Произошла ошибка аннулирования модерки")
                        ftext("Текст ошибки: "..u8:decode(info.error))
                    end
                else
                    ftext("Ошибка подключения к серверу")
                end
            end)
        else
            ftext("Используйте: /delmoder [nick]")
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
                    ftext("Недельный онлайн успешно сброшен")
                else
                    ftext("Ошибка сброса онлайна")
                    ftext("Текст ошибки: "..u8:decode(info.error))
                end
            else
                ftext("Ошибка подключения к серверу")
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
                        ftext("Счетчик недельного онлайна для игрока успешно включен")
                    else
                        ftext("Произошла ошибка выдачи счетчика недельного онлайна")
                        ftext("Текст ошибки: "..u8:decode(info.error))
                    end
                else
                    ftext("Ошибка подключения к серверу")
                end
            end)
        else
            ftext("Используйте: /addonline [nick]")
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
                        ftext("Счетчик недельного онлайна для игрока успешно выключен")
                    else
                        ftext("Произошла ошибка отключения счетчика недельного онлайна")
                        ftext("Текст ошибки: "..u8:decode(info.error))
                    end
                else
                    ftext("Ошибка подключения к серверу")
                end
            end)
        else
            ftext("Используйте: /delonline [nick]")
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
                    ftext("Произогла ошибка получения онлайна")
                    ftext("Текст ошибки: "..u8:decode(info.error))
                end
            else
                ftext("Ошибка подключения к серверу")
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
    select_button, close_button, back_button = select_button or '»', close_button or 'x', back_button or '«'
    prev_menus = {}
    function display(menu, id, caption)
        local string_list = {}
        for i, v in ipairs(menu) do
            table.insert(string_list, type(v.submenu) == 'table' and v.title .. ' »' or v.title)
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
        ftext('Введите /r [текст]')
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
        title = "{ffffff}» Инструктор",
        onclick = function()
        pID = tonumber(args)
        submenus_show(instmenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
	  {
        title = "{ffffff}» Цены лицензий",
        onclick = function()
        pID = tonumber(args)
	    pX, pY, pZ = getCharCoordinates(playerPed)
	    if sampGetPlayerNickname(Damien_Requeste) or dostavka or rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or rank == 'Управляющий' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(pricemenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('Вы должны находиться за стойкой')
		end
        end
      },
      {
        title = "{ffffff}» Вопросы",
        onclick = function()
        pID = tonumber(args)
		pX, pY, pZ = getCharCoordinates(playerPed)
		if sampGetPlayerNickname(Damien_Requeste) or rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(questimenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('Вы должны находиться за стойкой')
		end
        end
      },
      {
        title = "{ffffff}» Оформление",
        onclick = function()
        pID = tonumber(args)
		pX, pY, pZ = getCharCoordinates(playerPed)
		if sampGetPlayerNickname(Damien_Requeste) or dostavka or rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' or getDistanceBetweenCoords3d(pX, pY, pZ, 2345.4177, 1667.5751, 3040.9524) < 2 or getDistanceBetweenCoords3d(pX, pY, pZ, 357.9535, 173.4858, 1008.3893) < 6 then
        submenus_show(oformenu(id), "{139BEC}Inst Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
		else
	    ftext('Вы должны находиться за стойкой')
        end
		end
      },
	  {
        title = "{ffffff}» Ударить шокером",
        onclick = function()
		if cfg.main.male == true then
        sampSendChat("/me снял шокер с пояса")
        wait(1500)
        sampSendChat("/itazer")
        wait(1500)
        sampSendChat("/me повесил шокер на пояс")
        end
	    if cfg.main.male == false then
        sampSendChat("/me сняла шокер с пояса")
        wait(1500)
        sampSendChat("/itazer")
        wait(1500)
        sampSendChat("/me повесила шокер на пояс")
        end
		end
      }
    }
end

function questimenu(args)
    return
    {
      {
        title = '{5b83c2}« Раздел вопросов по ПДД »',
        onclick = function()
        end
      },
      {
        title = '{ffffff}» Пару вопросов',
        onclick = function()
          sampSendChat("Сейчас я задам вам пару вопросов по ПДД. Готовы?")
		end
      },
      {
        title = '{ffffff}» Город{ff0000} 50 км/ч',
        onclick = function()
        sampSendChat("Какая максимальная скорость разрешена в городе?")
        end
      },
      {
        title = '{ffffff}» Жилая местность{ff0000} 30 км/ч',
        onclick = function()
        sampSendChat("Какая максимальная скорость разрешена в жилой местности?")
        end
      },
      {
        title = '{ffffff}» Обгон{ff0000} с левой стороны.',
        onclick = function()
        sampSendChat("С какой стороны разрешен обгон?")
        end
      },
      {
        title = '{ffffff}» ДТП',
        onclick = function()
        sampSendChat("Вы попали в ДТП. Ваши действия?")
		wait(1500)
		ftext("{FFFFFF}- Правильный ответ: {A52A2A}Оказать первую помощь пострадавшим. Вызвать МЧС и ПД и ждать их прибытия.", -1)
        end
      },
	  {
        title = '{ffffff}» Действия при остановке',
        onclick = function()
        sampSendChat("За вами едет автомобиль с включённой сиреной. Ваши действия?")
		wait(1500)
		ftext("{FFFFFF}- Правильный ответ: {A52A2A}Сбавить скорость и прижаться к обочине.", -1)
        end
      },
	  {
        title = '{5b83c2}« Раздел других вопросов»',
        onclick = function()
        end
      },
      {
        title = '{ffffff}Цель ношения оружия',
        onclick = function()
        sampSendChat("Зачем вам лицензия на оружие?")
        end
      },
	  {
        title = '{ffffff}Хранение оружия',
        onclick = function()
        sampSendChat("Где вы будете хранить оружие?")
        end
      }
    }
end

function oformenu(id)
    return
    {
      {
        title = '{5b83c2}« Раздел оформления »',
        onclick = function()
        end
      },
      {
        title = '{ffffff}» Права.',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал(а) чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил(а) печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{ffffff}» Рыбалка',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал(а) чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил(а) печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{ffffff}» Пилот',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил(а) печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{ffffff}» Оружие{ff0000} со 2 уровня.',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал(а) чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил(а) печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{ffffff}» Катер',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{ffffff}» Бизнес',
        onclick = function()
          sampSendChat("/do Кейс с документами в руках инструктора.")
		  wait(1700)
		  sampSendChat("/me приоткрыл(а) кейс, после чего достал(а) чистый бланк и начал его заполнять")
		  wait(1700)
		  sampSendChat("/me записал(а) паспортные данные покупателя")
		  wait(1700)
		  sampSendChat("/do Лицензия в руке.")
		  wait(1700)
		  sampSendChat('/me поставил(а) печать "Autoschool San Fierro" и передал(а) лицензию '..sampGetPlayerNickname(id):gsub('_', ' ')..'')
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
        title = '{5b83c2}« Раздел стоимости »',
        onclick = function()
        end
      },
      {
        title = '{ffffff}» Права.',
        onclick = function()
		if gmegaflvl <= 2 then
          sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценами на права * протягивая прайс-лист человеку напротив ")
		  wait(1500)
		  sampSendChat("/do На прайс-листе написано:")
          wait(1200)
		  sampSendChat("/do 1-2 года проживания в штате: стоимость лицензии - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 лет проживания в штате: стоимость лицензии - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 лет проживания в штате: стоимость лицензии - 10000$")
          wait(1200)
		  sampSendChat("/do 16 и более лет проживания в штате: стоимость лицензии - 30000$")
          wait(1200)
          sampSendChat("Перед покупкой, пожалуйста прочитайте правила дорожного движения!")		  
		else if gmegaflvl <= 5 then
		  sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценами на права * протягивая прайс-лист человеку напротив ")
		  wait(1500)
		  sampSendChat("/do На прайс-листе написано:")
          wait(1200)
		  sampSendChat("/do 1-2 года проживания в штате: стоимость лицензии - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 лет проживания в штате: стоимость лицензии - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 лет проживания в штате: стоимость лицензии - 10000$")
          wait(1200)
		  sampSendChat("/do 16 и более лет проживания в штате: стоимость лицензии - 30000$")
          wait(1200)
          sampSendChat("Перед покупкой, пожалуйста прочитайте правила дорожного движения!") 
		else if gmegaflvl <= 15 then
		  sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценами на права * протягивая прайс-лист человеку напротив ")
		  wait(1500)
		  sampSendChat("/do На прайс-листе написано:")
          wait(1200)
		  sampSendChat("/do 1-2 года проживания в штате: стоимость лицензии - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 лет проживания в штате: стоимость лицензии - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 лет проживания в штате: стоимость лицензии - 10000$")
          wait(1200)
		  sampSendChat("/do 16 и более лет проживания в штате: стоимость лицензии - 30000$")
          wait(1200)
          sampSendChat("Перед покупкой, пожалуйста прочитайте правила дорожного движения!") 
		else if gmegaflvl >= 16 then
		  sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценами на права * протягивая прайс-лист человеку напротив ")
		  wait(1500)
		  sampSendChat("/do На прайс-листе написано:")
          wait(1200)
		  sampSendChat("/do 1-2 года проживания в штате: стоимость лицензии - 500$")
          wait(1200)
		  sampSendChat("/do 3-5 лет проживания в штате: стоимость лицензии - 5000$")
          wait(1200)
		  sampSendChat("/do 6-15 лет проживания в штате: стоимость лицензии - 10000$")
          wait(1200)
		  sampSendChat("/do 16 и более лет проживания в штате: стоимость лицензии - 30000$")
          wait(1200)
          sampSendChat("Перед покупкой, пожалуйста прочитайте правила дорожного движения!")
        end
		end
		end
		end
		end
      },
      {
        title = '{ffffff}» Рыбалка',
        onclick = function()
		sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценой на рыбалку * протягивая прайс-лист человеку напротив ")
		wait(1500)
		sampSendChat("/do На прайс-листе написано:")
		wait(1000)
        sampSendChat("/do Стоимость лицензии на рыбалку составляет - 2.000$")
        end
      },
      {
        title = '{ffffff}» Пилот',
        onclick = function()
		sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценой на пилотирование * протягивая прайс-лист человеку напротив ")
		wait(1500)
		sampSendChat("/do На прайс-листе написано:")
		wait(1200)
        sampSendChat("/do Стоимость лицензии на пилотирование составляет - 10.000$")
        end
      },
      {
        title = '{ffffff}» Оружие{ff0000} со 2 уровня.',
        onclick = function()
		if gmegaflvl > 1 then
		sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценой на оружие * протягивая прайс-лист человеку напротив ")
		wait(1500)
		sampSendChat("/do На прайс-листе написано:")
		wait(1200)
        sampSendChat("/do Стоимость лицензии на оружие составляет - 50.000$")
		else
		sampSendChat("Данную лицензию можно приобрести с 2-х лет в штате.")
		end
        end
      },
	  {
        title = '{ffffff}» Бизнес{ff0000} при наличии бизнеса.',
        onclick = function()
		sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценой на бинзес * протягивая прайс-лист человеку напротив ")
		wait(1500)
		sampSendChat("/do На прайс-листе написано:")
		wait(1200)
        sampSendChat("/do Стоимость лицензии на бизнес составляет - 100.000$")
        end
      },
      {
        title = '{ffffff}» Катер',
        onclick = function()
		sampSendChat("/todo Хорошо, прошу Вас ознакомиться с ценой на водный транспорт * протягивая прайс-лист человеку напротив ")
		wait(1500)
		sampSendChat("/do На прайс-листе написано:")
		wait(1200)
        sampSendChat("/do Стоимость лицензии на водные транспорты составляет - 5.000$")
        end
      },
    }
end

function instmenu(id)
    return
    {
      {
        title = '{5b83c2}« Раздел инструктора »',
        onclick = function()
        end
      },
      {
        title = '{ffffff}» Приветствие.',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("Здравствуйте. Я сотрудник автошколы "..myname:gsub('_', ' ')..", чем могу помочь?")
		wait(1500)
		sampSendChat('/do На рубашке бейджик с надписью "'..rank..' | '..myname:gsub('_', ' ')..'".')  
		end
      },
      {
        title = '{ffffff}» Паспорт',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        sampSendChat("Ваш паспорт, пожалуйста.")
		wait(1500)
		sampSendChat("/b /showpass "..myid.."")
        end
      },
	  {
        title = '{ffffff}» Попрощаться с клиентом',
        onclick = function()
        sampSendChat("Спасибо за покупку, всего Вам доброго.")
        end
      }
    }
end

function getFraktionBySkin(playerid)
    fraks = {
        [0] = 'Гражданский',
        [1] = 'Гражданский',
        [2] = 'Гражданский',
        [3] = 'Гражданский',
        [4] = 'Гражданский',
        [5] = 'Гражданский',
        [6] = 'Гражданский',
        [7] = 'Гражданский',
        [8] = 'Гражданский',
        [9] = 'Гражданский',
        [10] = 'Гражданский',
        [11] = 'Гражданский',
        [12] = 'Гражданский',
        [13] = 'Гражданский',
        [14] = 'Гражданский',
        [15] = 'Гражданский',
        [16] = 'Гражданский',
        [17] = 'Гражданский',
        [18] = 'Гражданский',
        [19] = 'Гражданский',
        [20] = 'Гражданский',
        [21] = 'Ballas',
        [22] = 'Гражданский',
        [23] = 'Гражданский',
        [24] = 'Гражданский',
        [25] = 'Гражданский',
        [26] = 'Гражданский',
        [27] = 'Гражданский',
        [28] = 'Гражданский',
        [29] = 'Гражданский',
        [30] = 'Rifa',
        [31] = 'Гражданский',
        [32] = 'Гражданский',
        [33] = 'Гражданский',
        [34] = 'Гражданский',
        [35] = 'Гражданский',
        [36] = 'Гражданский',
        [37] = 'Гражданский',
        [38] = 'Гражданский',
        [39] = 'Гражданский',
        [40] = 'Гражданский',
        [41] = 'Aztec',
        [42] = 'Гражданский',
        [43] = 'Гражданский',
        [44] = 'Aztec',
        [45] = 'Гражданский',
        [46] = 'Гражданский',
        [47] = 'Vagos',
        [48] = 'Aztec',
        [49] = 'Гражданский',
        [50] = 'Гражданский',
        [51] = 'Гражданский',
        [52] = 'Гражданский',
        [53] = 'Гражданский',
        [54] = 'Гражданский',
        [55] = 'Гражданский',
        [56] = 'Grove',
        [57] = 'Мэрия',
        [58] = 'Гражданский',
        [59] = 'Автошкола',
        [60] = 'Гражданский',
        [61] = 'Армия',
        [62] = 'Гражданский',
        [63] = 'Гражданский',
        [64] = 'Гражданский',
        [65] = 'Гражданский', -- над подумать
        [66] = 'Гражданский',
        [67] = 'Гражданский',
        [68] = 'Гражданский',
        [69] = 'Гражданский',
        [70] = 'МОН',
        [71] = 'Гражданский',
        [72] = 'Гражданский',
        [73] = 'Army',
        [74] = 'Гражданский',
        [75] = 'Гражданский',
        [76] = 'Гражданский',
        [77] = 'Гражданский',
        [78] = 'Гражданский',
        [79] = 'Гражданский',
        [80] = 'Гражданский',
        [81] = 'Гражданский',
        [82] = 'Гражданский',
        [83] = 'Гражданский',
        [84] = 'Гражданский',
        [85] = 'Гражданский',
        [86] = 'Grove',
        [87] = 'Гражданский',
        [88] = 'Гражданский',
        [89] = 'Гражданский',
        [90] = 'Гражданский',
        [91] = 'Гражданский', -- под вопросом
        [92] = 'Гражданский',
        [93] = 'Гражданский',
        [94] = 'Гражданский',
        [95] = 'Гражданский',
        [96] = 'Гражданский',
        [97] = 'Гражданский',
        [98] = 'Мэрия',
        [99] = 'Гражданский',
        [100] = 'Байкер',
        [101] = 'Гражданский',
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
        [121] = 'Гражданский',
        [122] = 'Гражданский',
        [123] = 'Yakuza',
        [124] = 'LCN',
        [125] = 'RM',
        [126] = 'RM',
        [127] = 'LCN',
        [128] = 'Гражданский',
        [129] = 'Гражданский',
        [130] = 'Гражданский',
        [131] = 'Гражданский',
        [132] = 'Гражданский',
        [133] = 'Гражданский',
        [134] = 'Гражданский',
        [135] = 'Гражданский',
        [136] = 'Гражданский',
        [137] = 'Гражданский',
        [138] = 'Гражданский',
        [139] = 'Гражданский',
        [140] = 'Гражданский',
        [141] = 'FBI',
        [142] = 'Гражданский',
        [143] = 'Гражданский',
        [144] = 'Гражданский',
        [145] = 'Гражданский',
        [146] = 'Гражданский',
        [147] = 'Мэрия',
        [148] = 'Гражданский',
        [149] = 'Grove',
        [150] = 'Мэрия',
        [151] = 'Гражданский',
        [152] = 'Гражданский',
        [153] = 'Гражданский',
        [154] = 'Гражданский',
        [155] = 'Гражданский',
        [156] = 'Гражданский',
        [157] = 'Гражданский',
        [158] = 'Гражданский',
        [159] = 'Гражданский',
        [160] = 'Гражданский',
        [161] = 'Гражданский',
        [162] = 'Гражданский',
        [163] = 'FBI',
        [164] = 'FBI',
        [165] = 'FBI',
        [166] = 'FBI',
        [167] = 'Гражданский',
        [168] = 'Гражданский',
        [169] = 'Yakuza',
        [170] = 'Гражданский',
        [171] = 'Гражданский',
        [172] = 'Гражданский',
        [173] = 'Rifa',
        [174] = 'Rifa',
        [175] = 'Rifa',
        [176] = 'Гражданский',
        [177] = 'Гражданский',
        [178] = 'Гражданский',
        [179] = 'Army',
        [180] = 'Гражданский',
        [181] = 'Байкер',
        [182] = 'Гражданский',
        [183] = 'Гражданский',
        [184] = 'Гражданский',
        [185] = 'Гражданский',
        [186] = 'Yakuza',
        [187] = 'Мэрия',
        [188] = 'СМИ',
        [189] = 'Гражданский',
        [190] = 'Vagos',
        [191] = 'Army',
        [192] = 'Гражданский',
        [193] = 'Aztec',
        [194] = 'Гражданский',
        [195] = 'Ballas',
        [196] = 'Гражданский',
        [197] = 'Гражданский',
        [198] = 'Гражданский',
        [199] = 'Гражданский',
        [200] = 'Гражданский',
        [201] = 'Гражданский',
        [202] = 'Гражданский',
        [203] = 'Гражданский',
        [204] = 'Гражданский',
        [205] = 'Гражданский',
        [206] = 'Гражданский',
        [207] = 'Гражданский',
        [208] = 'Yakuza',
        [209] = 'Гражданский',
        [210] = 'Гражданский',
        [211] = 'СМИ',
        [212] = 'Гражданский',
        [213] = 'Гражданский',
        [214] = 'LCN',
        [215] = 'Гражданский',
        [216] = 'Гражданский',
        [217] = 'СМИ',
        [218] = 'Гражданский',
        [219] = 'МОН',
        [220] = 'Гражданский',
        [221] = 'Гражданский',
        [222] = 'Гражданский',
        [223] = 'LCN',
        [224] = 'Гражданский',
        [225] = 'Гражданский',
        [226] = 'Rifa',
        [227] = 'Мэрия',
        [228] = 'Гражданский',
        [229] = 'Гражданский',
        [230] = 'Гражданский',
        [231] = 'Гражданский',
        [232] = 'Гражданский',
        [233] = 'Гражданский',
        [234] = 'Гражданский',
        [235] = 'Гражданский',
        [236] = 'Гражданский',
        [237] = 'Гражданский',
        [238] = 'Гражданский',
        [239] = 'Гражданский',
        [240] = 'Автошкола',
        [241] = 'Гражданский',
        [242] = 'Гражданский',
        [243] = 'Гражданский',
        [244] = 'Гражданский',
        [245] = 'Гражданский',
        [246] = 'Байкер',
        [247] = 'Байкер',
        [248] = 'Байкер',
        [249] = 'Гражданский',
        [250] = 'СМИ',
        [251] = 'Гражданский',
        [252] = 'Army',
        [253] = 'Гражданский',
        [254] = 'Байкер',
        [255] = 'Army',
        [256] = 'Гражданский',
        [257] = 'Гражданский',
        [258] = 'Гражданский',
        [259] = 'Гражданский',
        [260] = 'Гражданский',
        [261] = 'СМИ',
        [262] = 'Гражданский',
        [263] = 'Гражданский',
        [264] = 'Гражданский',
        [265] = 'Полиция',
        [266] = 'Полиция',
        [267] = 'Полиция',
        [268] = 'Гражданский',
        [269] = 'Grove',
        [270] = 'Grove',
        [271] = 'Grove',
        [272] = 'RM',
        [273] = 'Гражданский', -- надо подумать
        [274] = 'МОН',
        [275] = 'МОН',
        [276] = 'МОН',
        [277] = 'Гражданский',
        [278] = 'Гражданский',
        [279] = 'Гражданский',
        [280] = 'Полиция',
        [281] = 'Полиция',
        [282] = 'Полиция',
        [283] = 'Полиция',
        [284] = 'Полиция',
        [285] = 'Полиция',
        [286] = 'FBI',
        [287] = 'Army',
        [288] = 'Полиция',
        [289] = 'Гражданский',
        [290] = 'Гражданский',
        [291] = 'Гражданский',
        [292] = 'Aztec',
        [293] = 'Гражданский',
        [294] = 'Гражданский',
        [295] = 'Гражданский',
        [296] = 'Гражданский',
        [297] = 'Grove',
        [298] = 'Гражданский',
        [299] = 'Гражданский',
        [300] = 'Полиция',
        [301] = 'Полиция',
        [302] = 'Полиция',
        [303] = 'Полиция',
        [304] = 'Полиция',
        [305] = 'Полиция',
        [306] = 'Полиция',
        [307] = 'Полиция',
        [308] = 'МОН',
        [309] = 'Полиция',
        [310] = 'Полиция',
        [311] = 'Полиция'
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
                        ftext('Обнаружено обновление до версии '..updversion..'.')
					    updwindows.v = true
                        canupdate = true
                    else
                        print('Обновлений скрипта не обнаружено. Приятной игры.')
                        update = false
				    end
			    end
		    end
	    end
    end)
end


function smsjob()
  if rank == 'Мл.Менеджер' or rank == 'Ст.Менеджер' or rank == 'Директор' or  rank == 'Управляющий' then
    lua_thread.create(function()
        vixodid = {}
		status = true
		sampSendChat('/members')
        while not gotovo do wait(0) end
        wait(1200)
        for k, v in pairs(vixodid) do
            sampSendChat('/sms '..v..' На данный момент сотрудников на работе мало. Поэтому держите путь на работу!')
            wait(1200)
        end
        players2 = {'{ffffff}Ник\t{ffffff}Ранг\t{ffffff}Статус'}
		players1 = {'{ffffff}Ник\t{ffffff}Ранг'}
		gotovo = false
        status = false
        vixodid = {}
	end)
	else 
	ftext('Данная команда доступна с 7 ранга')
	end
end

function goupdate()
    ftext('Началось скачивание обновления. Скрипт перезагрузится через пару секунд.', -1)
    wait(300)
    downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
    if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
        showCursor(false)
	    thisScript():reload()
    end
end)
end

function cmd_color() -- функция получения цвета строки, хз зачем она мне, но когда то юзал
	local text, prefix, color, pcolor = sampGetChatString(99)
	sampAddChatMessage(string.format("Цвет последней строки чата - {934054}[%d] (скопирован в буфер обмена)",color),-1)
	setClipboardText(color)
end

function getcolor(id)
local colors = 
        {
		[1] = 'Зелёный',
		[2] = 'Светло-зелёный',
		[3] = 'Ярко-зелёный',
		[4] = 'Бирюзовый',
		[5] = 'Жёлто-зелёный',
		[6] = 'Темно-зелёный',
		[7] = 'Серо-зелёный',
		[8] = 'Красный',
		[9] = 'Ярко-красный',
		[10] = 'Оранжевый',
		[11] = 'Коричневый',
		[12] = 'Тёмно-красный',
		[13] = 'Серо-красный',
		[14] = 'Жёлто-оранжевый',
		[15] = 'Малиновый',
		[16] = 'Розовый',
		[17] = 'Синий',
		[18] = 'Голубой',
		[19] = 'Синяя сталь',
		[20] = 'Сине-зелёный',
		[21] = 'Тёмно-синий',
		[22] = 'Фиолетовый',
		[23] = 'Индиго',
		[24] = 'Серо-синий',
		[25] = 'Жёлтый',
		[26] = 'Кукурузный',
		[27] = 'Золотой',
		[28] = 'Старое золото',
		[29] = 'Оливковый',
		[30] = 'Серый',
		[31] = 'Серебро',
		[32] = 'Черный',
		[33] = 'Белый',
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
            ftext('Цвет ника сменен на: {'..color..'}'..cfg.main.clist..' ['..colors..']')
        end)
    end
end

function sampev.onServerMessage(color, text)
        if text:find('Рабочий день начат') and color ~= -1 then
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
                ftext('Цвет ника сменен на: {'..color..'}'..cfg.main.clist..' ['..colors..']')
                rabden = true
				wait(1000)
				if cfg.main.clisto then
				local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
                local myname = sampGetPlayerNickname(myid)
				if cfg.main.male == true then
				sampSendChat("/me открыл шкафчик")
                wait(1500)
                sampSendChat("/me снял свою одежду, после чего сложил ее в шкаф")
                wait(1500)
                sampSendChat("/me взял рабочую одежду, затем переоделся в нее")
                wait(1500)
                sampSendChat("/me нацепил бейджик на рубашку")
                wait(1500)
                sampSendChat('/do На рубашке бейджик с надписью "'..rank..' | '..myname:gsub('_', ' ')..'".')  
				end
				if cfg.main.male == false then
				sampSendChat("/me открыла шкафчик")
                wait(1500)
                sampSendChat("/me сняла свою одежду, после чего сложила ее в шкаф")
                wait(1500)
                sampSendChat("/me взяла рабочую одежду, затем переоделась в нее")
                wait(1500)
                sampSendChat("/me нацепила бейджик на рубашку")
                wait(1500)
                sampSendChat('/do На рубашке бейджик с надписью "'..rank..' | '..myname:gsub('_', ' ')..'".')
				end
			end
            end)
        end
	  end
    end
	if text:find('SMS:') and text:find('Отправитель:') then
		wordsSMS, nickSMS = string.match(text, 'SMS: (.+) Отправитель: (.+)');
		local idsms = nickSMS:match('.+%[(%d+)%]')
		lastnumber = idsms
	end
	if text:find('{00AB06}Чтобы завести двигатель, нажмите клавишу {FFFFFF}"2"{00AB06} или введите команду {FFFFFF}"/en"') then
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
    if text:find('Рабочий день окончен') and color ~= -1 then
	vars.isWorking = false
        rabden = false
    end
	if text:find('приобрел лицензию на воздушный транспорт') then
        local Nicks = text:match('Игрок (.+) приобрел лицензию на воздушный транспорт. Сумма добавлена к зарплате.')
		pilot = pilot + 1
	end
   	if text:find('приобрел водительские права') then
        local Nicks = text:match('Игрок (.+) приобрел водительские права. Сумма добавлена к зарплате.')
		prava = prava + 1
	end
   	if text:find('приобрел лицензию на рыболовство') then
        local Nicks = text:match('Игрок (.+) приобрел лицензию на рыболовство. Сумма добавлена к зарплате.')
		ribolov = ribolov + 1
	end
   	if text:find('приобрел лицензию на морской транспорт') then
        local Nicks = text:match('Игрок (.+) приобрел лицензию на морской транспорт. Сумма добавлена к зарплате.')
		kater = kater + 1
	end
   	if text:find('приобрел лицензию на оружие') then
        local Nicks = text:match('Игрок (.+) приобрел лицензию на оружие. Сумма добавлена к зарплате.')
		gun = gun + 1
	end
   	if text:find('приобрел лицензию на бизнес') then
        local Nicks = text:match('Игрок (.+) приобрел лицензию на открытие бизнеса. Сумма добавлена к зарплате.')
		biznes = biznes + 1
	end
	if text:find('Вы выгнали (.+) из организации. Причина: (.+)') then
        local un1, un2 = text:match('Вы выгнали (.+) из организации. Причина: (.+)')
		lua_thread.create(function()
		wait(3000)
		if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: %s - Уволен(а) по причине "%s".', cfg.main.tag, un1:gsub('_', ' '), un2))
        else
		sampSendChat(string.format('/r %s - Уволен(а) по причине "%s".', un1:gsub('_', ' '), un2))
		end
		end)
    end
	if text:find('передал(- а) удостоверение (.+)') then
        local inv1, inv2 = text:match('передал(- а) удостоверение (.+)')
		lua_thread.create(function()
		wait(5000)
		if cfg.main.aTag then
        sampSendChat(string.format('/r [%s]: Новый сотрудник Автошколы - %s. Добро пожаловать.', cfg.main.tag, inv1:gsub('_', ' '), inv2))
        else
		sampSendChat(string.format('/r %s Новый сотрудник Автошколы - %s. Добро пожаловать.', inv1:gsub('_', ' '), inv2))
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
		if text:match('Всего: %d+ человек') then
			local count = text:match('Всего: (%d+) человек')
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
            if stat:find('Выходной') and tonumber(nmrang) < 7 then
                table.insert(vixodid, id)
            end
			table.insert(players2, string.format('{ffffff}%s\t {'..color..'}%s[%s]{ffffff}\t%s\t%s', data, nick, id, rang, stat))
			return false
		end
		if text:match('Всего: %d+ человек') then
			local count = text:match('Всего: (%d+) человек')
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
                    table.insert(tMembers, Player:new(id, sRang, iRang, "Недоступно", invDate, false, 0, nickname))
                else
                    local id, invDate, nickname, sRang, iRang, sec = text:match("ID: (%d+) | (.+) | (%g+): (.+)%[(%d+)%] | %{.+%}%[AFK%]: (%d+).+")
                    table.insert(tMembers, Player:new(id, sRang, iRang, "Недоступно", invDate, true, sec, nickname))
                end
                return false
            end
            if text:match('Всего: %d+ человек') then
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