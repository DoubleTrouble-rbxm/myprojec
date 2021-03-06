script_name('Medic Tools')
script_version('1.1')
script_author('Roma_Mizantrop')
local sf = require 'sampfuncs'
local key = require "vkeys"
local inicfg = require 'inicfg'
local sampev = require 'lib.samp.events'
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
local ystwindow = imgui.ImBool(false)
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
ctag = "Medic Tools {ffffff}|"
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
vixodid = {}
local config_keys = {
    fastsms = { v = {}}
}
function apply_custom_style() -- ������ ������ ���������, ������� ������ � ������� �����

	imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    style.WindowPadding = ImVec2(15, 15)
    style.WindowRounding = 5.0
    style.FramePadding = ImVec2(5, 5)
    style.FrameRounding = 4.0
    style.ItemSpacing = ImVec2(12, 8)
    style.ItemInnerSpacing = ImVec2(8, 6)
    style.IndentSpacing = 25.0
    style.ScrollbarSize = 15.0
    style.ScrollbarRounding = 9.0
    style.GrabMinSize = 5.0
	style.GrabRounding = 3.0
	style.WindowTitleAlign = ImVec2(0.5, 0.5)


	colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
    colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 0.50)
    colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 0.80)
    colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
    colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
	--colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.TitleBgCollapsed] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.TitleBgActive] = ImVec4(0.07, 0.61, 0.92, 0.83)
	colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 0.50) 	
    colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 0.50)
    colors[clr.CheckMark] = ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.SliderGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
    --colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
    colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
    colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
    colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
    --colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.70)
    colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.80)

	colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 0.98)
    --colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.FrameBg] = ImVec4(0.13, 0.12, 0.15, 1.00)
    colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
	colors[clr.TitleBg] = ImVec4(0.07, 0.61, 0.92, 0.83)

end
apply_custom_style()

local fileb = getWorkingDirectory() .. "\\config\\medictools.bind"
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
            v = {key.VK_3}
        }
	}
end

local medictools =
{
  main =
  {
    posX = 1738,
    posY = 974,
    widehud = 320,
    male = true,
    wanted == false,
    clear == false,
    hud = false,
    tar = '������',
	tarr = '���',
	tarb = false,
	clistb = false,
	clisto = false,
	givra = false,
    clist = 0
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
cfg = inicfg.load(nil, 'medictools/config.ini')

local libs = {'sphere.lua', 'rkeys.lua', 'imcustom/hotkey.lua', 'imgui.lua', 'MoonImGui.dll', 'imgui_addons.lua'}
function main()
  while not isSampAvailable() do wait(1000) end
  if seshsps == 1 then
    ftext("Medic Tools ������� ��������. �������: /mt ��� ��������� ���������� ����������", -1)
  end
  if not doesDirectoryExist('moonloader/config/medictools/') then createDirectory('moonloader/config/medictools/') end
  if cfg == nil then
    sampAddChatMessage("{008B8B}Medic Tools {ffffff}| ���������� ���� �������, �������.", -1)
    if inicfg.save(medictools, 'medictools/config.ini') then
      sampAddChatMessage("{008B8B}Medic Tools {ffffff}| ���� ������� ������� ������.", -1)
      cfg = inicfg.load(nil, 'medictools/config.ini')
    end
  end
  if not doesDirectoryExist('moonloader/lib/imcustom') then createDirectory('moonloader/lib/imcustom') end
  for k, v in pairs(libs) do
        if not doesFileExist('moonloader/lib/'..v) then
            downloadUrlToFile('https://raw.githubusercontent.com/WhackerH/kirya/master/lib/'..v, getWorkingDirectory()..'\\lib\\'..v)
            print('����������� ���������� '..v)
        end
    end
	if not doesFileExist("moonloader/config/medictools/keys.json") then
        local fa = io.open("moonloader/config/medictools/keys.json", "w")
        fa:close()
    else
        local fa = io.open("moonloader/config/medictools/keys.json", 'r')
        if fa then
            config_keys = decodeJson(fa:read('*a'))
        end
    end
  while not doesFileExist('moonloader\\lib\\rkeys.lua') or not doesFileExist('moonloader\\lib\\imcustom\\hotkey.lua') or not doesFileExist('moonloader\\lib\\imgui.lua') or not doesFileExist('moonloader\\lib\\MoonImGui.dll') or not doesFileExist('moonloader\\lib\\imgui_addons.lua') do wait(0) end
  if not doesDirectoryExist('moonloader/medictools') then createDirectory('moonloader/medictools') end
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
  local frakc = proverkk:match('.+�����������%:%s+(.+)%s+����')
  local rang = proverkk:match('.+����%:%s+(.+)%s+������')
  local telephone = proverkk:match('.+�������%:%s+(.+)%s+�����������������')
  rank = rang
  frac = frakc
  tel = telephone
  sampCloseCurrentDialogWithButton(1)
  print(frakc)
  print(rang)
  print(telephone)
  ystf()
  update()
  local spawned = sampIsLocalPlayerSpawned()
  for k, v in pairs(tBindList) do
		rkeys.registerHotKey(v.v, true, onHotKey)
  end
  fastsmskey = rkeys.registerHotKey(config_keys.fastsms.v, true, fastsmsk)
  sampRegisterChatCommand('r', r)
  sampRegisterChatCommand('f', f)
  sampRegisterChatCommand('dlog', dlog)
  sampRegisterChatCommand('dcol', cmd_color)
  sampRegisterChatCommand('dmb', dmb)
  sampRegisterChatCommand('smsjob', smsjob)
  sampRegisterChatCommand('where', where)
  sampRegisterChatCommand('mt', mt)
  sampRegisterChatCommand('vig', vig)
  sampRegisterChatCommand('giverank', giverank)
  sampRegisterChatCommand('blag', blag)
  sampRegisterChatCommand('pd', cmd_pd)
  sampRegisterChatCommand('cchat', cmd_cchat)
  sampRegisterChatCommand('invite', invite)
  sampRegisterChatCommand('nick', nick)
  sampRegisterChatCommand('oinv', oinv)
  sampRegisterChatCommand('find', cmd_find)
  sampRegisterChatCommand('uninvite', uninvite)
    sampRegisterChatCommand('sethud', function()
        if cfg.main.givra then
            if not changetextpos then
                changetextpos = true
                ftext('�� ���������� ������� ������� ��� ���.')
            else
                changetextpos = false
				inicfg.save(cfg, 'medictools/config.ini') -- ��������� ��� ����� �������� � �������
            end
        else
            ftext('��� ������ �������� ����-���.')
        end
    end)
  sampRegisterChatCommand('yst', function() ystwindow.v = not ystwindow.v end)
  while true do wait(0)
    if #departament > 25 then table.remove(departament, 1) end
    if cfg == nil then
      sampAddChatMessage("{008B8B}Medic Tools {ffffff}| ���������� ���� �������, �������.", -1)
      if inicfg.save(medictools, 'medictools/config.ini') then
        sampAddChatMessage("{008B8B}Medic Tools {ffffff}| ���� ������� ������� ������.", -1)
        cfg = inicfg.load(nil, 'medictools/config.ini')
      end
    end
	    local myhp = getCharHealth(PLAYER_PED)
        local valid, ped = getCharPlayerIsTargeting(PLAYER_HANDLE)
    if wasKeyPressed(cfg.keys.fastmenu) and not sampIsDialogActive() and not sampIsChatInputActive() then
	if frac == 'Hospital' then
    submenus_show(fastmenu(id), "{008B8B}Medic Tools {ffffff}| ������� ����")
	else
	ftext('�������� �� �� �������� � MOH {ff0000}[ctrl+R]')
	end
    end
          if valid and doesCharExist(ped) then
            local result, id = sampGetPlayerIdByCharHandle(ped)
            if result and wasKeyPressed(key.VK_Z) then
			if frac == 'Hospital' then
                gmegafhandle = ped
                gmegafid = id
                gmegaflvl = sampGetPlayerScore(id)
                gmegaffrak = getFraktionBySkin(id)
			    local color = ("%06X"):format(bit.band(sampGetPlayerColor(id), 0xFFFFFF))
                --[[ftext(gmegafid)
                ftext(gmegaflvl)
                ftext(gmegaffrak)]]
				megaftimer = os.time() + 300
                submenus_show(pkmmenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] {ffffff}������� - "..sampGetPlayerScore(id).." ")
				else
			ftext('�������� �� �� �������� � MOH {ff0000}[ctrl+R]')
				end
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
		imgui.Process = second_window.v or third_window.v or bMainWindow.v or ystwindow.v or updwindows.v or infbar.v or memw.v
  end
  function rkeys.onHotKey(id, keys)
	if sampIsChatInputActive() or sampIsDialogActive() or isSampfuncsConsoleActive() then
		return false
	end
end
end

local fpt = [[
1.1 - ��� ������ � �������, ���������� � ������ ���������, ����������� � ����������. 
1.2 - �� ��������� ������ � ������ ��������� �������� ���������. ��� ��������� ���������� �����������. 
1.3 - ������� �������� ����� �������� ������������� � ����������� �� ��������. 
1.4 - ����� ����� ����������� � ���������� ������� ������ � ����� �����. 
1.5 - �������� ����� ��� �� ��������� �������� ��� ����� ���� ������� ����. 

2.1 - ��������� ������������ ��������������� ������ ��������� ����������� ������ ����, ���������� �� ������������� ���������, ��������� � ��������, �������, ���� � ��� �����. 
2.1.1 - ������� ����� "2.1" - �� ��������� ������ ����������, ������������� �� ������ ������� ���������� �� ���������. 
2.2 - ��������� ������ ����������������� ��������, ���� �� ��� ���� �������������. 
2.3 - ����������� �������� �� ����� ����� ����� ������ ��� ������������ �������� �� �������� � ����� ���������� ��� ����������. ����������: ���������. 
2.4 - ��������� �������������� ������ ���� �� ������� �� ����������������. 
2.5 - ������������� ��������� ������ ��� ����������� Role Play. | ���������: ������� | ��������� | ����������. 
2.6 - ���� � �������� ��� ����� �� �������, ��������� �� ������ ������� ����� ���� ����������� ����� ��������. 
2.7 - ��������� ������ �������� � ����������-������� �����. 
2.8 - ��������� ������ �������� ����� ���������, ���������� �� ��������� ����, ����� �� ����� ����������� �� ������. 
2.9 - ������ ��������� ������ � ��������� ���������� � ������� ����������, ���������� �� ���������. 
2.10 - ��������� ����� ����� ��������� ��� ������ �������� ����� ��� ��� ������������ �� �������� ��� ��� ������ �������.
2.10.1 - ����������� ���������� �� ������ �� ����� ���������.
2.11 - ��������� ������ ��������� ��������� ������ ������������� �� ������� ��� ������� ����������. 
2.12 - �� ������������ �������� ��������� ������ �������� ����� � ������� 5.000$. ������ ������ � ���� ������������. 
2.13 - �������� ��������� ������ ������������� � ������������� ��������.

3.1 - ������ ������ � ������ ��� (��. � ��.) ���������� � 08:00 � ������������� � 21:00. ����� ��������� ������� ����� ���������� ����� ����� ����� ��� ������ �������� �� ������ �����. 
3.3.1 - ����������� ���������� � �������� ����� 15 ����� | ���������: ����� | ������� | ����������. 
3.2 - ������ ������ � �������� ��� (��. � ��.) ���������� � 9:00 � ������������� � 17:00. 
3.3 - ������ ��������� �� �������� � ���� ������ ������� �� ������ � ������� 15 �����. 
3.5 - ��������� ������� ���������� � 13:00 �� 14:00 ���������. 
3.6 - ������ �� ���������� / �������� �������������� �������������. 
3.7 - ������� ���� ������ �������� ������� ����� � ����� ����.

4.1 - ����������� �������� ����� ����� ������������ ������������������� �������� ������ ����������� ������. 
4.2 - ����������� ���������, ������� ��������� ��������� � ����, ����� ����� ������������ ������������������� �����������, ������������� ������������ ���������������. 
4.3 - �������� ����. ������ ������ ����������� ������ ������ ������������ �� ���������, ������� ������� �� ������ ������ ���� 20 ������. 
4.3.1 - ���� � �������� ������ ������ ����������� ������ ��� ����� �� ��������� � �������� ���������, � �������� �������, �� ������ ����� ������������� �������� ����������� � ���������� �� ������������� ������. 
4.4 - ������������� ����. ������� �������� ����� ������ ���� �� ������ �� �����, ���� ���� �������� � ��������. 
4.4.1 - ������������� ����.�������� � ������ � ������ ����� ���������. ���������: ������� | ���������. 
4.5 - ����� �� ��������� ������, ���� ���� �� ����� � ��������������� ����.��������, ������ ��������. ���������: �����| �������. 
4.6 - ������������� ��������� ������ ������� �������� �����. | ���������: �������. 
4.7 - ��������� ������������ ��������� ������������ ��������������� � ������ �����. | ���������: ������� | ���������. 
4.7.1 - ��������� ������������� ��������� �� ������. ���������: ������� | ���������. ����������: �������� ������� �� ��������. 
4.7.2 - ������������� ��������� ����� (AFK) � ����. ������ �� ����� ��� ������� �������� ����� ����� 120 ������. | ���������: �������. 
4.8 - ������������������ ���������� �Stratum� � �������� ��������� ����� � ��������� ���.���� � ������ � ��������� �����. 

5.1 - ����������� �������� ����� ���� ������� � ��������� ���� �� �������� ������. 
5.1.1 - �������� ��� ��������� ������������ �������� �������� ������������ ������. 
5.1.2 - �������� ���������� �� ��������� � ���� ����� ������ ������� ����, ���� ��� ������ �����������. 
5.1.3 - ��������� �������� ��� �������� ����-���� �� ������� �������� ��� ���� �����. 
5.2 - ����������� ����������� ��� �������� �� ���������. | ���������: ��������� | ����������. ����������: ��������� � ����� ������ ��� ��������� ������������. 
5.3 - ������� ������ �������� �������� ���������������. | ������� ������� �������� �������� ���������� � ��������� | ������� ��� ��������� �������� �����������. 
5.3.1 - ������� ��������� ��������� �� ���� ����������� ��� ����������. 
5.3.2 - ������� ����� ���� ���� , ���������� � ������. ����������: ������ ������ ���������. 
5.3.3 - ������� ����� ����� ������ �������� ��� �� ����.���� � ��� ������ �����������. 
5.4 - �������� � ������� ���� ����� ��� ����� � ��� ���������� ���������. | ���������: �����.
5.5 - ����������� �������� ����� ���� ������ ��: ������, ������ ������, ������������ ������, ������ ������� ������������, �� ������� ����������, � ��� �� �� ������������ �������. 

6.1 - ����������� ��������� ����������� ������ ���� ��������� � ���������� � ������� �� ��������� �������� ������ �� ����. 
6.1.2 - ��������� � ������� ���� �� �����: ���������, ��� ����������, ���������. ������: �������� ���������, ����� � ���� ����������?; ������ ���, ����� ��� �� ������? 
6.2 - � ���� ������������ ��������� �� ����������� �����, ������, ����� ����� ��������, � ��� �� �������������� ����� � ������� ������ � ������� �����. | ���������: ����� | �������. 
6.3 - ����������� ������� � ����������� �����������, � ����� ����� ������. | ���������: ��������� | ����������. 
6.4 - ��������� �������� �������� (�������) � ����� ������������, � ����� � ����� ������������. | ���������: ������� | ���������. | ���������� 
6.5 - ��������� �������� � ����� ������������ ��� ������������ �������. ���������: ������� ��������� ( ��� �����, � ������� ����� ���������� �� ������� � SAPD, FBI, Army SA,� � ���������, � ������ ��������� ��� �������. )
6.5.1 - �������� �� ����� ������������ ����� ���� ����������, ���������� ��������� ��������� | ���������: ��������� | ����������. ����������: ���������. 
6.6 - ����������� �������� ���������, ����������. | ���������: ��������� | ����������. 
6.6.1 - ����������� ��������� ��������� � �������������� �����. | ���������: ������� | ���������. 
6.7 - ����������� �������, ����� ���� �����������. | ���������: ����� | �������. 
6.8 - ����������� ������������� ���-���� � ����� ������� � ����� ������������ ��� ������������. | ���������: ������� | ���������. 
6.9 - ��������� ������ ���������������� ������� ��� �������, ���� ���� � ��� ��� ������������� ���������. 
6.10 - ������ ���������� ������������ ����������� �������� ������ ����� (MG), ��������� � ���������������� �������. | ���������: ������� | ���������. 
6.11 - ����������� �������� ����������� �������� ��� ������� �� ������������ �����. | ���������: ������� |���������. 
6.12 - ����������� ������� ������������� ��������. | ���������: ����������. 
6.12.1 - ����������� ������������ ������������� �������, � ����� ���� � ����������� ��������� �� ������. | ���������: ����������. 
6.13 - ����������� ������� ��������� ������� ��������� ��� ������ ��� ��������. | ���������: ����������. 
6.14 - ����������� ���������� ���� ������ � ����� �����. ���������: | ���������: ����������. 
6.15 - ����������� ������������� � ������� �����. | ���������: ��������� | ����������. 
6.16 - ����������� �������� ������ � ������� �����. | ���������: ��������� | ����������. 
6.17 - ����������� �������� ���� ������� � ���������� ������������ ���� � ����� � ������� �����. | ���������: ������� | ��������� | ����������. 
6.18 -���� ��������� ��� ������ ������ �� ������� � ���� ���������� �� ���������� "����" ���������� , ����.���� ����� �������� � ������. | ���������: ����������.

7.1 - ����������� �������� ����� ����� ����� ������ ��� �������. 
7.1.1 - � ������ ��� ������� ��������� ������� � ��������� ������ (6 ����). 
7.2 - ������������ ������� ��� �������� ����������� ����� ���. ����������, ��������� ����� ������ ������� ����. 
7.2.1 - � ��������� �� ������ ����������� ����� ������� ���� ��������� �������. � ��������� ������, � ������� ����� ��������. 
7.2.2 - ����������� ���� ������� 7 ����. ������������ ���� 21 ����. 
7.3 - � ������, ���� ���. �������� ������������ � ��������� ����, ��� ��������� �����������������. 
7.4 - � ������, ���� ���. �������� �� ������������ � ��������� ����, ��� ��������� ������������ ������������. 
7.5 - ����������� �������� ����� ��������� �� ������� � ����� ����� (�� ���������� �����). 
7.6 - ������������ �������� ����� � ������ ����� ���� �� ����� ������ ���� � 2 ������. 
7.7 - �������� � ������ ����� ���� �� ����� ������ ��� � �����. 
7.8 - � ������� ����������� �������� � ������������ ������. 

8.1 - ����������� ��������, ������������ �� ���� ��� �������, ������ ����������� � ��������� �� �����/������� ������ 5 �����. ���������� ������� �������� ���������. 
8.2 - ������ ����� �����: /r [�����]: ������ || ����: __ || ��������: __ ||. 
8.2.1 - ��������� ������ OOC � IC ����������. ��������: ����������: ������� ���� || �������: (( AFK )). AFK, ��� �������� ������� �����������, �������. ��������: ����������: ������� ���� || �������: �����. 
8.3 - ����������� ������ �� �������� � ����� �������������� � ��������� ������� � ����. 
8.3.1 - ������� ����� ����� ����� �� ������ ������ � ������ ���������� ���������, ���.���������� � ����������. 

9.1 - � ������� ���������� ������������ �������� ���������� ��������� ���������� ��������������� �����.
9.2 - ���������� ������� ��� ���� ����� ����� �������� ����� ���������/������.
9.2.1 - ������� �������� ��� ����� �� �� ��������� | ���������: ����� | �������
9.2.2 - ������� �������� ������� ����� | ���������: ����� | ������� 
9.2.3 - ���������� �������� �� ����� �� ����� �������� ���/������� ��������� | ���������: ������� 
9.2.4 - ����� �� ����� �����, ������� �� �� ��������� | ���������: ���������� 
9.3 - ���������� ����� ������������ ����� ����������, ��� �������, ������, ����������� ����. 
9.3.1 - ������������ ���������� � ���� �����, ����, ������� � ����� ������ ���������, ������������ ��� ����� ����� | ���������: ������� | ��������� | ����������



��������� ���������. �����(�):
[ UPD - 17.07.2019 ]
6.18 - ���� ��������� ��� ������ ������ �� ������� � ���� ���������� �� ���������� "����" ���������� , ����.���� ����� �������� � ������. | ���������: ����������. ���������
5.4 - �������� � ������� ���� ����� ��� ����� � ��� ���������� ���������. | ���������: �����. ��������
4.5 - ����� �� ��������� ������, ���� ���� �� ����� � ��������������� ����.��������, ������ ��������. ���������: �����| �������. �������� 
4.7 - ��������� ������������ ��������� ������������ ��������������� � ������ �����. | ���������: ������� | ���������. �������� 
4.8 - ������������������ ���������� �Stratum� � �������� ��������� ����� � ��������� ���.���� � ������ � ��������� �����. �������� 
6.2 - � ���� ������������ ��������� �� ����������� �����, ������, ����� ����� ��������, � ��� �� �������������� ����� � ������� ������ � ������� �����. | ���������: ����� | �������.��������
6.7 - ����������� �������, ����� ���� �����������. | ���������: ����� | �������. ��������
9.2.1 - ������� �������� ��� ����� �� �� ��������� | ���������: ����� | ������� �������
]]

function dmb()
	lua_thread.create(function()
		status = true
		players2 = {'{ffffff}���� ��������\t{ffffff}���\t{ffffff}����\t{ffffff}������'}
		players1 = {'{ffffff}���\t{ffffff}����'}
		sampSendChat('/members')
		while not gotovo do wait(0) end
		if gosmb then
			sampShowDialog(716, "{ffffff}� ����: "..gcount.." | {ae433d}����������� | {ffffff}Time: "..os.date("%H:%M:%S"), table.concat(players2, "\n"), "x", _, 5) -- ���������� ����������.
		elseif krimemb then
			sampShowDialog(716, "{ffffff}� ����: "..gcount.." | {ae433d}����������� | {ffffff}Time: "..os.date("%H:%M:%S"), table.concat(players1, "\n"), "x", _, 5) -- ���������� ����������.
		end
		gosmb = false
		krimemb = false
		gotovo = false
		status = false
		gcount = nil
	end)
end

function vig(pam)
  local id, pric = string.match(pam, '(%d+)%s+(.+)')
if rank == '��������' or rank == '������' or rank == '���.����.�����' or rank == '����.����' then
  if id == nil then
    sampAddChatMessage("{008B8B}Medic Tools {ffffff}| �������: /vig [id] [�������]", -1)
  end
  if id ~=nil and not sampIsPlayerConnected(id) then
    sampAddChatMessage("{008B8B}Medic Tools {ffffff}| ����� � ID: "..id.." �� ��������� � �������.", -1)
  end
  if id ~= nil and sampIsPlayerConnected(id) then
      if pric == nil then
        sampAddChatMessage("{008B8B}Medic Tools {ffffff}| /vig [id] [�������]", -1)
      end
      if pric ~= nil then
	   if cfg.main.tarb then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/r [%s]: %s - �������� ������� �� �������: %s.", cfg.main.tarr, rpname, pric))
		else 
		name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
		sampSendChat(string.format("/r %s - �������� ������� �� �������: %s.", rpname, pric))
      end
  end
end
end
end

function where(params) -- ������ ��������������
   if rank == '��������' or rank == '������' or rank == '���.����.�����' or rank == '����.����' then
	if params:match("^%d+") then
		params = tonumber(params:match("^(%d+)"))
		if sampIsPlayerConnected(params) then
			local name = string.gsub(sampGetPlayerNickname(params), "_", " ")
			 if cfg.main.tarb then
			    sampSendChat(string.format("/r [%s]: %s, �������� ���� ��������������. �� ����� 20 ������.", cfg.main.tarr, name))
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

        
function blag(pam)
    local id, frack, pric = pam:match('(%d+) (%a+) (.+)')
    if id and frack and pric and sampIsPlayerConnected(id) then
        name = sampGetPlayerNickname(id)
        rpname = name:gsub('_', ' ')
        sampSendChat(string.format("/d %s, ��������� %s �� %s. ������!", frack, rpname, pric))
    else
        ftext("�������: /blag [id] [�������] [�������]", -1)
    end
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
			sampShowDialog(716, "{008B8B}Medic Tools {ffffff}| {ae433d}���������� ��� ����� {ffffff}| Time: "..os.date("%H:%M:%S"), table.concat(players3, "\n"), "x", _, 5) -- ���������� ����������.
		end
		gosmb = false
		krimemb = false
		gotovo = false
		statusc = false
	end)
end

function dlog()
    sampShowDialog(97987, '{008B8B}Medic Tools {ffffff} | ��� ��������� ������������', table.concat(departament, '\n'), '�', 'x', 0)
end

function getrang(rangg)
local ranks = 
        {
		['1'] = '������',
		['2'] = '�������',
		['3'] = '���.����',
		['4'] = '���������',
		['5'] = '��������',
		['6'] = '������',
		['7'] = '��������',
		['8'] = '������',
		['9'] = '���.����.�����'
		}
	return ranks[rangg]
end

function giverank(pam)
    lua_thread.create(function()
    local id, rangg, plus = pam:match('(%d+) (%d+)%s+(.+)')
	if sampIsPlayerConnected(id) then
	  if rank == '��������' or rank == '������' or rank == '���.����.�����' or rank == '����.����' then
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
				if cfg.main.tarb then
                sampSendChat(string.format('/r [%s]: '..sampGetPlayerNickname(id):gsub('_', ' ')..' - %s � ��������� �� %s%s.', cfg.main.tarr, plus == '+' and '�������(�)' or '�������(�)', ranks, plus == '+' and ', ����������' or ''))
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

function fastmenu(id)
 return
{
  {
   title = "{FFFFFF}���� {008B8B}������",
    onclick = function()
	submenus_show(fthmenu(id), "{008B8B}Medic Tools {ffffff}| ���� ������")
	end
   },
    {
   title = "{FFFFFF}���� {008B8B}���.�������� {ff0000}(��� ��.�������)",
    onclick = function()
	if rank == '��������' or rank == '������' or rank == '���.����.�����' or rank == '����.����' then
	submenus_show(govmenu(id), "{008B8B}Medic Tools {ffffff}| ���� ���.��������")
	else
	ftext('��� ������ ���������')
	end
	end
   },
}
end

function govmenu(id)
 return
{
  {
   title = "{FFFFFF}������������� � �����������",
    onclick = function()
	sampSendChat("/d OG, ����� ����� ��������������� ��������.")
    wait(5000)
    sampSendChat("/gov [Medic]: ��������� ������ � ����� ������ ����� ��������� ��������.")
    wait(5000)
    sampSendChat('/gov [Medic]: ������������� � ����������� �.Los-Santos ��������.')
    wait(5000)
    sampSendChat("/gov [Medic]: ������� ��, ���������� �����. ��������: 3-� ������ �������� � �����, ������� ���. �������.")
    wait(5000)
    sampSendChat("/d OG, ��������� ����� ��������������� ��������.")
    wait(1200)
	if cfg.main.hud then
    sampSendChat("/time")
    wait(500)
    setVirtualKeyDown(key.VK_F8, true)
    wait(150)
    setVirtualKeyDown(key.VK_F8, false)
	end
	end
   },
  {
   title = "{FFFFFF}�������� �������������",
    onclick = function()
	sampSendChat("/d OG, ����� ����� ��������������� ��������.")
        wait(5000)
        sampSendChat("/gov [Medic]: ��������� ������ � ����� ������ ����� ��������� ��������.")
        wait(5000)
        sampSendChat('/gov [Medic]: � ������ ������ �������� ������������� � ����������� �.Los-Santos.')
        wait(5000)
        sampSendChat("/gov [Medic]: ������� ��, ���������� �����. ��������: 3-� ������ �������� � �����, ������� ���. �������.")
        wait(5000)
        sampSendChat("/d OG, ��������� ����� ��������������� ��������.")
        wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
	end
   },
  {
   title = "{FFFFFF}����� �������������",
    onclick = function()
	sampSendChat("/d OG, ����� ����� ��������������� ��������.")
        wait(5000)
        sampSendChat("/gov [Medic]: ��������� ������ � ����� ������ �����, ������������� ������� � �����.")
        wait(5000)
        sampSendChat('/gov [Medic]: ����� ��� ��������, ��� �� ��. ����� "Ministry of Health" ������� ��������� ��� ������ �� ���������.')
        wait(5000)
        sampSendChat("/gov [Medic]: ��������� �� ������ �������� �� ��������� ���������: '�������� � ��� ����'.")
        wait(5000)
        sampSendChat("/d OG, ��������� ����� ��������������� ��������.")
        wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
	end
   },   
   {
   title = "{FFFFFF}������ ���. �����",
    onclick = function()
	sampSetChatInputEnabled(true)
	sampSetChatInputText("/d OG, ������� ���.����� �� X. ���������� �� �.")
	end
   },
   {
   title = "{FFFFFF}��������� � ����� ���. �����",
    onclick = function()
	sampSetChatInputEnabled(true)
	sampSetChatInputText("/d OG, ��������� ��� ����� ���.�������� �� X �� MOH.")
	end
   },
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

function fthmenu(id)
 return
{
  {
    title = "{FFFFFF}������������� ������",
    onclick = function()
        sampSendChat("�����������, ������������� �������. ����� ���������� � ������������ ���������������.")
        wait(cfg.commands.zaderjka * 1000) 
        sampSendChat("����� ������������ ��������: ������� ������, ���������� ����� ���������� � ��� �����������.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("����� ������������ ��������� ������������ ������������� � ��������� ���. �����.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b /d �������� 3 ������ � ����.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("���� �������� ����������� � ������������ - �������� ���. ������ ��������� �����..")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat(".. ��� ����������� �� ���� �������������, ��� �������, ���. ��������� � ��� �����.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("�����, ���� �� ���������� � ����� ���������, �� ������� ������ �� �����..")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat(".. ���� ������������� ������, ��� �� �������, � ����� ������������ ����������� � �����.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("������� �������� ��� � ���� �����. �� ������, �� ������.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ����� ��������:")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ��� �����������: /r [�����������]: �������� �� ����: ������.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b �������: /r [�����������]: ����: ����� | ��������: 0.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ��� ������� ���������: /r [�����������]: ����: ����� | ��������: 0 | ��������: �. ����.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ��� ����� � �����: /r [�����������]: ������� ����: ����� | �������: ���.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ��� ������ �������: /r [�����������]: ����� ������� ������ LS.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b �������: /r [�����������]: ���� ������� ������ LS | ��������: 0.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("/b ��� ���������� �������: /r [�����������]: �������� ������� ������ LS.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("�� ������ �� ������ ������� ����� ����� ���������� �����.")
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("���������� ��� ����� ������� ��� � ��� ��������� ��� ����.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("���� ���, ��� ����� ������ �������� � ����������� ������ ������� � �� ������������..") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat(".. �� ����� ��������� � �������������. � ��� ��� � ������ ������.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("� ������ - � ��������� ��� ���� ������..") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat(".. � ���� � �������, � ������ ������������ ������ � �������� ��� ��������.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("�����, �������� �� ������� ���������:") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("����������, �������� ��, ��� ������ ����� �� ��� �������.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("���� ��� ����������� ����� ������ ������ - ��� ����� ����� � � ������ � ����.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("��� ���� ���������, ������� ��������, ����� ��, ��� ��� ���� ������� �������.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("�� � ���������: ��� ����, ����� �������� ���������, ��� ����� ����� ������ ����������.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("����� �� �� ������� ������, ����� �������� ����.") 
        wait(cfg.commands.zaderjka * 1000)
        sampSendChat("�� ���� ���� � ���������� ���� ����������. ������� ������� ������, ����� � ������ ������.")
        wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
    end
  },
  {
    title = "{FFFFFF}������ ������ ��� ������������",
    onclick = function()
       sampSendChat("�����������, �������. ������� � ������ ��� ������ �� ���� ������� ������ ��� ������������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("����� ����� ��������, ��� ������������ ������������ ������������ ����������� ��������� ��� �����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������, ��� ��������� � ��������� ����� ���� ������������� �����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("��� ����� �������� ������� �������� � ������ �������� ����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("����������� � ����� ������ ����� ���������� ��������: ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("����, ������, ������, �������� ������� ����� ������.") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("���������� ���� �� ��� ���, ���� ����� �� ���������� �������� �� ����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("� ������ ��������� ������������ �������� �����������, �� ����������� ����, ���..") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ���� ������������� ���� ���� ������������� �����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������� �������, ��� ��� ����� ����� ������������ ���� ������������� �� ����� ���� �����..") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. � ������ ������ � �� ����� ���� � ��������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("��� ����������� ������������ ������� ���������� ������������ ����� ��������� ��������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. � �������� ��������, ���� ������������� ����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������� �� ��������.")
       wait(1200)
       if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
    end
  },
  {
   title = "{FFFFFF}������ ������ ��� ���������� �����",
    onclick = function()
       sampSendChat("�����������, �������. ������� � ������ ��� ������ �� ���� ������� ������ ��� ���������� �����.")
       wait(cfg.commands.zaderjka * 1000) 
       sampSendChat("��� ���������� �������� ��������������, �������� ����, ��������� ������, �����������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ����� ������ ������. �������� ������ ������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ������ ����� ����� ���������� ������������ ����������� �����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("��� ����� ����������� ������������� �� ���. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("� ����� ��������� ���������� ��������� ����� ������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. � ������������� - ����������, �� �������� ����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("���� ������� �� �������� � �������� ����� 30 �����..") 
       wait(cfg.commands.zaderjka * 1000) 
       sampSendChat(".. ����� ����������� ������� �������-�������� ������ � ���� �����. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("� ���� ������ ���������� ������ ������� ����� � ��������� ������������� � �������� ����������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������� �� ��������.")
       wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
    end
  },
  {
   title = "{FFFFFF}������ ������ ��� ���������",
    onclick = function()
      sampSendChat("�����������, �������. ������� � ������ ��� ������ �� ���� ������� ������ ��� ����������. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("�������� �������������� ��������������� ������� ��������, ���������.. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat(".. ������������� ��������������� �����. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("������� ����� �������: ������ ����, ������������� ������, ��� � ��� �����. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("���������������� ��������� ������ ������������ ������ ��������� ������������: ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("��������� ��������, ���������� �������, ��������������, ��� ��� ���� � ����. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("����� ������� ��������, ����������� �������� ����� � �������� ������ ��������. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("������ ������ ������ ���� ���������� �� ��������� �������������� �����.. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat(".. � ����������� ���������� �������. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("���� ������������ ��������� � ������, ����� ������������ ���������, ��.. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat(".. �������� ����, �������� ���������� ��� �������� ����������� �������� �� ������.")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("�������� ��� ���� � ��� �������� �����, ���������� �� ����� �.. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat(".. ����� ������������� �������� �����, ��������� ���������� �������. ")
      wait(cfg.commands.zaderjka * 1000)
      sampSendChat("������� �� ��������.")
       wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
    end
  },
  {
    title = "{FFFFFF}������ ������ ��� ���������",
    onclick = function()
       sampSendChat("�����������, �������. ������� � ������ ��� ������ �� ���� ������� ������ ��� ����������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("�������� ���������������� �� ������ � �������� �� ������� ������� �����, �� ���������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. � ��� �������� �� ������� �������� ���� �� ��������� � �����.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. �������� � �������� �� ������� ����������� ����.") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("�������� ��������: ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������� ���� � ����� ������, ���������� ����������, �������������� ��������� ����������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ����, �������������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������ ������ ��� ��������� ������ �������� � ����: �������������� ����������� �����..") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ��������� ������������, ��������������� ��������� ����.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ������������� ����������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("�������� ���������� ����� ������� ���������������� � ����������� ���������� ��� ��������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ����������� ������.")
       wait(1200)
		if cfg.main.hud then
        sampSendChat("/time")
        wait(500)
        setVirtualKeyDown(key.VK_F8, true)
        wait(150)
        setVirtualKeyDown(key.VK_F8, false)
		end
    end
  },
  {
    title = "{FFFFFF}������ ������ ��� ���",
    onclick = function()
       sampSendChat("�����������, �������. ������� � ������ ��� ������ �� ���� ������� ������ ��� ��ϻ. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("�������� ������ ������, ���������� ����������� �� ��������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("���������� ���������� �������� � �������� ������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("�������� ������ ������ � ������ ��� - ��������� ����������� ������.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. � ������ ����������� � ������� ������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("���������� ������� ������������� �� ����������, ��������� ���. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("����� ������� ������� ������ ������ � ������������ � ����������� ��������. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������ ��, ��������� ��������� ������������� � ���������� �����.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ������ �� ������, ���� ��� ����� � ������� �����, � �����.. ")
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat(".. ������������ ��������������� ������������� � �������� ����������.") 
       wait(cfg.commands.zaderjka * 1000)
       sampSendChat("������� �� ��������.")
       wait(1200)
		if cfg.main.hud then
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

do

function imgui.OnDrawFrame()
   if first_window.v then
	local tagfr = imgui.ImBuffer(u8(cfg.main.tarr), 256)
	local tagb = imgui.ImBool(cfg.main.tarb)
	local clistb = imgui.ImBool(cfg.main.clistb)
	local autoscr = imgui.ImBool(cfg.main.hud)
	local hudik = imgui.ImBool(cfg.main.givra)
	local clisto = imgui.ImBool(cfg.main.clisto)
	local stateb = imgui.ImBool(cfg.main.male)
	local waitbuffer = imgui.ImInt(cfg.commands.zaderjka)
	local clistbuffer = imgui.ImInt(cfg.main.clist)
    local iScreenWidth, iScreenHeight = getScreenResolution()
	local btn_size = imgui.ImVec2(-0.1, 0)
    imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(7, 3))
    imgui.Begin(u8'���������##1', first_window, btn_size, imgui.WindowFlags.NoResize)
	imgui.PushItemWidth(200)
	imgui.AlignTextToFramePadding(); imgui.Text(u8("������������ �������"))
	imgui.SameLine()
	if imgui.ToggleButton(u8'������������ �������', tagb) then
    cfg.main.tarb = not cfg.main.tarb
    end
	if tagb.v then
	if imgui.InputText(u8'������� ��� ���.', tagfr) then
    cfg.main.tarr = u8:decode(tagfr.v)
    end
	imgui.Text(u8("����-��� ������ ��������"))
	imgui.SameLine()
	if imgui.ToggleButton(u8'��������/��������� ����-���', hudik) then
        cfg.main.givra = not cfg.main.givra
		ftext(cfg.main.givra and '����-��� �������, ���������� ��������� /sethud' or '����-��� ��������')
    end
	end
	imgui.Text(u8("������� ����� �� ��������� ���"))
	imgui.SameLine()
    if imgui.HotKey(u8'##������� ����� ���', config_keys.fastsms, tLastKeys, 100) then
	    rkeys.changeHotKey(fastsmskey, config_keys.fastsms.v)
		ftext('������� ������� ��������. ������ ��������: '.. table.concat(rkeys.getKeysName(tLastKeys.v), " + ") .. ' | ����� ��������: '.. table.concat(rkeys.getKeysName(config_keys.fastsms.v), " + "))
		saveData(config_keys, 'moonloader/config/medictools/keys.json')
	end
	imgui.Text(u8("������������ ���������"))
	imgui.SameLine()
	if imgui.ToggleButton(u8'������������ ���������', clistb) then
        cfg.main.clistb = not cfg.main.clistb
    end
    if clistb.v then
        if imgui.SliderInt(u8"�������� �������� ������", clistbuffer, 0, 33) then
            cfg.main.clist = clistbuffer.v
        end
		imgui.Text(u8("������������ ��������� ����������"))
	    imgui.SameLine()
		if imgui.ToggleButton(u8'������������ ��������� ����������', clisto) then
        cfg.main.clisto = not cfg.main.clisto
        end
    end
	imgui.Text(u8("������� ���������"))
	imgui.SameLine()
	if imgui.ToggleButton(u8'������� ���������', stateb) then
        cfg.main.male = not cfg.main.male
    end
	if imgui.SliderInt(u8'�������� � ������� � ����������(���)', waitbuffer,  4, 10) then
     cfg.commands.zaderjka = waitbuffer.v
    end
	imgui.Text(u8("��������� ������/���.��������"))
	imgui.SameLine()
	if imgui.ToggleButton(u8'��������� ������', autoscr) then
        cfg.main.hud = not cfg.main.hud
    end
    if imgui.CustomButton(u8('��������� ���������'), imgui.ImVec4(0.08, 0.61, 0.92, 0.40), imgui.ImVec4(0.08, 0.61, 0.92, 1.00), imgui.ImVec4(0.08, 0.61, 0.92, 0.76), btn_size) then
	ftext('��������� ������� ���������.', -1)
    inicfg.save(cfg, 'medictools/config.ini') -- ��������� ��� ����� �������� � �������
    end
    imgui.End()
   end
    if ystwindow.v then
                imgui.LockPlayer = true
                imgui.ShowCursor = true
                local iScreenWidth, iScreenHeight = getScreenResolution()
                imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
                imgui.SetNextWindowSize(imgui.ImVec2(iScreenWidth/2, iScreenHeight / 2), imgui.Cond.FirstUseEver)
                imgui.Begin(u8('Medic Tools | ����� MOH'), ystwindow)
                for line in io.lines('moonloader\\medictools\\ystav.txt') do
                    imgui.TextWrapped(u8(line))
                end
                imgui.End()
            end
  if second_window.v then
    imgui.LockPlayer = true
    imgui.ShowCursor = true
    local iScreenWidth, iScreenHeight = getScreenResolution()
    local btn_size1 = imgui.ImVec2(70, 0)
	local btn_size = imgui.ImVec2(130, 0)
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
    imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(7, 5))
    imgui.Begin('Medic Tools | Main Menu | Version: '..thisScript().version, second_window, mainw,  imgui.WindowFlags.NoResize)
	local text = '�����:'
    imgui.SetCursorPosX((imgui.GetWindowWidth() - imgui.CalcTextSize(u8(text)).x)/3)
    imgui.Text(u8(text))
	imgui.SameLine()
	imgui.TextColored(imgui.ImVec4(0.43, 0.65 , 0.44, 2.0), 'Roma Mizantrop')
    imgui.Separator()
	if imgui.Button(u8'������', imgui.ImVec2(50, 30)) then
      bMainWindow.v = not bMainWindow.v
    end
	imgui.SameLine()
    if imgui.Button(u8'��������� �������', imgui.ImVec2(120, 30)) then
      first_window.v = not first_window.v
    end
    imgui.SameLine()
    if imgui.Button(u8 '�������� �� ������/����', imgui.ImVec2(170, 30)) then os.execute('explorer "https://vk.com/ortemelyan"')
    btn_size = not btn_size
    end
	imgui.SameLine()
    if imgui.Button(u8'������������� ������', imgui.ImVec2(150, 30)) then
      showCursor(false)
      thisScript():reload()
    end
    if imgui.Button(u8 '��������� ������', imgui.ImVec2(120, 30), btn_size) then
      showCursor(false)
      thisScript():unload()
    end
	imgui.SameLine()
    if imgui.Button(u8'������', imgui.ImVec2(55, 30)) then
      helps.v = not helps.v
    end
	imgui.Separator()
	imgui.BeginChild("����������", imgui.ImVec2(410, 150), true)
	imgui.Text(u8 '��� � �������:   '..sampGetPlayerNickname(myid):gsub('_', ' ')..'')
	imgui.Text(u8 '���������:') imgui.SameLine() imgui.Text(u8(rank))
	imgui.Text(u8 '����� ��������:   '..tel..'')
	if cfg.main.tarb then
	imgui.Text(u8 '��� � �����:') imgui.SameLine() imgui.Text(u8(cfg.main.tarr))
	end
	if cfg.main.clistb then
	imgui.Text(u8 '����� ��������:   '..cfg.main.clist..'')
	end
	imgui.EndChild()
	imgui.Separator()
	imgui.SetCursorPosX((imgui.GetWindowWidth() - imgui.CalcTextSize(u8("������� ����: %s")).x)/1.5)
	imgui.Text(u8(string.format("������� ����: %s", os.date())))
    imgui.End()
  end
  	if infbar.v then
                _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
                imgui.SetNextWindowPos(imgui.ImVec2(cfg.main.posX, cfg.main.posY), imgui.ImVec2(0.5, 0.5))
                imgui.SetNextWindowSize(imgui.ImVec2(cfg.main.widehud, 180), imgui.Cond.FirstUseEver)
                imgui.Begin('����� ����� ���-�� �����!', infbar, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar) 
                imgui.CentrText(u8'����� ����� ���-�� �����!') 
                imgui.Separator()
                imgui.End()
    end
    if helps.v then
                local iScreenWidth, iScreenHeight = getScreenResolution()
                imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(3, 7))
                imgui.Begin(u8 '������ �� �������', helps, imgui.WindowFlags.NoResize, imgui.WindowFlags.NoCollapse)
				imgui.BeginChild("������ ������", imgui.ImVec2(525, 385), true, imgui.WindowFlags.VerticalScrollbar)
                imgui.TextColoredRGB('{FF0000}/mt{CCCCCC} - ������� ���� �������')
                imgui.Separator()
                imgui.TextColoredRGB('{FF0000}/vig [id] [�������]{CCCCCC} - ������ ������� �� �����')
                imgui.TextColoredRGB('{FF0000}/dmb{CCCCCC} - ������� /members � �������')
                imgui.TextColoredRGB('{FF0000}/yst{CCCCCC} - ������� ����� MOH')
				imgui.TextColoredRGB('{FF0000}/smsjob{CCCCCC} - ������� �� ������ ���� ��.������ �� ���')
                imgui.TextColoredRGB('{FF0000}/dlog{CCCCCC} - ������� ��� 25 ��������� ��������� � �����������')
				imgui.TextColoredRGB('{FF0000}/cchat{CCCCCC} - ������� ���')
				imgui.TextColoredRGB('{FF0000}/blag [��] [�������] [���]{CCCCCC} - �������� ������ ������������� � �����������')
				imgui.TextColoredRGB('{FF0000}/nick [id] [0-1]{CCCCCC} - �������� ��� ������ �� ��� id. �������� 0 �������� �����, 1 �������� ����� ���')
				imgui.Separator()
                imgui.TextColoredRGB('�������: ')
                imgui.TextColoredRGB('{FF0000}���+Z �� ������{CCCCCC} - ���� ��������������')
                imgui.TextColoredRGB('{FF0000}F2{CCCCCC} - "������� ����"')
				imgui.EndChild()
                imgui.End()
    end
    if updwindows.v then
                local updlist = ttt
                imgui.LockPlayer = true
                imgui.ShowCursor = true
                local iScreenWidth, iScreenHeight = getScreenResolution()
                imgui.SetNextWindowPos(imgui.ImVec2(iScreenWidth / 2, iScreenHeight / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
                imgui.SetNextWindowSize(imgui.ImVec2(700, 330), imgui.Cond.FirstUseEver)
                imgui.Begin(u8('Medic Tools | ����������'), updwindows, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize)
                imgui.Text(u8('����� ���������� ������� Medic Tools �� ������ '..updversion..'. ��� �� ���������� ������� ������ �����.'))
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

function showHelp(param) -- "��������" ��� �������
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(imgui.GetFontSize() * 35.0)
        imgui.TextUnformatted(param)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
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
		local fa = io.open("moonloader/config/medictools/keys.json", "w")
        if fa then
            fa:write(encodeJson(config_keys))
            fa:close()
        end
	end
end

addEventHandler("onWindowMessage", function (msg, wparam, lparam)
	if msg == wm.WM_KEYDOWN or msg == wm.WM_SYSKEYDOWN then
		if tEditData.id > -1 then
			if wparam == key.VK_ESCAPE then
				tEditData.id = -1
				consumeWindowMessage(true, true)
			elseif wparam == key.VK_TAB then
				bIsEnterEdit.v = not bIsEnterEdit.v
				consumeWindowMessage(true, true)
			end
		end
	end
end)

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
        if cfg.main.tarb then
            sampSendChat(string.format('/r [%s]: %s', cfg.main.tarr, pam))
        else
            sampSendChat(string.format('/r %s', pam))
        end
    else
        ftext('������� /r [�����]')
    end
end
function f(pam)
    if #pam ~= 0 then
        if cfg.main.tarb then
            sampSendChat(string.format('/f [%s]: %s', cfg.main.tarr, pam))
        else
            sampSendChat(string.format('/f %s', pam))
        end
    else
        ftext('������� /f [�����]')
    end
end
function ftext(message)
    sampAddChatMessage(string.format('%s %s', ctag, message), 0x008B8B)
end

function mt()
  if frac == 'Hospital' then
  second_window.v = not second_window.v
  else
  ftext('�������� �� �� �������� � MOH {ff0000}[ctrl+R]')
  end
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
        title = "{ffffff}� �������",
        onclick = function()
        pID = tonumber(args)
        submenus_show(medicmenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
	  {
        title = "{ffffff}� �����",
        onclick = function()
        pID = tonumber(args)
        submenus_show(gorlomenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
      {
        title = "{ffffff}� ��������",
        onclick = function()
        pID = tonumber(args)
        submenus_show(nawmenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
      {
        title = "{ffffff}� ����������������",
        onclick = function()
        pID = tonumber(args)
        submenus_show(narkomenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
      {
        title = "{ffffff}� ���� ��������, �������, ���������",
        onclick = function()
        pID = tonumber(args)
        submenus_show(renmenu(id), "{008B8B}Medic Tools {ffffff}| {"..color.."}"..sampGetPlayerNickname(id).."["..id.."] ")
        end
      },
    }
end

function gorlomenu(args)
    return
    {
      {
        title = '{ffffff}� �����������',
        onclick = function()
          sampSendChat("������������, ��� ��� ���������?")
		end
      },
      {
        title = '{ffffff}� ������ �����',
        onclick = function()
        sampSendChat("������, �������� ���.")
        wait(4000)
        sampSendChat("/me �������� �����")
        wait(4000)
        sampSendChat("/me ������ �������")
        wait(4000)
        sampSendChat("/me ����� ����������� ��������")
        wait(4000)
        sampSendChat("/do ��������� � ����.")
        wait(4000)
        sampSendChat("/me ��������� ����� ������������� �����������")
        wait(4000)
        sampSendChat("/heal "..id)
        wait(4000)
        sampSendChat("�������� ���, �� �������.") 
		end
      }
    }
end

function narkomenu(args)
    return
    {
      {
        title = '{ffffff}� �����������',
        onclick = function()
        local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        local myname = sampGetPlayerNickname(myid)
        sampSendChat("������������. � �������� "..myname:gsub('_', ' ').."")
        wait(4000)
        sampSendChat("��������� ������ �� ���������������� ���������� 10.000$.")
		end
      },
      {
        title = '{ffffff}� ������ ������',
        onclick = function()
        sampSendChat("�������������� �� ������� � ��������� �����.")
        wait(5000)
        sampSendChat("/do ����� � ����.")
        wait(4000)
        sampSendChat("/me ���� ����� ��������� ���.������� � ��������� ����� ����")
        wait(4000)
        sampSendChat("/me ������� ���� �� ���� ��������, ����� ���� ���� �������� ")
        wait(4000)
        sampSendChat("/me ���� ���� � �������� ����� � ����� �����")
        wait(4000)
        sampSendChat("/healaddict "..id" [10000]")
        wait(4000)
        sampSendChat("����� ���������� ������� ������ ����������� ������������� �������� ������������� ���������")
        wait(4000)
        sampSendChat("����� �������.") 
		end
      }
    }
end

function renmenu(args)
    return
    {
      {
        title = '{5b83c2}� ������ �������� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� ������������� �������',
        onclick = function()
        sampSendChat("�������� �� ������� � ������ ������.")
        wait(4000)
        sampSendChat("/me ������� ������������� �������")
        wait(4000)
        sampSendChat("/do ������������� ������� �������.")
        wait(4000)
        sampSendChat("/me ������ ������������� ��������� �� ������������� �������")
        wait(4000)
        sampSendChat("/me ������������� ������")
        wait(4000)
        sampSendChat("/try ��������� �������") 
		end
      },
      {
        title = '{5b83c2}� ���� � �������� ������� ����������� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� ������� �����������',
        onclick = function()
        sampSendChat("�������� �� �������.")
        wait(4000)
        sampSendChat("/me ���� �� ����� �������� � ����� ��")
        wait(4000)
        sampSendChat("/do ������������� ������� �������.")
        wait(4000)
        sampSendChat("/me ���� ����� � ��������������, ����� ���� ��������� ������������ �������")
        wait(4000)
        sampSendChat("/me ������ ��������� ������������� �������")
        wait(4000)
        sampSendChat("/me ���������� �������� ��������")
        wait(4000)
        sampSendChat("/me �������� ���� ����� �����, ����� ���� ���� �������� �������")
        wait(4000)
        sampSendChat("/me ������� ����, ����� ���� ������������ �������")
        wait(4000)
        sampSendChat("��������� ����� �����. ����� �������!")
        wait(4000)
        sampSendChat("/me ���� �������� � ������ �� � ���� ����� �����") 
		end
      },
      {
        title = '{5b83c2}� ���� � �������� ������� ������������/����� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� ������� ������������/�����',
        onclick = function()
        sampSendChat("/me ��������� ����� ������������� �� ������������ ����")
        wait(4000)
        sampSendChat("/me ���� �� ����� �������� � ����� ��")
        wait(4000)
        sampSendChat("/me ��������� ������������� � ����������")
        wait(4000)
        sampSendChat("/me ������� ����� ������� � ��������� ���� �� ���� ��������")
        wait(4000)
        sampSendChat("/me ����������� ���� ��������")
        wait(4000)
        sampSendChat("/do ������ �������� �����������, ������� ������� ��������.")
        wait(4000)
        sampSendChat("/me ������ ��������� � ������")
        wait(4000)
        sampSendChat("/me � ������� ��������� ������������ �������� ��������� ������������� �������")
        wait(4000)
        sampSendChat("/me ������ �� �������� ����������� ������")
        wait(4000)
        sampSendChat("/me ������������ ������������ ������� � ������� �������")
        wait(4000)
        sampSendChat("/me ���� �������� � ������ �� � ���� ����� �����")
        wait(4000)
        sampSendChat("/me ����� � ��������� ��������� ������� ��������������")
        wait(4000)
        sampSendChat("/do ������ ��������� �����, ������� ������ � ��������.") 
		end
      },
      {
        title = '{5b83c2}� ���� � �������� �������� ����� �',
        onclick = function()
        end
      },
      {
        title = '{ffffff}� �������� �����',
        onclick = function()
        sampSendChat("/me ���� �� ����� �������� � ����� ��")
        wait(4000)
        sampSendChat("/me ������ ������ ��������")
        wait(4000)
        sampSendChat("/me ��������� ������� ������� ������ � ��������")
        wait(4000)
        sampSendChat("/me ��������� ������������ �������")
        wait(4000)
        sampSendChat("/me ������ �� ���. ����� ���� � ������� ��� ������ �����������")
        wait(4000)
        sampSendChat("/me �������� ������������� ����������� �� �����")
        wait(4000)
        sampSendChat("/me ���� ����������� ���� � ����")
        wait(4000)
        sampSendChat("/me ����� ����������� ����� � �������� �����")
        wait(4000)
        sampSendChat("/me ������ ����� � ����� ����� ������")
        wait(4000)
        sampSendChat("/me ������� ���� � ���� � �������")
        wait(4000)
        sampSendChat("/me ���� ����, ���� ����� � ������������ ������������ ������� ����")
        wait(4000)
        sampSendChat("�� ������� �������, �������� ���, �� �������.")
        wait(4000)
        sampSendChat("/me ����� � ��������� ��������� ������� ��������������") 
		end
      },
    }
end


function nawmenu(args)
    return
    {
      {
        title = '{ffffff}� ��������� ����� ��������',
        onclick = function()
        sampSendChat("/me ������ �������")
        wait(4000)
        sampSendChat("/me ������ �� ������� ����� � ��������")
        wait(4000)
        sampSendChat("/me ��������� ����� ���������, ����� ���� ������ � ���� �������������")
        wait(4000)
        sampSendChat("/me ����� ������ ������ ����")
        wait(4000)
        sampSendChat("�� ����������, � ��� �������� � �������.")
        wait(4000)
        sampSendChat("������ �� �������� ��� � ��������, ��� ���������� � �������� ������� ������.") 
		end
      }
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

function medicmenu(id)
    return
    {
      {
        title = '{ffffff}� �����������.',
        onclick = function()
        sampSendChat("������������, ��� ��� ���������?") 
		end
      },
      {
        title = '{ffffff}� ���� ��������',
        onclick = function()
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
        sampSendChat("������, ������ � ��� ������")
		wait(4000)
		sampSendChat("/me ������ �������")
		wait(4000)
		sampSendChat("/me ����� ����������� ��������")
		wait(4000)
		sampSendChat("/do ������� � ����")
		wait(4000)
		sampSendChat("/me ������� �������� ��������� � ��� ������ �����")
		wait(4000)
		sampSendChat("/heal "..id)
		wait(4000)
		sampSendChat("�������� ���, �� �������")                                        		
        end
      }
    }
end

function ystf()
    if not doesFileExist('moonloader/medictools/ystav.txt') then
        local file = io.open("moonloader/medictools/ystav.txt", "w")
        file:write(fpt)
        file:close()
        file = nil
    end
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
	downloadUrlToFile('https://raw.githubusercontent.com/Misanthrope123/myprojec/master/updatemedic.json', fpath, function(id, status, p1, p2)
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
                    else
                        ftext('���������� ������� �� ����������. �������� ����.', -1)
                        update = false
				    end
			    end
		    end
	    end
    end)
end


function smsjob()
  if rank == '��������' or rank == '������' or rank == '���.����.�����' or rank == '����.����' then
    lua_thread.create(function()
        vixodid = {}
		status = true
		sampSendChat('/members')
        while not gotovo do wait(0) end
        wait(1200)
        for k, v in pairs(vixodid) do
            sampSendChat('/sms '..v..' �� ������, � ��� ���� 15 �����, ����� ������� �� ������. ����� ��������� ���������/����������')
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

function sampev.onSendSpawn()
    pX, pY, pZ = getCharCoordinates(playerPed)
    if cfg.main.clistb and getDistanceBetweenCoords3d(pX, pY, pZ, 2337.3574,1666.1699,3040.9524) < 20 then
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
        if cfg.main.clistb then
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
    if text:find('������� ���� �������') and color ~= -1 then
        rabden = false
    end
	if text:find('�� ������� (.+) �� �����������. �������: (.+)') then
        local un1, un2 = text:match('�� ������� (.+) �� �����������. �������: (.+)')
		lua_thread.create(function()
		wait(3000)
		if cfg.main.tarb then
        sampSendChat(string.format('/r [%s]: %s - ������(�) �� ������� "%s".', cfg.main.tarr, un1:gsub('_', ' '), un2))
        else
		sampSendChat(string.format('/r %s - ������(�) �� ������� "%s".', un1:gsub('_', ' '), un2))
		end
		end)
    end
	if text:find('�������(- �) ������������� (.+)') then
        local inv1 = text:match('�������(- �) ������������� (.+)')
		lua_thread.create(function()
		wait(5000)
		if cfg.main.tarb then
        sampSendChat(string.format('/r [%s]: ����� ��������� ��������� - %s. ����� ����������.', cfg.main.tarr, inv1:gsub('_', ' ')))
        else
		sampSendChat(string.format('/r ����� ��������� ��������� - %s. ����� ����������.', inv1:gsub('_', ' ')))
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
	if status then
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
end