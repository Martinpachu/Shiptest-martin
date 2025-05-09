
/////////////////////////////////////////
/////////////////Tools///////////////////
/////////////////////////////////////////

/datum/design/large_welding_tool
	name = "Industrial Welding Tool"
	id = "large_welding_tool"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 70, /datum/material/glass = 60, /datum/material/sulfur = 10)
	build_path = /obj/item/weldingtool/largetank/empty
	category = list("initial", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/handdrill
	name = "Hand Drill"
	desc = "A small electric hand drill with an interchangeable screwdriver and bolt bit"
	id = "handdrill"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3500, /datum/material/silver = 1500, /datum/material/titanium = 2500)
	build_path = /obj/item/screwdriver/power
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/jawsoflife
	name = "Jaws of Life"
	desc = "A small, compact Jaws of Life with an interchangeable pry jaws and cutting jaws"
	id = "jawsoflife" // added one more requirment since the Jaws of Life are a bit OP
	build_path = /obj/item/crowbar/power
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4500, /datum/material/silver = 2500, /datum/material/titanium = 3500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rpd
	name = "Rapid Pipe Dispenser (RPD)"
	id = "rpd_loaded"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 75000, /datum/material/glass = 37500)
	build_path = /obj/item/pipe_dispenser
	category = list("Tool Designs")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/rcd_loaded
	name = "Rapid Construction Device"
	desc = "A tool that can construct and deconstruct walls, airlocks and floors on the fly."
	id = "rcd_loaded"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 60000, /datum/material/glass = 5000)  // costs more than what it did in the autolathe, this one comes loaded.
	build_path = /obj/item/construction/rcd/loaded
	category = list("Tool Designs")
	departmental_flags =  DEPARTMENTAL_FLAG_ENGINEERING


/datum/design/rcd_upgrade/frames
	name = "RCD frames designs upgrade"
	desc = "Adds computer and machine frame designs to the RCD."
	id = "rcd_upgrade_frames"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/rcd_upgrade/frames
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rcd_upgrade/simple_circuits
	name = "RCD simple circuits designs upgrade"
	desc = "Adds the ability to produce simple circuits using the RCD."
	id = "rcd_upgrade_simple_circuits"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/rcd_upgrade/simple_circuits
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rcd_upgrade/silo_link
	name = "Advanced RCD silo link upgrade"
	desc = "Upgrades the RCD to be able to pull materials from the ore silo. The RCD must be linked to the silo using a multitool before it will function."
	id = "rcd_upgrade_silo_link"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 2500, /datum/material/silver = 2500, /datum/material/titanium = 2500, /datum/material/bluespace = 2500)
	build_path = /obj/item/rcd_upgrade/silo_link
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/rld_mini
	name = "Mini Rapid Light Device (MRLD)"
	desc = "A tool that can portable and standing lighting orbs and glowsticks."
	id = "rld_mini"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/glass = 10000, /datum/material/plastic = 8000, /datum/material/gold = 2000)
	build_path = /obj/item/construction/rld/mini
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/rapid_shuttle_designator
	name = "Rapid Shuttle Designator"
	desc = "A tool that can be used to designate a shuttle for a shuttle launch."
	id = "rapid_shuttle_designator"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 1500, /datum/material/titanium = 2000)
	build_path = /obj/item/shuttle_creator
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE

/////////////////////////////////////////
//////////////Alien Tools////////////////
/////////////////////////////////////////

/datum/design/alienwrench
	name = "Alien Wrench"
	desc = "An advanced wrench obtained through Abductor technology."
	id = "alien_wrench"
	build_path = /obj/item/wrench/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienwirecutters
	name = "Alien Wirecutters"
	desc = "Advanced wirecutters obtained through Abductor technology."
	id = "alien_wirecutters"
	build_path = /obj/item/wirecutters/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienscrewdriver
	name = "Alien Screwdriver"
	desc = "An advanced screwdriver obtained through Abductor technology."
	id = "alien_screwdriver"
	build_path = /obj/item/screwdriver/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/aliencrowbar
	name = "Alien Crowbar"
	desc = "An advanced crowbar obtained through Abductor technology."
	id = "alien_crowbar"
	build_path = /obj/item/crowbar/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienwelder
	name = "Alien Welding Tool"
	desc = "An advanced welding tool obtained through Abductor technology."
	id = "alien_welder"
	build_path = /obj/item/weldingtool/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 5000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alienmultitool
	name = "Alien Multitool"
	desc = "An advanced multitool obtained through Abductor technology."
	id = "alien_multitool"
	build_path = /obj/item/multitool/abductor
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/silver = 2500, /datum/material/plasma = 5000, /datum/material/titanium = 2000, /datum/material/diamond = 2000)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/////////////////////////////////////////
/////////Alien Surgical Tools////////////
/////////////////////////////////////////

/datum/design/alienscalpel
	name = "Alien Scalpel"
	desc = "An advanced scalpel obtained through Abductor technology."
	id = "alien_scalpel"
	build_path = /obj/item/scalpel/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/alienhemostat
	name = "Alien Hemostat"
	desc = "An advanced hemostat obtained through Abductor technology."
	id = "alien_hemostat"
	build_path = /obj/item/hemostat/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/alienretractor
	name = "Alien Retractor"
	desc = "An advanced retractor obtained through Abductor technology."
	id = "alien_retractor"
	build_path = /obj/item/retractor/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliensaw
	name = "Alien Circular Saw"
	desc = "An advanced surgical saw obtained through Abductor technology."
	id = "alien_saw"
	build_path = /obj/item/circular_saw/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliendrill
	name = "Alien Drill"
	desc = "An advanced drill obtained through Abductor technology."
	id = "alien_drill"
	build_path = /obj/item/surgicaldrill/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/silver = 2500, /datum/material/plasma = 1000, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/aliencautery
	name = "Alien Cautery"
	desc = "An advanced cautery obtained through Abductor technology."
	id = "alien_cautery"
	build_path = /obj/item/cautery/alien
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 1500, /datum/material/plasma = 500, /datum/material/titanium = 1500)
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
