#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\main.ahk


global TakaSlot := 6
global SpeedWagonSlot := 5
global MapCoords := Map()

; (1) Kuinshi Palace Coords



global GeneralSlotTeam := Map(
    "slot1", Map("name", "", "slot", 1, "Placement", 0,),
    "slot2", Map("name", "", "slot", 2, "Placement", 0, ),
    "slot3", Map("name", "", "slot", 3, "Placement", 0, ),
    "slot4", Map("name", "", "slot", 4, "Placement", 0, ),
)





global KuinshiPalaceCoords := Map(
   "slot1", Map("Coord", [[543, 329], [578, 332], [543, 369], [583, 370], [309, 287]]),
    "slot2", Map( "Coord", [[482, 299], [480, 340], [568, 275], [423, 265], [447, 224]]),
    "slot3", Map( "Coord",[[450, 276], [518, 340], [459, 300], [239, 502], [184, 340]]),
    "slot4", Map( "Coord",[[372, 413], [509, 208], [610, 347], [395, 415], [532, 211]]),
    "taka", Map("name", "Takarado", "slot", 6, "Coord", [[317, 158]]),
    "speed", Map("name", "Speedwagon",  "slot", 5, "Coord", [[219, 302], [201, 375], [286, 327]])
)


MapCoords["KuinshiPalace"] := KuinshiPalaceCoords 


; (2) Golden Castle Coords

global GoldenCastleCoords := Map(
    "slot1", Map("Coord", [[672, 548], [440, 53], [653, 107], [613, 550], [309, 287]]),
     "slot2", Map( "Coord", [[616, 358], [535, 118], [644, 437], [423, 265], [447, 224]]),
     "slot3", Map( "Coord",[[136, 124], [149, 179], [141, 240], [180, 134], [57, 216]]),
     "slot4", Map( "Coord",[[746, 112], [574, 550], [610, 259], [787, 493], [532, 211]]),
     "taka", Map("name", "Takarado", "slot", 6, "Coord", [[310, 433]]), 
     "speed", Map("name", "Speedwagon",  "slot", 5, "Coord", [[134, 433], [194, 433], [254, 433]])
 )
 

MapCoords["GoldenCastle"] := GoldenCastleCoords

; (3) Shibuya AfterMath Coords

global ShibuyaAftermathCoords := Map(
    "slot1", Map("Coord", [[325, 343], [377, 340], [330, 387], [384, 388], [273, 349]]),
     "slot2", Map( "Coord", [[431, 361], [430, 281], [337, 281], [266, 308], [439, 440]]),
     "slot3", Map( "Coord",[[158, 118], [220, 118], [158, 175], [220, 175], [184, 340]]),
     "slot4", Map( "Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takarado",  "slot", 6,  "Coord", [[630, 167]]),
     "speed", Map("name", "Speedwagon", "slot", 5, "Coord", [[290, 97], [388, 97], [479, 97]])
 )
 

MapCoords["ShibuyaAftermath"] := ShibuyaAftermathCoords
; (4) DoubleDungeon (both story and legend)

global DoubleDungeonCoords := Map(
    "slot1", Map( "Coord", [[31, 217], [72, 207], [31, 270], [72, 270], [16, 462]]),
     "slot2", Map( "Coord", [[635, 424], [135, 425], [600, 113], [423, 265], [447, 224]]),
     "slot3", Map( "Coord",[[724, 92], [724, 150], [680, 150], [680, 92], [184, 340]]),
     "slot4", Map( "Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takarado", "slot", 6, "Coord", [[169, 216]]),
     "speed", Map("name", "Speedwagon", "slot", 5, "Coord", [[554, 333], [551, 272], [608, 308]])
 )
 

 MapCoords["DoubleDungeon"] := DoubleDungeonCoords
 
; (5) SandVillage (both story and legend)

global SandVillageCoords := Map(
    "slot1", Map( "Coord", [[478, 265], [387, 264], [327, 273], [434, 309], [289, 162]]),
     "slot2", Map( "Coord", [[308, 276], [330, 161], [392, 161], [229, 123], [447, 224]]),
     "slot3", Map( "Coord",[[450, 276], [518, 340], [459, 300], [239, 502], [184, 340]]),
     "slot4", Map("Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takarado", "slot", 6, "Coord", [[169, 216]]),
     "speed", Map("name", "Speedwagon", "slot", 5, "Coord", [[169, 256], [220, 294], [400, 300]])
 )


MapCoords["SandVillage"] := SandVillageCoords
 
 ;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

global PlanetNamakCoords := Map(
    "slot1", Map( "Coord", [[388, 123], [177, 245], [215, 245], [170, 279], [201, 294]]),
     "slot2", Map( "Coord", [[177, 245], [215, 245], [318, 239], [423, 265], [447, 224]]),
     "slot3", Map( "Coord", [[450, 276], [518, 340], [459, 300], [239, 502], [184, 340]]),
     "slot4", Map( "Coord", [[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takadora", "slot", 6, "Coord", [[169, 216]]),
     "speed", Map("name", "Sprintwagon", "slot", 5, "Coord", [[169, 256], [500, 208], [222, 256]])
 )


MapCoords["PlanetNamak"] := PlanetNamakCoords

global ShibuyaStationCoords := Map(
    "slot1", Map( "Coord", [[480, 378], [480, 440], [420, 378], [420, 440], [189, 32]]),
     "slot2", Map( "Coord", [[635, 424], [135, 425], [600, 113], [423, 265], [447, 224]]),
     "slot3", Map( "Coord",[[168, 520], [518, 340], [459, 300], [239, 502], [184, 340]]),
     "slot4", Map( "Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map( "name", "Takarado", "slot", 6, "Coord", [[169, 216]]),
     "speed", Map( "name", "Speedwagon", "slot", 5, "Coord", [[169, 256], [500, 208], [222, 256]])
 )


MapCoords["ShibuyaStation"] := ShibuyaStationCoords

global UndergroundChurchCoords := Map(
    "slot1", Map( "Coord", [[290, 96], [325, 96], [292, 128], [327, 127], [167, 89]]),
     "slot2", Map( "Coord", [[635, 424], [135, 425], [600, 113], [423, 265], [447, 224]]),
     "slot3", Map( "Coord",[[450, 276], [518, 340], [459, 300], [239, 502], [184, 340]]),
     "slot4", Map( "Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takarado", "slot", 6, "Coord", [[169, 216]]),
     "speed", Map("name", "Speedwagon", "slot", 5, "Coord", [[150, 318], [224, 318], [310, 318]])
 )


MapCoords["Underground"] := UndergroundChurchCoords

global SpiritSocietyCoords := Map(
    "slot1", Map("Coord", [[613, 563], [676, 563], [676, 501], [613, 501], [444, 461]]),
     "slot2", Map("Coord", [[642, 536], [135, 425], [600, 113], [423, 265], [447, 224]]),
     "slot3", Map("Coord",[[450, 276], [518, 340], [459, 300], [239, 502], [184, 340]]),
     "slot4", Map("Coord",[[272, 224], [478, 436], [296, 453], [558, 492], [532, 211]]),
     "taka", Map("name", "Takarado", "slot",6,  "Coord", [[169, 216]]),
     "speed", Map("name", "Speedwagon", "slot", 5, "Coord", [[575, 303], [491, 303], [524, 240]])
 )


MapCoords["SpiritSociety"] := SpiritSocietyCoords

;------------------------------------------------------------

