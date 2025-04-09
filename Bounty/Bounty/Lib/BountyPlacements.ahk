#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk


global file_path := A_ScriptDir "\Lib\UnitPlacements\BountyPlacements.txt"

width := 530
height := 390

PlacementGUI := Gui("+AlwaysOnTop")

PlacementGUI.SetFont("s20 bold", "Segoe UI")
PlacementGUI.Add("Text", "x0 w" width " cWhite +Center", "Unit Placements")

; Slot 1
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x40 y50 w200 h150 c501126 +Center", "Slot 1")
PlacementGUI.SetFont("s10", "Segoe UI")
PlacementGUI.Add("Text", "x50 y90 cWhite", "Unit Name:")
global Slot1Name := PlacementGUI.Add("Edit", "x50 y110 w160", "")
PlacementGUI.Add("Text", "x50 y140 cWhite", "Placement:")
global Slot1Placement := PlacementGUI.Add("DropDownList", "x50 y160 w160", [1, 2, 3, 4, 5])
Slot1Placement.Choose(1)

; Slot 2
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x280 y50 w200 h150 c501126 +Center", "Slot 2")
PlacementGUI.SetFont("s10", "Segoe UI")
PlacementGUI.Add("Text", "x290 y90 cWhite", "Unit Name:")
global Slot2Name := PlacementGUI.Add("Edit", "x290 y110 w160", "")
PlacementGUI.Add("Text", "x290 y140 cWhite", "Placement:")
global Slot2Placement := PlacementGUI.Add("DropDownList", "x290 y160 w160", [1, 2, 3, 4, 5])
Slot2Placement.Choose(1)

; Slot 3
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x40 y220 w200 h150 c501126 +Center", "Slot 3")
PlacementGUI.SetFont("s10", "Segoe UI")
PlacementGUI.Add("Text", "x50 y260 cWhite", "Unit Name:")
global Slot3Name := PlacementGUI.Add("Edit", "x50 y280 w160", "")
PlacementGUI.Add("Text", "x50 y310 cWhite", "Placement:")
global Slot3Placement := PlacementGUI.Add("DropDownList", "x50 y330 w160", [1, 2, 3, 4, 5])
Slot3Placement.Choose(1)

; Slot 4
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x280 y220 w200 h150 c501126 +Center", "Slot 4")
PlacementGUI.SetFont("s10", "Segoe UI")
PlacementGUI.Add("Text", "x290 y260 cWhite", "Unit Name:")
global Slot4Name := PlacementGUI.Add("Edit", "x290 y280 w160", "")
PlacementGUI.Add("Text", "x290 y310 cWhite", "Placement:")
global Slot4Placement := PlacementGUI.Add("DropDownList", "x290 y330 w160", [1, 2, 3, 4, 5])
Slot4Placement.Choose(1)

; Save Button
PlacementGUI.SetFont("s12 bold", "Segoe UI")
SavePlacementbttn := PlacementGUI.Add("Button", "x50 y15 w120 +BackgroundTrans +Center", "Save")
SavePlacementbttn.OnEvent("Click", (*) => SavePlacementsBounty())

PlacementGUI.BackColor := "09011b"
PlacementGUI.MarginX := 20
PlacementGUI.MarginY := 20


SavePlacementsBounty() {
    file_path := A_ScriptDir "\Lib\UnitPlacements\BountyPlacements.txt"
    dir_path := A_ScriptDir "\Lib\UnitPlacements"

    if !DirExist(dir_path) {
        MsgBox("Error: Directory does not exist: " dir_path)
        return
    }

    text := ""
    Loop 4 { ; Loop through all 4 slots
        slot := "Slot" A_Index
        text .= slot "|" %slot%Name.Value "|" %slot%Placement.Value "`n"
    }

    try {
        FileDelete(file_path)
        FileAppend(text, file_path, "UTF-8")
    } catch {
        MsgBox("Error writing to file: " file_path)
    }

    AddToLog("Placement data saved successfully.")
}


LoadAndUpdateUnitsBounty(ingame) {
    global GeneralSlotTeam, Slot1Name, Slot1Placement
    global Slot2Name, Slot2Placement
    global Slot3Name, Slot3Placement
    global Slot4Name, Slot4Placement

    file_path := A_ScriptDir "\Lib\UnitPlacements\BountyPlacements.txt"

    if !FileExist(file_path) {
        MsgBox("No saved data found. Using default values.")
        return
    }

    
    data := Map()
    dataLines := StrSplit(FileRead(file_path), "`n", "`r")

    for line in dataLines {
        if (Trim(line) = "") {
            continue
        }

        parts := StrSplit(line, "|")
        slot := StrLower(parts[1])  

        data[slot] := Map()
        data[slot]["Name"] := parts[2]
        data[slot]["Placement"] := parts[3]
    }

    

    ; Update GeneralSlotTeam
    for slotKey, slotData in GeneralSlotTeam {
        normalizedKey := StrLower(slotKey)  
        if data.Has(normalizedKey) {
            slotData["name"] := data[normalizedKey]["Name"]
            slotData["Placement"] := data[normalizedKey]["Placement"]
        } else {
            AddToLog("No data found for Slot: " slotKey)
        }
    }

    
    if data.Has("slot1") {
        Slot1Name.Value := data["slot1"]["Name"]
        Slot1Placement.Value := data["slot1"]["Placement"]
    }

    if data.Has("slot2") {
        Slot2Name.Value := data["slot2"]["Name"]
        Slot2Placement.Value := data["slot2"]["Placement"]
    }

    if data.Has("slot3") {
        Slot3Name.Value := data["slot3"]["Name"]
        Slot3Placement.Value := data["slot3"]["Placement"]
    }

    if data.Has("slot4") {
        Slot4Name.Value := data["slot4"]["Name"]
        Slot4Placement.Value := data["slot4"]["Placement"]
    }
    if (ingame) {
        AddToLog("Loaded placement data from file.")
    }
}

BountyPlacementSettingUI() {
    LoadAndUpdateUnitsBounty(false)
    PlacementGUI.Show("w" width " h" height)
}





; CREDIT TO s.isme (Discord)