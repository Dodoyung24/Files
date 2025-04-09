#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\main.ahk

;--------------------------------------------------------------------------------




SaveSkipEssence() {

    SettingsFile := "Lib\Data\EssenceSkip.txt"

    CheckSkipEssenceState := SkipButtonEssence.Value 
    FileDelete(SettingsFile) ;deletes the file with the data

    FileAppend("State: " CheckSkipEssenceState, SettingsFile) ;saves the new dropdown txt in the new created file 
    if (CheckSkipEssenceState == 0) {
        AddToLog("Skip essence challenge is disabled")
    }
    else if (CheckSkipEssenceState == 1) {
        AddToLog("Skip essence challenge is enabled")
    }


}

LoadSkipEssence() {

SettingsFile := "Lib\Data\EssenceSkip.txt"

    if !FileExist(SettingsFile) {
        AddToLog("No data found for SkipEssence, defaulting to disabled")
        FileAppend("State: 2" , SettingsFile)
    }


    ReadData := FileRead(SettingsFile) ;Read


    Loop Parse, ReadData, "`n" { ;loop through the file and search for the string
        if InStr(A_LoopField, "State: 1") ;state one means true 
            {
                
                SkipButtonEssence.Value := true
                
                
            }

            else if InStr(A_LoopField, "State: 0") ;same for here
                {
                    SkipButtonEssence.Value := false
                }
            }
        }





ChangeGameModes() { 
 CurrentMode := GameModes.Text
 AddToLog("Selected " CurrentMode)
 if (CurrentMode == "Infinity") {
    Placementbttn.Visible := false
 }
    else if (CurrentMode == "Bounty") {
        Placementbttn.Visible := true
    }
}


     
;Load and save the button/other gui stuff

;--------------------------------------------------

;This is for the total gems/rerolls data save/load
SaveState() {
    
    SettingsFile := "Lib\Data\SettingsCheck.txt"

    CheckSettingsButtonState := CheckSettingsButton.Value 
    FileDelete(SettingsFile) ;deletes the file with the data
    FileAppend("State: " CheckSettingsButtonState, SettingsFile) ;saves the new dropdown txt in the new created file 
    if (CheckSettingsButtonState == 0) {
        AddToLog("Settings check is disabled")
    }
    else if (CheckSettingsButtonState == 1) {
        AddToLog("Settings check is enabled")
    }
}


LoadState() {
   
    SettingsFile := "Lib\Data\SettingsCheck.txt"
    
    if !FileExist(SettingsFile) {
        AddToLog("No data found for SensCheck, defaulting to disabled")
        FileAppend("State: 2" , SettingsFile)
    }
    
    
    ReadData := FileRead(SettingsFile) ;Read
    
   
    Loop Parse, ReadData, "`n" { ;loop through the file and search for the string
        if InStr(A_LoopField, "State: 1")
            {
                
                CheckSettingsButton.Value := true
                
            }
            else if InStr(A_LoopField, "State: 0") ;same for here
                {
                    CheckSettingsButton.Value := false
                }
            }
        }

        ;Load and save the button/other gui stuff

        ;--------------------------------------------------

        ;This is for the total gems/rerolls data save/load

        SaveRewards() {
            global globalGems, globalRerolls
            rewardsFile := "Lib\Data\rewards.txt"
            FileDelete rewardsFile 
            FileAppend "DataGems:" globalGems "`nDataRerolls:" globalRerolls "`n", rewardsFile
        }
        
        LoadRewards() {
            global globalGems, globalRerolls
            rewardsFile :=  "Lib\Data\rewards.txt"
            
            if !FileExist(rewardsFile) {
                
                FileAppend("DataGems:0`nDataRerolls:0`n", rewardsFile)
            }
            
            
            rewardsContent := FileRead(rewardsFile)
            
            
            Loop Parse, rewardsContent, "`n" {
                if InStr(A_LoopField, "DataGems:") {
                    globalGems := StrReplace(A_LoopField, "DataGems:", "")
                } else if InStr(A_LoopField, "DataRerolls:") {
                    globalRerolls := StrReplace(A_LoopField, "DataRerolls:", "")
                }
            }
           
        }