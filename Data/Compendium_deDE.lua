local _, T = ...
if GetLocale() ~= "deDE" then return end
local Text = T.Compendium.Translate

-- The German wording of Data/Compendium.lua, faction for faction and line for
-- line in the same order. tools/check-compendium.lua fails the build when the
-- two files drift apart.

--------------------------------------------------------------------------------
-- Hauptstädte
--------------------------------------------------------------------------------

Text(72, { -- Stormwind
    "Quests im Wald von Elwynn, im Westfall, im Rotkammgebirge, in Dunkelhain und in der Stadt.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(47, { -- Ironforge
    "Quests in Dun Morogh, im Loch Modan, in den Sumpflanden und in der Sengenden Schlucht.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(69, { -- Darnassus
    "Quests in Teldrassil, in Dunkelküste, im Eschental und in Feralas.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(54, { -- Gnomeregan
    "Die Gnomen-Questreihen in Dun Morogh und alles in Gnomeregan.",
    "Gib beim Gnomen-Quartiermeister in Eisenschmiedes Bastelviertel Runenstoff ab.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(930, { -- Exodar
    "Quests auf der Azurmythosinsel und der Blutmythosinsel.",
    "Gib beim Draenei-Quartiermeister in der Exodar Runenstoff ab.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(76, { -- Orgrimmar
    "Quests in Durotar, im Nördlichen Brachland, in Azshara und in der Stadt selbst.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(81, { -- Thunder Bluff
    "Quests in Mulgore, im Brachland, in den Tausend Nadeln und in Feralas.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(68, { -- Undercity
    "Quests in Tirisfal, im Silberwald, im Vorgebirge des Hügellands und in den Pestländern.",
    "Gib beim Quartiermeister der Stadt Runenstoff ab; die Abgabe wiederholt sich bis Ehrfürchtig.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(530, { -- Darkspear Trolls
    "Quests auf den Echoinseln, in Durotar und die Trollreihen im Brachland.",
    "Gib beim Troll-Quartiermeister im Tal der Geister in Orgrimmar Runenstoff ab.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(911, { -- Silvermoon City
    "Quests im Immersangwald und in den Geisterlanden.",
    "Gib beim Blutelfen-Quartiermeister in Silbermond Runenstoff ab.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

--------------------------------------------------------------------------------
-- Classic
--------------------------------------------------------------------------------

Text(529, { -- Argent Dawn
    "Gib Geißelsteine in den Lagern der Argentumdämmerung in beiden Pestländern ab.",
    "Töte Untote in den Pestländern, solange du das Abzeichen der Argentumdämmerung trägst.",
    "Die Questreihen an der Kapelle des Hoffnungsvollen Lichts, in Scholomance, Stratholme und Naxxramas.",
}, "Ohne das Abzeichen fallen keine Geißelsteine - der Schmuck muss angelegt sein.")

Text(576, { -- Timbermaw Hold
    "Gib Kopfschmuckfedern der Totholz (Feuerwald) und Rückgrate der Winterfell (Winterquell) ab.",
    "Töte Totholz- und Winterfellfurbolgs; die Kills zählen bis Wohlwollend.",
    "Die wiederholbaren Quests am Mutanusfeste, im Feuerwald und in Winterquell.",
}, "Ab Wohlwollend zählen Kills nicht mehr - dann bewegen nur noch die beiden Abgaben den Balken.")

Text(59, { -- Thorium Brotherhood
    "Töte Dunkeleisenzwerge in der Schwarzfelstiefe, bis Lokhtos mit dir handelt.",
    "Gib Lokhtos im Grimmen Säufer Dunkeleisenrückstände und Dunkeleisenerz ab.",
    "Beute aus dem Geschmolzenen Kern und dem Pechschwingenhort: Feuerkerne, Lavakerne, Elementiumerz.",
}, "Dunkeleisenrückstände fallen überall in der Schwarzfelstiefe und sind der billigste Weg bis Wohlwollend.")

Text(609, { -- Cenarion Circle
    "Gib verschlüsselte Schriften der Dämmerung in der Cenariusfeste in Silithus ab.",
    "Der Außendienst in Silithus und die Questreihen um den Schattenhammer.",
    "Ruinen von Ahn'Qiraj: alles darin zahlt Ruf beim Zirkel des Cenarius.",
}, "Die Schriften fallen in den Dämmerungslagern in Silithus - Farmen und Abgeben liegen also auf einer Route.")

Text(749, { -- Hydraxian Waterlords
    "Herzog Hydraxis in Azshara startet die Reihe und die Ewige Quintessenz.",
    "Bosse im Geschmolzenen Kern; jeder Kill zahlt bis Ehrfürchtig.",
}, "Der Geschmolzene Kern ist die einzige echte Quelle - also eine Raid-ID pro Woche.")

Text(910, { -- Brood of Nozdormu
    "Der Tempel von Ahn'Qiraj: jeder Kill darin hebt den Schwarm.",
    "Gib Qiraji-Artefakte bei Anachronos in der Höhle der Zeit ab.",
}, "Die Fraktion beginnt bei Hassinnig, und nichts außerhalb von Ahn'Qiraj bewegt sie.")

Text(270, { -- Zandalar Tribe
    "Zul'Gurub: Bosse und Trash zahlen beide.",
    "Gib zulianische Münzen und Bijous bei den Zandalari auf der Insel Yojamba ab.",
}, "Bijous fallen beim Trash, ein voller Clear bringt also mehr als reines Bossfarmen.")

Text(809, { -- Shen'dralar
    "Düsterbruch Nord und West: die Eldreth und Hochgeborenen darin zahlen Ruf.",
    "Gib Librams bei den Shen'dralar im Athenäum von Düsterbruch West ab.",
}, "Die Fraktion taucht erst auf, wenn du die Shen'dralar hinter der Athenäumstür getroffen hast.")

Text(349, { -- Ravenholdt
    "Töte Syndikatsmitglieder in den Alteracbergen und im Vorgebirge des Hügellands.",
    "Schurken: Gib Fahrad in Rabenholdt schwere Ramschkisten ab.",
}, "Ohne Taschendiebstahl bleiben nur die Syndikatskills - und die sind zäh.")

Text(589, { -- Wintersaber Trainers
    "Die wiederholbaren Quests von Rivern Frostwind am Frostsäblerfelsen in Winterquell.",
    "Gib Frostwindfleisch, Splitterzahnfleisch und Geisterperlen der Winterfell ab.",
}, "Nur Allianz, und die Belohnung bei Ehrfürchtig ist der Frostsäbler aus Winterquell.")

Text(909, { -- Darkmoon Faire
    "Sammle weiche buschige Schwänze, leuchtende Federn und die übrigen Jahrmarktsgegenstände.",
    "Der Jahrmarkt öffnet in der ersten Woche des Monats; geschlossen nimmt niemand etwas an.",
    "Auf neueren Clients: die Spiele der Insel und die Berufsquests, einmal im Monat.",
})

Text(21, { -- Booty Bay
    "Quests in Schlingendorntal, aus Beutebucht heraus und auf dem Kap.",
    "Gib Flottenmeister Seehorn in Beutebucht Abzeichen der Blutsegelbukaniere ab.",
}, "Die Abzeichen heben alle vier Goblinstädte zugleich - und senken die Blutsegel.")

Text(369, { -- Gadgetzan
    "Quests in Tanaris und aus Gadgetzan heraus.",
    "Gib die Blutsegelabzeichen in Beutebucht ab; alle vier Städte teilen sich den Gewinn.",
})

Text(470, { -- Ratchet
    "Quests im Brachland aus Ratschet heraus.",
    "Gib die Blutsegelabzeichen in Beutebucht ab; alle vier Städte teilen sich den Gewinn.",
})

Text(577, { -- Everlook
    "Quests in Winterquell aus Ewige Warte heraus.",
    "Gib die Blutsegelabzeichen in Beutebucht ab; alle vier Städte teilen sich den Gewinn.",
})

Text(87, { -- Bloodsail Buccaneers
    "Töte die Goblinwachen von Beutebucht, Gadgetzan, Ratschet und Ewige Warte.",
    "Die Blutsegelreihe an der Wilden Küste südlich von Beutebucht.",
}, "Jeder Punkt hier kostet Ruf bei den Steamwheedle-Städten; die Abzeichen machen das später rückgängig.")

Text(92, { -- Gelkis Clan Centaur
    "Töte Magramzentauren in Desolace.",
    "Die Questreihe der Gelkis in ihrem Lager im Süden von Desolace.",
}, "Die beiden Klans sind Spiegelbilder: Wer einen hebt, senkt den anderen; nur einer wird je freundlich.")

Text(93, { -- Magram Clan Centaur
    "Töte Gelkiszentauren in Desolace.",
    "Die Questreihe der Magram in ihrem Lager im Osten von Desolace.",
}, "Die beiden Klans sind Spiegelbilder: Wer einen hebt, senkt den anderen; nur einer wird je freundlich.")

Text(730, { -- Stormpike Guard
    "Alteractal: Siege und die erschlagenen Anführer der Frostwölfe.",
    "Gib Rüstungsfetzen und die Feldabgaben im Tal selbst ab.",
})

Text(729, { -- Frostwolf Clan
    "Alteractal: Siege und die erschlagenen Anführer der Sturmlanzen.",
    "Gib Rüstungsfetzen und die Feldabgaben im Tal selbst ab.",
})

Text(890, { -- Silverwing Sentinels
    "Warsong-Schlucht: jede zurückgebrachte Flagge und jeder Sieg.",
    "Gib Warsong-Abzeichen im Lager der Silberschwingen im Eschental ab.",
})

Text(889, { -- Warsong Outriders
    "Warsong-Schlucht: jede zurückgebrachte Flagge und jeder Sieg.",
    "Gib Warsong-Abzeichen im Lager des Kriegshymnenklans im Eschental ab.",
})

Text(509, { -- The League of Arathor
    "Arathibecken: gehaltene Stützpunkte und gewonnene Schlachten.",
    "Gib Arathibecken-Abzeichen im Lager vor dem Schlachtfeld ab.",
})

Text(510, { -- The Defilers
    "Arathibecken: gehaltene Stützpunkte und gewonnene Schlachten.",
    "Gib Arathibecken-Abzeichen im Lager vor dem Schlachtfeld ab.",
})

--------------------------------------------------------------------------------
-- The Burning Crusade
--------------------------------------------------------------------------------

Text(932, { -- The Aldor
    "Gib auf dem Aldorgipfel Feuerschwingen- und Sonnenzornsiegel ab, später teuflische Waffen.",
    "Die Tagesquests in Shattrath und der Netherstürme, die die Aldor nennen.",
}, "Wer sich für die Aldor entscheidet, macht die Seher feindlich - und das bleibt so.")

Text(934, { -- The Scryers
    "Gib auf dem Sehertribut Male von Kil'jaeden und Sargeras ab, später arkane Folianten.",
    "Die Tagesquests in Shattrath und der Netherstürme, die die Seher nennen.",
}, "Wer sich für die Seher entscheidet, macht die Aldor feindlich - und das bleibt so.")

Text(935, { -- The Sha'tar
    "Die Flügel von Festung der Stürme: Mechanar, Botanica und Arkatraz.",
    "Questreihen in den Netherstürmen und aus Shattrath heraus.",
})

Text(933, { -- The Consortium
    "Die Managruft in Auchindoun, normal wie heroisch.",
    "Gib Gezhe in Nagrand Obsidiankriegsperlen der Oger ab.",
    "Die Questreihen des Konsortiums in den Netherstürmen.",
})

Text(1011, { -- Lower City
    "Auchenaikrypta, Sethekkhallen und Schattenlabyrinth.",
    "Gib Arakkoafedern aus dem Wald von Terokkar in der Unteren Stadt ab.",
    "Die Tagesquests der Unteren Stadt in Shattrath, auch die heroische.",
})

Text(942, { -- Cenarion Expedition
    "Die Flügel der Echsenkessel: Sklavenunterkünfte, Tiefensumpf und Dampfkammer.",
    "Gib unbekannte Pflanzenteile in der Cenariusfeste im Zangarmarsch ab.",
    "Die Questreihen im Zangarmarsch und die Instanzquests der Echsenkessel.",
})

Text(989, { -- Keepers of Time
    "Das Vorgebirge des Alten Hügellands und das Schwarze Morast; heroisch zahlt weit mehr.",
    "Die Zugangsreihen in der Höhle der Zeit.",
})

Text(990, { -- The Scale of the Sands
    "Der Hyjalgipfel: jede Welle und jeder Boss.",
})

Text(967, { -- The Violet Eye
    "Karazhan, Bosse wie Trash; die Schlüsselreihe bringt dich hinein.",
})

Text(1012, { -- Ashtongue Deathsworn
    "Die Bosse des Schwarzen Tempels, von Naj'entus bis Illidan.",
})

Text(946, { -- Honor Hold
    "Die Questreihen der Höllenfeuerhalbinsel aus Ehrenfeste heraus.",
    "Höllenfeuerbollwerk, Der Blutkessel und Die Zerschmetterten Hallen.",
}, "Die heroischen Zerschmetterten Hallen sind das schnellste Stück des Wegs nach Ehrfürchtig.")

Text(947, { -- Thrallmar
    "Die Questreihen der Höllenfeuerhalbinsel aus Thrallmar heraus.",
    "Höllenfeuerbollwerk, Der Blutkessel und Die Zerschmetterten Hallen.",
}, "Die heroischen Zerschmetterten Hallen sind das schnellste Stück des Wegs nach Ehrfürchtig.")

Text(941, { -- The Mag'har
    "Die Questreihen in Nagrand aus Garadar heraus, samt Ring des Blutes.",
    "Die Oger- und Kil'sorrowlager, in die dich die Nagrandquests schicken.",
})

Text(978, { -- Kurenai
    "Die Questreihen in Nagrand aus Telaar heraus, samt Ring des Blutes.",
    "Die Oger- und Kil'sorrowlager, in die dich die Nagrandquests schicken.",
})

Text(970, { -- Sporeggar
    "Gib Sumpffürstenranken und Blutrote Hibisken aus dem Tiefensumpf ab.",
    "Töte Naga im Zangarmarsch; mit Glühkappen kaufst du den Rest.",
    "Die wiederholbaren Quests in Sporeggar selbst.",
})

Text(1015, { -- Netherwing
    "Die Reihe auf dem Netherschwingenfels im Schattenmondtal; Fliegen ist Pflicht.",
    "Die Tagesquests auf dem Fels: Bergbau, Eier und die Bombenflüge.",
    "Netherschwingeneier, die rings um den Fels versteckt liegen, je 250 Ruf.",
}, "Ehrfürchtig kauft einen Netherschwingendrachen; nur die Eier haben kein Tageslimit.")

Text(1031, { -- Sha'tari Skyguard
    "Die Tagesquests an der Schwarzwindlandung in Terokkar und über Skettis.",
    "Töte Arakkoa in Skettis, solange die Tagesquests auf Abklingzeit sind.",
})

Text(1038, { -- Ogri'la
    "Die Apexisreihe im Schergrat schaltet Ogri'la frei.",
    "Die Tagesquests von Ogri'la, auch die gemeinsamen mit der Himmelswache.",
})

Text(1077, { -- Shattered Sun Offensive
    "Die Tagesquests auf der Insel von Quel'Danas, an Land wie im Hafen.",
    "Terrasse der Magister und das Sonnenbrunnenplateau.",
}, "Je weiter die Insel auf deinem Realm ausgebaut ist, desto mehr Tagesquests gibt es.")

Text(922, { -- Tranquillien
    "Die Questreihen der Geisterlande aus Tristessa heraus; nur Horde.",
})

--------------------------------------------------------------------------------
-- Wrath of the Lich King
--------------------------------------------------------------------------------

Text(1090, { -- Kirin Tor
    "Trag den Wappenrock des Kirin Tor in einer heroischen Nordend-Instanz.",
    "Die Tagesquests in Dalaran: Kochkunst, Angeln und die Juwelierskunst-Quest.",
})

Text(1106, { -- Argent Crusade
    "Trag den Wappenrock des Argentumkreuzzugs in einer heroischen Nordend-Instanz.",
    "Die Tagesquests in Eiskrone an der Argentumvorhut und der Kreuzfahrerspitze.",
    "Die Tagesquests des Argentumturniers, sobald dein Charakter Knappe war.",
})

Text(1098, { -- Knights of the Ebon Blade
    "Trag den Wappenrock der Schwarzen Klinge in einer heroischen Nordend-Instanz.",
    "Die Tagesquests am Schattengewölbe in Eiskrone.",
    "Die Questreihen in Eiskrone ab der Erhebung des Todes.",
})

Text(1091, { -- The Wyrmrest Accord
    "Trag den Wappenrock des Wyrmruhpakts in einer heroischen Nordend-Instanz.",
    "Die Tagesquests am Tempel von Wyrmruh in der Drachenöde.",
    "Die Questreihen der Drachenöde rund um den Tempel.",
})

Text(1119, { -- The Sons of Hodir
    "Die Reihe von K3 hinauf nach Dun Niffelem schaltet die Tagesquests frei.",
    "Die Tagesquests in Dun Niffelem: Speere, Harpunen und Thorims Arena.",
    "Gib Relikte von Ulduar ab; sie fallen überall in den Sturmgipfeln.",
}, "Hier hängen die Schulterverzauberungen, und einen Wappenrock gibt es dafür nicht.")

Text(1073, { -- The Kalu'ak
    "Die drei Tuskarr-Tagesquests in Moa'kihafen, Kamagua und Unu'pe.",
    "Die Tuskarr-Questreihen in der Boreanischen Tundra und der Drachenöde.",
}, "Drei Tagesquests sind die Obergrenze - diese Fraktion braucht ihre Zeit.")

Text(1104, { -- Frenzyheart Tribe
    "Die Tagesquests im Sholazarbecken, sobald du dich für die Wolvar entscheidest.",
    "Die Questreihen im Sholazarbecken bis zur Entscheidung selbst.",
}, "Ein Seitenwechsel wirft dich bei den Orakeln auf Hassinnig und zurück - entscheide dich einmal.")

Text(1105, { -- The Oracles
    "Die Tagesquests im Sholazarbecken, sobald du dich für die Gorlocs entscheidest.",
    "Die Questreihen im Sholazarbecken bis zur Entscheidung selbst.",
}, "Ein Seitenwechsel wirft dich beim Wildherz-Stamm auf Hassinnig und zurück - entscheide dich einmal.")

Text(1156, { -- The Ashen Verdict
    "Eiskronenzitadelle: Bosse und Trash, in jedem Schwierigkeitsgrad.",
})

Text(1094, { -- The Silver Covenant
    "Die Tagesquests des Argentumturniers, sobald du für den Silberbund reitest.",
})

Text(1124, { -- The Sunreavers
    "Die Tagesquests des Argentumturniers, sobald du für die Sonnenhäscher reitest.",
})

Text(1050, { -- Valiance Expedition
    "Nordend-Quests aus den Allianzlagern, vor allem in der Boreanischen Tundra.",
    "Trag den Wappenrock in einer heroischen Nordend-Instanz.",
})

Text(1052, { -- Horde Expedition
    "Nordend-Quests aus den Hordelagern, vor allem in der Boreanischen Tundra.",
    "Trag den Wappenrock in einer heroischen Nordend-Instanz.",
})

Text(1064, { -- The Taunka
    "Die Taunka-Questreihen in der Boreanischen Tundra, der Drachenöde und im Heulenden Fjord.",
})

Text(1067, { -- The Hand of Vengeance
    "Die Questreihen der Verlassenen im Heulenden Fjord und in Giftspeier.",
})

Text(1085, { -- Warsong Offensive
    "Die Kriegshymnen-Questreihen in der Tundra, der Drachenöde und den Grizzlyhügeln.",
})

Text(1068, { -- Explorers' League
    "Die Questreihen der Forscherliga im Heulenden Fjord und in den Sturmgipfeln.",
})

Text(1126, { -- The Frostborn
    "Die Questreihen der Frostgeborenen in den Sturmgipfeln rund um Frostfeste.",
})

--------------------------------------------------------------------------------
-- Cataclysm
--------------------------------------------------------------------------------

Text(1158, { -- Guardians of Hyjal
    "Die Kampagne am Hyjal, vom Lager an Nordrassil bis vor Ragnaros' Tür.",
    "Trag den Wappenrock des Hyjal in einer heroischen Cataclysm-Instanz.",
})

Text(1135, { -- The Earthen Ring
    "Die Kampagne in Vashj'ir und die ersten Kapitel in Tiefenheim.",
    "Trag den Wappenrock des Erdenrings in einer heroischen Cataclysm-Instanz.",
})

Text(1171, { -- Therazane
    "Schließ die Kampagne in Tiefenheim ab; mit der Vergebung der Steinmutter öffnen die Tagesquests.",
    "Die Tagesquests an Therazanes Thron und in den Bröckelnden Tiefen.",
}, "Die Schulterverzauberungen hängen bei Wohlwollend und Ehrfürchtig, einen Wappenrock gibt es nicht.")

Text(1173, { -- Ramkahen
    "Die Kampagne in Uldum aus Ramkahen heraus.",
    "Die Tagesquests in Ramkahen, sobald die Kampagne durch ist.",
    "Trag den Wappenrock von Ramkahen in einer heroischen Cataclysm-Instanz.",
})

Text(1172, { -- Dragonmaw Clan
    "Die Kampagne im Hochland aus Blutschlucht heraus; nur Horde.",
    "Der Schmelztiegel des Gemetzels und die Tagesquests im Hochland.",
    "Trag den Wappenrock des Drachenmalklans in einer heroischen Cataclysm-Instanz.",
})

Text(1174, { -- Wildhammer Clan
    "Die Kampagne im Hochland aus Donnerspeer heraus; nur Allianz.",
    "Der Schmelztiegel des Gemetzels und die Tagesquests im Hochland.",
    "Trag den Wappenrock der Wildhammer in einer heroischen Cataclysm-Instanz.",
})

Text(1177, { -- Baradin's Wardens
    "Die Tagesquests auf Tol Barad; wer die Insel hält, bekommt doppelt so viele.",
    "Der Sieg in der Schlacht um Tol Barad selbst.",
})

Text(1178, { -- Hellscream's Reach
    "Die Tagesquests auf Tol Barad; wer die Insel hält, bekommt doppelt so viele.",
    "Der Sieg in der Schlacht um Tol Barad selbst.",
})

Text(1204, { -- Avengers of Hyjal
    "Die Bosse der Feuerlande, in jedem Schwierigkeitsgrad.",
})

Text(1133, { -- Bilgewater Cartel
    "Die Goblin-Questreihen auf Kezan, den Verlorenen Inseln und in Azshara.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

Text(1134, { -- Gilneas
    "Die Worgen-Questreihen in Gilneas und die Gilneer Kapitel in Dunkelküste.",
    "Trag den Wappenrock der Stadt in einer Instanz, auf Clients mit Stadtwappenröcken.",
})

--------------------------------------------------------------------------------
-- Mists of Pandaria
--------------------------------------------------------------------------------

Text(1269, { -- Golden Lotus
    "Die Tagesquests im Tal der Ewigen Blüten; die Lager öffnen nacheinander.",
    "Die Questreihe des Goldenen Lotus an der Goldenen Pagode.",
    "Zandalari-Kriegsbringer lassen Gestohlene Insignien des Goldenen Lotus fallen.",
}, "Der Goldene Lotus ist das Tor: Shado-Pan und Erhabene Himmlische öffnen bei Respektvoll.")

Text(1270, { -- Shado-Pan
    "Respektvoll beim Goldenen Lotus schaltet die Tagesquests der Shado-Pan frei.",
    "Die Tagesquests an der Shado-Pan-Garnison in den Steppen von Townlong.",
    "Zandalari-Kriegsbringer lassen Gestohlene Shado-Pan-Insignien fallen.",
}, "Die Große Belobigung bei Respektvoll verdoppelt den Gewinn für jeden Charakter des Accounts.")

Text(1341, { -- The August Celestials
    "Respektvoll beim Goldenen Lotus schaltet die Tagesquests der Himmlischen frei.",
    "Die Tempelquests: Tiger in Kun-Lai, Kranich in Krasarang, Schlange im Jadewald, Ochse in Townlong.",
    "Zandalari-Kriegsbringer lassen Gestohlene Insignien der Himmlischen fallen.",
})

Text(1337, { -- The Klaxxi
    "Die Tagesquests im Schreckensödland aus Klaxxi'vess heraus.",
    "Die Reihe der Paragons: Jeder geweckte Klaxxi-Paragon bringt mehr zu tun.",
    "Zandalari-Kriegsbringer lassen Gestohlene Klaxxi-Insignien fallen.",
})

Text(1271, { -- Order of the Cloud Serpent
    "Die Tagesquests am Arboretum im Jadewald, Rennen eingeschlossen.",
    "Zieh deine eigene Wolkenschlange aus dem Ei; die Reihe trägt bis Ehrfürchtig.",
})

Text(1272, { -- The Tillers
    "Beginn die Hofreihe bei Bauer Yoon in Halbhügel im Tal der Vier Winde.",
    "Die Arbeit auf dem Hof und die Tagesquests in Halbhügel, jeden Tag.",
    "Die Reihe der Ackerbauerngilde: Jede gewonnene Stimme öffnet mehr vom Hof.",
}, "Der Hof wächst mit dem Ruf, und die Freunde der Ackerbauern haben eigene Balken.")

Text(1302, { -- The Anglers
    "Die Angel-Tagesquests rund um den Anglerkai in der Krasarangwildnis.",
    "Die Anglerreihe im Süden des Schreckensödlands.",
}, "Angelfertigkeit ist nicht überall Pflicht, macht die Tagesquests aber deutlich schneller.")

Text(1358, { -- Nat Pagle
    "Gib Nat einen seiner drei seltenen Fische: Fliegender Tigergurami, Mimik-Oktopus, Stachelfischalpha.",
    "Ein seltener Fisch pro Tag bewegt den Balken; fisch ihn aus Pandarias Schwärmen.",
    "Nat sitzt am Anglerkai in der Krasarangwildnis und will erst den Anglerverband sehen.",
}, "Das ist ein Freundschaftsbalken, keine Rufstufe: Bester Freund bringt Nats Hut und sein Angelbuch.")

Text(1345, { -- The Lorewalkers
    "Finde die Überlieferungsobjekte überall in Pandaria; jedes bringt ein gutes Stück.",
    "Die eigenen Reihen der Hüter der Weisheit am Sitz des Wissens im Tal.",
}, "Jedes Objekt zählt nur einmal - das hier ist eine Schatzsuche, kein Grind.")

Text(1359, { -- The Black Prince
    "Wrathions Reihe um den legendären Umhang, Kapitel für Kapitel.",
    "Die Abgaben der Reihe selbst: Siegel, Geheimnisse und die Marken der Donnerinsel.",
})

Text(1376, { -- Operation: Shieldwall
    "Die Tagesquests in der Krasarangwildnis an der Löwenlandung; nur Allianz.",
    "Die Kapitel der Kampagne, eines pro Woche Ruf.",
})

Text(1375, { -- Dominance Offensive
    "Die Tagesquests in der Krasarangwildnis am Dominanzpunkt; nur Horde.",
    "Die Kapitel der Kampagne, eines pro Woche Ruf.",
})

Text(1387, { -- Kirin Tor Offensive
    "Die Tagesquests auf der Donnerinsel; nur Allianz.",
    "Die Kampagne der Insel: Jede eingenommene Stufe öffnet mehr Tagesquests.",
})

Text(1388, { -- Sunreaver Onslaught
    "Die Tagesquests auf der Donnerinsel; nur Horde.",
    "Die Kampagne der Insel: Jede eingenommene Stufe öffnet mehr Tagesquests.",
})

Text(1435, { -- Shado-Pan Assault
    "Die Bosse im Thron des Donners; jeder Schwierigkeitsgrad zahlt.",
}, "Nur Raid: keine Tagesquests, keine Abgaben, nur der Hof des Donnerkönigs.")

Text(1492, { -- Emperor Shaohao
    "Seltene und elitäre Gegner auf der Zeitlosen Insel, den Hof der Himmlischen eingeschlossen.",
    "Die Schätze der Insel und die wöchentlichen Quests der Himmlischen.",
})

Text(1440, { -- Darkspear Rebellion
    "Die Kampagne Schlachtfeld: Brachland und ihre Wochenkapitel; nur Horde.",
    "Die Tagesquests in der Klingenblüte, solange die Rebellion läuft.",
})

Text(1228, { -- Forest Hozen
    "Die Questreihen im Jadewald, die sich für die Hozen entscheiden; nur Horde.",
})

Text(1242, { -- Pearlfin Jinyu
    "Die Questreihen im Jadewald, die sich für die Jinyu entscheiden; nur Allianz.",
})

Text(1352, { -- Huojin Pandaren
    "Pandaren-Questreihen auf der Wandernden Insel und aus Orgrimmar heraus.",
})

Text(1353, { -- Tushui Pandaren
    "Pandaren-Questreihen auf der Wandernden Insel und aus Sturmwind heraus.",
})

--------------------------------------------------------------------------------
-- Die Freunde der Ackerbauern
--------------------------------------------------------------------------------

Text(1273, { -- Jogu the Drunk
    "Gib ihm täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Jogu mag den Lieblichen Apfel am liebsten; sein Favorit zählt fast doppelt.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1275, { -- Ella
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Ihr Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1276, { -- Old Hillpaw
    "Gib ihm täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Alter Hügelpfote mag die Blaue Feder am liebsten; sein Favorit zählt fast doppelt.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1277, { -- Chee Chee
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Ihr Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1278, { -- Sho
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Sho mag den Lieblichen Apfel am liebsten; ihr Favorit zählt fast doppelt.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1279, { -- Haohan Mudclaw
    "Gib ihm täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Sein Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1280, { -- Tina Mudclaw
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Ihr Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1281, { -- Gina Mudclaw
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Ihr Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Gina ist zugleich die Quartiermeisterin der Ackerbauern - du kommst ohnehin bei ihr vorbei.")

Text(1282, { -- Fish Fellreed
    "Gib ihr täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Ihr Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

Text(1283, { -- Farmer Fung
    "Gib ihm täglich ein Geschenk aus den Haufen dunkler Erde nördlich von Halbhügel.",
    "Sein Lieblingsgeschenk zählt fast doppelt so viel wie jedes andere.",
}, "Ein Geschenk pro Freund und Tag - zehn Freunde heißt also zehn Haufen dunkler Erde.")

--------------------------------------------------------------------------------
-- Warlords of Draenor
--------------------------------------------------------------------------------

Text(1515, { -- Arakkoa Outcasts
    "Die Kampagne in den Zinnen von Arak aus dem Zufluchtsort der Verstoßenen heraus.",
    "Die Tagesquests, die die Kampagne im Außenposten zurücklässt.",
})

Text(1710, { -- Sha'tari Defense
    "Die Kampagne in Talador; nur Allianz.",
    "Garnisonsmissionen, die die Fraktion nennen, und die Bonusziele der Zone.",
})

Text(1708, { -- Laughing Skull Orcs
    "Die Kampagne in Talador; nur Horde.",
    "Garnisonsmissionen, die die Fraktion nennen, und die Bonusziele der Zone.",
})

Text(1731, { -- Council of Exarchs
    "Die Kampagne im Schattenmondtal rund um Mondstiege; nur Allianz.",
    "Garnisonsmissionen und die Belobigungen, die sie zurückgeben.",
})

Text(1445, { -- Frostwolf Orcs
    "Die Kampagne im Frostfeuergrat rund um Frostwall; nur Horde.",
    "Garnisonsmissionen und die Belobigungen, die sie zurückgeben.",
})

Text(1682, { -- Wrynn's Vanguard
    "Kampagne und Bonusziele in Nagrand aus der Löwenwacht heraus; nur Allianz.",
})

Text(1681, { -- Vol'jin's Spear
    "Kampagne und Bonusziele in Nagrand aus Vol'jins Stolz heraus; nur Horde.",
})

Text(1711, { -- Steamwheedle Preservation Society
    "Die Ausgrabungsstätten Draenors und die Archäologiequests, die sie speisen.",
}, "Nur mit Archäologie: Ohne den Beruf bewegt sich dieser Balken überhaupt nicht.")

Text(1849, { -- Order of the Awakened
    "Die Tagesquests im Tanaandschungel, sobald die 6.2-Kampagne den Dschungel geöffnet hat.",
    "Die tägliche Abgabe von Apexiskristallen; die Kristalle fallen überall auf Draenor.",
})

Text(1850, { -- The Saberstalkers
    "Töte die Bestien und Raren von Fang'rila im Süden des Tanaandschungels.",
    "Gib die Klauen und Felle ab, die sie fallen lassen; die Abgabe wiederholt sich.",
})

Text(1847, { -- Hand of the Prophet
    "Die Kampagne im Tanaandschungel und ihre Tagesquests; nur Allianz.",
    "Werftmissionen, die die Fraktion nennen.",
})

Text(1848, { -- Vol'jin's Headhunters
    "Die Kampagne im Tanaandschungel und ihre Tagesquests; nur Horde.",
    "Werftmissionen, die die Fraktion nennen.",
})

--------------------------------------------------------------------------------
-- Legion
--------------------------------------------------------------------------------

Text(1828, { -- Highmountain Tribe
    "Weltquests in Hochberg, an jedem Tag, an dem sie offen sind.",
    "Die Geschichtskampagne von Hochberg und ihre Folgequests.",
    "Die Abgesandtenquest: vier Weltquests für eine Truhe und ein großes Stück Ruf.",
})

Text(1948, { -- Valarjar
    "Weltquests in Sturmheim, an jedem Tag, an dem sie offen sind.",
    "Die Geschichtskampagne von Sturmheim und ihre Folgequests.",
    "Die Abgesandtenquest: vier Weltquests für eine Truhe und ein großes Stück Ruf.",
})

Text(1900, { -- Court of Farondis
    "Weltquests in Azsuna, an jedem Tag, an dem sie offen sind.",
    "Die Geschichtskampagne von Azsuna und ihre Folgequests.",
    "Die Abgesandtenquest: vier Weltquests für eine Truhe und ein großes Stück Ruf.",
})

Text(1883, { -- Dreamweavers
    "Weltquests in Val'sharah, an jedem Tag, an dem sie offen sind.",
    "Die Geschichtskampagne von Val'sharah und ihre Folgequests.",
    "Die Abgesandtenquest: vier Weltquests für eine Truhe und ein großes Stück Ruf.",
})

Text(1859, { -- The Nightfallen
    "Die Kampagne in Suramar, Kapitel für Kapitel; sie trägt den größten Teil.",
    "Weltquests in Suramar und die Abgaben uralten Manas rund um die Stadt.",
    "Das Training der Verdorrten: Ein voller Durchgang bringt mehr als ein Tag Weltquests.",
})

Text(1894, { -- The Wardens
    "Weltquests der Wächterinnen, verteilt über die ganzen Verheerten Inseln.",
    "Die eigene Kampagne der Wächterinnen aus Azsuna heraus.",
    "Die Abgesandtenquest: vier Weltquests für eine Truhe und ein großes Stück Ruf.",
})

Text(2045, { -- Armies of Legionfall
    "Weltquests am Zerschmetterten Strand und die Rufbaken der Sentinax.",
    "Die Legionsfall-Kampagne und die wöchentlichen Baubeiträge.",
})

Text(2165, { -- Army of the Light
    "Weltquests auf Argus, vor allem in den Antoranischen Wüsten.",
    "Die Kampagne auf Argus, Kapitel für Kapitel.",
    "Invasionspunkte und die großen Invasionen einmal pro Woche.",
})

Text(2170, { -- Argussian Reach
    "Weltquests auf Argus, vor allem in Mac'Aree.",
    "Die Kampagne auf Argus, Kapitel für Kapitel.",
    "Invasionspunkte und die großen Invasionen einmal pro Woche.",
})

Text(1975, { -- Conjurer Margoss
    "Angle ertrunkenes Mana an Margoss' Zuflucht und gib es ihm direkt zurück.",
}, "Nur mit Angeln, und das Floß zu seiner Insel kauft man mit demselben Mana.")

--------------------------------------------------------------------------------
-- Battle for Azeroth
--------------------------------------------------------------------------------

Text(2160, { -- Proudmoore Admiralty
    "Die Kampagne im Tiragardesund und ihre Nebenkapitel; nur Allianz.",
    "Weltquests im Tiragardesund und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Kul Tiras, alle paar Tage.",
})

Text(2161, { -- Order of Embers
    "Die Kampagne in Drustvar und ihre Nebenkapitel; nur Allianz.",
    "Weltquests in Drustvar und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Kul Tiras, alle paar Tage.",
})

Text(2162, { -- Storm's Wake
    "Die Kampagne im Sturmsangtal und ihre Nebenkapitel; nur Allianz.",
    "Weltquests im Sturmsangtal und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Kul Tiras, alle paar Tage.",
})

Text(2103, { -- Zandalari Empire
    "Die Kampagne in Zuldazar und ihre Nebenkapitel; nur Horde.",
    "Weltquests in Zuldazar und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Zandalar, alle paar Tage.",
})

Text(2156, { -- Talanji's Expedition
    "Die Kampagne in Nazmir und ihre Nebenkapitel; nur Horde.",
    "Weltquests in Nazmir und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Zandalar, alle paar Tage.",
})

Text(2158, { -- Voldunai
    "Die Kampagne in Vol'dun und ihre Nebenkapitel; nur Horde.",
    "Weltquests in Vol'dun und der Abgesandte, der sie nennt.",
    "Fraktionsangriffe auf Zandalar, alle paar Tage.",
})

Text(2159, { -- 7th Legion
    "Die Kriegskampagne, Kapitel für Kapitel; nur Allianz.",
    "Inselexpeditionen und die Fraktionsangriffe auf Zandalar.",
})

Text(2157, { -- The Honorbound
    "Die Kriegskampagne, Kapitel für Kapitel; nur Horde.",
    "Inselexpeditionen und die Fraktionsangriffe auf Kul Tiras.",
})

Text(2164, { -- Champions of Azeroth
    "Die Reihe um das Herz von Azeroth und ihre Folgequests mit Magni.",
    "Weltquests, die die Champions nennen, auf beiden Kontinenten.",
})

Text(2163, { -- Tortollan Seekers
    "Die Weltquests der Tortollaner: die Rätsel, die Rennen und die Begleitquests.",
    "Der Abgesandte, der sie nennt; er ist der einzige verlässliche Brocken.",
}, "Keine eigene Zone, keine Tagesquests - diese Fraktion kriecht, egal was du tust.")

Text(2373, { -- The Unshackled
    "Die Kampagne in Nazjatar und ihre täglichen Folgequests; nur Horde.",
    "Weltquests in Nazjatar und die täglichen Abgaben in Neuheim.",
})

Text(2400, { -- Waveblade Ankoan
    "Die Kampagne in Nazjatar und ihre täglichen Folgequests; nur Allianz.",
    "Weltquests in Nazjatar und die täglichen Abgaben in Mezzamer.",
})

Text(2391, { -- Rustbolt Resistance
    "Die Kampagne auf Mechagon aus Rostbolzen heraus.",
    "Die Tagesquests in Rostbolzen, die Raren und die täglichen Lochkartenläufe.",
})

Text(2415, { -- Rajani
    "Der Angriff auf das Tal der Ewigen Blüten, in den Wochen, in denen er läuft.",
    "Die Tagesquests und Raren im Tal, solange der Angriff steht.",
    "Die Wochenquest des Angriffs ist der größte einzelne Brocken.",
})

Text(2417, { -- Uldum Accord
    "Der Angriff auf Uldum, in den Wochen, in denen er läuft.",
    "Die Tagesquests und Raren in Uldum, solange der Angriff steht.",
    "Die Wochenquest des Angriffs ist der größte einzelne Brocken.",
})

Text(2395, { -- Honeyback Hive
    "Die Tagesquests der Honigrückenernte im Sturmsangtal; nur Allianz.",
}, "Eine Tagesquest pro Tag und sonst nichts - das Reittier am Ende dauert Wochen.")

--------------------------------------------------------------------------------
-- Shadowlands
--------------------------------------------------------------------------------

Text(2407, { -- The Ascended
    "Die Kampagne in Bastion und die Kapitel des Kyrianischen Pakts.",
    "Weltquests in Bastion und die Berufungen, die dich dorthin schicken.",
    "Die Wochenquest der Zone und die Paktangriffe im Schlund.",
})

Text(2410, { -- The Undying Army
    "Die Kampagne in Maldraxxus und die Kapitel des Nekrolord-Pakts.",
    "Weltquests in Maldraxxus und die Berufungen, die dich dorthin schicken.",
    "Die Wochenquest der Zone und die Paktangriffe im Schlund.",
})

Text(2413, { -- Court of Harvesters
    "Die Kampagne in Revendreth und die Kapitel des Venthyr-Pakts.",
    "Weltquests in Revendreth und die Berufungen, die dich dorthin schicken.",
    "Die Wochenquest der Zone und die Paktangriffe im Schlund.",
})

Text(2465, { -- The Wild Hunt
    "Die Kampagne in Ardenwald und die Kapitel des Nachtfae-Pakts.",
    "Weltquests in Ardenwald und die Berufungen, die dich dorthin schicken.",
    "Die Wochenquest der Zone und die Paktangriffe im Schlund.",
})

Text(2432, { -- Ve'nari
    "Ve'naris eigene Reihe im Schlund, die ihr Warenangebot Schritt für Schritt öffnet.",
    "Gib ihr Stygia; jeder Rare und jedes Ereignis im Schlund lässt mehr fallen.",
}, "Ihre Verbesserungen machen den Schlund erst erträglich - das hier zahlt sich selbst zurück.")

Text(2470, { -- Death's Advance
    "Die Kampagne in Korthia, Kapitel für Kapitel.",
    "Die Tagesquests in Korthia und die Raren, die über die Insel ziehen.",
})

Text(2472, { -- The Archivists' Codex
    "Gib dem Kodex in Korthia Reliktfragmente, um die nächste Forschung zu kaufen.",
    "Reliktfragmente kommen aus Korthias Tagesquests, Raren und versteckten Truhen.",
})

Text(2478, { -- The Enlightened
    "Die Kampagne in Zereth Mortis, Kapitel für Kapitel.",
    "Die Tagesquests und Weltquests in Zereth Mortis rund um den Hafen.",
})

Text(2445, { -- The Ember Court
    "Richte den Aschernen Hof in Revendreth aus; jeder zufriedene Gast zahlt.",
    "Die Kapitel des Venthyr-Pakts, die den Hof überhaupt erst öffnen.",
}, "Nur Venthyr, und der Hof läuft einmal pro Woche und Charakter.")

--------------------------------------------------------------------------------
-- Dragonflight
--------------------------------------------------------------------------------

Text(2507, { -- Dragonscale Expedition
    "Die Kampagnen in den Erwachenden Küsten und der Azurblauen Spanne aus den Lagern der Expedition.",
    "Weltquests auf den Dracheninseln, die die Expedition nennen.",
    "Kundschafterpakete der Expedition, die beim Klettern und Erkunden auftauchen.",
    "Hilfe für den Pakt: Die Wochenquest zahlt an alle Fraktionen der Dracheninseln.",
})

Text(2511, { -- Iskaara Tuskarr
    "Das Gemeinschaftsfest in der Azurblauen Spanne, zweimal am Tag.",
    "Die Kampagne der Azurblauen Spanne und die Nebenkapitel der Tuskarr.",
    "Weltquests auf den Dracheninseln, die die Tuskarr nennen.",
    "Hilfe für den Pakt: Die Wochenquest zahlt an alle Fraktionen der Dracheninseln.",
})

Text(2503, { -- Maruuk Centaur
    "Die Großen Jagden in den Ohn'ahranebenen; die Jagd skaliert mit der Gruppe.",
    "Die Kampagne der Ohn'ahranebenen und die Kapitel der Klans.",
    "Weltquests auf den Dracheninseln, die die Zentauren nennen.",
    "Hilfe für den Pakt: Die Wochenquest zahlt an alle Fraktionen der Dracheninseln.",
})

Text(2510, { -- Valdrakken Accord
    "Die Belagerung der Drachenfluchfeste in den Erwachenden Küsten, alle zwei Stunden.",
    "Die Kampagne in Thaldraszus und die Drachenschwarmkapitel in Valdrakken.",
    "Weltquests auf den Dracheninseln, die den Pakt nennen.",
    "Hilfe für den Pakt: Die Wochenquest zahlt an alle Fraktionen der Dracheninseln.",
})

Text(2564, { -- Loamm Niffen
    "Die Kampagne der Zaralekhöhle aus Loamm heraus.",
    "Schnüfflersuche: Lass einen Niffen die Verstecke der Höhle ausgraben, wieder und wieder.",
    "Weltquests und Rare in der Zaralekhöhle.",
})

Text(2574, { -- Dream Wardens
    "Die Kampagne im Smaragdgrünen Traum, ein gutes Stück je Kapitel.",
    "Superblüten und die Traumsaat, die du zwischendurch pflanzt.",
    "Weltquests im Traum und die Wochenquest, die die Wächter nennt.",
})

Text(2544, { -- Artisan's Consortium
    "Erledige Handwerksaufträge für andere Spieler; das ist der Löwenanteil.",
    "Die wöchentlichen Berufsquests an den Handelsposten der Dracheninseln.",
}, "Eine Handwerkerfraktion: Wissenspunkte und Rezepte dahinter sind der eigentliche Grund.")

Text(2550, { -- Cobalt Assembly
    "Töte die Gegner der Zerschmetterten Flamme an der Kobaltversammlung in der Azurblauen Spanne.",
    "Sammle die Wilden Arkana, die sie fallen lassen: 15 für mäßige, 45 für große.",
}, "Ein Vertrauensbalken statt einer Rufstufe - ein paar konzentrierte Stunden reichen bis zum Maximum.")

Text(2526, { -- Winterpelt Furbolg
    "Schließ die Furbolg-Questreihen in der Azurblauen Spanne ab, um überhaupt eingelassen zu werden.",
    "Die Folgequests von Alt Grimmzahn, sobald der Stamm dir traut.",
})

Text(2517, { -- Wrathion
    "Die Tagesquests an der Obsidianzitadelle, an den Tagen, an denen du Wrathion unterstützt.",
}, "Wrathion und Sabellian teilen sich dieselben Tagesquests: Was der eine bekommt, fehlt dem anderen.")

Text(2518, { -- Sabellian
    "Die Tagesquests an der Obsidianzitadelle, an den Tagen, an denen du Sabellian unterstützt.",
}, "Wrathion und Sabellian teilen sich dieselben Tagesquests: Was der eine bekommt, fehlt dem anderen.")

Text(2553, { -- Soridormi
    "Zeitrisse in Thaldraszus und die Quests rund um jeden Riss.",
})

Text(2568, { -- Glimmerogg Racer
    "Die Schneckenrennen in Glimmerogg in der Zaralekhöhle; jedes Rennen zählt.",
})

Text(2615, { -- Azerothian Archives
    "Die Geschichte der Archive und ihre wöchentlichen Forschungsquests.",
    "Die Grabungsereignisse, die die Archive über die Dracheninseln verteilen.",
})

Text(2509, { -- Clan Shikaar
    "Große Jagden und Weltquests der Maruuk heben den Klan zusammen mit den Zentauren.",
})

Text(2512, { -- Clan Aylaag
    "Große Jagden und Weltquests der Maruuk heben den Klan zusammen mit den Zentauren.",
})

Text(2513, { -- Clan Ohn'ir
    "Große Jagden und Weltquests der Maruuk heben den Klan zusammen mit den Zentauren.",
})

Text(2520, { -- Clan Nokhud
    "Große Jagden und Weltquests der Maruuk heben den Klan zusammen mit den Zentauren.",
})

Text(2522, { -- Clan Teerai
    "Große Jagden und Weltquests der Maruuk heben den Klan zusammen mit den Zentauren.",
})

--------------------------------------------------------------------------------
-- The War Within
--------------------------------------------------------------------------------

Text(2590, { -- Council of Dornogal
    "Die Kampagne auf der Insel von Dorn und jede Nebenquest der Insel.",
    "Weltquests und Sonderaufträge auf der Insel von Dorn.",
    "Die wöchentliche Instanzquest in Dornogal, für eine Fraktion deiner Wahl.",
    "Reiche Truhen in Tiefen geben eine Rufmarke.",
})

Text(2570, { -- Hallowfall Arathi
    "Die Theatertruppe in Heiligfall, wöchentlich, dazu Das Licht verbreiten.",
    "Die Kampagne in Heiligfall und ihre Nebenquests.",
    "Weltquests und Sonderaufträge in Heiligfall.",
    "Die wöchentliche Instanzquest in Dornogal, für eine Fraktion deiner Wahl.",
})

Text(2594, { -- The Assembly of the Deeps
    "Die Maschine erwecken in den Klingenden Tiefen, sobald das Ereignis läuft.",
    "Die Kampagne der Klingenden Tiefen und ihre Nebenquests.",
    "Weltquests und Sonderaufträge in den Klingenden Tiefen.",
    "Die wöchentliche Instanzquest in Dornogal, für eine Fraktion deiner Wahl.",
})

Text(2600, { -- The Severed Threads
    "Die Kampagne in Azj-Kahet und die Kapitel der Stadt der Fäden.",
    "Weltquests und Sonderaufträge in Azj-Kahet.",
    "Die wöchentliche Instanzquest in Dornogal, für eine Fraktion deiner Wahl.",
}, "Die drei Schirmherren darunter haben eigene Balken; einen zu unterstützen bremst diesen hier nicht.")

Text(2601, { -- The Weaver
    "Unterstütz die Weberin in der Stadt der Fäden; ihre Quests zahlen auf diesen Balken.",
    "Weltquests in Azj-Kahet, die sie nennen.",
})

Text(2605, { -- The General
    "Unterstütz den General in der Stadt der Fäden; seine Quests zahlen auf diesen Balken.",
    "Weltquests in Azj-Kahet, die ihn nennen.",
})

Text(2607, { -- The Vizier
    "Unterstütz die Wesirin in der Stadt der Fäden; ihre Quests zahlen auf diesen Balken.",
    "Weltquests in Azj-Kahet, die sie nennen.",
})

Text(2653, { -- The Cartels of Undermine
    "Die drei Wochenquests in Unterstadt: Jobs über Jobs, Drang zum Überschwang, Sammeln, Sortieren, Kassieren.",
    "Weltquests in Unterstadt; sie erscheinen erst, wenn du ein Kartell der Woche gewählt hast.",
    "Die Kampagne in Unterstadt, ein gutes Stück je Kapitel.",
    "Rare in Unterstadt, je einmal am Tag; die vom Kartell beschworenen zahlen am meisten.",
})

Text(2669, { -- Darkfuse Solutions
    "Wähl Dunkelzünder als dein Kartell der Woche; dann zahlen seine Aufträge auf diesen Balken.",
    "Weltquests und Sonderaufträge in Unterstadt, solange Dunkelzünder dein Schirmherr ist.",
})

Text(2671, { -- Venture Company
    "Wähl die Handelskoalition als dein Kartell der Woche in Unterstadt.",
    "Weltquests und Sonderaufträge in Unterstadt, solange sie dein Schirmherr ist.",
})

Text(2673, { -- Bilgewater Cartel
    "Wähl das Bilgewasserkartell als dein Kartell der Woche in Unterstadt.",
    "Weltquests und Sonderaufträge in Unterstadt, solange es dein Schirmherr ist.",
})

Text(2675, { -- Blackwater Cartel
    "Wähl das Schwarzwasserkartell als dein Kartell der Woche in Unterstadt.",
    "Weltquests und Sonderaufträge in Unterstadt, solange es dein Schirmherr ist.",
})

Text(2677, { -- Steamwheedle Cartel
    "Wähl das Dampfdruckkartell als dein Kartell der Woche in Unterstadt.",
    "Weltquests und Sonderaufträge in Unterstadt, solange es dein Schirmherr ist.",
})

Text(2685, { -- Gallagio Loyalty Rewards Club
    "Befreiung von Unterstadt: Die Bosse zahlen in jedem Schwierigkeitsgrad.",
})

Text(2736, { -- Manaforge Vandals
    "Manaschmiede Omega: Die Bosse zahlen in jedem Schwierigkeitsgrad, und zwar für die ganze Kriegsschar.",
}, "Die Leiste hat eine Wochengrenze, die pro Woche um eine Stufe steigt; Rückstand lässt sich aufholen.")

Text(2658, { -- The K'aresh Trust
    "Die Kampagne auf K'aresh und jede Nebenquest der Zone.",
    "Weltquests auf K'aresh, dazu die Wochenquests wie Ökologische Sukzession.",
    "Die wöchentliche Instanzquest in Dornogal, genommen für das K'aresh-Konsortium.",
    "Die Raren auf K'aresh und die Lorebücher, die über die Zone verstreut liegen.",
})

Text(2688, { -- Flame's Radiance
    "Das Szenario Einbruch der Nacht in Heiligfall, zu jeder vollen Stunde.",
    "Die Tagesquests der Einfälle, solange ein Einfall läuft.",
    "Die Flamme brennt ewig, die Wochenquest zum Szenario.",
})

Text(2640, { -- Brann Bronzebeard
    "Lauf Tiefen mit Brann; er steigt mit jeder Tiefe, die ihr beide abschließt.",
}, "Gar kein Ruf: Seine Stufe ist seine Erfahrung, und höhere Stufen zahlen mehr davon.")

--------------------------------------------------------------------------------
-- Midnight
--------------------------------------------------------------------------------

Text(2710, { -- Silvermoon Court
    "Die Kampagne im Immersangwald und die Nebenquests der Zone.",
    "Weltquests und Sonderaufträge im Immersangwald.",
    "Saltherils Soiree, mit der Wochenquest des Hauses, das du unterstützt.",
    "Die wöchentliche Instanzquest von Halduron Hellschwinge, für eine Fraktion pro Woche.",
}, "Eine Ruhmstufe kostet 2500 Ruf und zählt für die ganze Kriegsschar.")

Text(2696, { -- Amani Tribe
    "Die Kampagne in Zul'Aman und die Nebenquests der Zone.",
    "Weltquests und Sonderaufträge in Zul'Aman.",
    "Der Überfluss und seine Wochenquest Reiche Opfergaben.",
    "Die wöchentliche Instanzquest von Halduron Hellschwinge, für eine Fraktion pro Woche.",
}, "Die Raren in Zul'Aman zahlen je einmal pro Woche, reiche Truhen in Tiefen geben eine Marke.")

Text(2704, { -- Hara'ti
    "Die Kampagne in Harandar und die Nebenquests der Zone.",
    "Weltquests und Sonderaufträge in Harandar.",
    "Legenden der Haranir und die dazugehörige Wochenquest um das Haranir-Relikt.",
    "Die wöchentliche Instanzquest von Halduron Hellschwinge, für eine Fraktion pro Woche.",
})

Text(2699, { -- The Singularity
    "Die Kampagne im Voidsturm und die Nebenquests der Zone.",
    "Weltquests und Sonderaufträge im Voidsturm.",
    "Der Sturmarionangriff und seine Wochenquest Haltet die Stellung.",
    "Die wöchentliche Instanzquest von Halduron Hellschwinge, für eine Fraktion pro Woche.",
})

Text(2712, { -- Blood Knights
    "Unterstütz die Blutritter auf Saltherils Soiree und mach ihre Wochenquest.",
}, "Die vier Häuser haben eigene Balken, und nur das unterstützte Haus bewegt sich in einer Woche.")

Text(2713, { -- Farstriders
    "Unterstütz die Waldläufer auf Saltherils Soiree und mach ihre Wochenquest.",
}, "Die vier Häuser haben eigene Balken, und nur das unterstützte Haus bewegt sich in einer Woche.")

Text(2711, { -- Magisters
    "Unterstütz die Magister auf Saltherils Soiree und mach ihre Wochenquest.",
}, "Die vier Häuser haben eigene Balken, und nur das unterstützte Haus bewegt sich in einer Woche.")

Text(2714, { -- Shades of the Row
    "Unterstütz die Schatten der Gasse auf Saltherils Soiree und mach ihre Wochenquest.",
}, "Die vier Häuser haben eigene Balken, und nur das unterstützte Haus bewegt sich in einer Woche.")

Text(2772, { -- Zul'jarra's Forces
    "Die Patchkampagne Rückkehr nach Amani'Zar bringt dich auf die Gewundene Insel.",
    "Die Kampagne der Insel, ihre Nebenquests und die Gewölbe von Atal'Utek.",
    "Weltquests, Sonderaufträge und Verfluchte Wogen auf der Insel.",
    "Die Raren der Gewundenen Insel, je einmal.",
})
