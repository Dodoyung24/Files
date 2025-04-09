#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\SpeedPlacements.ahk

SendMode "Event"




VoteStart() {
    BetterClick(365, 120)
}

CheckPlacements(unitName, Current) {
    global GeneralSlotTeam
    uPlacements := GeneralSlotTeam[unitName]["Placement"]
    if (uPlacements >= Current) {
        return true
    } else {
        return false
    }
}





EnsureUpgrade(mapName,unitName,Coord,Upgrade) {
    
    pos := MapCoords[mapName][unitName]["Coord"][Coord]
    Level := UpgradeLevels[Upgrade]
    if GeneralSlotTeam.Has(unitName) {  
        slotName := GeneralSlotTeam[unitName]["name"]  
    } else {  
        slotName := MapCoords[mapName][unitName]["name"]  
    }

    if PlacedUnit() {
        if (FindText(&X, &Y, 522, 261, 586, 290,0.2,0, Levels[Upgrade])) {
            if (Upgrade == unitmaxed) {
                AddToLog("Upgraded " slotName " (" Coord ")" " to Max ")
            }
            else {
                AddToLog("Upgraded " slotName " (" Coord ")" " to upgrade " Level)
            }

            sleep 50
            BetterClick(NeuX,NeuY)
            return true

        } else {
            sleep 50
            SendInput("t")
            BetterClick(NeuX, NeuY)
            SendInput("{q}")
        }
    } else {
        ClickMethod("Left", pos[1], pos[2])
        sleep 50
        
    }
    Sleep 350
} 



PriorityChange(mapName, unitName, coord, times) {
    pos := MapCoords[mapName][unitName]["Coord"][coord]
    Loop {
        if (PlacedUnit()) {
            Loop times {
                SendInput("r")
                Sleep 500
            }

            AddToLog("Change " unitName "'s priority target to " Priority[times + 1])
            Sleep 1000
            ClickMethod("Left", 594, 422)
            return true
        }
        ClickMethod("Left", pos[1], pos[2])
        Sleep 300
    }
}



EnsurePlacement(mapName,unitName, coord) {
    sleep 50
    SendInput("{q}")
    sleep 50
    pos := MapCoords[mapName][unitName]["Coord"][coord]
    if GeneralSlotTeam.Has(unitName) {
        slotNumber := GeneralSlotTeam[unitName]["slot"]  ; Get the slot number from GeneralSlotTeam
        slotName := GeneralSlotTeam[unitName]["name"]  ; Get the name from GeneralSlotTeam
    } else {
        slotNumber := MapCoords[mapName][unitName]["slot"]  ; Fallback to MapCoords for slot number
        slotName := MapCoords[mapName][unitName]["name"]  ; Fallback to MapCoords for name
    }
    sleep 50
    PlaceUnit(pos[1], pos[2], slotNumber)
     sleep 300
    if PlacedUnit() {
        AddToLog("Placed " slotName " (" Coord ")")
        SendInput("q")
        sleep 100
        BetterClick(NeuX, NeuY)
        return true
    } 
    sleep 300
}

Sell(mapName,unitName, coord) {
    BetterClick(NeuX, NeuY)
    pos := MapCoords[mapName][unitName]["Coord"][coord]
    Loop 5 {
        if (FindText(&Xe, &Ye, 83 - 300, 458 - 300, 83 + 300, 458 + 300, 0, 0, CheckPlaced)) {
            SendInput("x")
            Sleep 1000
            return true
        } else {
            ClickMethod("Left", pos[1], pos[2])
        }
        Sleep 300
    }
}

Challengetime() {
    Minutes := A_Min

    if ((Minutes >= 0 && Minutes <= 5) || (Minutes >= 30 && Minutes <= 35)) {
        return true 
    }
    else {
        return false 
    }
}



PlacedUnit() {
    sleep 400
    if (ok:=FindText(&X, &Y, 357, 445, 406, 468, 0.2, 0.1, CheckPlaced)) {
        return true 
    
}

    return false 
}


ClickMethod(button, x, y, clickDelay := 0) {
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick("Left", -1, 0, , , , "R")
}

BetterPlace(X,Y,slot) {
    SendInput(slot)
    sleep 350
    BetterClick(X,Y)
    Sleep 150
    SendInput("q")
}
LookDown() {
    BetterClick(700, 299)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 1000
    SendInput(Format("{Click {} {} Left}", 427, 315+150))
	Sleep 1000
    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}


PlaceUnit(x, y, slot) {
    sleep 100
    Send(slot)
    Sleep 600
    clickmethod("Left", x, y)
}

	
BetterClickX(x,y,count,delay) {
    loop count {
        BetterClick(x,y)
        sleep delay
        break
    }
}


resetGui(){
    global CardData
    CardData := Map(  ; Use a map for fast lookup
       "wins", 0,
       "runs", 0

    )
}





StartupSound() {
CmdLine := DllCall("GetCommandLine", "Str")

; Check if the script was started with the /restart parameter
if !InStr(CmdLine, " /restart") {
StartSound := A_ScriptDir "\Lib\Sounds\StartSound.mp3"
SoundPlay(StartSound)

 }
 }

InitiateWebhook(MatchStat) {
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        SendWebhook(MatchStat)
    }
}

StopMacro() {
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        ;EndWebhook()
    } 
    Reload()
}

BetterClick(x, y) {                     ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)

}

WebhookLog() {
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        TextWebhook()
    } 
}

SpecSpeed2() {
    BetterClick(229, 410)
    sleep 500
    BetterClickX(326, 508,4,700)
    sleep 700
    BetterClick(404, 574)
}



