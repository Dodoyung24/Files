#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk
#Include %A_ScriptDir%\Lib\MapCoordinates.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk






 
ShibuyaAftermathSpeedPlace() {
    global LegendStage
    success := false 
    times := 0 
    LegendStage := true
    
    
    while (!success && times < 10) {  
     times++ 
    sleep 600
    BetterPlace(404, 319,SpeedWagonSlot) ;Place speed 
    Sleep 600
    success := PlacedUnit()
    
    if (!success) {
        if (Mod(times,5)) == 0 {
        AddToLog("Speed not placed (" times ") time ")
         } 
        SendInput("q")
        Sleep 1000
        TptoSpawn()
    }
    
    if (success) {
        AddToLog("Speed Placed after (" times ") time ") ;if success try to find spot
        sleep 1000
        ShibuyaAftermathFindSpot()
        break
    }

    if (!success && times >= 10) {
    RestartMatch() ;doesnt click vote start, its a legend stage
    sleep 500
    BetterClick(403, 306) 
    sleep 500
    BetterClick(393, 289) ;click any middle card
    sleep 900
    BetterClick(360,120)



    }
 }
}

 

GoldenCastleSpeedPlace() {
    global LegendStage
    success := false 
    times := 0 
    LegendStage :=true
    
    
    while (!success && times < 10) {  
     times++
    
    sleep 600
    BetterPlace(415, 209,SpeedWagonSlot) ;Place speed 
    Sleep 600
    
    success := PlacedUnit()
    
    if (!success) {
        if (Mod(times,5)) == 0 {
        AddToLog("Speed not placed (" times ") time ")
        }                                                  ;if not placed tp to spawn and try again 
        SendInput("q")
        Sleep 1000
        TptoSpawn()
    }
    
    if (success) {
    AddToLog("Speed placed after (" times ") time")
    TPtoSpawn()
    sleep 400
    SpecSpeed()
    sleep 1000
    SendInput("{d up}") 
    Sleep 100
    SendInput ("{d down}")
    Sleep 1200
    SendInput ("{d up}")
    RestartMatch()
    sleep 2000
    CheckCards()
    sleep 1000
    GoldenCastlePlacement()
        break
    }
    
    }
    
    if (!success && times >= 10) { 
        RestartMatch()
        sleep 500
        BetterClick(393, 289) ;click any middle card
        sleep 900
        BetterClick(403, 306) ;click cancel after clicking the card thing
        sleep 500
        BetterClick(361,122) ;click vote start
        sleep 300
        GoldenCastleSpeedPlace()
    } 
}



ShibuyaStationSpeedPlace() {
global LegendStage
success := false 
times := 0 
LegendStage := false


while (!success && times < 10) {  
 times++

sleep 600
BetterPlace(392, 326,SpeedWagonSlot) ;Place speed 
Sleep 600

success := PlacedUnit()

if (!success) {
    if (Mod(times,5)) == 0 {
    AddToLog("Speed not placed (" times ") time ")
    }                                               ;if not placed tp to spawn and try again 
    SendInput("q")
    Sleep 1000
    TptoSpawn()
}

if (success) {
    AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
    TPtoSpawn()
    sleep 400
    SpecSpeed()
    sleep 1000
    SendInput("{a up}") 
    Sleep 100
    SendInput ("{a down}")
    Sleep 6500
    SendInput ("{a up}")
    sleep 1000
    RestartMatch()
    sleep 500
    ShibuyaStationPlacement()
    break
}

}

if (!success && times >= 10) { 
    RestartMatch()
    sleep 500
    ShibuyaStationSpeedPlace()
}
    
 
}


DoubleDungeonSpeedPlace() {
    global LegendStage
    success := false 
    times := 0 
   
    
    
    while (!success && times < 10) {  
     times++
    
    sleep 600
    BetterPlace(567, 371,SpeedWagonSlot) ;Place speed 
    Sleep 1000
    success := PlacedUnit()
    
    if (!success) {
        if (Mod(times,5)) == 0 {
        AddToLog("Speed not placed (" times ") time ")
         } 
        SendInput("q")
        Sleep 1000
        TptoSpawn()
    }
    
    if (success) {
        AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
        TPtoSpawn()
        sleep 400
        SpecSpeed()
        sleep 1000
        RestartMatch() ;clicks vote start if story
        sleep 500
        if (LegendStage) {
        CheckCards() ;checks card and clicks vote start for legend stage
        }
        sleep 500
        DoubleDungeonPlacement() 
        break
    }

    if (!success && times >= 10) { ;restarts match if he failed 10 times, because i dont wanna make it check for lose
        RestartMatch() ;restarts (clicks vote start for story only)
        sleep 500
        if (LegendStage) {
            BetterClick(393, 289) ;click any middle card
            sleep 900
            BetterClick(403, 306) ;click cancel after clicking the card thing
            sleep 500
            BetterClick(361,122) ;click vote start
            sleep 400
        }
    
        DoubleDungeonSpeedPlace() ;Place speed again
    }
 }
}



SandVillageSpeedPlace() {
success := false 
times := 0 
global LegendStage


while (!success && times < 10) {  
 times++

sleep 600
BetterPlace(666, 214,SpeedWagonSlot) ;Place speed 
Sleep 600
success := PlacedUnit()

if (!success) { ;tp to spawn if not placed
    if (Mod(times,5)) == 0 {
    AddToLog("Speed not placed (" times ") time ")
     } 

    SendInput("q")
    Sleep 1000
    TptoSpawn()
}

if (success) {
    AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
    Sleep 500
    FindSpotSandVillage()
    break
}

}

if (!success && times >= 10) { ;restarts match if he failed 10 times, because i dont wanna make it check for lose
    
    RestartMatch() ;restarts (clicks vote start for story only)
    sleep 500
    if (LegendStage) {
        BetterClick(393, 289) ;click any middle card
        sleep 900
        BetterClick(403, 306) ;click cancel after clicking the card thing
        sleep 500
        BetterClick(361,122) ;click vote start
        sleep 400
    }

    SandVillageSpeedPlace() ;Place speed again
}
    
 
}

 

PlanetNamakSpeedPlace() {
global LegendStage, Infinity
success := false 
times := 0 
LegendStage := false

while (!success && times < 10) {  
 times++

sleep 600
BetterPlace(403, 308,SpeedWagonSlot)
Sleep 600
success := PlacedUnit() ;check if placed


if (!success) {
    if (Mod(times,5)) == 0 {
    AddToLog("Speed not placed (" times ") time ")
     } 
    SendInput("q")
    Sleep 1000
    TptoSpawn()
}

if (success) {
    AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
    Sleep 500
    if (Infinity == true) {
        FindSpotPlanetNamak(true)
        
        return
    }
    FindSpotPlanetNamak(false)
    break
}

if (!success) {
    RestartMatch()
    sleep 500
    PlanetNamakSpeedPlace()
  }
 }
}

UndergroundSpeedPlace() {
    loop {
    success := false 
    success := PlacedUnit()
    sleep 600
    BetterPlace(398, 302,SpeedWagonSlot)
    sleep 600
    if (success) {
    TPtoSpawn()
    sleep 1000
    SpecSpeed()
    sleep 1000
    RestartMatch()
    sleep 400
    BetterClick(366, 124) ;start match
    sleep 500
    undergroundPlacement()
    break ;place units
    }
   
 }   
}

KuinshinSpeedPlace() {
success := false 
times := 0 


while (!success && times < 10) {  
 times++

sleep 600
BetterPlace(378,348,SpeedWagonSlot)
Sleep 600
success := PlacedUnit() ;check if placed


if (!success) {
    if (Mod(times,5)) == 0 {
    AddToLog("Speed not placed (" times ") time ") 
    }

    SendInput("q")
    Sleep 1000
    TptoSpawn()
}

if (success) {
    AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
    Sleep 500
    FindSpotKuinshiPalace()
    break
}

if (!success && times >= 10) {
    RestartMatch() ;restarts (clicks vote start for story only)
    sleep 500
    BetterClick(393, 289) ;click any middle card
    sleep 900
    BetterClick(403, 306) ;click cancel after clicking the card thing
    sleep 500
    BetterClick(361,122) ;click vote start
    sleep 400
    KuinshinSpeedPlace()
  }
 } 
} 

 
SpiritSpeedPlace() {
    success := false 
    times := 0 
    
    ;this map only has one spawn but still adding this to make sure 

    while (!success && times < 10) {  
     times++
    sleep 600
    BetterPlace(403, 308,SpeedWagonSlot)
    Sleep 600
    success := PlacedUnit() ;check if placed
    
    
    if (!success) {
        if (Mod(times,5)) == 0 {
        AddToLog("Speed not placed (" times ") time ") 
        }

        SendInput("q")
        Sleep 1000
        TptoSpawn()
    }
 
    if (success) {
        AddToLog("Speed Placed (" times ") time ") ;if success try to find spot
        Sleep 500
        FindSpotSpiritSociety()
        break
    }
    
    if (!success && times >= 10) {
        RestartMatch() ;story stage so clicks vote start
        sleep 500
        SpiritSpeedPlace() ;place speed again 
      }
     }
    }