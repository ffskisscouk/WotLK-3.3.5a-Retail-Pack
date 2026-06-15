local LSM = LibStub("LibSharedMedia-3.0") 

local SetMediaName = function(name)
    return 'Merfin: ' .. name
end

-- BACKGROUND
LSM:Register("background", SetMediaName('Chat Background'), [[Interface\AddOns\MerfinMedia\background\MerfinUI_ChatBackground.tga]]) 

--  FONT
LSM:Register("font", "ArchivoNarrow-Bold", [[Interface\AddOns\MerfinMedia\font\ArchivoNarrow-Bold.ttf]], LSM.LOCALE_BIT_western) 
LSM:Register("font", "ArchivoNarrow-Bold", [[Interface\AddOns\MerfinMedia\font\ArchivoNarrow-Bold.ttf]], LSM.LOCALE_BIT_ruRU) 
LSM:Register("font", "Expressway", [[Interface\AddOns\MerfinMedia\font\Expressway.ttf]])

---- SOUND

-- Alerts
LSM:Register("sound", SetMediaName('Alert Bell'), [[Interface\AddOns\MerfinMedia\sound\Alerts\AlertBell.mp3]]) 

-- Class: Paladin
LSM:Register("sound", SetMediaName('Beacon Missing'), [[Interface\AddOns\MerfinMedia\sound\Class\Paladin\BeaconMissing.mp3]]) 
LSM:Register("sound", SetMediaName('Sacred Shield Missing'), [[Interface\AddOns\MerfinMedia\sound\Class\Paladin\SacredShieldMissing.mp3]]) 

-- Class: Warlock
LSM:Register("sound", SetMediaName('Decimation'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\Decimation.mp3]]) 
LSM:Register("sound", SetMediaName('Drain Soul'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\DrainSoul.mp3]]) 
LSM:Register("sound", SetMediaName('Molten Core'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\MoltenCore.mp3]]) 
LSM:Register("sound", SetMediaName('No Life Tap'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\NoLifeTap.mp3]]) 

-- Class: Hunter
LSM:Register("sound", SetMediaName('Use Hunter Mark'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\UseHunterMark.mp3]]) 

-- Class: DK
LSM:Register("sound", SetMediaName('Pestilence Miss'), [[Interface\AddOns\MerfinMedia\sound\Class\Warlock\PestilenceMiss.mp3]]) 

-- Countdowns
LSM:Register("sound", "1", [[Interface\AddOns\MerfinMedia\sound\Countdowns\1.mp3]]) 
LSM:Register("sound", "2", [[Interface\AddOns\MerfinMedia\sound\Countdowns\2.mp3]]) 
LSM:Register("sound", "3", [[Interface\AddOns\MerfinMedia\sound\Countdowns\3.mp3]]) 
LSM:Register("sound", "4", [[Interface\AddOns\MerfinMedia\sound\Countdowns\4.mp3]]) 
LSM:Register("sound", "5", [[Interface\AddOns\MerfinMedia\sound\Countdowns\5.mp3]]) 

-- Other
LSM:Register("sound", SetMediaName('Do Not Release'), [[Interface\AddOns\MerfinMedia\sound\Other\DoNotRelease.wav]]) 
LSM:Register("sound", SetMediaName('Take Healhtstone Idiot'), [[Interface\AddOns\MerfinMedia\sound\Other\TakeHealhtstoneIdiot.mp3]]) 
LSM:Register("sound", SetMediaName('Wrong Action Bar'), [[Interface\AddOns\MerfinMedia\sound\Other\WrongActionBar.mp3]]) 

-- Positions
LSM:Register("sound", SetMediaName('Go To Left Side'), [[Interface\AddOns\MerfinMedia\sound\Positions\GoToLeftSide.wav]]) 
LSM:Register("sound", SetMediaName('Go To Middle Side'), [[Interface\AddOns\MerfinMedia\sound\Positions\GoToMiddleSide.wav]]) 
LSM:Register("sound", SetMediaName('Go To Right Side'), [[Interface\AddOns\MerfinMedia\sound\Positions\GoToRightSide.wav]])
LSM:Register("sound", SetMediaName('Run Out'), [[Interface\AddOns\MerfinMedia\sound\Positions\RunOut.wav]])
LSM:Register("sound", SetMediaName('Spread Out'), [[Interface\AddOns\MerfinMedia\sound\Positions\SpreadOut.wav]])

-- RotationsWA
LSM:Register("sound", SetMediaName('Use Defensive Soon'), [[Interface\AddOns\MerfinMedia\sound\RotationsWA\UseDefensiveSoon.mp3]])
LSM:Register("sound", SetMediaName('Use Healthstone Soon'), [[Interface\AddOns\MerfinMedia\sound\RotationsWA\UseHealthstoneSoon.mp3]])
LSM:Register("sound", SetMediaName('You Are Next'), [[Interface\AddOns\MerfinMedia\sound\RotationsWA\YouAreNext.mp3]])

-- Raids: Icecrown Citadel

-- Trash
LSM:Register("sound", SetMediaName('Decimate Cast'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Trash\DecimateCast.mp3]])
LSM:Register("sound", SetMediaName('Kill Horror'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Trash\KillHorror.mp3]])
LSM:Register("sound", SetMediaName('Stop Casting'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Trash\StopCasting.mp3]])

-- MGW
LSM:Register("sound", SetMediaName('Whirlwind Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\MGW\WhirlwindSoon.mp3]])

-- LDW
LSM:Register("sound", SetMediaName('Summon Spirits'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LDW\SummonSpirits.mp3]])
LSM:Register("sound", SetMediaName('Curse On You'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LDW\CurseOnYou.mp3]])
LSM:Register("sound", SetMediaName('Mass Dispel'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LDW\MassDispel.mp3]])

-- GSB
LSM:Register("sound", SetMediaName('Mage Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\GSB\MageSoon.mp3]])

-- DBS
LSM:Register("sound", SetMediaName('Summon Adds Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\DBS\SummonAddsSoon.mp3]])

-- Festergut
LSM:Register("sound", SetMediaName('Explosion'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Festergut\Explosion.mp3]])
LSM:Register("sound", SetMediaName('MalleableGoo'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Festergut\MalleableGoo.mp3]])

-- Rotface
LSM:Register("sound", SetMediaName('Prepare For Explosion'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Rotface\PrepareForExplosion.mp3]])

-- PP
LSM:Register("sound", SetMediaName('Red Cast'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\RedCast.mp3]])
LSM:Register("sound", SetMediaName('Choking Bomb Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\ChokingBombSoon.mp3]])
LSM:Register("sound", SetMediaName('MalleableGoo'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\MalleableGoo.mp3]])
LSM:Register("sound", SetMediaName('Red'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\Red.mp3]])
LSM:Register("sound", SetMediaName('Green'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\Green.mp3]])
LSM:Register("sound", SetMediaName('Bomb Explosion'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\PP\BombExplosion.mp3]])

-- BPC
LSM:Register("sound", SetMediaName('Target Switch'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\BPC\TargetSwitch.mp3]])
LSM:Register("sound", SetMediaName('Target Switch Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\BPC\TargetSwitchSoon.mp3]])
LSM:Register("sound", SetMediaName('Empowered Vortex'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\BPC\EmpoweredVortex.mp3]])
LSM:Register("sound", SetMediaName('Kinetic Bomb'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\BPC\KineticBomb.mp3]])

-- VDW
LSM:Register("sound", SetMediaName('Portals Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\VDW\PortalsSoon.mp3]])

-- Sindragosa
LSM:Register("sound", SetMediaName('Watch Marks'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Sindragosa\WatchMarks.mp3]])
LSM:Register("sound", SetMediaName('Unchained Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Sindragosa\UnchainedSoon.mp3]])
LSM:Register("sound", SetMediaName('Blistering Cold Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\Sindragosa\BlisteringColdSoon.mp3]])

-- LK
LSM:Register("sound", SetMediaName('Summon Shambling'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\SummonShambling.mp3]])
LSM:Register("sound", SetMediaName('Summon Valkyrs'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\SummonValkyrs.mp3]])
LSM:Register("sound", SetMediaName('Summon Raging'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\SummonRaging.mp3]])
LSM:Register("sound", SetMediaName('Phasing Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\PhasingSoon.mp3]])
LSM:Register("sound", SetMediaName('Defile Soon'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\DefileSoon.mp3]])


--LSM:Register("sound", SetMediaName('Red'), [[Interface\AddOns\MerfinMedia\sound\Raids\IcecrownCitadel\LK\WatchMarks.mp3]])


-- STATUSBAR
LSM:Register("statusbar", "Flatt", [[Interface\AddOns\MerfinMedia\statusbar\Flatt.blp]]) 