/obj/item/assembly/igniter
	name = "igniter"
	desc = "A small electronic device able to ignite combustible substances."
	icon_state = "igniter"
	custom_materials = list(/datum/material/iron=500, /datum/material/glass=50)
	var/datum/effect_system/spark_spread/sparks
	heat = 1000
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound =  'sound/items/handling/component_pickup.ogg'

/obj/item/assembly/igniter/Initialize()
	. = ..()
	sparks = new
	sparks.set_up(2, 0, src)
	sparks.attach(src)

/obj/item/assembly/igniter/Destroy()
	if(sparks)
		qdel(sparks)
	sparks = null
	. = ..()

/obj/item/assembly/igniter/activate()
	if(!..())
		return FALSE//Cooldown check
	var/turf/location = get_turf(loc)
	if(location)
		location.hotspot_expose(1000,1000)
	sparks.start()
	return TRUE

/obj/item/assembly/igniter/attack_self(mob/user)
	activate()
	add_fingerprint(user)

/obj/item/assembly/igniter/ignition_effect(atom/A, mob/user)
	. = span_notice("[user] fiddles with [src], and manages to light [A].")
	activate()
	add_fingerprint(user)
