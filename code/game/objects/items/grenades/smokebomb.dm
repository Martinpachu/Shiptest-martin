/obj/item/grenade/smokebomb
	name = "smoke grenade"
	desc = "Real bruh moment if you ever see this. Probably tell a c*der or something."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "smokewhite"
	item_state = "smoke"
	slot_flags = ITEM_SLOT_BELT
	///It's extremely important to keep this list up to date. It helps to generate the insightful description of the smokebomb. EDIT: honestly fuck you nemvar. go directly to jail and do not collect 200 dollars
	var/static/list/bruh_moment = list("Dank", "Hip", "Lit", "Based", "Robust", "Bruh")

///Here we generate the extremely insightful description.
/obj/item/grenade/smokebomb/Initialize()
	. = ..()
	desc = "The word '[pick(bruh_moment)]' is scribbled on it in crayon."

///Here we generate some smoke and also damage blobs??? for some reason. Honestly not sure why we do that.
/obj/item/grenade/smokebomb/prime()
	. = ..()
	update_mob()
	playsound(src, 'sound/effects/smoke.ogg', 50, TRUE, -3)
	var/datum/effect_system/smoke_spread/bad/smoke = new
	smoke.set_up(4, src)
	smoke.start()
	qdel(smoke) //And deleted again. Sad really.
	resolve()
