#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\MapCoordinates.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\MapPlacing.ahk
#Include %A_ScriptDir%\Lib\SpeedPlacements.ahk
#Include %A_ScriptDir%\Lib\BountyPlacements.ahk


SendMode "Event"
global MacroStartTime := 0
global MacroStartTime := A_TickCount

upgrades:
;upgrade0 := "|<>**50$15.XaBkRiPhrBithrBiPhkRj7hzxW2AkNU" (dont need for the upgrade function)
upgrade1 := "|<>**50$13.XcrbPXhlqyvPRhiqrPPhzq8XANU"
upgrade2 := "|<>**50$15.XiBkRiPhrRjnhwRiDhkBi1hzxW2AkNU"
upgrade3 := "|<>**50$15.XaBkRiPhyRhXhzBithkRj7hzxW2AkNU"
upgrade4 := "|<>**50$15.XuBnRiPhnRiHhURjvhzRgPhnxW2AkNU"
upgrade5 := "|<>**50$14.X4PUqtxiDPVqzBjnP1qsRjzMV6MNU"
upgrade6 := "|<>**50$15.XqBsRiDhnpi6hmRinhkRj6hzxW2AkNU"
upgrade7 := "|<>**50$15.W2BURjnhyphahdZjAhv5jMhzRW2AkNU"
upgrade8 := "|<>**50$15.X6BkRiHhmRi3hmRivhkRj7hzxW2AkNU"
upgrade9 := "|<>**50$15.XCBkRinhmRi3hyRjWhkpiQhzRW2AkNU"
upgrade10 := "|<>**50$20.XjAPn1qsnRiBnPvQqqrBhgrPP1qqsxjvzMU16M0NU"
upgrade11 :="|<>*72$18.zzz3CE24840A40A76A76A7CQDCQDCQDzw3zkXztU"
upgrade12 :="|<>*75$21.zzzzzzzVb64MEMW0FYE2AXXlYQsQba7YwUAbY1YzzwVzy6DztU"
upgrade13 :="|<>*75$21.zzzwAskX234EGAW3VYQQQXblYwXAba1YwsQbzzYDzklzzA"
unitmaxed :="|<>*80$38.zzzzzzsLtvnu68wQQQFW677WCMUVUw7aM0NDXta8Y1kSNXN0MXaMy3UQNbTVwjiNzzzzzb7zzzzVlzzzzwzzzzzzy"


BackButtonBountyMenu := "|<>*108$44.00000307z0001w1zw000l0k3U00AMA0M0036302TwzlslkyvwQTAQC0Q16P47060F2l0k1UA1gQ8QEz0v7W74DkAlklVXA1g0A0M10D07U70F3k3wFsAQrznzrzzszkCsSCAU"
SettingEnabled := "|<>*90$12.s7U1U1000000000000U1U1s7U"
DailyRewards:="|<>*56$24.0000000000001sD03ANU26kk63kk31Uk3U1U1U300k600MC00k701U3U311U63Uk67kk76sk3wTU1sD0U"
CancelCheck:="|<>*108$41.CxzzzDyMlzzyzwFbzzzzwU800N1c000020E1A7A4kl20CM9VXA0QkH/iQ0tYaTzzzzzzjzzzzzzTzzzzzzU"
Cancel:="|<>**50$55.0zU00001w1ks00000n1kA00000NUlazzsyTwknzqNDlwSMNbkA3kQ7AAUl68lANa6MtnCNyQn3DwtbAz0tUla8ma9bwsQ3UNHUkCA73tAtsy7a1zjzrjnyz0000000008"
CreateMatch:="|<>*130$104.000000000000001k0007s000C01sS0Q0y0003bU007k0zDUDUAU001UQVUZ4AAq9+8PA000k7zzzlzn73zXznk00AzVkt8C6kkmEQQC002Ds84210w084230k00WCSN8lnD82FXYkA00Azb03AM3m86Mlwn0036NlwX6Dwy96APAk00s6S10skDDW1lUnA0071bksCC7nAkQQAn0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
TenBounty:="|<>*75$13.vVlUMk0FW8lYQnANWQkDSC"
ZeroBounty:="|<>*74$8.ks6061UQa8a1ss"
CreateButton:="|<>*156$32.kzzzDtzzznyz4A8EDrPHBfxUam23QwAHsrXXa8"
Cardexistence:="|<>*69$83.zhyzzzzzzvzzbz0PtyzzzrzYCE7y0rnwzzzbzEM0Dtt8VkVa04AaGNTnm11U1000NA4mzbYC7YX0UUmMNZzU0470D083a0sPzU21C8SMF3A3krzzzzzzzzzzDzzDzzzzzzzzzyDzwzzzU0000003U0D0E"
SettingsSymbol:="|<>**50$14.1s0n0U4004A/4XW4MV74XEkU00U43A0S2"
Play:="|<>*117$29.ztzzy1ntzw1bzztXDzznWS0C6As2M0NX4E1n6A4zb0M9z60snyC1lzzzzbzzzyDzzzwy"
UpdateLog:="|<>*164$19.bztVzs0Tw07w21w3UQ3k43w03z01zk1zw1zw0zw0Dy03y10y1kC1w21z01zU1zs8zyA"
LeaderBoard:="|<>*75$10.DkS8lkDVy7kCAFsDm"
Victory:="|<>*81$122.0D0DD0TVzzsDk7z1k7bU07s7zsTyzzzjz3zwz3zw0361X3C1w00T0tU3sknVU0UkkEy0600303M0A6MMM08AA4D00U01U0S011Y663z3y33U0A00k03U0MD1VzzkTUkk77y3s7UsS31UsTzy7sQA7zzVy3w67kkMS7zzUw733zzsTVzVVwC07VzzwD3kkzzy7sTsMS3k3sTzz1UwADzzVy7y600w1y7zzsMT33zzsTVzVU0TUTVzzy07kkzzy7sTsM0DwDsTzzk3wA7zzVy3w601z3zzzzw0z3UyTsTUS3VsTkzzzzzUTks03y7w00sS3wDsTzzs7wD00zVzU0S7kz3y7zzz3z3s0TsTw0DVwDkzVzzztzlzUDz7zkDszbwTwTzzzzzzzzzzzzzzzzzzzzy"
ReturnToLobby:="|<>*179$117.zzzzzzzzzzzzzzzbwzzs7zzzzzzzzzzwzzwzbzz0TzDzzzzzDzzbzzbwzztlztzzzzztzzwzzwzbzzDC63DNAXy3kzbz3Uw7bdt00Nn1UDkM3wzUA1UAs08m7CMwFy74TbwFWAFX83ANtnDbDttlwzb4tbCF0M7DCNwtzDCDbwsbAtkNlDss3DbDssXwzWA1UD3D833UNwtz3UTUC1UA1wttkwSHDbjwSDw1swbYzbzzzzzzzzzzzzzzzzzzszzzzzzzzzzzzzzzzzzzDzzzzzzzzzzzzzzzzzzlw"
fail := "|<>**45$86.00000000000000000000000000000zzkDUDbk3zzzz0M0A3A3DA0k0S0wA01VVVVVUM0301X00MEMMMM600k0Ak07w3y67zU0A01oDz20kVV08Tz3k9201U48ME240Ea2EzUE1W640Vz48kY08488VV080N245002338ME202EVVE0UUkG640U1Y8EI08E06VV080F2A93w400cME27sEa2EU300C640VzwD0Y80Uz1VVzs0300N20MMEMM0600k0AEU4426601U0A06481X0nVU0M03071y0DU7jzzzzzzz0000000000000008"
Rewards:="|<>*88$59.zzzzzzzzby1zzzzzzzDw1zzzzzzyTs1zzzzzzwznX1aNlAb1kb40Al0M03108WE60kE6S0V408lbbA410A0lXDCQ1l7s1k6S0q3W0lXUAw1U7a3nDWNyH1U"
BountyPlay:="|<>*130$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzrzzzzzzzzzzzzyzzzzzzzzzzzzzrzzzzzzwMSA9iy7XV367r01U00bkMAMk1wl18UYUyGNX4GD60R0Aa7mHA80ktsHg9Yly31U267bVRkgrDkwQ8MEyzzzzznzzzzzzzzzzzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
CheckPlaced := "|<>*105$35.zzzzzzBzzztyNzzznwkAE24NVGYV0sEV801kVWMlXzD7zzzySTzzzzzzzzs"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
retryButton := "|<>**50$48.0000000000000000000S3k00S00S3k00G00G2E00G00G2E00G1zHuTSSG3XmSHqqG30kC1naG2Ql68laG6QnaQt4G6QnaQwAHy8l68w8E70kC1aME7XmSHaMTwzTny4k000000Ak000000AU000000DU0000000000000000U"
Vote:="|<>*88$28.jbyzwSTnztlz7zX888D8U0Uw4NA1sF4kTXUkUzD7X3zzzzzzzzzs"
Wave15:="|<>*137$19.lkDkk7kM7sATw63xX0ylUCMv7ATXCA1b61bXVnU"
cancelButton := "|<>**50$54.00000001s1z000003s73U00003AC1U00003AANjzyDbzANzvAbsyDANbkA3kQ7AN1WAFWMnANXbAtbtnANzbAtbs7AANWAdWNzCC1kAdkM7673tAtsy7a3zTzjTbxy000000000U"
owned := "|<>**65$49.3s00001s7y00000Y61U0000G2ATzzbttvDByqzDozYqn8C1UNqN8AnAnBttU6NUNbgQsXAnwnv0wnaMC1gkvRri7oqDtzjxzTzU"
Wave10:="|<>*98$17.ss7VU63086AE8MQFksXVl33X6D60SA0wQ3U"
GemSymbol:="|<>*51$16.zrzwDzUDw0TU0w03k060000000C00w03s0Dk3zEzxzy"



LegendStageSpots:
SandVillageSpot:="|<>*120$57.70007U7zzwQ002M0TzzU000k0Dzzs000U00Tzz000A001zzs003kE0Dzz000yrU0Tzs007zx47zz001zzzwzzs03zzzzzzz0Dzzzzzzzs0zzzzzzzz07zzzzzzzs0zzzzzzzx03zzzzzzzs0Dzzzzzzz00zzzzzzzs07zzzzzzz00zzzzzzzs07zzzzzzz00zzrzzzzs0TzzzzzTz03zzzzzvzs0TzzzzyTz07zzzzzUzs3zzzzzyTz0Dzzzzznzs0zzzzzzzz03zzzzzzzs0Dzzzzzzz00zzzzzzzs0Dzzzzzzz02Tzzzzzzs1lzzzzzzz00Dvzzzzzs01zzzzzzz007zzzzzzu00zzzzzzz007zzzzzzs00zzzzzzz003zzzzzzs00QDzzjzz0020Tzzzzs00E0zewzz00205k07zs0000401zz001U000Dzs000003nzz000000zzzs00000TTzz000001vzzs00000DTzz000001tzzs000000Dzz0000000TDs1U000003z0A000000Dw"
KuinshinPalaceSpot:="|<>*37$81.00000000000DU000000000003w000000000000TU000000000003w000000000000TU000000000003w000000000000zU000000000007y000000000001zU00000000000Dw000000000001zk00000000000Dy00000004UM03zk0000003yDs1zw0000003zzzzzzU7trzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs000001y0zzy000000007k7zzk00000000y0zzzs00000007k7zzz00000000y0zzzw00000007k7zzzU0000000y0zzzz00000003k7bzzw0000000S0kzzz00000003k47zzw01E0000T0Uzzzw0y00003s67zzzkTo0000T0VzzzzXzs0003s4DzzzwLbY000T0bzzzznwTk003s6zzzzxDV0000T0zvzzwjC80003w5zzzzzslk000DUjzzzzzDzw001w6zzzzzzzzks0DUrzzzzzzzzb01w6zzzzzzzzzw0DUbzzzzzzzzzU1w4Tzzzzzzzzw1DUrzzzzzzzzzbzw7zzzzzzzzzxzzUzzzzzzzzzzzzw7zzzzzzzzzzzzUbzzzzzzzzzzzw6Dzzzzzzzzzzzklzzzzzzzzzzzw4DzzzzzzzzzzjUVzzzzzzzzzzsw47zzzzzzzzzz7kkzzzzzzzzzzky63zzzzzzzzzy7kUPzzzzzzzzzky61Tzzzzzzzzw3UkDzzzzzzzzz0Q61zzwzzzzzzs3kUTzzrzzzzzzUS40jzzzzzzzzk3sk3zzzzzzzzz0S60Tzzzzzzzzw3kk0zzzzzzzzzUS60Dzzzzzzyzw3kk1zzzzzzzkx0S60DzzzzzzyDA3kk1zzzzzzzVU0S60Dzzzzzzw003sk3zzzzzzz008T60Tzzzzzzk03Xsk3zzzzzzy00QT60zzzzzzzk03XwkDzzzzzzy00sTa1zzzzzzzk033wkDzzzw03y000TY1zzzx00Ts00jykTszy003z000Tq1m00000Ds003zkMm00000DU00Tw"
ShibuyaAftermathSpot:="|<>*44$81.000000000007ns00000000000yT00000000000DXs00000000001wT00000000000DXs00000000001wz00000000000T7M00000000003sk00000000000T6000000000003tz00000000000SDs00000000007lz00000000000yDs00000000007nz00000000000yTs0000000000DXz00000000001wTs0000000000Dbz00000000001wzs0000000000T7z00000000003szs0000000000T7z00000000003tzs0000000000SDz00000000007lzs0000000000yDz00000000007nzs0000000000wTz0000000000DXzs0000000001wTz0000000000DXzs0000000001wzz0000000000T7zs0000000003szz0000000000T7zs0000000003tzz0000000000SDk80000000007lo10000000000yAU00000000007ngq0000000000yTzs000000000DXzz0000000001wTzs000000000DXzz0000000001wzzs000000000T7zz0000000003szzs000000000T7zz0000000003tzzs000000000SDzz0000000007lzzs000000000yDzz0000000007nzzs000000000yTzz000000000DXzzs000000001wTzz000000000DXzzs000000001wzzz000000000T7zzs000000003szzz000000000T7zzs000000003tzzz000000000yDzzs000000007lzzz000000000yDzzs000000007lzzz000000000yTzy000000000DXy00000000001wM00M00000000DX0Tz000000001wzzzs00000000T7zzz000000003szzzs00000000T7zzz000000003tzzzs00000000yDzzz000000007lzzzs00000000yDzzz000000007lzzzs00000000wTzzz00000000DXzzzw"
SpiritSocietySpot:="|<>*41$71.00001s00000000001k00000000003U0000000000700000400000D00001M00000zzzzzzyXzzzzzzzzzzy01zzzzzzzzzw00A03kA0240000803UE0000000E070U000000000C30000000000Q60000000000s80000000201kk0000000403VU0000000807a00000000E0CA00000000U0CM0000200100QU0000400200v00000000301y08k00000103zDzzk0000DUDzzzzw00003UDzzzzk00001UTzzzw0000020zzzzk0000001zzzyU0000003zzzw000001k7zzzk800003U7zzzUE001L00Dzzz00006800Tzzy00008004zzzw00000001zzzw00000003zzzs00000007zzzs0001000Dzzzk0002000Tzzy00000000zzzw00000001zzzs0000000Nzzzk0000800Xzzzk0000k017zzzk0001U02DzzzU0003U04TzzzU0803008zzzz00Q0600Fzzzy00y2800Vzzzy01z4E013zzzy03zMEEy7zzzw07zLlzwDzzzw0DyzbzsTzzzw0TzzzzkzzzzzkzzzzzVzzzzzVzzzzz3zzzzz3zzzzzDzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzzzzzzzy000001kE0Tzw000003U04000000007U0000000000D00000000000S00000000000w00000000001s00000000003k00000000007W0000000000D00000E"

LegendStages:
KuinshiPalace:="|<>*70$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzxzzszzzzXzlblzzkzzzz3zV71zzXzzzy7z6A7zzzzzzwDzwETzzzzzzsTzs1swAMVy0k3sk7ksME1s1U3kUTVkkU1k303V0z3VX01Vy0360yD36730QC6A0wC6AS70MwANUsQAMwD0FsMnUk0MlsRkXklbVk0lXkk17VXDXk1X7VU6D36Tblb6DbUQTCDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
GoldenCastle:="|<>*72$59.z7zzwTz3zzk3zzsTy7zz01zzkzwDzw03zzVzsTzkCDzz3zkzzVzz0y7sVs73zw0wD03U2D0k0sy0604Q1UUls0AC8w37VXksMQEz6D37Xkk0UyAS6D3VU3UEM8AC033zU0s0sC0607U3k3kS0C0DkDsDsyAz0zzzzzzzzzzk"
ShibuyaAftermath:="|<>*71$66.sT7zX7zzzzzU73zV3zzzzzU33zX3zzzzz033zz3zzzzz3b3zz3zzzzz3z0DX0D7VXs0z07X073V3kU703V033VVkk301X033VVkw33VX3V7VkVzV7VX3V7Vs17V7VX3V3Vs3337VX0301w3037VX03U1w7U77VX07k1y7kD7nX4TsnyDzzzzzzzzzwDzzzzzzzzzwTzzzzzzzzzsTzzzzzzzzzszU"
DoubleDungeon:="|<>*71$59.zzzzzzz7z707zzzzy7y603zzzzwDwA03zzzzsTsMQ7zzzzkzkkw7UT7VU7VVwC0S730733sM0QC60667skEMQA0AQDVXklsMQ8sT37VXkksFlwCD33VVkXU0Q460303301w0S0606207s1y0A0Q40zw7yAsXyDzzzzzzzzzk"
SandVillage:="|<>*74$49.sTzzzzzsE3zzzzzw80zzzzzy00Tzzzzz0CTzzzzzU7zl74DwE1zU1U3s0E3U0k0w0A0k0M0A07UMwAC673y4S6D37UD2737VVk3301Xkk001k0lsQ081s0swD061z6QTDla"

StorySpots:
NamekSpot:="|<>*82$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzU00Dzzzzzzzzzy00000Tzzzzzzzk0000000zzzzzz000000007zzzzs00000000zzzzzU00000007zzzzy00000000zzzzzU00000007zzzzw00000000zzzzw000000007zzzzk00000000zzzzy000000007zzzzU00000000zzzzw000000007zzzz000000000zzzs0000000007zzs0000000000zzy00000000007zzk0000000000zzy00000000007zzs0000000000zzz00000000007zzw0000000000zzz00000000007zzs0000000000zzzU0000000007zzy0000000000zzzs0000000007zzzk000000000zzzzk000000007zzzk000000zy0zzzu00000zS3zzzzzU00007xsAzzzzw00000Tj1zzzzbs00003TsDzzzzz0000UHjUzzzzzs000A0Qs7zzzzz000000r3zzzzzw000M16SCzzzzzk007k0bsHzzzzy001zU0T0Tzzzzk00Ty03A7zzzzs007zw2A0zzzzz001zzwE03zzzzw0UTzzs00DzzzzsDzzzz0klzzzzjXzzzzwTpzzzzzzzzzzznyDzzzzlzzzzzyTrzzzzz7zzzzzzzzzzzzwzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzjzzzzzzzzzzzzBDzzzzzzzzzzzztzzzzzzzzzzzzyTzzzzzzzzzzzzXzzzzzzzzzzzzwTzzzzzzzzzzzztzzzzzzzzzzzzzzRzzzzzzzzzzzzmDzzzzzzzzzzzyszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
;SpiritSocietySpot := "|<>*75$54.zzzzzzzzzwDzzXzwTzk3zzVzwCTk1zzXzwQDU1zzzzzwDVnzzzzzwDVzW7X4AM1UzU3X0AE1k3U1X0AE1s1U1X1QM3y1VkX3wQDzkXkX7wQDXkVlX7wQDVVU1X7wQDU1U3X7wS3k3U3X7wS3s7XzX7wTXzzXzzzzzzzzXzzzzzzzzXzzzzzzzzXzzzzzzzzzzzzzzzU"



StoryStages:
SpiritSociety:="|<>*76$52.sTzz7zszy0TzwDzVns0zzlzyC703zzzzzsQCTzzzzzVkzl3lW6A01z0760MU20Q0AM1W0A0k0lViA1w33V67ssTy4S4MzXVlsEslXyC733036DssQ0A0QMzXkM1k1lXyD1kD7z6Dsz7zwTzzzzzzzlzzzzzzzz7zzzzzzzwTzzzzzs"
UndergroundChurch:="|<>*72$61.zzzzzy7zzzXyDzzz3zzzkz7zzzVzzzsTXzzzkzzzwDlzzzsTzzy7sl3z4D0wE3wM0y070601yA0D030300z60301VlUcTX3VVkkskwDVXklsM0My7klsMQA0QTUUswA067yDk0QS703037w0SD3k1k1XzUz7nwNy1ly"
ShibuyaStation:="|<>*71$70.sTzzzzzXzzzy0TDzzwy7zzzs0sTzzVszzzz03Vzzy7zzzzwCS7zzsTzzzzkzk3l708w3sV0y0A080VU7U20M0U0U240C0A0k6030MkEM0w3VsQC7X7VVny67XksSAS6D1sMS73VslsMw33Vs0C7X11Xk0D1k0w6C0CD81w703kMs1swkDwT6TlXsDXu"
PlanetNamak:="|<>*77$66.zzXzzzzzzzz07VzzzzzzzD03Vzzzzzzy701Vzzzzzzy73VVzzzzzzy73kXy8sVz0w03kXs0M0y0803UXk0M0Q08001Xk0M0QCA101XlsMQACC703XlsMwA0C70TXlsMwA0S77zVk0MwADy77zUs0MwA0D17zUw0swC0D17zsyAsyTUTlU"
;same name, so i took the "normal" text to double check (double dungeon)
Normal:="|<>*113$53.zzzzzzzzaTDzzzzzzASTzzzzzyMQzzzzzzwktkQaH7mNUn0M4060n8a0kM0A1aM8sbn4FXAkFlDaAXaNkk6TANUAHlUAyMn0M7nUtwnb4lU"




Modifiers:
Explosion:="|<>*56$61.zzzzzjzzzzzzzzzrzzzzzzzzztzzzzzzzzzszzzzzzzzzwTzzzzzzzzyDzzzzzzzzz7zzzzzzzzzXzzzzzzzzzkzzzzzzzzzkTzzzzzzzzsDzzzzzzzzw7zzzzzzzzy3zzzzzzzzz0zzzzzzzzzUTzzzzzzzzUDzzzzzzzz07zzzzzzzzU0Tzzzzzzzs0Tzzzzzztw0DTzzzzzyT0DDzzzzzz7UDbzzzzzzls77zzzzzzwT73zzzzzzy7z1zzzzzzvUz0zzzzzzzkC0Tzzzzzzk003zzzzzzU0000Tzzzs000003zzzk0003zzzzzzzk03zzzzzzzs00vzzzzzyQMMQzzzzzyQACDjzzzzyyC7XzzzzzzzDXtzzzzzzzDlyTzzzzzzztzjzzzzzzzwzzzzzzzzzyTzzzzzzzzzjzzzzzzzzzrzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Exploding:="|<>*57$45.zzzzzzzzzzzzzzzzzzrzzzzzzyzzzzzzznzzzzzzwTzzzzzzXzzzzzzwTzzzzzzXzzzzzzwTzzzzzzVzzzzzzsDzzzzzz1zzzzzzsDzzzzzz1zzzzzzsDzzzzzz0zzzzzzk7zzzzzs0zzzzzz00zzzzzw0DzzzzDU1vzzzwy0STzzzXk7nzzzyD0szzzzsyC7zzzz3zUzzzzQ7s7zzzzUQ0zzzzs001zzzw00003zk000007s0001zzzzy00Tzzzzk01rzzzCAACTzznXVlxzzxwQD7zzzzblwzzzztyDnzzzzznzTzzzzyTzzzzzznzzzzzzzTzzzzzzvzzzzzzzTzzzU"
Thrice:="|<>*37$50.zzzzzzzzzzzz0zzzzzzy07zzzzzz00Tzzzzz003zzzzz000TzzzzU001zzzzk0U0Dzzzs1z01zzzy1zw0Dzzz1zzU1zzzkzzw0DzzsDyzU1zzy7y1w0Tzz1z0DU7zzkTU1s0zzw7vUD0Dzz1zw3k3zzsTzUw0zzy7zsDUDzzkzw3s7zzy7z1w1zzzlz0T0zzzy00DkTzzzk07sDzzzy03w7zzzzk1z3zzzXzzzVzzzk7zzkzzzs0zzkTzzyQDzsDzzzjXzk7lzzxwTs3tjzz77w1yvzzzny0zjzzzwz0zvzzzzTkTzzzzzzwDzzzzzzz7zzzzzzztzzzzzzzzTzzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy"
Champions:="|<>*20$45.zzzzzzzzzzzzzzzzzzzzzzzzzyzzzzzzz0zzzzzzk0zzzzzs01zzzzy007zzzzk00Dzzzw000zzzzk001zzzy00U7zzzs0D0zzzz03s7zzzw0z1zzzxoDUDzzz71s1zzzss70Tzzz30k7zzzk843zzzy000TzzzU001zzzw0007zzzU000zzzw000Lzzzk001zzzw000Dzzzn00lzzz0S0S1zzw1wDUDzzU3nk3zzy0CQ0zzzU0v07zzs06M1zzy00k0DzzU06E7zzs00y1zzz1U3kDzzsTsS7zzz7zXlzzzwzySTzzzjznnzzzzzzTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Immunity:="|<>*34$63.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTzzzzzzzzzXzzzzzzzzzwDzzzzzzzzz0zzzzzzzzzk3zzzzzzzzw8Tzzzzzzzz3UzzzzzzzzUy3zzzzzzzkCw3zzzzzzk7Xs3zzzzzy3k3kzzzzzzss0D7zzzzzz600szzzzzzsk07Dzzzzzzb00lzzzzzzwM06DzzzzzzX00nzzzzzzyM0CTzzzzzznU1XzzzzzzyQ0ATzzzzzzlU3bzzzzzzyA0Qzzzzzzzlk37zzzzzzsC0M7zzzzzs1k707zzzzy07Vs0Tzzzzk0SS07zzzzz01zU0zzzzzs27kk7zzzzs1sQDUDzzzz0Dl3s1zzzzw3z0zUDzzzz3zwTzkzzzzvzzrzzrzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"
Revitalize:="|<>*51$68.zzzzzzzzzzzzzzk1zz07zzzzzs0DzU0Tzzzzw00zk03zzzzz007s00Dzzzy000s001zzzzU004000Tzzzk0000003zzzs0000000Tzzy00000007zzz00800000zzzk0Ds0Tk0Dzzw07zUTw03zzz01zwTzU0zzzk0zzjzs0Dzzw0Dzzzz03zzz03zzzzs0zzzs1zzzzw0Tzzy0Dzzzz07zzzU3zzzzU3zzzw0Tzzzs3zzzzU7zzzw0zzzzw0zzzz0DzzzzU7zzzU7zzzzw0zzzU3zzzzzs3zzk3zzzzzy0Tzs1zzzzzzk3zs0zzzzzzy0Dw0zzzzzzzk1w0Tzzzzzzy0C0Dzzzzzzzs007zzzzzzzz007zzzzzzzzs03zzzzzzzzzU1zzzzzzzzzw1zzzzzzzzzzkzzzzzs"
Quake:="|<>*40$64.zzzzzrzzzzzzzzzTTzzzzzzzztxzzzzzzzzzXzwzzzzzzzzDzXzzzzzzzyzyDzzzzzzzzzVzzzzzzzzzyDzzzzzzzbxlzzzzzzzzDrTzzzzzzzzTzzzzzzzzzzzzzzzzzzzzzrzzzzzzzzzp7zzzzzzzzwonzzzzzzzzWF7zzzzzzzs0WDzzzzzzy860DzzzzzzU1EEzzzzzzw0601zzzzzzU0M81zzzzzw01U01zzzzzU04001zzzzw00E003zzzzU020007zzzw008000Tzzzs00U001zzzzk04000Tzzzzl0E007zzzzzz3000zzzzzzyC007zzzzzzwy01zzzzzzzzz0zzzzU"


ChallengeTypes:

EssenceStone:="|<>*96$57.0Dzzzzzzzs1zzzzzzzz0DzzzzzzztzksQ78yD10w630M30k03bnsX0M680w624NmDV1zkM03CFw00BWl7tn0ls1UE83CM600A63UtnlsA"
StatChip:="|<>*100$65.zzzzzzztzDz1nzzDzUnyTw1bzyTw0bwzsbDzwzk1Dzznw7YkTXyHn9UkA10yDw1a1UEM31wTs3A1knX7DwznaNltb7CTszbAnUX70QTk3CNU0660sTk2Qn0kyD9szsQtaHzzzzzzzzzwzzzzzzzzzztzzzzzzzzzznw"

if (ok:=FindText(&X, &Y, 352, 217, 426, 248, 0, 0, EssenceStone))
if (ok:=FindText(&X, &Y, 348, 219, 484, 252, 0, 0, StatChip))

LoadRewards()
LoadState()
StartupSound()
LoadSkipEssence()

AllTimeRewards.Value := "Gems: " FormatNumber(globalGems) "`nRerolls: " FormatNumber(globalRerolls)

Manual := false
roundStart := A_TickCount
global FoundLastWave := false

timeset := 100000
roundLast := 1215000
NeuX := 381 ;neutral mouse position ingame (resting position)
NeuY := 364
global Priority := ["First", "Closest", "Last", "Strongest", "Weakest", "Bosses"]
SpeedCordsSelling := ""
global inLoop := false 
global Infinity := false 
global PlayedInf := 0
global LegendStage := false
global paused := false
global Challenge := false
global CurrentChallenge := ""
Levels := [
    upgrade1,
    upgrade2,
    upgrade3,
    upgrade4,
    upgrade5,
    upgrade6,
    upgrade7,
    upgrade8,
    upgrade9,
    upgrade10,
    upgrade11,
    upgrade12,
    upgrade13,
    unitmaxed
]

UpgradeLevels := [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    "max",
]

F1:: {
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(327, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Bounty macro") {
        Sleep 50
        WinActivate("Bounty macro")
        Sleep 100
    }
  
}



F2:: {

   
   LoadAndUpdateUnitsBounty(true)

    if WinExist("Bounty macro") {
        WinActivate("Bounty macro")
    }

    if WinExist(RobloxWindow) {
        WinMove(327, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("Open Roblox to start the macro")
        return
    }

    if (GameModes.Text == "Bounty") {
        if (CheckSettingsButton.Value == 1) {
            AddToLog("Checking for correct Settings")
            CheckGraphicalSettings()
         }
         else {
            AddToLog("Skipping settings check")
         }
        StartBounty()
        return
      }
    else if (GameModes.Text == "Infinity") {
        if (CheckSettingsButton.Value == 1) {
            AddToLog("Checking for correct Settings")
            CheckGraphicalSettings()
         }
         else {
            AddToLog("Skipping settings check")
         }
        NamekInfinity()
        return
      }



      else {
          MsgBox("Select a Gamemode before you start!")
          StopMacro()
       }



}

F3:: { 
    global Manual
    Manual := false
    ;SaveState()
    LoadAndUpdateUnitsBounty(true)
    SaveRewards()
    StopMacro()
}

F4:: { 
    global paused
   if paused {
        paused := false
        AddToLog("Unpaused")
        Pause(false)
        return
    }
    else {
        paused := true
        AddToLog("Paused")
        Pause(true)
        return
    }
   }


CheckGraphicalSettings() {
if (ok:=FindText(&X, &Y, 918, 594, 998, 627, 0, 0, BackButtonBountyMenu)) {
    BetterClick(617, 561)
}   
sleep 500
SendInput("{Escape}")
sleep 1000
BetterClick(253, 85)
sleep 500
MouseMove(504, 281)
sleep 300

Loop 3 {
    SendInput("{WheelDown}")
    Sleep 400
}

sleep 700
BetterClickX(444, 212,4,100)
sleep 500
SendInput("{WheelDown}")
sleep 1000
BetterClickX(392, 377,4,100)
sleep 500
SendInput("{Escape}") ; scroll down
sleep 1000
BetterClick(16, 578)
sleep 500


;----- Check if all the settings r enabled 

BetterClick(394, 285)
sleep 500
Loop 8 {
    SendInput("{WheelUp}") ;scroll up to make sure you r at the top
    Sleep 200
}
sleep 400

Settings:=FindText(&X, &Y,  844, 310, 871, 474, 0.3, 0.3, SettingEnabled)

if Settings {
WinGetPos(&WinX,&WinY)
    for Setting in Settings {
        x := Setting.x - WinX
        y := Setting.y - 33 - WinY
        BetterClick(x,y)
        sleep 500
    }
}
sleep 500
MouseMove(378, 365)
sleep 200
loop 5 {
Sleep 100
SendInput("{WheelDown 10}")
}
sleep 300
BetterClick(517, 445)
sleep 1000

loop 3 {
sleep 40
SendInput("{WheelDown 10}")
}
sleep 1000
BetterClick(453, 515)

sleep 500
BetterClick(572, 127)
sleep 1000

return

}



GoToBounty(inLoop,CheckBounty) {
    loop 3 {
        Sleep 1000
        MouseMove(86, 255)
        sleep 500
        MouseMove(NeuX,NeuY)
        sleep 500
    if (ok:=FindText(&X, &Y, 398, 313, 451, 333, 0, 0, Play)) { ;1
        sleep 1000
        BetterClick(88,257)
        sleep 500
        BetterClick(88, 257)
        sleep 1500

        SendInput ("{s up}")  
        Sleep 100  
        SendInput ("{s down}")
        Sleep 9500
        SendInput ("{s up}")
        KeyWait "s" 

        sleep 1000

        SendInput ("{a up}")  
        Sleep 100  
        SendInput ("{a down}")
        Sleep 300
        SendInput ("{a up}")

        sleep 1000

        SendInput ("{d up}")  
        Sleep 100  
        SendInput ("{d down}")
        Sleep 300
        SendInput ("{d up}")

        Sleep 1000

        SendInput("e")
        sleep 1000
        BetterClick(447, 434)
        sleep 500
        BetterClick(447, 434)
        Sleep 2000

        if (inLoop == true ) {
        StartBounty()
        }

        if (CheckBounty) { ;2
            if (!ok:=FindText(&X, &Y,978, 565, 993, 576, 0, 0, ZeroBounty)) and (!ok:=FindText(&X, &Y, 973, 563, 995, 577, 0, 0, TenBounty)) { ;3

                AddToLog("Bounties didnt reset")
                BetterClick(626, 560)
                sleep 1000
                if (Challengetime()) {
                    StartChallenge()
                }

                else {
                    StartInf()
                    Challenge := false
                    break
                }
               
            } ;3
        
            else {
                AddToLog("Bounty reset, playing bounties again")
                sleep 1000
                StartBounty()
                break
            }

        } ;2

       return
    } ;1

    ;returns to code if he doesnt find play text in the loop 3 

 }
 return
}

antiSoftLock(game) {
    ;sex
    global Movement, Manual, FoundLastWave,CurrentMap, Infinity, PlayedInf, Challenge
    
    if (ok := FindText(&X, &Y, 449, 191, 776, 255, 0, 0, fail)) {
    AddToLog("Failed match")
    matchwin := false 
    movement := 0 
    if (!Challenge) {
    UpdateFail() ;updates second number in bounty wins if not challenge
    }
    sleep 1000
    SendWebhook(true)
    Sleep 2500

    BetterClickX(611, 422,4,100)
    AddToLog("Returning to Lobby")
    matchwin := false 
    movement := 0 
    LegendStage := false
    CurrentMap := ""
    Challenge := false
    Sleep 1000
    CheckSetting(false)
    return
 
} 



else if (ok := FindText(&X, &Y, 449, 191, 776, 255, 0, 0, Victory)) {
    if (!Challenge) {
    AddToLog("Won Bounty")
    UpdateRewards(530,1)
    UpdateWin(false)
    }
    else {
        AddToLog("Won Challenge")
        UpdateRewards(60,0) 
        UpdateChallengeStats() ;updates challenge gui 
        Challenge := false
    }

    sleep 1000
    SendWebhook(true)
    sleep 2500

    BetterClickX(611, 422,4,100) ;click return
    AddToLog("Returning to Lobby")
    Movement := 0 
    matchwin := true
    LegendStage := false
    CurrentMap := ""
    Sleep 1000
    CheckSetting(false)
    return
}

;if (ok := FindText(&X, &Y, 759, 432, 1037, 506, 0, 0, ReturnToLobby)) 
   

if (Infinity) {
if (ok := FindText(&X, &Y, 579, 64, 602, 83, 0.2, 0.2, Wave10)) {
        PlayedInf++
        sleep 200
        if (PlayedInf <= 5 && !Challengetime()) {
        UpdateRewards(100,0)
        UpdateWin(true)
        sleep 200
        AddToLog("Played Infinity in a row: (" PlayedInf ") ")
        Sleep 1000
        movement := 0
        RestartMatch()
        undergroundPlacementInf()
       }
       else {
            movement := 0
            PlayedInf := 0
            UpdateRewards(100,0)
            UpdateWin(true)
            sleep 500
            Infinity := false 
            if (Challengetime) {
                AddToLog("Challenge reset, playing Challenge") ;checks if challenge is true in checksetting, so if the time has come it does it
                Challenge := true
            }
            else {
                AddToLog("Checking if Bounty reset")
            }
            sleep 1000
            SendWebhook(true)
            Sleep 1000
            BetterClick(21, 574)
            sleep 500
            BetterClick(512, 246)
            sleep 500
            BetterClick(346, 314)
            sleep 500

            CheckSetting(true) ;waits till it loads into lobby and if challnge is set to true, it starts challenge and breaks before continuing with inf, if not challenge it skips and starts inf
       }
    }
}
    if (game) {
    BetterClick(403, 312)
    }
 }


StartChallenge() {
   
    global Challenge, CurrentMap, CurrentChallenge
    MapLog.Text := "Map: " CurrentMap

    while (Challenge) {
        AddToLog("Going to challenges")
        BetterClick(37, 317) ; click areas
        Sleep 500

        loop 3 {
            BetterClick(525, 273) ; click challenges
            Sleep 50
        }

        Sleep 200
        BetterClick(564, 196)
        Sleep 1500

        SendInput ("{w up}")
        Sleep 100
        SendInput ("{w down}")
        Sleep 5200
        SendInput ("{w up}")
        KeyWait "w" ; Wait for "w" to be fully processed


        SendInput("{d up}") ; Ensure key is released
        Sleep 100
        SendInput ("{d down}")
        Sleep 2500
        SendInput ("{d up}")
        KeyWait "d" ; Wait for "d" to be fully processed
        Sleep 2000

        if (ok := FindText(&X, &Y, 668, 336, 736, 360, 0.1, 0.1, CreateButton)) {
            BetterClick(360, 300)	; createpress
            Sleep 2000
            Lobbychecks()
            sleep 500
            Challenge := true
            ;checks for what type of challenge it is, so we update the rewards properly
            if (ok:=FindText(&X, &Y, 352, 217, 426, 248, 0, 0, EssenceStone)) {
                if (SkipButtonEssence.Value == 1) {
                    BetterClick(241, 427)
                    AddToLog("Skipping Essence Stone challenge")
                    sleep 1000
                    StartInf()
                    return
                }
                CurrentChallenge := "Essence Stone"
                AddToLog("Going into Essence Stone Challenge")
            }

            else if (ok:=FindText(&X, &Y, 348, 219, 484, 252, 0, 0, StatChip)) {
                CurrentChallenge := "Stat Chip"
                AddToLog("Going into Stat Chip Challenge")
            }

            else { 
                 CurrentChallenge := "Trait Reroll"
                 AddToLog("Going into Trait reroll challenge")
            }
            
            AssignMap()
            break

        } 

        else {
            BetterClick(234, 431) ;		
            sleep 2000	
            AddToLog("No challenge found")
            StartInf()
            break
            }
    }
}

StartBounty() {
   ;xex 
        sleep 1000
        global Manual, Infinity, CurrentMap
        CurrentMap := "" ;resets the map it detected last game
        map := "" ;the map to get the placements from
        Manual := true
        Infinity := false
        PlayedInf := 0
        LegendStage := false
        Challenge := false
      
        CheckForLogAndTab(false)
        GoToBounty(false,false) 
        sleep 2000
       
        if (ok:=FindText(&X, &Y,978, 565, 993, 576, 0, 0, ZeroBounty)) and (!ok:=FindText(&X, &Y, 973, 563, 995, 577, 0, 0, TenBounty)){
            AddToLog("No Bounties left, starting inf and going challenge from there")
            BetterClick(626, 560)
            sleep 500
            StartInf()
        }
        
       

        else if (ok:=FindText(&X, &Y, 825, 101, 934, 133, 0.1, 0.1, BountyPlay)) {
            AddToLog("Searching for map")
            BetterClick(737, 159)
            Sleep 1000
            BetterClick(557, 443)
            Sleep 1500
            LobbyChecks()
            BetterClickX(406, 323,3,200)
            sleep 200
            AssignMap()
        }
        
    
        else {
            AddToLog("No current state found, going inf ")
            sleep 1000
            BetterClick(626, 560)
            sleep 500
            StartInf()
            
        }
    }

Lobbychecks() {
   
if (ok:=FindText(&X, &Y, 615, 294, 691, 324, 0.3, 0.3, CancelCheck)) {
        BetterClickX(406, 323,3,200)
        AddToLog("Clicked Cancel")
   }
 
}

StartInf() {
global MapLog, Infinity
Challenge := false
Infinity := false

while (true) {
AddToLog("Going to Infinity")
sleep 500
BetterClick(614, 563)
sleep 500
BetterClick(88, 257)
sleep 500
BetterClick(88, 257)
Sleep 1700
SendInput ("{s up}")  
 Sleep 100  
SendInput ("{s down}")
Sleep 5000
SendInput ("{s up}")
KeyWait "s" 
;----
sleep 500
SendInput("{d up}") 
Sleep 100
SendInput ("{d down}")
Sleep 4500
SendInput ("{d up}")
KeyWait "d"

if (ok:=FindText(&X, &Y, 340, 275, 489, 314, 0.1, 0.1, CreateMatch)) {
    BetterClick(85, 250) ; CreateMatch
    Sleep 1000
    BetterClick(138, 389) ; select underground
    Sleep 1000
    BetterClick(307, 195) ; select sandbox
    Sleep 800
    loop 3 {
        Sleep 50
        SendInput("{WheelDown 10}") ; scroll down
    }
    Sleep 800
    BetterClick(346, 340) ; select inf
    Sleep 1000
    BetterClick(560, 445) ; Start
    sleep 500
    Lobbychecks()
    Sleep 1000
    BetterClick(110, 438) ; Start2
    CurrentMap := "UndergroundInf"
    sleep 200
    MapLog.Text := "Map: " CurrentMap
    Infinity := true 

    while (!ok:=FindText(&X,&Y,647, 119, 824, 193, 0, 0, Vote)) {
        Sleep 1000
    }
   
    Sleep 3000
    LookDown()
    SendInput("{Tab}")
    sleep 200
    BetterClick(365,122)
    Sleep 1000
    loop {
        success := false 
        success := PlacedUnit()
        BetterPlace(398, 302,SpeedWagonSlot)
        sleep 1200
        if (success) {
        TPtoSpawn()
        sleep 1000
        SpecSpeed()
        sleep 1000
        RestartMatch()
        sleep 400
        BetterClick(366, 124) ;start match
        sleep 500
        undergroundPlacementInf()
        break
        }
    }
     
  } else {
    AddToLog("Teleporter not found, trying again")
    BetterClick(400, 102)
    sleep 1000
  }
 }
}

AssignMap() {
global MapLog, LegendStage, CurrentMap
CurrentMap := ""
LegendStage := false


Sleep 500
if (ok:=FindText(&X, &Y, 101-150000, 177-150000, 101+150000, 177+150000, 0, 0, KuinshiPalace)) {
    CurrentMap := "KuinshiPalace"
    LegendStage := true
}

else if (ok:=FindText(&X, &Y, 94-150000, 177-150000, 94+150000, 177+150000, 0, 0, GoldenCastle)) {
    CurrentMap := "GoldenCastle"
    LegendStage := true
}

else if (ok:=FindText(&X, &Y, 98-150000, 179-150000, 98+150000, 179+150000, 0.1, 0, ShibuyaAftermath)) && (!ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)){
     CurrentMap := "ShibuyaAftermath"
     LegendStage := true
}

else if (ok:=FindText(&X, &Y,93-150000, 177-150000, 93+150000, 177+150000, 0, 0, DoubleDungeon)) && (!ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)){
    CurrentMap := "DoubleDungeon(L)"
    LegendStage := true
}

else if (ok:=FindText(&X, &Y, 89-150000, 177-150000, 89+150000, 177+150000, 0, 0, SandVillage)) && (!ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)) {
    CurrentMap := "SandVillage(L)"
    LegendStage := true

}


else if (ok:=FindText(&X, &Y, 91-150000, 214-150000, 91+150000, 214+150000, 0, 0, SpiritSociety)){
      CurrentMap := "SpiritSociety"
      
}

else if (ok:=FindText(&X, &Y, 95-150000, 212-150000, 95+150000, 212+150000, 0, 0, UndergroundChurch)){
      CurrentMap := "Underground"
}

else if (ok:=FindText(&X, &Y, 186-150000, 212-150000, 186+150000, 212+150000, 0, 0, ShibuyaStation)){
      CurrentMap := "ShibuyaStation"
}

else if (ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)) and (ok:=FindText(&X, &Y,93-150000, 177-150000, 93+150000, 177+150000, 0, 0, DoubleDungeon)) {
         CurrentMap := "DoubleDungeon"
         
    }

else if (ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)) and (ok:=FindText(&X, &Y, 89-150000, 177-150000, 89+150000, 177+150000, 0, 0, SandVillage)) {
    CurrentMap := "SandVillage"
    
}

else if (ok:=FindText(&X, &Y, 358, 244, 423, 259, 0, 0, Normal)) and (ok:=FindText(&X, &Y, 98-150000, 212-150000, 98+150000, 212+150000, 0, 0, PlanetNamak)){
      CurrentMap := "PlanetNamak"
 }
else  {
    AddToLog("No map Found, starting infinity")
    StartInf()
}
 
MapLog.Text := "Map: " CurrentMap
Sleep 1000

BetterClickX(92, 463,3,50)
sleep 160
BetterClickX(92,430,3,50)
Sleep 300

AddToLog("Going into " CurrentMap)

LoadIn() 

}



Loadin() {
global LegendStage, CurrentMap

loop {
     Sleep 500
     if (LegendStage) {                   ;if "legendstage" is true (which is set to true on assignmap for Lstages) clicks in the middle to pick any card at the start when loading in
     BetterClick(393, 289)
     }
    if (ok := FindText(&X, &Y, 647, 119, 824, 193, 0, 0, Vote)) {   ;loops till it finds vote start
        AddToLog("Loaded into " CurrentMap " successfully, waiting 8 seconds")
        sleep 8000
        SendInput ("{Tab}") 
        AddToLog("Tabbed")
        Sleep 1500
        
        Position() ;here starts the speed placements
        break
    }
    
}

}

Card1 := Immunity
Card2 := Exploding
Card3 := Champions
Card4 := Revitalize  ;Change to whatever is easier for your team
Card5 := Quake
Card6 := Thrice


CheckCards() {
    loop {
    MouseMove(260, 260)
    Sleep 100
    MouseMove(400, 260)
    Sleep 100
    MouseMove(540, 260)
    Sleep 100
    MouseMove(640, 125)
    Sleep 1000
    if (!ok:=FindText(&X, &Y,480, 389, 967, 433, 0.2, 0.2, CardExistence)) {
        AddToLog("Map doesnt have cards")
        Sleep 500
     return false 
    }
  

    ;-----------------------------------
    ;this is for legend stage only
    if (ok := FindText(&X,&Y,524, 241, 939, 417,0.1,0.1,Card2)) { ;if he finds the "card1", run the code. Else it restarts 
        WinGetPos(&WinX,&WinY)
      BetterClickX(X-WinX,Y-WinY,3,100) ;click the cards position 
      Sleep 300
      AddToLog("Card found")
      Sleep 1300
      BetterClick(396, 300)
      Sleep 700
      BetterClick(366, 123) ;vote starts
      Sleep 1000
      return
    }
    else
    AddToLog("Card not found") ;restarts here to try to find again
    Sleep 500
    BetterClick(400, 260) ;clicks any card i think? forgot
    Sleep 800
    BetterClick(397, 302) 
    Sleep 500
    BetterClick(365, 123) ;Vote start
    Sleep 6000
    BetterClick(20, 574)
    Sleep 500
    BetterClick(516, 280)
    Sleep 500 
    BetterClick(342, 312)
    Sleep 1000
   
}
}




Position() { ;this runs only after the macro loaded into load in

global CurrentMap

if CurrentMap == "KuinshiPalace" { ;depending on which map got picked in assignmap(), runs the speed placement to it
LookDown()
BetterClick(365, 122) ;click vote start after the load in part 
Sleep 1000
KuinshinSpeedPlace()

}

else if CurrentMap == "SandVillage(L)" or CurrentMap == "SandVillage" {
  
LookDown()
BetterClick(365, 122)
Sleep 1000
SandVillageSpeedPlace()

} 

else if CurrentMap == "Underground"  {
LookDown()
sleep 200
BetterClick(365,122)
Sleep 1000
UndergroundSpeedPlace()

}

else if CurrentMap == "PlanetNamak" {

LookDown()
sleep 200
BetterClick(365,122)
Sleep 1000
PlanetNamakSpeedPlace()



 }

else if CurrentMap == "DoubleDungeon" or CurrentMap == "DoubleDungeon(L)" {

    LookDown()
    sleep 200
    BetterClick(365,122)
    sleep 1000
    DoubleDungeonSpeedPlace()
}

else if CurrentMap == "ShibuyaStation" {
    LookDown()
    sleep 200
    BetterClick(365, 122)
    sleep 1000
    ShibuyaStationSpeedPlace()
}

else if CurrentMap == "SpiritSociety" {
    LookDown()
    sleep 200
    BetterClick(365, 122)
    sleep 1000
    SpiritSpeedPlace()
}

else if CurrentMap == "GoldenCastle" {
    LookDown()
    sleep 1000
    BetterClick(365, 122)
    sleep 1000
    GoldenCastleSpeedPlace()
}

else if CurrentMap == "ShibuyaAftermath"  {

    LookDown()
    sleep 1000
    BetterClick(365, 122) 
    sleep 1000
    ShibuyaAftermathSpeedPlace()
}


}










ShibuyaAftermathFindSpot() {
    tries := 0
    loop {
        tries++ 
		if (ok:=FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, Rewards) or ok:= FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, fail)) { 
            BetterClick(495, 425) ; Replay
			Sleep 400
            BetterClick(393, 289) ;click the middle card
            sleep 500 
            BetterClick(365, 122) ;click vote start 
            sleep 500
            ShibuyaAftermathSpeedPlace() ;place speed again
        }

        Sleep 600
        SpecSpeed()
        Sleep 600

        if (ok:=FindText(&X, &Y,337, 368, 475, 639, 0.1, 0.1, ShibuyaAftermathSpot))
            {
              AddToLog("Spot found after " tries " tries ")
              SendInput ("{d up}")
              sleep 200
              SendInput ("{d down}")
              sleep 2000
              SendInput ("{d up}")
              KeyWait "d"
              sleep 500
              SendInput ("{w up}")
              sleep 200
              SendInput ("{w down}")
              sleep 1100
              SendInput ("{w up}")
              KeyWait "w"
              sleep 200
              RestartMatch()
              sleep 500
              CheckCards()
              sleep 1000
              ShibuyaAftermathPlacement()
              Break
            }
        else

        if (Mod(tries,5)) == 0 {  ;outputs only every 5 tries to make log readable
       AddToLog("Spot not found after: " tries " tries ")  

        }   

        TPtoSpawn() ;this is for the else statement too, so tps when not finding the spot
    }

}

FindSpotSandVillage() { ;Both story and legend stage share this 
 global LegendStage
    tries := 0
    AddToLog("Finding Spot")
    loop {
        tries++ 
		if (ok:=FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, Rewards) or ok:= FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, fail)) { 
            BetterClick(495, 425) ; Replay
			Sleep 400
             if (LegendStage) {
                BetterClick(393, 289) ;clicks middle card
             }
             sleep 500
             BetterClick(365, 122) ;click vote start
             sleep 500
            SandVillageSpeedPlace() 
        }

        Sleep 600
        SpecSpeed()
        Sleep 600

        if (ok:=FindText(&X, &Y,856, 266, 947, 342, 0.3, 0.3, SandVillageSpot)) {
              AddToLog("Spot found after " tries " tries ")
              sleep 1000
              RestartMatch() ;if it is story, it clicks vote start, if legend stage, it doesnt (restarts match first)
              sleep 1000


              if (LegendStage) {
                CheckCards() ;after restarting, if legend stage, it picks the card and vote starts (else restarts till it finds the card)
              }

              sleep 1000

              loop 3 {
                sleep 300
              BetterPlace(766, 221,SpeedWagonSlot) ;places speed
              }

              sleep 1000

              if (!PlacedUnit()) { ;if the function returns false (if the unit isnt placed it returns false)
              BetterClick(766, 221)      ;clicks speed again if you maybe placed him but he closed his menu because of the loop
             }

                  sleep 1000
                  BetterClick(228, 411) ;clicks spectate
                  sleep 700
                  BetterClick(NeuX,NeuY) ;clicks neutral spot to close speeds upgrade menu
                  sleep 700
                  SandPlacement() ;starts the placement
                  Break
              
             }
             if (Mod(tries,5)) == 0 {  ;outputs only every 5 tries to make log readable
                AddToLog("Spot not found after: " tries " tries ")  
            }

       TPtoSpawn() 
      }
    }




FindSpotPlanetNamak(NamekInfinity) {
    tries := 0
    loop {
        tries++ 
		if (ok:=FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, Rewards) or ok:= FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, fail)) { 
            BetterClick(495, 425) ; Replay
			Sleep 500
            BetterClick(365,122)
            sleep 500
            PlanetNamakSpeedPlace()
        }
        Sleep 300
        SpecSpeed()
        Sleep 1000
        if (ok:=FindText(&X, &Y,  922, 455, 1133, 636, 0.1, 0.1, NamekSpot))
            {
              AddToLog("Spot found after " tries " tries")
              RestartMatch()
              sleep 500
              if (NamekInfinity) {
                AddToLog("Starting Inf placement")
                NamakInfinityPlacement()
                break
              }
              NamakPlacement()
              Break
            }
        else 

        if (Mod(tries,5)) == 0 {  
        AddToLog("Spot not found after: " tries " tries ")  
        }  

       TPtoSpawn() 
          
    }

}
FindSpotKuinshiPalace() {
    tries := 0
    loop {
        tries++ 
		if (ok:=FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, Rewards) or ok:= FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, fail)) { 
            BetterClick(495, 425) ; Replay
			Sleep 700
            BetterClick(393, 289) ;clicks middle card
            sleep 700
            BetterClick(365,122)
            sleep 500
            KuinshinSpeedPlace()
        }

        Sleep 600
        SpecSpeed()
        Sleep 600

        if (ok:=FindText(&X, &Y, 789, 394, 938, 510, 0.1, 0.1, KuinshinPalaceSpot))
            {
              AddToLog("Spot found after " tries " tries")
              RestartMatch()
              sleep 500
              CheckCards()
              KuinshiPlacement()
              break
            }
        else 

        if (Mod(tries,5)) == 0 {  
        AddToLog("Spot not found after: " tries " tries ")  
          }   

         TPtoSpawn() 
          
    }
}

FindSpotSpiritSociety() {
    tries := 0
    loop {
        tries++ 
		if (ok:=FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, Rewards) or ok:= FindText(&X, &Y, 471-150000, 173-150000, 471+150000, 173+150000, 0, 0, fail)) { 
            BetterClick(495, 425) ; Replay
			Sleep 700
            BetterClick(365,122) ;vote start
            sleep 500
            SpiritSpeedPlace()
        }

        Sleep 600
        SpecSpeed()
        Sleep 600

        if (ok:=FindText(&X, &Y, 853, 436, 1136, 636, 0.2, 0.2, SpiritSocietySpot))
            {
              AddToLog("Spot found after " tries " tries")
              RestartMatch()
              sleep 500
              SpiritSocietyPlacement()
              break
            }
        else 

        if (Mod(tries,5)) == 0 {  
        AddToLog("Spot not found after: " tries " tries ")  
          }   

         TPtoSpawn() 
          
    }
}


SpecSpeed() {
        BetterClick(230, 412)
        Sleep 700
        BetterClick(326, 512)
        Sleep 1000
        BetterClick(404, 574)
        sleep 1000
}

        
    

TPtoSpawn() {
        BetterClick(24, 578) ; settings
        Sleep 600
        BetterClick(517, 210) ; spawn
        Sleep 800
        BetterClick(573, 125) ; close settings
        Sleep 800
    }


    RestartMatch() {
        global LegendStage
        BetterClick(20, 579) ; settings
        Sleep 900
        BetterClick(517, 281) ; restart
        Sleep 800
        BetterClick(346, 315) ; confirm restart
        Sleep 1500
        if (ok:=FindText(&X, &Y, 671, 331, 805, 375, 0.1, 0.1, Cancel)) {
        BetterClick(402, 303) ; close settings
        Sleep 700
       }
       if (!LegendStage)
       BetterClick(365,122)
    }

    CheckSetting(CheckBounty) {
        CurrentMap := ""
        loop {
            sleep 1500
            if (ok:=FindText(&X, &Y, 335, 615, 367, 640, 0.1, 0.1, SettingsSymbol)) or (ok:=FindText(&X, &Y, 472, 539, 643, 566, 0, 0, GemSymbol)) {
                AddToLog("Returned to Lobby, waiting 15 sec to load fully")
                sleep 15000
                if (Challenge) {
                    CheckForLogAndTab(false)
                    sleep 2000
                    StartChallenge()
                    break
                }
                if (!CheckBounty) {
                CheckForLogAndTab(true) ;Inloop is true so runs gotobounty(true,false), true meaning he runs the loop from the start and false being not jus checking the bounty amount
                break
                }
                else {
                    CheckForLogAndTab(false)
                    sleep 500
                    GoToBounty(false,true)
                    break
                }


            }
        
        }
       
    
    }  





    CheckForLogAndTab(inLoop) {

    if (ok:=FindText(&X,&Y,941, 99, 1007, 139,0.2,0.2,LeaderBoard)) {
        BetterClickX(640, 72,3,100)
        AddToLog("LeaderBoard closed")
        
       }
       else {
              AddToLog("LeaderBoard not found")
       }
       sleep 200
       MouseMove(426, 241)
       sleep 1000
        if (ok:=FindText(&X,&Y,969, 162, 1027, 218,0.2,0.2,UpdateLog)) {
         BetterClickX(664, 141,3,100)
         AddToLog("UpdateLog closed")
         sleep 500
        }
        else {
            AddToLog("LeaderBoard not found")
        }
        sleep 500
        if (ok:=FindText(&X, &Y, 880, 228, 918, 265, 0.1, 0.1, DailyRewards)) {
            BetterClickX(563, 193,3,100) 
        }
        else {
            AddToLog("DailyRewards not found")
        }
        if (inLoop == true ) {
        GoToBounty(true,false) 
        }
        return 
    }

    NamekInfinity() {
    global Infinity, Manual
    Manual := true
    CheckForLogAndTab(false)
        while (true) {
            AddToLog("Going to Infinity")
            sleep 500
            BetterClick(614, 563)
            sleep 500
            BetterClick(88, 257)
            sleep 500
            BetterClick(88, 257)
            Sleep 1700
            SendInput ("{s up}")  
             Sleep 100  
            SendInput ("{s down}")
            Sleep 5000
            SendInput ("{s up}")
            KeyWait "s" 
            ;----
            sleep 500
            SendInput("{d up}") 
            Sleep 100
            SendInput ("{d down}")
            Sleep 4500
            SendInput ("{d up}")
            KeyWait "d"
            
            if (ok:=FindText(&X, &Y, 340, 275, 489, 314, 0.1, 0.1, CreateMatch)) {
                BetterClick(85, 250) ; CreateMatch
                Sleep 1000
                BetterClick(139, 180) ; select underground
                Sleep 1000
                BetterClick(307, 195) ; select sandbox
                Sleep 800
                loop 3 {
                    Sleep 50
                    SendInput("{WheelDown 10}") ; scroll down
                }
                Sleep 800
                BetterClick(346, 340) ; select inf
                Sleep 1000
                BetterClick(560, 445) ; Start
                sleep 500
                Lobbychecks()
                Sleep 1000
                BetterClick(110, 438) ; Start2
                CurrentMap := "Namek Infinity"
                sleep 200
                MapLog.Text := "Map: " CurrentMap
            
                while (!ok:=FindText(&X,&Y,647, 119, 824, 193, 0, 0, Vote)) {
                    Sleep 1000
                }
                global Infinity := true
                Sleep 3000
                LookDown()
                SendInput("{Tab}")
                sleep 200
                BetterClick(365,122)
                Sleep 1000
                PlanetNamakSpeedPlace()
                break
                }
          }
        }

ReplayCheck() {
    global PlayedInf
    sleep 1000
    if (ok := FindText(&X, &Y, 579, 64, 602, 83, 0.2, 0.2, Wave10)) {
        PlayedInf++
        UpdateRewards(100,0)
        UpdateWin(true)
        Sleep 1000
        if (PlayedInf = 10) {
        SendWebhook(true)
        PlayedInf := 0
        }
        movement := 0
        AddToLog("Wave 10, restarting for next game")
        RestartMatch()
        NamakInfinityPlacement()
        
    }
}