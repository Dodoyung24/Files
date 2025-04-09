#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk
#Include %A_ScriptDir%\Lib\MapCoordinates.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\SpeedPlacements.ahk

ShibuyaAftermathPlacement() {
    global Manual, Movement
    Map := "ShibuyaAftermath"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if (EnsurePlacement(Map, "speed", 1)) {
                    Movement++
                }
            case 1:
                if (EnsurePlacement(Map, "speed", 2)) {
                    Movement++
                }
            case 2:
                if (EnsurePlacement(Map, "speed", 3)) {
                    Movement++
                }
            case 3:
                if (EnsureUpgrade(Map, "speed", 1, 1)) {
                    Movement++
                }
            case 4:
                if (EnsureUpgrade(Map, "speed", 2, 1)) {
                    Movement++
                }
            case 5:
                if (EnsureUpgrade(Map, "speed", 3, 1)) { ;place and upgrade all speeds to 1 here
                    Movement++
                }
            case 6:
            if (CheckPlacements("slot1", 1)) {
                if (EnsurePlacement(Map, "slot1", 1)) { ;vegeta place 1
                    Movement++
                }
            } else {
                Movement++
            }
            case 7:
                if (EnsureUpgrade(Map, "speed", 1, 14)) { 
                    Movement++
                }
            case 8:
                if (EnsureUpgrade(Map, "speed", 2, 14)) {
                    Movement++
                }
            case 9:
                if (EnsureUpgrade(Map, "speed", 3, 14)) { ;max all speeds
                    Movement++
                }
            case 10:
            if (CheckPlacements("slot1", 2)) {
                if (EnsurePlacement(Map, "slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 11:
            if (CheckPlacements("slot1", 3)) {
                if (EnsurePlacement(Map, "slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 12:
                if (CheckPlacements("slot1", 4)) {
                if (EnsurePlacement(Map, "slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 13:
                if (EnsurePlacement(Map, "taka", 1)) {
                    Movement++
                }
            case 14:
                if (EnsureUpgrade(Map, "taka", 1, 14)) { ;max taka
                    Movement++
                }
            case 15:
            if (CheckPlacements("slot3", 1)) {
                if (EnsurePlacement(Map, "slot3", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 16:
                if (CheckPlacements("slot3", 2)) {
                if (EnsurePlacement(Map, "slot3", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 17:
                if (CheckPlacements("slot3", 3)) {
                if (EnsurePlacement(Map, "slot3", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 18:
                if (CheckPlacements("slot3", 4)) {
                if (EnsurePlacement(Map, "slot3", 4)) { ;placed all uryus
                    Movement++
                }
            } else {
                Movement++
            }
            case 19:
            if (CheckPlacements("slot2", 1)) {
                if (EnsurePlacement(Map, "slot2", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 20:
                if (CheckPlacements("slot2", 1)) {
                if (EnsureUpgrade(Map, "slot2", 1, 14)) { ;max slot2
                        Movement++
                    }
            } else {
                Movement++
            }
            case 21:
            loop {
                sleep 1000
                antiSoftLock(true)
            }
            }
    }
}

SpiritSocietyPlacement() {
    global Manual, Movement
    Map := "SpiritSociety"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
            if (CheckPlacements("slot1", 1)) {
                if (EnsurePlacement(Map, "slot1", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 1:
            if (CheckPlacements("slot1", 2)) {
                if (EnsurePlacement(Map, "slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 2:
            if (CheckPlacements("slot1", 3)) {
                if (EnsurePlacement(Map, "slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 3:
            if (CheckPlacements("slot1", 4)) {
                if (EnsurePlacement(Map, "slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 4:
                if (EnsurePlacement(Map, "speed", 1)) {
                    Movement++
                }
            case 5:
                if (EnsurePlacement(Map, "speed", 2)) {
                    Movement++
                }
            case 6:
                if (EnsurePlacement(Map, "speed", 3)) {
                    Movement++
                }
            case 7:
                if (EnsureUpgrade(Map, "speed", 1, 14)) {
                    Movement++
                }
            case 8:
                if (EnsureUpgrade(Map, "speed", 2, 14)) {
                    Movement++
                }
            case 9:
                if (EnsureUpgrade(Map, "speed", 3, 14)) {
                    Movement++
                }
            case 10:
            if (CheckPlacements("slot1", 1)) {
                if (EnsureUpgrade(Map, "slot1", 1, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 11:
            if (CheckPlacements("slot1", 2)) {
                if (EnsureUpgrade(Map, "slot1", 2, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 12:
                if (CheckPlacements("slot1", 3)) {
                if (EnsureUpgrade(Map, "slot1", 3, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 13:
            if (CheckPlacements("slot1", 4)) {
                if (EnsureUpgrade(Map, "slot1", 4, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 14:
            if (CheckPlacements("slot2", 1)) {
                if (EnsurePlacement(Map, "slot2", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 15:
            if (CheckPlacements("slot2", 1)) {
                if (EnsureUpgrade(Map, "slot2", 1, 14)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 16:
            loop {
                sleep 1000
                antiSoftLock(true)
            }
            }
    }
}


GoldenCastlePlacement() {
    global Manual, Movement
    Map := "GoldenCastle"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if (EnsurePlacement(Map, "speed", 1)) {
                    Movement++
                }
            case 1:
                if (EnsurePlacement(Map, "speed", 2)) {
                    Movement++
                }
            case 2:
                if (EnsurePlacement(Map, "speed", 3)) {
                    Movement++
                }
            case 3:
            if (CheckPlacements("slot1", 1)) {
                if (EnsurePlacement(Map, "slot1", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 4:
            if (CheckPlacements("slot1", 2)) {
                if (EnsurePlacement(Map, "slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 5:
            if (CheckPlacements("slot1", 3)) {
                if (EnsurePlacement(Map, "slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 6:
            if (CheckPlacements("slot1", 4)) {
                if (EnsurePlacement(Map, "slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 7:
                if (EnsureUpgrade(Map, "speed", 1, 14)) {
                    Movement++
                }
            case 8:
                if (EnsureUpgrade(Map, "speed", 2, 14)) {
                    Movement++
                }
            case 9:
                if (EnsureUpgrade(Map, "speed", 3, 14)) {
                    Movement++
                }
            case 10:
                if (EnsurePlacement(Map, "taka", 1)) {
                    Movement++
                }
            case 11:
            if (CheckPlacements("slot2", 1)) {  
                if (EnsurePlacement(Map, "slot2", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 12:
            if (CheckPlacements("slot2", 2)) {
                if (EnsurePlacement(Map, "slot2", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 13:
            if (CheckPlacements("slot2", 3)) {
                if (EnsurePlacement(Map, "slot2", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 14:
                if (EnsureUpgrade(Map, "taka", 1, 14)) {
                    SendInput ("{a up}")
                    sleep 100
                    SendInput ("{a down}")
                    sleep 2000
                    SendInput ("{a up}")
                    KeyWait ("a")
                    Movement++
                    
                }
            case 15:
            if (CheckPlacements("slot3", 1)) {
                if (EnsurePlacement(Map, "slot3", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 16:
            if (CheckPlacements("slot3", 1)) {
                if (PriorityChange(Map, "slot3", 1,5)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 17:
            if (CheckPlacements("slot3", 2)) {
                if (EnsurePlacement(Map, "slot3", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 18:
            if (CheckPlacements("slot3", 2)) {
                if (PriorityChange(Map, "slot3", 2,5)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 19:
            if (CheckPlacements("slot3", 3)) {
                if (EnsurePlacement(Map, "slot3", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 20:
            if (CheckPlacements("slot3", 3)) {
                if (PriorityChange(Map, "slot3", 3,5)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 21:
            if (CheckPlacements("slot3", 4)) {
                if (EnsurePlacement(Map, "slot3", 4)) {
                 Movement++
                }
            } else {
                Movement++
            }
            case 22: 
                SendInput ("{d up}")
                    sleep 100
                    SendInput ("{d down}")
                    sleep 2000
                    SendInput ("{d up}")
                    KeyWait ("a")
                    Movement++
                
            case 23:
            if (CheckPlacements("slot2", 1)) {
                if (EnsureUpgrade(Map, "slot2", 1, 8)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 24:
            if (CheckPlacements("slot2", 2)) {
                if (EnsureUpgrade(Map, "slot2", 2, 8)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 25:
            if (CheckPlacements("slot2", 3)) {
                if (EnsureUpgrade(Map, "slot2", 3, 8)) {
                    Movement++
                }
            } else {
                Movement++
            }    
            case 26: 
                loop {
                sleep 1000
                antiSoftLock(true)
                }
      }
    }
  } 



ShibuyaStationPlacement() {
    global Manual, Movement
    Map := "ShibuyaStation"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if CheckPlacements("slot1", 1) {
                    if (EnsurePlacement(Map,"slot1", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 1:
                if checkPlacements("slot1", 2) {
                    if (EnsurePlacement(Map,"slot1", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 2:
                if checkplacements("slot1", 3) {
                    if (EnsurePlacement(Map,"slot1", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 3:
                if checkPlacements("slot1", 4) {
                    if (EnsurePlacement(Map,"slot1", 4)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 4:
                if CheckPlacements("slot1", 1) {
                    if (EnsureUpgrade(Map,"slot1", 1, 6)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 5:
                if CheckPlacements("slot3", 1) {
                    if (EnsurePlacement(Map,"slot3", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 6:
                if CheckPlacements("slot3", 1) {
                    if (PriorityChange(Map,"slot3", 1,5)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 7:
                if CheckPlacements("slot3", 1) {
                    if (EnsureUpgrade(Map,"slot3", 1,14)) {
                        Movement++
                        }
                } else {
                    Movement++
                }
                case 8:
                    loop {
                        sleep 1000
                        antiSoftLock(true)
                    }
            }
    }
}

DoubleDungeonPlacement() {
    global Manual, Movement
    Map := "DoubleDungeon"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if (CheckPlacements("slot1", 1)) {
                    if (EnsurePlacement(Map, "slot1", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 1:
                if CheckPlacements("slot1", 2) {
                    if (EnsurePlacement(Map, "slot1", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 2:
                if CheckPlacements("slot1", 3) {
                    if (EnsurePlacement(Map, "slot1", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 3:
                if CheckPlacements("slot1", 4) {
                    if (EnsurePlacement(Map, "slot1", 4)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 4:
                    if (EnsurePlacement(Map, "speed", 1)) {
                        Movement++
                    }
                case 5:
                    if (EnsurePlacement(Map, "speed", 2)) {
                        Movement++
                    }
                case 6:
                    if (EnsurePlacement(Map, "speed", 3)) { ; placed all speeds
                        Movement++
                    }
                case 7:
                    if (EnsureUpgrade(Map, "speed", 1, 14)) {
                        Movement++
                    }
                case 8:
                    if (EnsureUpgrade(Map, "speed", 2, 14)) {
                        Movement++
                    }
                case 9:
                    if (EnsureUpgrade(Map, "speed", 3, 14)) {
                        Movement++
                    }
                case 10:
                if (CheckPlacements("slot3", 1)) {
                    if (EnsurePlacement(Map, "slot3", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 11:
                if (CheckPlacements("slot3", 1)) {
                    if (PriorityChange(Map, "slot3", 1, 4)) { ; Change priority to weakest
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 12:
                if (CheckPlacements("slot3", 2)) {
                    if (EnsurePlacement(Map, "slot3", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 13:
                if (CheckPlacements("slot3", 2)) {
                    if (PriorityChange(Map, "slot3", 2, 4)) { ; Change priority to weakest
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 14:
                if (CheckPlacements("slot3", 3)) {
                    if (EnsurePlacement(Map, "slot3", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 15:
                if (CheckPlacements("slot3", 3)) {
                    if (PriorityChange(Map, "slot3", 3, 4)) { ; Change priority to weakest
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 16:
                if (CheckPlacements("slot3", 4)) {
                    if (EnsurePlacement(Map, "slot3", 4)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 17:
                if (CheckPlacements("slot3", 4)) {
                    if (PriorityChange(Map, "slot3", 4, 4)) { ; Change priority to weakest
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 18:
                if (CheckPlacements("slot3", 1)) {
                    if (EnsureUpgrade(Map, "slot3", 1, 2)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 19:
                if (CheckPlacements("slot3", 2)) {
                    if (EnsureUpgrade(Map, "slot3", 2, 2)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 20:
                if (CheckPlacements("slot3", 3)) {
                    if (EnsureUpgrade(Map, "slot3", 3, 2)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 21:
                if (CheckPlacements("slot3", 4)) {
                    if (EnsureUpgrade(Map, "slot3", 4, 2)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 22:
                if (CheckPlacements("slot1", 1)) {
                    if (EnsureUpgrade(Map, "slot1", 1, 5)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 23:
                if (CheckPlacements("slot1", 2)) {
                    if (EnsureUpgrade(Map, "slot1", 2, 5)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 24:
                if (CheckPlacements("slot1", 3)) {
                    if (EnsureUpgrade(Map, "slot1", 3, 5)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 25:
                if (CheckPlacements("slot1", 4)) {
                    if (EnsureUpgrade(Map, "slot1", 4, 5)) { 
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 26:
                 loop {
                 sleep 1000
                 antiSoftLock(true)
                    }
            }
    }
}

SandPlacement() {
    global Manual, Movement
    Map := "SandVillage"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if (CheckPlacements("slot1",1)) {
                    if (EnsurePlacement(Map,"slot1", 1)) {
                        Movement++ 
                    }
                } else {
                    Movement++
                }
                case 1:
                    if (CheckPlacements("slot2",1)) {
                        if (EnsurePlacement(Map,"slot2", 1)) {
                            Movement++ 
                        }
                    } else {
                        Movement++
                    }
                case 2:
                    if (CheckPlacements("slot2",2)) {
                        if (EnsurePlacement(Map,"slot2", 2)) {
                            Movement++ 
                        }
                    } else {
                        Movement++
                    }
                case 3:
                    if (CheckPlacements("slot2",3)) {
                        if (EnsurePlacement(Map,"slot2", 3)) {
                            Movement++ 
                        }
                    } else {
                        Movement++
                    }
                case 4:
                    if (EnsurePlacement(Map,"speed", 1)) {
                        Movement++
                    }
                case 5:
                    if (EnsurePlacement(Map,"speed", 2)) {
                        Movement++
                    }
                case 6:
                    if (EnsureUpgrade(Map,"speed", 1, 14)) {
                        Movement++
                    }
                case 7:
                    if (EnsureUpgrade(Map,"speed", 2, 14)) {
                        Movement++
                    }
                case 8:
                    if (EnsureUpgrade(Map,"speed", 3, 14)) {
                        Movement++
                    }
                case 9:
                if (CheckPlacements("slot2",1)) {
                    if (EnsureUpgrade(Map,"slot2", 1, 9)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 10:
                if (CheckPlacements("slot2",2)) {
                    if (EnsureUpgrade(Map,"slot2", 2, 8)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 11:
                if (CheckPlacements("slot2",3)) {
                    if (EnsureUpgrade(Map,"slot2", 3, 8)) {
                        Movement++
                        } 
                } else {
                    Movement++
                }
                case 12:
                loop {
                        sleep 1000
                        antiSoftLock(true)
                    }        
              

  }
 }
}

undergroundPlacementInf() {
    Sleep 500
    BetterClick(365, 123)
    Sleep 1000
    global Manual, Movement
    Map := "Underground"
    Movement := 0
    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
        switch (Movement) {
            case 0:
            if (CheckPlacements("slot1", 1)) {
                if (EnsurePlacement(Map, "slot1", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 1:
            if (CheckPlacements("slot1", 2)) {
                if (EnsurePlacement(Map, "slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 2:
            if (CheckPlacements("slot1", 3)) {
                if (EnsurePlacement(Map, "slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 3:
            if (CheckPlacements("slot1", 4)) {
                if (EnsurePlacement(Map, "slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 4:
            loop {
                sleep 1000
                antiSoftLock(true)
            }
   }
 }
}
    
undergroundPlacement() {
    Sleep 500
    BetterClick(365, 123)
    Sleep 1000
    global Manual, Movement
    Map := "Underground"
    Movement := 0

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
        switch (Movement) {
            case 0:
            if (CheckPlacements("slot1", 1)) {
                if (EnsurePlacement(Map, "slot1", 1)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 1:
            if checkplacements("slot1", 2) {
                if (EnsurePlacement(Map, "slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 2:
            if (CheckPlacements("slot1", 3)) {
                if (EnsurePlacement(Map, "slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 3:
            if (CheckPlacements("slot1", 4)) {
                if (EnsurePlacement(Map, "slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 4:
                if (EnsurePlacement(Map, "speed", 1)) {
                    Movement++
                }
            case 5:
                if (EnsurePlacement(Map, "speed", 2)) {
                    Movement++
                }
            case 6:
                if (EnsurePlacement(Map, "speed", 3)) {
                    Movement++
                }
            case 7:
                if (EnsureUpgrade(Map, "speed", 1, 14)) {
                    Movement++
                }
            case 8:
                if (EnsureUpgrade(Map, "speed", 2, 14)) {
                    Movement++
                }
            case 9:
                if (EnsureUpgrade(Map, "speed", 3, 14)) {
                    Movement++
                }
            case 10:
            if (CheckPlacements("slot1", 1)) {
                if (EnsureUpgrade(Map, "slot1", 1, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 11:
            if (CheckPlacements("slot1", 2)) {
                if (EnsureUpgrade(Map, "slot1", 2, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 12:
            if (CheckPlacements("slot1", 3)) {
                if (EnsureUpgrade(Map, "slot1", 3, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 13:
            if (CheckPlacements("slot1", 4)) {
                if (EnsureUpgrade(Map, "slot1", 4, 6)) {
                    Movement++
                }
            } else {
                Movement++
            }
            case 14:
            loop {
                sleep 1000
                antiSoftLock(true)
            }
        }
    }
}


NamakInfinityPlacement() {
    global Manual, Movement
    Map := "PlanetNamak"
    Movement := 0
    Infinity := true
    BetterClick(369, 124)
    Sleep 1000

    while (Manual) {
        if (!Manual) {
            return
           }
    ReplayCheck() 
    switch (Movement) {
        case 0:
        if (CheckPlacements("slot1",1)) {
            if (EnsurePlacement(Map,"slot1", 1)) {
                Movement++
            }
        } else {
            Movement++
        }
        case 1:
            if (CheckPlacements("slot1",2)) {
                if (EnsurePlacement(Map,"slot1", 2)) {
                    Movement++
                }
            } else {
                Movement++
            }
        case 2:
            if (CheckPlacements("slot1",3)) {
                if (EnsurePlacement(Map,"slot1", 3)) {
                    Movement++
                }
            } else {
                Movement++
            }
        case 3:
            if (CheckPlacements("slot1",4)) {
                if (EnsurePlacement(Map,"slot1", 4)) {
                    Movement++
                }
            } else {
                Movement++
            }
        case 4:
            loop {
                sleep 1000
                ReplayCheck()
                }
    }
  }
}









NamakPlacement() {
    AddToLog("Starting placement for inf")
    BetterClick(369, 124)
    Sleep 1000
    global Manual, Movement
    Map := "PlanetNamak"
    Movement := 0
    

    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                if (CheckPlacements("slot1",1)) {
                    if (EnsurePlacement(Map,"slot1", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 1:
                    if (CheckPlacements("slot1",2)) {
                        if (EnsurePlacement(Map,"slot1", 2)) {
                            Movement++
                        }
                    } else {
                        Movement++
                    }
                case 2:
                    if (CheckPlacements("slot1",3)) {
                        if (EnsurePlacement(Map,"slot1", 3)) {
                            Movement++
                        }
                    } else {
                        Movement++
                    }
                case 3:
                    if (CheckPlacements("slot1",4)) {
                        if (EnsurePlacement(Map,"slot1", 4)) {
                            Movement++
                        }
                    } else {
                        Movement++
                    }
                case 4:
                    loop {
                        sleep 1000
                        antiSoftLock(true)
                        }
                        
            }
        }
    }   

    


KuinshiPlacement() {
    global Manual, Movement
    Map := "KuinshiPalace"
    Movement := 0
    while (Manual) {
        if (!Manual) {
            return
        }
        antiSoftLock(false)
            switch (Movement) {
                case 0:
                    if (EnsurePlacement(Map, "speed", 1)) {
                        Movement++
                    }
                case 1:
                    if (EnsurePlacement(Map, "speed", 2)) {
                        Movement++
                    }
                case 2:
                    if (EnsurePlacement(Map, "speed", 3)) {
                        Movement++
                    }
                case 3:
                if (CheckPlacements("slot1", 1)) {
                    if (EnsurePlacement(Map, "slot1", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 4:
                if CheckPlacements("slot1", 2) {
                    if (EnsurePlacement(Map, "slot1", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 5:
                if (CheckPlacements("slot1", 3)) {
                    if (EnsurePlacement(Map, "slot1", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 6:
                if (CheckPlacements("slot1", 4)) {
                    if (EnsurePlacement(Map, "slot1", 4)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 7:
                    if (EnsureUpgrade(Map, "speed", 1, 14)) {
                        Movement++
                    }
                case 8:
                    if (EnsureUpgrade(Map, "speed", 2, 14)) {
                        Movement++
                    }
                case 9:
                    if (EnsureUpgrade(Map, "speed", 3, 14)) {
                        Movement++
                    }
                case 10:
                    if (EnsurePlacement(Map, "taka", 1)) {
                        Movement++
                    }
                case 11:
                if (CheckPlacements("slot2", 1)) {
                    if (EnsurePlacement(Map, "slot2", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 12:
                if (CheckPlacements("slot2", 2)) {
                    if (EnsurePlacement(Map, "slot2", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 13:
                if (CheckPlacements("slot2", 3)) {
                    if (EnsurePlacement(Map, "slot2", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 14:
                    if (EnsureUpgrade(Map, "taka", 1, 14)) {
                        Movement++
                    }
                case 15:
                if (CheckPlacements("slot2", 1)) {
                    if (EnsureUpgrade(Map, "slot2", 1, 8)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 16:
                if (CheckPlacements("slot2", 2)) {
                    if (EnsureUpgrade(Map, "slot2", 2, 7)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 17:
                if (CheckPlacements("slot2", 3)) {
                    if (EnsureUpgrade(Map, "slot2", 3, 7)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 18:
                if (CheckPlacements("slot4", 1)) {
                    if (EnsurePlacement(Map, "slot4", 1)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 19:
                if (CheckPlacements("slot4", 1)) {
                    if (PriorityChange(Map, "slot4", 1, 5)) { ;change prio to boss
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 20:
                if (CheckPlacements("slot4", 2)) {
                    if (EnsurePlacement(Map, "slot4", 2)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 21:
                if (CheckPlacements("slot4", 2)) {
                    if (PriorityChange(Map, "slot4", 2, 5)) { ;change prio to boss
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 22:
                if (CheckPlacements("slot4", 3)) {
                    if (EnsurePlacement(Map, "slot4", 3)) {
                        Movement++
                    }
                } else {
                    Movement++
                }
                case 23:
                if (CheckPlacements("slot4", 3)) {
                    if (PriorityChange(Map, "slot4", 3, 5)) { ;change prio to boss
                        Movement++
                    }
                } else {
                    Movement++
                }                
                case 24:
                 loop {
                 sleep 1000
                 antiSoftLock(true)
                  }
                }
            }
       }