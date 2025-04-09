#Requires AutoHotkey v2.0 
#Include %A_ScriptDir%\Lib\BountyPlacements.ahk
#Include %A_ScriptDir%\Lib\LoadAndSaveGui.ahk




Wins := 0
runs := 0
Rerolls := 0
gems := 0
globalGems := 0
globalRerolls := 0
InfRuns := 0
ChallengesWon := 0
EssenceStones := 0
StatChips := 0

global CurrentMode := ""

MacroName := "Bounty Macro"
discord_link := "https://discord.gg/YTAAf4s6xX"
current_version := "1.0.5"


Jeff := "Lib\Images\Jeff.png"
Close := "Lib\Images\Close.png"
Minimize := "Lib\Images\minimize.png"
DiscordLogo :=  "Lib\Images\Discord-Logo.png"

guideText := "f1 - Align Roblox`nf2 - Run Macro`nf3 - Reload Macro`nf4 - Pause Macro"
lastlog := ""


JeffGui := Gui("-Caption +Border +AlwaysOnTop", "Bounty macro")
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")
JeffGui.BackColor := "09011b"

JeffGui.Add("Picture", "x1200 y10 w60 h60 +BackgroundTrans cffffff",Jeff)
Discord := JeffGui.Add("Picture", "x1110 y10 w89 h50 +BackgroundTrans cffffff",DiscordLogo)
Discord.OnEvent("Click", (*) => OpenDiscord())

;close button
CloseBttn := JeffGui.Add("Picture", "x1340 y10 w50 h50 +BackgroundTrans cffffff", Close)
CloseBttn.OnEvent("Click", (*) => ExitApp())

MinimizeBttn := JeffGui.Add("Picture", "x1274 y-5 w60 h90  +BackgroundTrans cffffff" , Minimize)
MinimizeBttn.OnEvent("Click", (*) => MinimizeGUI())

JeffGui.AddProgress("c0x7e4141 x308 y27 w800 h598", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", JeffGui)


OwnerName := JeffGui.Add("Text", "x20 y15 w270 h20 cffffff +Center", "Dodo's Macro")
OwnerName.SetFont("s12 bold cf2ebe2", "Georgia")
; Map
JeffGui.Add("GroupBox","x20 y40 w270 h80 c4d1507 +Center","Map")
MapLog := JeffGui.Add("Text", "x35 y70 w240 h20 cf2ebe2 +Center", "Map: ")

; ---------------------------------------------------------------

;Statistic
JeffGui.Add("GroupBox","x20 y140 w270 h210 c4d1507 +Center","Bounty statistics")

;Wins
WinsLog := JeffGUI.Add("Text", "x35 y158 w238 h300 r13 cf2e7e2 +BackgroundTrans +Center", "Bounty Wins: " Wins "/" runs)
WinsLog.SetFont("s17")

ChallengeWins := JeffGUI.Add("Text", "x35 y185 w238 h300 r13 cf2e7e2 +BackgroundTrans +Center", "Challenge Wins: " ChallengesWon)
ChallengeWins.SetFont("s17")
;-----
;Current earned rewards
CurrentText := JeffGui.Add("Text", "x-25 y217 w238 r13 cf2ebe2 +BackgroundTrans +Center", "Current")
CurrentText.SetFont("s14")
RewardsLog := JeffGUI.Add("Text", "x-25 y245 w238 h300 r7 cf2ebe2 +BackgroundTrans +Center","Gems: " gems "`nRerolls: " Rerolls)
RewardsLog.SetFont("s12")

;------
;all time rewards
TotalText := JeffGui.Add("Text", "x90 y217 w210 r13 cf2ebe2 +BackgroundTrans +Center", "Total")
TotalText.SetFont("s14")
AllTimeRewards := JeffGUI.Add("Text", "x90 y245 w238 h300 r7 cf2ebe2 +BackgroundTrans +Center", "Gems: " FormatNumber(globalGems) "`nRerolls: " FormatNumber(globalRerolls))
AllTimeRewards.SetFont("s12") 
;------

;inf runs
InfinityRuns := JeffGUI.Add("Text", "x35 y286 w238 h300 r7 cf2ebe2 +BackgroundTrans +Center", "Infinity runs: " InfRuns)
InfinityRuns.SetFont("s13") 

EssenceStonesReward := JeffGUI.Add("Text", "x35 y305 w238 h300 r7 cf2ebe2 +BackgroundTrans +Center", "Essence Stones: " EssenceStones)
StatChipsReward := JeffGUI.Add("Text", "x35 y325 w238 h300 r7 cf2ebe2 +BackgroundTrans +Center", "Stat Chips: " StatChips)



;Logs -----------------------------------------------------------
JeffGui.Add("GroupBox","x20 y360 w270 h265 c4d1507 +Center","Logs")
ActivityLogs := JeffGui.Add("Text", "x35 y390 w240 h210 c96d0ff +Center", "Macro Launch")

; ---------------------------------------------------------------

; Macro Name
JeffGui.SetFont("s16 bold cFFFFFF", "Consolas")
JeffGui.Add("Text", "x1130 y90 w250 h30 c9eb3a8 +Center", MacroName)
JeffGui.SetFont("s12 bold cFFFFFF", "Consolas")

; ---------------------------------------------------------------





;Current version
JeffGui.Add("GroupBox","x1130 y140 w250 h70 c4d1507 +Center","Current version")
Version := JeffGui.Add("Text", "x1140 y170 w230 h20 cf2ebe2 +Center", current_version)

; ---------------------------------------------------------------

;Settings
JeffGui.Add("GroupBox","x1130 y230 w250 h200 c4d1507 +Center","Settings")


PlacementBttn := JeffGui.Add("Button","x1140 y260 w230 h30 cffffff +BackgroundTrans +Center", "Placement settings")
PlacementBttn.OnEvent("Click",(*)=>BountyPlacementSettingUI())
PlacementBttn.Visible := true


;------------


WebhookBttn := JeffGui.Add("Button","x1140 y300 w230 h30 cffffff +BackgroundTrans +Center", "Webhook settings")
WebhookBttn.OnEvent("Click",(*)=>WebhookSettingsUI())

SettingsCheck := JeffGUI.Add("Text", "x1150 y350 w150 h80 	cf2ebe2 +BackgroundTrans + Center", "Check settings")
SettingsCheck.SetFont("s12")
CheckSettingsButton := JeffGUI.Add("Checkbox", "x1300 y350 w30",)
CheckSettingsButton.OnEvent("Click", (*) => SaveState())

ChallengeSettings := JeffGui.Add("Button", "x1260 y390 w100 h24 cf2ebe2 +BackgroundTrans +Center", "Other settings")
ChallengeSettings.SetFont("s10 bold", "Segoe UI")
ChallengeSettings.OnEvent("Click", (*) => ChallengeSettingsUI())
;------------------------- 

GameModes := JeffGui.Add("DropDownList","x1140 y390 w80 h110 cFFFFFF +Center", ["Bounty", "Infinity"])
GameModes.SetFont("s9")
GameModes.OnEvent("Change", (*) => ChangeGameModes())





;Guide ---------------------------
JeffGui.Add("GroupBox","x1130 y450 w250 h175 c4d1507 +Center","Guide")
Guide := JeffGui.Add("Text", "x1180 y500 h90 w170 cf2ebe2 -Center",guideText)



JeffGui.Show("x27 y15 w1400 h665")




    ChallengeSettingUI := Gui("+AlwaysOnTop")
    
    ChallengeSettingUI.BackColor := "09011b"
    ;------------------
    SkipChallengeText := ChallengeSettingUI.Add("Text", "x-10 y20 w230 h50 cffffff +Center", "Skip Essence Challenge?")
    SkipChallengeText.SetFont("s10 bold", "Segoe UI")

    SkipButtonEssence := ChallengeSettingUI.Add("Checkbox", "x185 y20 w20 h20 cffffff +Center")
    SkipButtonEssence.OnEvent("Click", (*) => SaveSkipEssence()) 



















MinimizeGUI() {
    WinMinimize("Bounty macro")
}

OpenDiscord(){
    Run(discord_link)
}

AddToLog(text){
    global lastlog
    
    SendActivityLogsStatus := FileRead(SendActivityLogsFile, "UTF-8")
    ActivityLogs.Value := text "`n" ActivityLogs.Value
    if FileExist(SendActivityLogsFile) && (SendActivityLogsStatus = "1") {
        lastlog := text
        WebhookLog()
        
        
    } 
    
}

ChallengeSettingsUI() {
    ChallengeSettingUI.Show("w250 h75")
     
}



UpdateFail(){
    global runs 
    runs++
    WinsLog.Value := "Wins: " Wins "/" runs
}

UpdateChallengeStats() {
    global ChallengesWon, CurrentChallenge, StatChips, EssenceStones

    ChallengesWon++

    ;Update the rewards
    if (CurrentChallenge == "Essence Stone") {
        EssenceStones := EssenceStones + 8 ;add one essence stone

    } else if (CurrentChallenge == "Stat Chip") {
        EssenceStone := EssenceStones + 2
        StatChips := StatChips + 3 ;add three stat chips

    } else if (CurrentChallenge == "Trait Reroll") {
        UpdateRewards(0,1) ;update 1 trait rr on the trait challenge
        EssenceStones := EssenceStones + 2 ;add two essence stone 
    }

    ChallengeWins.Value := "Challenge Wins: " ChallengesWon
    EssenceStonesReward.Value := "Essence Stones: " EssenceStones
    StatChipsReward.Value := "Stat Chips: " StatChips
}

UpdateWin(infinity){
    global Wins, runs, InfRuns
    if infinity {
        InfRuns++
        InfinityRuns.Value := "Infinity runs: " InfRuns
        return
    } 
    Wins++
    runs++
    WinsLog.Value := "Wins: " Wins "/" runs
    
}

UpdateRewards(newGems, newRerolls) {
    global Rerolls, gems, globalGems, globalRerolls, RewardsLog, AllTimeRewards

    
    Rerolls := Rerolls ? Rerolls : 0
    gems := gems ? gems : 0
    globalGems := globalGems ? globalGems : 0
    globalRerolls := globalRerolls ? globalRerolls : 0
    newGems := newGems ? newGems : 0
    newRerolls := newRerolls ? newRerolls : 0

    
    Rerolls := Rerolls + newRerolls
    gems := gems + newGems
    globalGems := globalGems + newGems
    globalRerolls := globalRerolls + newRerolls

    
    SaveRewards()

    
    RewardsLog.Value := "Gems: " FormatNumber(gems) "`nRerolls: " FormatNumber(Rerolls)
    AllTimeRewards.Value := "Gems: " FormatNumber(globalGems) "`nRerolls: " FormatNumber(globalRerolls)
}

FormatNumber(num) {
    if (num >= 1000000) {
        return Round(num / 1000000, 1) "M" ; format as millions
    } else if (num >= 1000) {
        return Round(num / 1000, 1) "K" ; format as thousands
    }
    return num ; Return the number as is if less than 1000
}