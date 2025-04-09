#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\gui.ahk


WebhookURLFile := "Lib\Data\WebhookURL.txt"
DiscordUserIDFile := "Lib\Data\DiscordUSERID.txt"
SendActivityLogsFile := "Lib\Data\SendActivityLogs.txt" 


if FileExist(WebhookURLFile) {
    WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    if (WebhookURL != "")
        webhook := WebHookBuilder(WebhookURL)
}


global DiscordUserID := ""


SendWebhook(stats) {
    global MacroStartTime, webhook, DiscordUserID, wins, roundStart, gems, globalGems, globalRerolls, Rerolls, runs, InfRuns, EssenceStones, StatChips, ChallengesWon

    UserIDSent := ""

    if (DiscordUserID = "") {
        UserIDSent := ""
    }
    else {
        UserIDSent := "<@" DiscordUserID ">"
    }

    ; Calculate the runtime
    ElapsedTimeMs := A_TickCount - MacroStartTime
    ElapsedTimeSec := Floor(ElapsedTimeMs / 1000)
    ElapsedHours := Floor(ElapsedTimeSec / 3600)
    ElapsedMinutes := Floor(Mod(ElapsedTimeSec, 3600) / 60)
    ElapsedSeconds := Mod(ElapsedTimeSec, 60)
    Runtime := Format("{} hours, {} minutes", ElapsedHours, ElapsedMinutes)

    ; Initialize GDI+
    pToken := Gdip_Startup()
    if !pToken {
        MsgBox("Failed to initialize GDI+")
        return
    }
  
    MonitorGet(1, &MonitorLeft, &MonitorTop, &MonitorRight, &MonitorBottom) ;main mon

    MonitorWidth := MonitorRight - MonitorLeft
    MonitorHeight := MonitorBottom - MonitorTop
    
    
    pBitmap := Gdip_BitmapFromScreen(MonitorLeft "|" MonitorTop "|" MonitorWidth "|" MonitorHeight)
    if !pBitmap {
        MsgBox("Failed to capture the primary monitor")
        Gdip_Shutdown(pToken)
        return
    }

    ; Crop the bitmap to x=0, y=0, width=1200, height=700
    pCroppedBitmap := CropImage(pBitmap, 30, 15, 1400,665)
    if !pCroppedBitmap {
        MsgBox("Failed to crop the bitmap")
        Gdip_DisposeImage(pBitmap)
        Gdip_Shutdown(pToken)
        return
    }

    ; Prepare the stats text
    
    

   
    
    WinsLog := ""
    WinsLog .= "**Bounty wins:** " wins "/" runs
    RewardsLog := ""
    RewardsLog .= "**Current**: `n " "Gems: " gems  "`nRerolls: " Rerolls 
    AllTimeRewards := ""
    AllTimeRewards .=  "**Total**: `n AllTimeGems: " globalGems "`n AllTimeRerolls: " globalRerolls
    InfinityRuns := ""
    InfinityRuns .=  "**Infinity runs:** " InfRuns
    EssenceStonesLog := ""
    EssenceStonesLog .= "Essence Stones: " EssenceStones
    StatChipsLog := ""
    StatChipsLog .= "Stat Chips: " StatChips
    ChallengesWonLog := ""
    ChallengesWonLog .= "**Challenges Won**: " ChallengesWon
    
    ; Prepare the attachment and embed
    attachment := AttachmentBuilder(pCroppedBitmap)
    myEmbed := EmbedBuilder()
        .setTitle("Bounty Macro!")
        .setDescription("**[Macro Runtime: " Runtime "]**`n" WinsLog "`n" ChallengesWonLog "`n" InfinityRuns "`n" "`n"  AllTimeRewards "`n" "`n"  RewardsLog "`n" "`n" EssenceStonesLog "`n" StatChipsLog)
        .setColor(0x0A5EB0)
        .setImage(attachment)
        .setFooter({ text: "Dodo's Webhook" })
        .setTimeStamp()


    if (WebhookURL == "") {
        
        return false 
    }
    ; Send the webhook
    webhook.send({
        content: (UserIDSent),
        embeds: [myEmbed],
        files: [attachment]
    })

    ; Clean up resources
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(pCroppedBitmap)
    Gdip_Shutdown(pToken)
}

/*TestWebhook() {
    global MacroStartTime, webhook, DiscordUserID, wins, globalGems, globalRerolls, Rerolls, runs, InfRuns

    UserIDSent := ""

    if (DiscordUserID = "") {
        UserIDSent := ""
    }
    else {
        UserIDSent := "<@" DiscordUserID ">"
    }

    ; Calculate the runtime
    ElapsedTimeMs := A_TickCount - MacroStartTime
    ElapsedTimeSec := Floor(ElapsedTimeMs / 1000)
    ElapsedHours := Floor(ElapsedTimeSec / 3600)
    ElapsedMinutes := Floor(Mod(ElapsedTimeSec, 3600) / 60)
    ElapsedSeconds := Mod(ElapsedTimeSec, 60)
    Runtime := Format("{} hours, {} minutes", ElapsedHours, ElapsedMinutes)

    ; Initialize GDI+
    pToken := Gdip_Startup()
    if !pToken {
        MsgBox("Failed to initialize GDI+")
        return
    }

    ; Capture the entire screen
    pBitmap := Gdip_BitmapFromScreen() 
    if !pBitmap {
        MsgBox("Failed to capture the screen")
        Gdip_Shutdown(pToken)
        return
    }

    ; Crop the bitmap to x=0, y=0, width=1200, height=700
    pCroppedBitmap := CropImage(pBitmap, 27, 15, 1400, 655)
    if !pCroppedBitmap {
        MsgBox("Failed to crop the bitmap")
        Gdip_DisposeImage(pBitmap)
        Gdip_Shutdown(pToken)
        return
    }

    ; Prepare the stats text
    nums := 0
    WinsLog := ""
    WinsLog .= "**Match win:** " wins "/" runs
    RewardsLog := ""
    RewardsLog .= "**Current**: `n " "Gems: " gems  "`nRerolls: " Rerolls 
    AllTimeRewards := ""
    AllTimeRewards .=  "**Global**: `n AllTimeGems: " globalGems "`n AllTimeRerolls: " globalRerolls
    InfinityRuns := ""
    InfinityRuns .=  "**Infinity runs:** " InfRuns

    statsText .= "**Win rate:** " Round(nums*10,2) "%`n-# *(win rate progress bar)*`n"
    loop Round(nums){
        statsText .= ":green_square:"
    }
    loop 10-Round(nums){
        statsText .= ":red_square:"
    }

    ; Prepare the attachment and embed
    attachment := AttachmentBuilder(pCroppedBitmap)
    myEmbed := EmbedBuilder()
        .setTitle("Challenge Completed")
        .setDescription("**[Macro Runtime: " Runtime "]**`n" WinsLog "`n" InfinityRuns "`n" "`n"  AllTimeRewards "`n" "`n"  RewardsLog)
        .setColor(0x0A5EB0)
        .setImage(attachment)
        .setFooter({ text: "Salmon Webhooks" })
        .setTimeStamp()

    ; Send the webhook
    webhook.send({
        content: (UserIDSent),
        embeds: [myEmbed],
        files: [attachment]
    })

    ; Clean up resources
    Gdip_DisposeImage(pBitmap)
    Gdip_DisposeImage(pCroppedBitmap)
    Gdip_Shutdown(pToken)
}

EndWebhook() {
    global MacroStartTime, webhook, DiscordUserID, wins, globalGems, globalRerolls, Rerolls, runs, InfRuns

    UserIDSent := ""

    if (DiscordUserID = "") {
        UserIDSent := ""
    }
    else {
        UserIDSent := "<@" DiscordUserID ">"
    }

    ; Calculate the runtime
    ElapsedTimeMs := A_TickCount - MacroStartTime
    ElapsedTimeSec := Floor(ElapsedTimeMs / 1000)
    ElapsedHours := Floor(ElapsedTimeSec / 3600)
    ElapsedMinutes := Floor(Mod(ElapsedTimeSec, 3600) / 60)
    ElapsedSeconds := Mod(ElapsedTimeSec, 60)
    Runtime := Format("{} hours, {} minutes", ElapsedHours, ElapsedMinutes)

    ; Prepare the stats text
    nums := 0
    WinsLog := ""
    WinsLog .= "Match win: " wins "/" runs
    RewardsLog := ""
    RewardsLog .= "**Current:  `n " "Gems: " gems  "`nRerolls: " Rerolls 
    AllTimeRewards := ""
    AllTimeRewards .=  "**Global**:  `n AllTimeGems: " globalGems "`n AllTimeRerolls: " globalRerolls
    InfinityRuns := ""
    InfinityRuns .=  "**Infinity runs:** " InfRuns

    statsText .= "**Win rate:** " Round(nums*10,2) "%`n-# *(win rate progress bar)*`n"
    loop Round(nums){
        statsText .= ":green_square:"
    }
    loop 10-Round(nums){
        statsText .= ":red_square:"
    }

    ; Prepare the attachment and embed
    myEmbed := EmbedBuilder()
        .setTitle("Macro Stopped")
        .setDescription("Runtime: " Runtime "]**`n" WinsLog "`n" InfinityRuns "`n" "`n"  AllTimeRewards "`n" "`n"  RewardsLog)
        .setColor(0x191A1C)
        .setFooter({ text: "Salmon Webhooks" })
        .setTimeStamp()

    ; Send the webhook
    webhook.send({
        content: (UserIDSent),
        embeds: [myEmbed],
        files: []
    })

    ; Clean up resources
}
*/

TextWebhook() {
    global MacroStartTime, webhook, DiscordUserID, lastlog

    ; Calculate the runtime
    ElapsedTimeMs := A_TickCount - MacroStartTime
    ElapsedTimeSec := Floor(ElapsedTimeMs / 1000)
    ElapsedHours := Floor(ElapsedTimeSec / 3600)
    ElapsedMinutes := Floor(Mod(ElapsedTimeSec, 3600) / 60)
    ElapsedSeconds := Mod(ElapsedTimeSec, 60)
    Runtime := Format("{} hours, {} minutes", ElapsedHours, ElapsedMinutes)

    ; Prepare the attachment and embed
    myEmbed := EmbedBuilder()
        .setTitle("")
        .setDescription("[" FormatTime(A_Now, "hh:mm tt") "] " lastlog)
        .setColor(0x0A97B0)
        

    ; Send the webhook
    webhook.send({
        content: (""),
        embeds: [myEmbed],
        files: []
    })

    ; Clean up resources
}


CropImage(pBitmap, x, y, width, height) {
    ; Initialize GDI+ Graphics from the source bitmap
    pGraphics := Gdip_GraphicsFromImage(pBitmap)
    if !pGraphics {
        MsgBox("Failed to initialize graphics object")
        return
    }

    ; Create a new bitmap for the cropped image
    pCroppedBitmap := Gdip_CreateBitmap(width, height)
    if !pCroppedBitmap {
        MsgBox("Failed to create cropped bitmap")
        Gdip_DeleteGraphics(pGraphics)
        return
    }

    ; Initialize GDI+ Graphics for the new cropped bitmap
    pTargetGraphics := Gdip_GraphicsFromImage(pCroppedBitmap)
    if !pTargetGraphics {
        MsgBox("Failed to initialize graphics for cropped bitmap")
        Gdip_DisposeImage(pCroppedBitmap)
        Gdip_DeleteGraphics(pGraphics)
        return
    }

    ; Copy the selected area from the source bitmap to the new cropped bitmap
    Gdip_DrawImage(pTargetGraphics, pBitmap, 0, 0, width, height, x, y, width, height)

    ; Cleanup
    Gdip_DeleteGraphics(pGraphics)
    Gdip_DeleteGraphics(pTargetGraphics)

    ; Return the cropped bitmap
    return pCroppedBitmap
}


WebhookSettingsUI() { 
    if FileExist(WebhookURLFile)
        WebhookURLBox.Value := FileRead(WebhookURLFile, "UTF-8")

    if FileExist(DiscordUserIDFile)
        DiscordUserIDBox.Value := FileRead(DiscordUserIDFile, "UTF-8")

    if FileExist(SendActivityLogsFile) ; Load checkbox value
        SendActivityLogsBox.Value := (FileRead(SendActivityLogsFile, "UTF-8") = "1")

    WebhookGUI.Show("w300 h150")
}

SaveWebhookSettings() {
    if !(WebhookURLBox.Value = "" || RegExMatch(WebhookURLBox.Value, "^https://discord\.com/api/webhooks/.*")) {
        MsgBox("Invalid Webhook URL! Please enter a valid Discord webhook URL.", "Error", "+0x1000", )
        WebhookURLBox.Value := ""
        return
    }

    if !(RegExMatch(DiscordUserIDBox.Value, "^\d*$")) {
        MsgBox("Invalid Discord User ID! Please enter a valid Discord User ID or keep it empty.", "Error", "+0x1000")
        DiscordUserIDBox.Value := ""
        return
    }

    WebhookGUI.Hide()

    ; Delete old files if they exist
    if FileExist(WebhookURLFile)
        FileDelete(WebhookURLFile)

    if FileExist(DiscordUserIDFile)
        FileDelete(DiscordUserIDFile)

    if FileExist(SendActivityLogsFile)
        FileDelete(SendActivityLogsFile)

    ; Save the new values
    FileAppend(WebhookURLBox.Value, WebhookURLFile, "UTF-8")
    FileAppend(DiscordUserIDBox.Value, DiscordUserIDFile, "UTF-8")
    FileAppend(SendActivityLogsBox.Value ? "1" : "0", SendActivityLogsFile, "UTF-8")
}



WebhookGUI := Gui("+AlwaysOnTop")

WebhookGUI.SetFont("s8 bold", "Segoe UI")
WebhookGUI.Add("Text", "x10 y8 cWhite", "Webhook URL")
WebhookURLBox := WebhookGUI.Add("Edit", "x10 y22 w280", "")

WebhookGUI.Add("Text", "x10 y56 cWhite", "Discord User ID (optional)")
DiscordUserIDBox := WebhookGUI.Add("Edit", "x10 y70 w280", "")

SendActivityLogsBox := WebhookGUI.Add("Checkbox", "x10 y109 cWhite", "Webhook Activity Logs")

SaveWebhook := WebhookGUI.Add("Button", "x170 y105 w120 +BackgroundTrans", "Save Settings")
SaveWebhook.OnEvent("Click", (*) => SaveWebhookSettings())

WebhookGUI.BackColor := "09011b"
WebhookGUI.MarginX := 20
WebhookGUI.MarginY := 20

WebhookGUI.OnEvent("Close", (*) => WebhookGUI.Hide())
WebhookGUI.Title := "Webhook Settings"