local _, T = ...
local Add = T.Compendium.Add

-- Where reputation with a faction comes from, faction by faction. Faction IDs
-- are the same in every flavour, so one file serves retail, Mists and Vanilla:
-- a client simply never asks about the factions it does not have.
--
-- What an entry looks like:
--   * two to five lines, each one thing the player can go and do,
--   * the best source first, an "unlock" line first when something gates it,
--   * the note at the end carries the catch: a cap, a warning, a one-off.
-- Keep a line short enough to read in a tooltip, about 95 characters.
--
-- The tags are the keys of KINDS in Core/Compendium.lua: unlock, quest, daily,
-- weekly, world, turnin, kill, dungeon, event, craft.
--
-- Data/Compendium_deDE.lua translates every line of this file in the same
-- order; tools/check-compendium.lua fails the build when the two drift apart.

--------------------------------------------------------------------------------
-- Capitals
--------------------------------------------------------------------------------

Add(72, { -- Stormwind
    { "quest", "Quests in Elwynn Forest, Westfall, Redridge, Duskwood and the city itself." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(47, { -- Ironforge
    { "quest", "Quests in Dun Morogh, Loch Modan, the Wetlands and Searing Gorge." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(69, { -- Darnassus
    { "quest", "Quests in Teldrassil, Darkshore, Ashenvale and Feralas." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(54, { -- Gnomeregan
    { "quest", "The gnome quest lines in Dun Morogh and everything inside Gnomeregan." },
    { "turnin", "Hand Runecloth to the gnome quartermaster in Ironforge's Tinker Town." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(930, { -- Exodar
    { "quest", "Quests on Azuremyst Isle and Bloodmyst Isle." },
    { "turnin", "Hand Runecloth to the draenei quartermaster in the Exodar." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(76, { -- Orgrimmar
    { "quest", "Quests in Durotar, the Northern Barrens, Azshara and the city itself." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(81, { -- Thunder Bluff
    { "quest", "Quests in Mulgore, the Barrens, Thousand Needles and Feralas." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(68, { -- Undercity
    { "quest", "Quests in Tirisfal Glades, Silverpine Forest, Hillsbrad and the Plaguelands." },
    { "turnin", "Hand Runecloth to the city's quartermaster; the turn-in repeats until Exalted." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(530, { -- Darkspear Trolls
    { "quest", "Quests on the Echo Isles, in Durotar and the troll chains in the Barrens." },
    { "turnin", "Hand Runecloth to the troll quartermaster in Orgrimmar's Valley of Spirits." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(911, { -- Silvermoon City
    { "quest", "Quests in Eversong Woods and the Ghostlands." },
    { "turnin", "Hand Runecloth to the blood elf quartermaster in Silvermoon City." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

--------------------------------------------------------------------------------
-- Classic
--------------------------------------------------------------------------------

Add(529, { -- Argent Dawn
    { "turnin", "Hand Scourgestones in at the Argent Dawn camps in both Plaguelands." },
    { "kill", "Kill undead in the Plaguelands while the Argent Dawn Commission is equipped." },
    { "quest", "The quest lines at Light's Hope Chapel, Scholomance, Stratholme and Naxxramas." },
}, "No Commission, no Scourgestones: the trinket has to be worn for them to drop.")

Add(576, { -- Timbermaw Hold
    { "turnin", "Hand in Deadwood Headdress Feathers (Felwood) and Winterfall Spines (Winterspring)." },
    { "kill", "Kill Deadwood and Winterfall furbolgs; the kills count until Honored." },
    { "quest", "The repeatable quests at Timbermaw Hold, Felwood and Winterspring." },
}, "Kills stop counting at Honored - from there only the two turn-ins move the bar.")

Add(59, { -- Thorium Brotherhood
    { "kill", "Kill Dark Iron dwarves in Blackrock Depths until Lokhtos will trade with you." },
    { "turnin", "Hand Dark Iron Residue and Dark Iron Ore to Lokhtos in the Grim Guzzler." },
    { "raid", "Molten Core and Blackwing Lair drops: Fiery Core, Lava Core, Elementium Ore." },
}, "Dark Iron Residue drops all over Blackrock Depths and is the cheapest way to Honored.")

Add(609, { -- Cenarion Circle
    { "turnin", "Hand Encrypted Twilight Texts to Cenarion Hold in Silithus." },
    { "quest", "Silithus field duty and the Twilight's Hammer quest lines." },
    { "raid", "Ruins of Ahn'Qiraj: everything inside pays Cenarion Circle reputation." },
}, "The texts drop from the Twilight camps in Silithus, so the grind and the farm are the same route.")

Add(749, { -- Hydraxian Waterlords
    { "quest", "Duke Hydraxis in Azshara starts the chain and the Eternal Quintessence." },
    { "raid", "Molten Core bosses; each kill pays until Exalted." },
}, "Molten Core is the only real source, so this one moves at one raid lockout per week.")

Add(910, { -- Brood of Nozdormu
    { "raid", "The Temple of Ahn'Qiraj: every kill inside raises the brood." },
    { "turnin", "Hand Qiraji artifacts to Anachronos at the Caverns of Time." },
}, "The faction starts at Hated, and nothing outside Ahn'Qiraj moves it.")

Add(270, { -- Zandalar Tribe
    { "raid", "Zul'Gurub: bosses and trash both pay." },
    { "turnin", "Hand Zulian coins and bijous to the Zandalari on Yojamba Isle." },
}, "Bijous drop from trash, so a full clear beats a boss-only run.")

Add(809, { -- Shen'dralar
    { "dungeon", "Dire Maul North and West: the Eldreth and Highborne inside pay reputation." },
    { "turnin", "Hand Librams to the Shen'dralar in Dire Maul West's Athenaeum." },
}, "The faction only appears once you have met the Shen'dralar behind the Athenaeum door.")

Add(349, { -- Ravenholdt
    { "kill", "Kill Syndicate members in Alterac Mountains and Hillsbrad Foothills." },
    { "turnin", "Rogues: hand Heavy Junkboxes to Fahrad at Ravenholdt Manor." },
}, "Without pickpocketing, the Syndicate kills are the only source - and they are slow.")

Add(589, { -- Wintersaber Trainers
    { "daily", "The repeatable quests from Rivern Frostwind at Frostsaber Rock in Winterspring." },
    { "turnin", "Hand in Chillwind Meat, Shardtooth Meat and Winterfall Spirit Beads." },
}, "Alliance only, and the reward at Exalted is the Winterspring Frostsaber.")

Add(909, { -- Darkmoon Faire
    { "turnin", "Collect Soft Bushy Tails, Vibrant Plumes and the other faire items and hand them in." },
    { "event", "The faire opens on the first week of the month; nothing turns in while it is closed." },
    { "daily", "On modern clients: the island's games and the profession quests, once a month." },
})

Add(21, { -- Booty Bay
    { "quest", "Quests in Stranglethorn, out of Booty Bay and the Cape." },
    { "turnin", "Hand Bloodsail insignias to Fleet Master Seahorn in Booty Bay." },
}, "The insignia turn-ins lift all four goblin towns at once - and sink the Bloodsail.")

Add(369, { -- Gadgetzan
    { "quest", "Quests in Tanaris and out of Gadgetzan itself." },
    { "turnin", "Hand Bloodsail insignias in at Booty Bay; all four towns share the gain." },
})

Add(470, { -- Ratchet
    { "quest", "Quests in the Barrens out of Ratchet." },
    { "turnin", "Hand Bloodsail insignias in at Booty Bay; all four towns share the gain." },
})

Add(577, { -- Everlook
    { "quest", "Quests in Winterspring out of Everlook." },
    { "turnin", "Hand Bloodsail insignias in at Booty Bay; all four towns share the gain." },
})

Add(87, { -- Bloodsail Buccaneers
    { "kill", "Kill the goblin guards of Booty Bay, Gadgetzan, Ratchet and Everlook." },
    { "quest", "The Bloodsail chain on the Wild Shore south of Booty Bay." },
}, "Every point here costs Steamwheedle reputation; the insignia turn-ins undo it later.")

Add(92, { -- Gelkis Clan Centaur
    { "kill", "Kill Magram centaurs in Desolace." },
    { "quest", "The Gelkis quest line at their camp in southern Desolace." },
}, "The two clans are mirror images: raising one sinks the other, and only one can be Friendly.")

Add(93, { -- Magram Clan Centaur
    { "kill", "Kill Gelkis centaurs in Desolace." },
    { "quest", "The Magram quest line at their camp in eastern Desolace." },
}, "The two clans are mirror images: raising one sinks the other, and only one can be Friendly.")

Add(730, { -- Stormpike Guard
    { "event", "Alterac Valley: winning the battle and killing the Frostwolf leaders." },
    { "turnin", "Hand in Armor Scraps and the battlefield turn-ins inside the valley." },
})

Add(729, { -- Frostwolf Clan
    { "event", "Alterac Valley: winning the battle and killing the Stormpike leaders." },
    { "turnin", "Hand in Armor Scraps and the battlefield turn-ins inside the valley." },
})

Add(890, { -- Silverwing Sentinels
    { "event", "Warsong Gulch: every flag returned and every match won." },
    { "turnin", "Turn Warsong Gulch marks in at the Silverwing camp in Ashenvale." },
})

Add(889, { -- Warsong Outriders
    { "event", "Warsong Gulch: every flag returned and every match won." },
    { "turnin", "Turn Warsong Gulch marks in at the Warsong camp in Ashenvale." },
})

Add(509, { -- The League of Arathor
    { "event", "Arathi Basin: holding bases and winning matches." },
    { "turnin", "Turn Arathi Basin marks in at the base camp outside the battleground." },
})

Add(510, { -- The Defilers
    { "event", "Arathi Basin: holding bases and winning matches." },
    { "turnin", "Turn Arathi Basin marks in at the base camp outside the battleground." },
})

--------------------------------------------------------------------------------
-- The Burning Crusade
--------------------------------------------------------------------------------

Add(932, { -- The Aldor
    { "turnin", "Hand Firewing and Sunfury Signets, later Fel Armaments, in on the Aldor Rise." },
    { "daily", "The Shattrath and Netherstorm dailies that name the Aldor." },
}, "Choosing the Aldor makes the Scryers hostile, and the choice sticks for that character.")

Add(934, { -- The Scryers
    { "turnin", "Hand Marks of Kil'jaeden and Sargeras, later Arcane Tomes, in at Scryer's Tier." },
    { "daily", "The Shattrath and Netherstorm dailies that name the Scryers." },
}, "Choosing the Scryers makes the Aldor hostile, and the choice sticks for that character.")

Add(935, { -- The Sha'tar
    { "dungeon", "The Tempest Keep wings: The Mechanar, The Botanica and The Arcatraz." },
    { "quest", "Quest lines in Netherstorm and out of Shattrath City." },
})

Add(933, { -- The Consortium
    { "dungeon", "Mana-Tombs in Auchindoun, normal and heroic." },
    { "turnin", "Hand Obsidian Warbeads from Nagrand's ogres to Gezhe in Nagrand." },
    { "quest", "The Consortium quest lines in Netherstorm." },
})

Add(1011, { -- Lower City
    { "dungeon", "Auchenai Crypts, Sethekk Halls and Shadow Labyrinth." },
    { "turnin", "Hand Arakkoa Feathers from Terokkar Forest in at Lower City." },
    { "daily", "The Lower City dailies in Shattrath, including the heroic daily." },
})

Add(942, { -- Cenarion Expedition
    { "dungeon", "The Coilfang wings: Slave Pens, Underbog and Steamvault." },
    { "turnin", "Hand Unidentified Plant Parts in at the Cenarion Refuge in Zangarmarsh." },
    { "quest", "The Zangarmarsh quest lines and the Coilfang dungeon quests." },
})

Add(989, { -- Keepers of Time
    { "dungeon", "Old Hillsbrad Foothills and The Black Morass; heroic pays far more." },
    { "quest", "The Caverns of Time attunement chains." },
})

Add(990, { -- The Scale of the Sands
    { "raid", "Hyjal Summit: every wave and every boss." },
})

Add(967, { -- The Violet Eye
    { "raid", "Karazhan, bosses and trash; the key chain starts you off." },
})

Add(1012, { -- Ashtongue Deathsworn
    { "raid", "Black Temple bosses, from Naj'entus to Illidan." },
})

Add(946, { -- Honor Hold
    { "quest", "The Hellfire Peninsula quest lines out of Honor Hold." },
    { "dungeon", "Hellfire Ramparts, The Blood Furnace and The Shattered Halls." },
}, "Heroic Shattered Halls is the fastest stretch of the road to Exalted.")

Add(947, { -- Thrallmar
    { "quest", "The Hellfire Peninsula quest lines out of Thrallmar." },
    { "dungeon", "Hellfire Ramparts, The Blood Furnace and The Shattered Halls." },
}, "Heroic Shattered Halls is the fastest stretch of the road to Exalted.")

Add(941, { -- The Mag'har
    { "quest", "The Nagrand quest lines out of Garadar, including the Ring of Blood." },
    { "kill", "The ogre and Kil'sorrow camps the Nagrand quests send you to." },
})

Add(978, { -- Kurenai
    { "quest", "The Nagrand quest lines out of Telaar, including the Ring of Blood." },
    { "kill", "The ogre and Kil'sorrow camps the Nagrand quests send you to." },
})

Add(970, { -- Sporeggar
    { "turnin", "Hand in Bog Lord Tendrils and Sanguine Hibiscus from the Underbog." },
    { "kill", "Kill naga in Zangarmarsh; Glowcaps buy the rest of the way." },
    { "quest", "The repeatable quests at Sporeggar itself." },
})

Add(1015, { -- Netherwing
    { "unlock", "The Netherwing Ledge chain in Shadowmoon Valley; flying is required." },
    { "daily", "The mining, egg and bombing dailies on Netherwing Ledge." },
    { "turnin", "Netherwing Eggs hidden around the ledge, 250 reputation each." },
}, "Exalted buys a Netherwing drake; the eggs are the part that does not cap per day.")

Add(1031, { -- Sha'tari Skyguard
    { "daily", "The dailies at Blackwind Landing in Terokkar and over Skettis." },
    { "kill", "Kill arakkoa in Skettis while the dailies are on cooldown." },
})

Add(1038, { -- Ogri'la
    { "unlock", "The apexis chain in Blade's Edge Mountains opens Ogri'la." },
    { "daily", "The Ogri'la dailies, including the ones shared with the Skyguard." },
})

Add(1077, { -- Shattered Sun Offensive
    { "daily", "The Isle of Quel'Danas dailies, on the ground and in the harbour." },
    { "dungeon", "Magisters' Terrace and the Sunwell Plateau." },
}, "More dailies open as the island's phases advance on your realm.")

Add(922, { -- Tranquillien
    { "quest", "The Ghostlands quest lines out of Tranquillien; Horde only." },
})

--------------------------------------------------------------------------------
-- Wrath of the Lich King
--------------------------------------------------------------------------------

Add(1090, { -- Kirin Tor
    { "dungeon", "Wear the Kirin Tor tabard in any Northrend heroic." },
    { "daily", "The Dalaran dailies: cooking, fishing and the jewelcrafting daily." },
})

Add(1106, { -- Argent Crusade
    { "dungeon", "Wear the Argent Crusade tabard in any Northrend heroic." },
    { "daily", "The Icecrown dailies at the Argent Vanguard and Crusaders' Pinnacle." },
    { "quest", "The Argent Tournament dailies once your character is a valiant." },
})

Add(1098, { -- Knights of the Ebon Blade
    { "dungeon", "Wear the Ebon Blade tabard in any Northrend heroic." },
    { "daily", "The dailies at the Shadow Vault in Icecrown." },
    { "quest", "The Icecrown quest lines from Death's Rise onwards." },
})

Add(1091, { -- The Wyrmrest Accord
    { "dungeon", "Wear the Wyrmrest tabard in any Northrend heroic." },
    { "daily", "The dailies at the Wyrmrest Temple in Dragonblight." },
    { "quest", "The Dragonblight quest lines around the temple." },
})

Add(1119, { -- The Sons of Hodir
    { "unlock", "The Storm Peaks chain from K3 up to Dun Niffelem opens the dailies." },
    { "daily", "The Dun Niffelem dailies: spears, harpoons and the Thorim arena." },
    { "turnin", "Hand Relics of Ulduar in; they drop all over the Storm Peaks." },
}, "The shoulder enchants live here, and there is no tabard for this one.")

Add(1073, { -- The Kalu'ak
    { "daily", "The three tuskarr dailies at Moa'ki Harbour, Kamagua and Unu'pe." },
    { "quest", "The tuskarr quest lines in the Borean Tundra and Dragonblight." },
}, "Three dailies a day is the ceiling, so this faction takes its time.")

Add(1104, { -- Frenzyheart Tribe
    { "daily", "The Sholazar Basin dailies once you side with the wolvar." },
    { "quest", "The Sholazar quest lines up to the choice itself." },
}, "Switching sides drops you to Hated with the Oracles and back again - pick one and finish it.")

Add(1105, { -- The Oracles
    { "daily", "The Sholazar Basin dailies once you side with the gorloc." },
    { "quest", "The Sholazar quest lines up to the choice itself." },
}, "Switching sides drops you to Hated with the Frenzyheart and back again - pick one and finish it.")

Add(1156, { -- The Ashen Verdict
    { "raid", "Icecrown Citadel: bosses and trash, on every difficulty." },
})

Add(1094, { -- The Silver Covenant
    { "daily", "The Argent Tournament dailies once you ride for the Silver Covenant." },
})

Add(1124, { -- The Sunreavers
    { "daily", "The Argent Tournament dailies once you ride for the Sunreavers." },
})

Add(1050, { -- Valiance Expedition
    { "quest", "Northrend quests out of the Alliance camps, above all in the Borean Tundra." },
    { "dungeon", "Wear the tabard in a Northrend heroic." },
})

Add(1052, { -- Horde Expedition
    { "quest", "Northrend quests out of the Horde camps, above all in the Borean Tundra." },
    { "dungeon", "Wear the tabard in a Northrend heroic." },
})

Add(1064, { -- The Taunka
    { "quest", "The taunka quest lines in the Borean Tundra, Dragonblight and Howling Fjord." },
})

Add(1067, { -- The Hand of Vengeance
    { "quest", "The Forsaken quest lines in the Howling Fjord and at Venomspite." },
})

Add(1085, { -- Warsong Offensive
    { "quest", "The Warsong quest lines in the Borean Tundra, Dragonblight and Grizzly Hills." },
})

Add(1068, { -- Explorers' League
    { "quest", "The Explorers' League quest lines in the Howling Fjord and Storm Peaks." },
})

Add(1126, { -- The Frostborn
    { "quest", "The Frostborn quest lines in the Storm Peaks around Frosthold." },
})

--------------------------------------------------------------------------------
-- Cataclysm
--------------------------------------------------------------------------------

Add(1158, { -- Guardians of Hyjal
    { "quest", "The Mount Hyjal campaign, from the Nordrassil camp to Ragnaros' door." },
    { "dungeon", "Wear the Hyjal tabard in a Cataclysm heroic." },
})

Add(1135, { -- The Earthen Ring
    { "quest", "The Vashj'ir campaign and the Deepholm opening chapters." },
    { "dungeon", "Wear the Earthen Ring tabard in a Cataclysm heroic." },
})

Add(1171, { -- Therazane
    { "unlock", "Finish the Deepholm campaign; the dailies open with the Stonemother's pardon." },
    { "daily", "The dailies at Therazane's Throne and the Crumbling Depths." },
}, "The shoulder enchants hang at Honored and Exalted, and there is no tabard for them.")

Add(1173, { -- Ramkahen
    { "quest", "The Uldum campaign out of Ramkahen itself." },
    { "daily", "The Ramkahen dailies once the campaign is done." },
    { "dungeon", "Wear the Ramkahen tabard in a Cataclysm heroic." },
})

Add(1172, { -- Dragonmaw Clan
    { "quest", "The Twilight Highlands campaign out of Bloodgulch; Horde only." },
    { "daily", "The Crucible of Carnage and the Highlands dailies." },
    { "dungeon", "Wear the Dragonmaw tabard in a Cataclysm heroic." },
})

Add(1174, { -- Wildhammer Clan
    { "quest", "The Twilight Highlands campaign out of Thundermar; Alliance only." },
    { "daily", "The Crucible of Carnage and the Highlands dailies." },
    { "dungeon", "Wear the Wildhammer tabard in a Cataclysm heroic." },
})

Add(1177, { -- Baradin's Wardens
    { "daily", "The Tol Barad dailies; holding the island doubles how many you get." },
    { "event", "Winning the Tol Barad battle itself." },
})

Add(1178, { -- Hellscream's Reach
    { "daily", "The Tol Barad dailies; holding the island doubles how many you get." },
    { "event", "Winning the Tol Barad battle itself." },
})

Add(1204, { -- Avengers of Hyjal
    { "raid", "Firelands bosses, on every difficulty." },
})

Add(1133, { -- Bilgewater Cartel
    { "quest", "The goblin quest lines on Kezan, the Lost Isles and in Azshara." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

Add(1134, { -- Gilneas
    { "quest", "The worgen quest lines in Gilneas and the Gilnean chapters in Darkshore." },
    { "dungeon", "Wear the city tabard in a dungeon, on the clients that have city tabards." },
})

--------------------------------------------------------------------------------
-- Mists of Pandaria
--------------------------------------------------------------------------------

Add(1269, { -- Golden Lotus
    { "daily", "The Vale of Eternal Blossoms dailies; the hubs open one after another." },
    { "quest", "The Golden Lotus story chain at the Golden Pagoda." },
    { "kill", "Zandalari Warbringers drop Stolen Golden Lotus Insignias." },
}, "Golden Lotus gates the other Vale factions: Shado-Pan and August Celestials open at Revered.")

Add(1270, { -- Shado-Pan
    { "unlock", "Revered with the Golden Lotus opens the Shado-Pan dailies." },
    { "daily", "The dailies at the Shado-Pan Garrison in Townlong Steppes." },
    { "kill", "Zandalari Warbringers drop Stolen Shado-Pan Insignias." },
}, "The Grand Commendation at Revered doubles the gain for every character on the account.")

Add(1341, { -- The August Celestials
    { "unlock", "Revered with the Golden Lotus opens the Celestials' dailies." },
    { "daily", "The temple dailies: Tiger in Kun-Lai, Crane in Krasarang, Serpent in Jade Forest, Ox in Townlong." },
    { "kill", "Zandalari Warbringers drop Stolen Celestial Insignias." },
})

Add(1337, { -- The Klaxxi
    { "daily", "The Dread Wastes dailies out of Klaxxi'vess." },
    { "quest", "The paragon chain: each Klaxxi paragon you wake adds more to do." },
    { "kill", "Zandalari Warbringers drop Stolen Klaxxi Insignias." },
})

Add(1271, { -- Order of the Cloud Serpent
    { "daily", "The dailies at the Arboretum in the Jade Forest, races included." },
    { "quest", "Raise your own cloud serpent from the egg; the chain runs to Exalted." },
})

Add(1272, { -- The Tillers
    { "unlock", "Start the farm chain with Farmer Yoon at Halfhill in the Valley of the Four Winds." },
    { "daily", "The farm chores and the Halfhill dailies, every day." },
    { "quest", "The Tillers Union chain: each vote won opens more of the farm." },
}, "The farm grows with the reputation, and the Tillers friends have bars of their own.")

Add(1302, { -- The Anglers
    { "daily", "The fishing dailies around Angler's Wharf in Krasarang Wilds." },
    { "quest", "The angler chain in the southern Dread Wastes." },
}, "Fishing skill is not needed for all of them, but it makes the dailies far quicker.")

Add(1358, { -- Nat Pagle
    { "turnin", "Hand Nat one of his three rare fish: Flying Tiger Gourami, Mimic Octopus, Spinefish Alpha." },
    { "daily", "One rare fish per day is what moves the bar; fish Pandaria's pools for them." },
    { "unlock", "Nat sits at Angler's Wharf in Krasarang Wilds and wants the Anglers first." },
}, "This is a friendship bar, not a standing: Best Friend hands over Nat's Hat and his fishing journal.")

Add(1345, { -- The Lorewalkers
    { "turnin", "Find the lore objects scattered across Pandaria; each one is worth a chunk." },
    { "quest", "The Lorewalkers' own chains at the Seat of Knowledge in the Vale." },
}, "Every lore object is a one-off, so this faction is a treasure hunt, not a grind.")

Add(1359, { -- The Black Prince
    { "quest", "Wrathion's legendary cloak chain, chapter by chapter." },
    { "turnin", "The chain's own turn-ins: sigils, secrets and the Thunder Isle tokens." },
})

Add(1376, { -- Operation: Shieldwall
    { "daily", "The Krasarang Wilds dailies at Lion's Landing; Alliance only." },
    { "quest", "The Shieldwall campaign chapters, one per week of reputation." },
})

Add(1375, { -- Dominance Offensive
    { "daily", "The Krasarang Wilds dailies at Domination Point; Horde only." },
    { "quest", "The Dominance campaign chapters, one per week of reputation." },
})

Add(1387, { -- Kirin Tor Offensive
    { "daily", "The Isle of Thunder dailies; Alliance only." },
    { "quest", "The island's campaign: every stage taken opens more dailies." },
})

Add(1388, { -- Sunreaver Onslaught
    { "daily", "The Isle of Thunder dailies; Horde only." },
    { "quest", "The island's campaign: every stage taken opens more dailies." },
})

Add(1435, { -- Shado-Pan Assault
    { "raid", "Throne of Thunder bosses; every difficulty pays." },
}, "Raid only: no dailies, no turn-ins, just the Thunder King's court.")

Add(1492, { -- Emperor Shaohao
    { "kill", "Rares and elites on the Timeless Isle, the Celestial court included." },
    { "turnin", "The isle's treasures and the weekly Celestial quests." },
})

Add(1440, { -- Darkspear Rebellion
    { "quest", "The Battlefield: Barrens campaign and its weekly chapters; Horde only." },
    { "daily", "The Razorbloom dailies while the rebellion runs." },
})

Add(1228, { -- Forest Hozen
    { "quest", "The Jade Forest quest lines that side with the hozen; Horde only." },
})

Add(1242, { -- Pearlfin Jinyu
    { "quest", "The Jade Forest quest lines that side with the jinyu; Alliance only." },
})

Add(1352, { -- Huojin Pandaren
    { "quest", "Pandaren quest lines on the Wandering Isle and out of Orgrimmar." },
})

Add(1353, { -- Tushui Pandaren
    { "quest", "Pandaren quest lines on the Wandering Isle and out of Stormwind." },
})

--------------------------------------------------------------------------------
-- The Tillers' friends. Each of them is a friendship bar of its own, fed by the
-- gifts dug out of the Dark Soil north of Halfhill.
--------------------------------------------------------------------------------

Add(1273, { -- Jogu the Drunk
    { "turnin", "Give him a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Jogu likes the Lovely Apple best; his favourite is worth nearly double." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1275, { -- Ella
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Her favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1276, { -- Old Hillpaw
    { "turnin", "Give him a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Old Hillpaw likes the Blue Feather best; his favourite is worth nearly double." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1277, { -- Chee Chee
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Her favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1278, { -- Sho
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Sho likes the Lovely Apple best; her favourite is worth nearly double." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1279, { -- Haohan Mudclaw
    { "turnin", "Give him a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "His favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1280, { -- Tina Mudclaw
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Her favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1281, { -- Gina Mudclaw
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Her favourite gift is worth nearly double what any other is." },
}, "Gina is also the Tillers' quartermaster, so you will pass her anyway.")

Add(1282, { -- Fish Fellreed
    { "turnin", "Give her a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "Her favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

Add(1283, { -- Farmer Fung
    { "turnin", "Give him a gift a day from the Dark Soil piles north of Halfhill." },
    { "daily", "His favourite gift is worth nearly double what any other is." },
}, "One gift per friend per day, so ten friends means ten piles of Dark Soil.")

--------------------------------------------------------------------------------
-- Warlords of Draenor
--------------------------------------------------------------------------------

Add(1515, { -- Arakkoa Outcasts
    { "quest", "The Spires of Arak campaign out of the outcasts' refuge." },
    { "daily", "The outpost dailies the campaign leaves behind." },
})

Add(1710, { -- Sha'tari Defense
    { "quest", "The Talador campaign; Alliance only." },
    { "quest", "Garrison missions that name the faction, and the zone's bonus objectives." },
})

Add(1708, { -- Laughing Skull Orcs
    { "quest", "The Talador campaign; Horde only." },
    { "quest", "Garrison missions that name the faction, and the zone's bonus objectives." },
})

Add(1731, { -- Council of Exarchs
    { "quest", "The Shadowmoon Valley campaign around Lunarfall; Alliance only." },
    { "quest", "Garrison missions and the commendations they hand back." },
})

Add(1445, { -- Frostwolf Orcs
    { "quest", "The Frostfire Ridge campaign around Frostwall; Horde only." },
    { "quest", "Garrison missions and the commendations they hand back." },
})

Add(1682, { -- Wrynn's Vanguard
    { "quest", "Nagrand's campaign and bonus objectives out of Lion's Watch; Alliance only." },
})

Add(1681, { -- Vol'jin's Spear
    { "quest", "Nagrand's campaign and bonus objectives out of Vol'jin's Pride; Horde only." },
})

Add(1711, { -- Steamwheedle Preservation Society
    { "quest", "Draenor's dig sites and the archaeology quests they feed." },
}, "Archaeology only: without the profession this bar does not move at all.")

Add(1849, { -- Order of the Awakened
    { "daily", "The Tanaan Jungle dailies once the 6.2 campaign has opened the jungle." },
    { "turnin", "The daily Apexis Crystal hand-in; crystals drop all over Draenor." },
})

Add(1850, { -- The Saberstalkers
    { "kill", "Kill the beasts and rares of Fang'rila in southern Tanaan Jungle." },
    { "turnin", "Hand in the claws and hides they drop; the turn-in repeats." },
})

Add(1847, { -- Hand of the Prophet
    { "quest", "The Tanaan Jungle campaign and its dailies; Alliance only." },
    { "quest", "Shipyard missions that name the faction." },
})

Add(1848, { -- Vol'jin's Headhunters
    { "quest", "The Tanaan Jungle campaign and its dailies; Horde only." },
    { "quest", "Shipyard missions that name the faction." },
})

--------------------------------------------------------------------------------
-- Legion
--------------------------------------------------------------------------------

Add(1828, { -- Highmountain Tribe
    { "world", "World quests in Highmountain, every day they are up." },
    { "quest", "The Highmountain story campaign and its follow-ups." },
    { "weekly", "The emissary quest: four world quests for a cache and a big chunk." },
})

Add(1948, { -- Valarjar
    { "world", "World quests in Stormheim, every day they are up." },
    { "quest", "The Stormheim story campaign and its follow-ups." },
    { "weekly", "The emissary quest: four world quests for a cache and a big chunk." },
})

Add(1900, { -- Court of Farondis
    { "world", "World quests in Azsuna, every day they are up." },
    { "quest", "The Azsuna story campaign and its follow-ups." },
    { "weekly", "The emissary quest: four world quests for a cache and a big chunk." },
})

Add(1883, { -- Dreamweavers
    { "world", "World quests in Val'sharah, every day they are up." },
    { "quest", "The Val'sharah story campaign and its follow-ups." },
    { "weekly", "The emissary quest: four world quests for a cache and a big chunk." },
})

Add(1859, { -- The Nightfallen
    { "quest", "The Suramar campaign, chapter by chapter; it carries most of the way." },
    { "world", "Suramar world quests and the Ancient Mana turn-ins around the city." },
    { "event", "Withered Army Training: a full run pays more than a day of world quests." },
})

Add(1894, { -- The Wardens
    { "world", "Warden world quests, scattered across all of the Broken Isles." },
    { "quest", "The Wardens' own campaign out of Azsuna." },
    { "weekly", "The emissary quest: four world quests for a cache and a big chunk." },
})

Add(2045, { -- Armies of Legionfall
    { "world", "Broken Shore world quests and the Sentinax beacons." },
    { "quest", "The Legionfall campaign and the weekly building contributions." },
})

Add(2165, { -- Army of the Light
    { "world", "Argus world quests, above all on Antoran Wastes." },
    { "quest", "The Argus campaign, chapter by chapter." },
    { "event", "Invasion Points and the greater invasions once a week." },
})

Add(2170, { -- Argussian Reach
    { "world", "Argus world quests, above all on Mac'Aree." },
    { "quest", "The Argus campaign, chapter by chapter." },
    { "event", "Invasion Points and the greater invasions once a week." },
})

Add(1975, { -- Conjurer Margoss
    { "turnin", "Fish Drowned Mana at Margoss's Retreat and hand it straight back to him." },
}, "Fishing only, and the raft to his island is bought with the same mana.")

--------------------------------------------------------------------------------
-- Battle for Azeroth
--------------------------------------------------------------------------------

Add(2160, { -- Proudmoore Admiralty
    { "quest", "The Tiragarde Sound campaign and its side chapters; Alliance only." },
    { "world", "World quests in Tiragarde Sound and the emissary that names them." },
    { "event", "Faction assaults in Kul Tiras, every few days." },
})

Add(2161, { -- Order of Embers
    { "quest", "The Drustvar campaign and its side chapters; Alliance only." },
    { "world", "World quests in Drustvar and the emissary that names them." },
    { "event", "Faction assaults in Kul Tiras, every few days." },
})

Add(2162, { -- Storm's Wake
    { "quest", "The Stormsong Valley campaign and its side chapters; Alliance only." },
    { "world", "World quests in Stormsong Valley and the emissary that names them." },
    { "event", "Faction assaults in Kul Tiras, every few days." },
})

Add(2103, { -- Zandalari Empire
    { "quest", "The Zuldazar campaign and its side chapters; Horde only." },
    { "world", "World quests in Zuldazar and the emissary that names them." },
    { "event", "Faction assaults in Zandalar, every few days." },
})

Add(2156, { -- Talanji's Expedition
    { "quest", "The Nazmir campaign and its side chapters; Horde only." },
    { "world", "World quests in Nazmir and the emissary that names them." },
    { "event", "Faction assaults in Zandalar, every few days." },
})

Add(2158, { -- Voldunai
    { "quest", "The Vol'dun campaign and its side chapters; Horde only." },
    { "world", "World quests in Vol'dun and the emissary that names them." },
    { "event", "Faction assaults in Zandalar, every few days." },
})

Add(2159, { -- 7th Legion
    { "quest", "The war campaign, chapter by chapter; Alliance only." },
    { "event", "Island Expeditions and the faction assaults on Zandalar." },
})

Add(2157, { -- The Honorbound
    { "quest", "The war campaign, chapter by chapter; Horde only." },
    { "event", "Island Expeditions and the faction assaults on Kul Tiras." },
})

Add(2164, { -- Champions of Azeroth
    { "quest", "The Heart of Azeroth chain and its follow-ups with Magni." },
    { "world", "World quests that name the Champions, on both continents." },
})

Add(2163, { -- Tortollan Seekers
    { "world", "The tortollan world quests: the puzzles, the races and the escorts." },
    { "weekly", "The emissary that names them; it is the only reliable lump." },
}, "No zone of their own and no dailies, so this one moves slowly whatever you do.")

Add(2373, { -- The Unshackled
    { "quest", "The Nazjatar campaign and the daily follow-ups; Horde only." },
    { "world", "Nazjatar world quests and the daily hand-ins at Newhome." },
})

Add(2400, { -- Waveblade Ankoan
    { "quest", "The Nazjatar campaign and the daily follow-ups; Alliance only." },
    { "world", "Nazjatar world quests and the daily hand-ins at Mezzamere." },
})

Add(2391, { -- Rustbolt Resistance
    { "quest", "The Mechagon campaign out of Rustbolt." },
    { "daily", "The Rustbolt dailies, the rares and the island's daily punch card runs." },
})

Add(2415, { -- Rajani
    { "event", "The assault on the Vale of Eternal Blossoms, on the weeks it runs." },
    { "daily", "The Vale dailies and rares while the assault is up." },
    { "weekly", "The assault's weekly quest is the single biggest chunk." },
})

Add(2417, { -- Uldum Accord
    { "event", "The assault on Uldum, on the weeks it runs." },
    { "daily", "The Uldum dailies and rares while the assault is up." },
    { "weekly", "The assault's weekly quest is the single biggest chunk." },
})

Add(2395, { -- Honeyback Hive
    { "daily", "The Honeyback Harvester dailies in Stormsong Valley; Alliance only." },
}, "One daily a day and nothing else, so the mount at the end takes weeks.")

--------------------------------------------------------------------------------
-- Shadowlands
--------------------------------------------------------------------------------

Add(2407, { -- The Ascended
    { "quest", "The Bastion campaign and the Kyrian covenant chapters." },
    { "world", "Bastion world quests and the callings that send you there." },
    { "weekly", "The zone's weekly quest and the covenant assaults in the Maw." },
})

Add(2410, { -- The Undying Army
    { "quest", "The Maldraxxus campaign and the Necrolord covenant chapters." },
    { "world", "Maldraxxus world quests and the callings that send you there." },
    { "weekly", "The zone's weekly quest and the covenant assaults in the Maw." },
})

Add(2413, { -- Court of Harvesters
    { "quest", "The Revendreth campaign and the Venthyr covenant chapters." },
    { "world", "Revendreth world quests and the callings that send you there." },
    { "weekly", "The zone's weekly quest and the covenant assaults in the Maw." },
})

Add(2465, { -- The Wild Hunt
    { "quest", "The Ardenweald campaign and the Night Fae covenant chapters." },
    { "world", "Ardenweald world quests and the callings that send you there." },
    { "weekly", "The zone's weekly quest and the covenant assaults in the Maw." },
})

Add(2432, { -- Ve'nari
    { "quest", "Ve'nari's own chain in the Maw, which opens her stock one step at a time." },
    { "turnin", "Hand her Stygia; every rare and every event in the Maw drops more." },
}, "Her upgrades are what make the Maw bearable, so this one pays for itself.")

Add(2470, { -- Death's Advance
    { "quest", "The Korthia campaign, chapter by chapter." },
    { "daily", "The Korthia dailies and the rares that roam the island." },
})

Add(2472, { -- The Archivists' Codex
    { "turnin", "Hand Relic Fragments to the Codex in Korthia to buy the next research." },
    { "daily", "Relic fragments come from Korthia's dailies, rares and hidden caches." },
})

Add(2478, { -- The Enlightened
    { "quest", "The Zereth Mortis campaign, chapter by chapter." },
    { "daily", "The Zereth Mortis dailies and world quests around Haven." },
})

Add(2445, { -- The Ember Court
    { "weekly", "Host the Ember Court in Revendreth; every guest you please pays." },
    { "quest", "The Venthyr covenant chapters that open the court in the first place." },
}, "Venthyr only, and the court runs once a week per character.")

--------------------------------------------------------------------------------
-- Dragonflight
--------------------------------------------------------------------------------

Add(2507, { -- Dragonscale Expedition
    { "quest", "The Waking Shores and Azure Span campaigns out of the expedition's camps." },
    { "world", "Dragon Isles world quests that name the expedition." },
    { "turnin", "Expedition Scout's Packs, found by climbing and exploring the isles." },
    { "weekly", "Aiding the Accord: the weekly quest pays every Dragon Isles faction." },
})

Add(2511, { -- Iskaara Tuskarr
    { "event", "The Community Feast in the Azure Span, twice a day." },
    { "quest", "The Azure Span campaign and the tuskarr side chapters." },
    { "world", "Dragon Isles world quests that name the tuskarr." },
    { "weekly", "Aiding the Accord: the weekly quest pays every Dragon Isles faction." },
})

Add(2503, { -- Maruuk Centaur
    { "event", "Grand Hunts in the Ohn'ahran Plains; the hunt scales with the group." },
    { "quest", "The Ohn'ahran Plains campaign and the clan chapters." },
    { "world", "Dragon Isles world quests that name the centaur." },
    { "weekly", "Aiding the Accord: the weekly quest pays every Dragon Isles faction." },
})

Add(2510, { -- Valdrakken Accord
    { "event", "The Siege on Dragonbane Keep in the Waking Shores, every two hours." },
    { "quest", "The Thaldraszus campaign and the dragonflight chapters in Valdrakken." },
    { "world", "Dragon Isles world quests that name the accord." },
    { "weekly", "Aiding the Accord: the weekly quest pays every Dragon Isles faction." },
})

Add(2564, { -- Loamm Niffen
    { "quest", "The Zaralek Cavern campaign out of Loamm." },
    { "event", "Sniffenseeking: let a niffen dig up the cavern's caches, over and over." },
    { "world", "Zaralek Cavern world quests and its rares." },
})

Add(2574, { -- Dream Wardens
    { "quest", "The Emerald Dream campaign, worth a chunk per chapter." },
    { "event", "Superblooms, and the Dreamseeds you plant between them." },
    { "world", "Emerald Dream world quests and the weekly that names the wardens." },
})

Add(2544, { -- Artisan's Consortium
    { "craft", "Finish crafting orders for other players; that is the bulk of it." },
    { "quest", "The weekly profession quests at the Dragon Isles trade posts." },
}, "A crafter's faction: the knowledge points and patterns behind it are the reason to bother.")

Add(2550, { -- Cobalt Assembly
    { "kill", "Kill Sundered Flame mobs at the Cobalt Assembly in the Azure Span." },
    { "turnin", "Loot the Wild Arcana they drop: 15 for Moderate, 45 for Major." },
}, "A trust bar rather than a standing, and a few focused hours take it to Maximum.")

Add(2526, { -- Winterpelt Furbolg
    { "unlock", "Finish the furbolg quest lines in the Azure Span to be let in at all." },
    { "quest", "The follow-up quests from Old Grimtusk once the tribe trusts you." },
})

Add(2517, { -- Wrathion
    { "daily", "The Obsidian Citadel dailies in the Waking Shores, on the days you back Wrathion." },
}, "Wrathion and Sabellian split the same dailies: what you give one, the other does not get.")

Add(2518, { -- Sabellian
    { "daily", "The Obsidian Citadel dailies in the Waking Shores, on the days you back Sabellian." },
}, "Wrathion and Sabellian split the same dailies: what you give one, the other does not get.")

Add(2553, { -- Soridormi
    { "event", "Time Rifts in Thaldraszus, and the quests around each rift." },
})

Add(2568, { -- Glimmerogg Racer
    { "event", "The snail races at Glimmerogg in Zaralek Cavern; every race counts." },
})

Add(2615, { -- Azerothian Archives
    { "quest", "The Archives' story and its weekly research quests." },
    { "event", "The dig site events the Archives run across the Dragon Isles." },
})

Add(2509, { -- Clan Shikaar
    { "event", "Grand Hunts and Maruuk world quests raise the clan along with the centaur." },
})

Add(2512, { -- Clan Aylaag
    { "event", "Grand Hunts and Maruuk world quests raise the clan along with the centaur." },
})

Add(2513, { -- Clan Ohn'ir
    { "event", "Grand Hunts and Maruuk world quests raise the clan along with the centaur." },
})

Add(2520, { -- Clan Nokhud
    { "event", "Grand Hunts and Maruuk world quests raise the clan along with the centaur." },
})

Add(2522, { -- Clan Teerai
    { "event", "Grand Hunts and Maruuk world quests raise the clan along with the centaur." },
})

--------------------------------------------------------------------------------
-- The War Within
--------------------------------------------------------------------------------

Add(2590, { -- Council of Dornogal
    { "quest", "The Isle of Dorn campaign and every side quest on the island." },
    { "world", "World quests and special assignments on the Isle of Dorn." },
    { "weekly", "The weekly dungeon quest in Dornogal, for one faction of your choice." },
    { "event", "Bountiful coffers in delves hand out a reputation token." },
})

Add(2570, { -- Hallowfall Arathi
    { "event", "The Theater Troupe weekly in Hallowfall, and Spreading the Light." },
    { "quest", "The Hallowfall campaign and its side quests." },
    { "world", "World quests and special assignments in Hallowfall." },
    { "weekly", "The weekly dungeon quest in Dornogal, for one faction of your choice." },
})

Add(2594, { -- The Assembly of the Deeps
    { "event", "Awakening the Machine in the Ringing Deeps, once it is up." },
    { "quest", "The Ringing Deeps campaign and its side quests." },
    { "world", "World quests and special assignments in the Ringing Deeps." },
    { "weekly", "The weekly dungeon quest in Dornogal, for one faction of your choice." },
})

Add(2600, { -- The Severed Threads
    { "quest", "The Azj-Kahet campaign and the City of Threads chapters." },
    { "world", "World quests and special assignments in Azj-Kahet." },
    { "weekly", "The weekly dungeon quest in Dornogal, for one faction of your choice." },
}, "The three patrons below have bars of their own; backing one does not slow this bar down.")

Add(2601, { -- The Weaver
    { "quest", "Back the Weaver in the City of Threads; her patron quests pay this bar." },
    { "world", "Azj-Kahet world quests that name her." },
})

Add(2605, { -- The General
    { "quest", "Back the General in the City of Threads; his patron quests pay this bar." },
    { "world", "Azj-Kahet world quests that name him." },
})

Add(2607, { -- The Vizier
    { "quest", "Back the Vizier in the City of Threads; her patron quests pay this bar." },
    { "world", "Azj-Kahet world quests that name her." },
})

Add(2653, { -- The Cartels of Undermine
    { "weekly", "The three Undermine weeklies: Many Jobs, Handle It!, Urge to Surge, Reduce, Reuse, Resell." },
    { "world", "Undermine world quests; they only appear once you have picked a cartel for the week." },
    { "quest", "The Undermine campaign, a good chunk per chapter." },
    { "kill", "Undermine rares, once a day each; the cartel-summoned ones pay the most." },
})

Add(2669, { -- Darkfuse Solutions
    { "weekly", "Pick Darkfuse as your cartel for the week; its jobs then pay this bar." },
    { "world", "Undermine world quests and special assignments while Darkfuse is your patron." },
})

Add(2671, { -- Venture Company
    { "weekly", "Pick the Venture Company as your cartel for the week in Undermine." },
    { "world", "Undermine world quests and special assignments while they are your patron." },
})

Add(2673, { -- Bilgewater Cartel
    { "weekly", "Pick the Bilgewater Cartel as your cartel for the week in Undermine." },
    { "world", "Undermine world quests and special assignments while they are your patron." },
})

Add(2675, { -- Blackwater Cartel
    { "weekly", "Pick the Blackwater Cartel as your cartel for the week in Undermine." },
    { "world", "Undermine world quests and special assignments while they are your patron." },
})

Add(2677, { -- Steamwheedle Cartel
    { "weekly", "Pick the Steamwheedle Cartel as your cartel for the week in Undermine." },
    { "world", "Undermine world quests and special assignments while they are your patron." },
})

Add(2685, { -- Gallagio Loyalty Rewards Club
    { "raid", "Liberation of Undermine: bosses pay on every difficulty." },
})

Add(2736, { -- Manaforge Vandals
    { "raid", "Manaforge Omega: bosses pay on every difficulty, and the track is warband-wide." },
}, "The track has a weekly cap that rises by one renown a week; falling behind can be caught up.")

Add(2658, { -- The K'aresh Trust
    { "quest", "The K'aresh campaign and every side quest in the zone." },
    { "world", "K'aresh world quests, plus the weeklies like Ecological Succession." },
    { "weekly", "The weekly dungeon quest in Dornogal, taken for the K'aresh Trust." },
    { "kill", "K'aresh rares, and the lore books scattered across the zone." },
})

Add(2688, { -- Flame's Radiance
    { "event", "The Nightfall scenario in Hallowfall, at the top of every hour." },
    { "daily", "The Radiant Incursion dailies while an incursion is running." },
    { "weekly", "The Flame Burns Eternal, the weekly quest for the Nightfall scenario." },
})

Add(2640, { -- Brann Bronzebeard
    { "event", "Run delves with Brann; he levels with every delve the two of you finish." },
}, "Not a reputation at all: his level is his experience, and higher tiers pay more of it.")

--------------------------------------------------------------------------------
-- Midnight
--------------------------------------------------------------------------------

Add(2710, { -- Silvermoon Court
    { "quest", "The Eversong Woods campaign and the zone's side quests." },
    { "world", "World quests and special assignments in Eversong Woods." },
    { "event", "Saltheril's Soiree, with the weekly quest of whichever house you back." },
    { "weekly", "The weekly dungeon quest from Halduron Brightwing, for one faction a week." },
}, "Renown costs 2500 reputation a rank and counts for the whole warband.")

Add(2696, { -- Amani Tribe
    { "quest", "The Zul'Aman campaign and the zone's side quests." },
    { "world", "World quests and special assignments in Zul'Aman." },
    { "event", "Abundance, and its weekly quest Abundant Offerings." },
    { "weekly", "The weekly dungeon quest from Halduron Brightwing, for one faction a week." },
}, "Zul'Aman's rares pay once a week each, and bountiful delve caches add a token.")

Add(2704, { -- Hara'ti
    { "quest", "The Harandar campaign and the zone's side quests." },
    { "world", "World quests and special assignments in Harandar." },
    { "event", "Legends of the Haranir, and the Haranir Relic weekly that goes with it." },
    { "weekly", "The weekly dungeon quest from Halduron Brightwing, for one faction a week." },
})

Add(2699, { -- The Singularity
    { "quest", "The Voidstorm campaign and the zone's side quests." },
    { "world", "World quests and special assignments in the Voidstorm." },
    { "event", "Stormarion Assault, and its weekly quest Stand Your Ground." },
    { "weekly", "The weekly dungeon quest from Halduron Brightwing, for one faction a week." },
})

Add(2712, { -- Blood Knights
    { "weekly", "Back the Blood Knights at Saltheril's Soiree and run their weekly quest." },
}, "The four houses have their own bars, and only the house you back moves in a given week.")

Add(2713, { -- Farstriders
    { "weekly", "Back the Farstriders at Saltheril's Soiree and run their weekly quest." },
}, "The four houses have their own bars, and only the house you back moves in a given week.")

Add(2711, { -- Magisters
    { "weekly", "Back the Magisters at Saltheril's Soiree and run their weekly quest." },
}, "The four houses have their own bars, and only the house you back moves in a given week.")

Add(2714, { -- Shades of the Row
    { "weekly", "Back the Shades at Saltheril's Soiree and run their weekly quest." },
}, "The four houses have their own bars, and only the house you back moves in a given week.")

Add(2772, { -- Zul'jarra's Forces
    { "unlock", "The patch campaign Return to Amani'Zar takes you to the Coiled Isle." },
    { "quest", "The Coiled Isle campaign, its side quests and the Vaults of Atal'Utek." },
    { "world", "World quests, special assignments and Cursed Surges on the isle." },
    { "kill", "The Coiled Isle rares, once each." },
})
