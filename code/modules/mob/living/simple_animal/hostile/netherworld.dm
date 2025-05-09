/mob/living/simple_animal/hostile/netherworld
	name = "creature"
	desc = "A sanity-destroying otherthing from the netherworld."
	icon_state = "otherthing"
	icon_living = "otherthing"
	icon_dead = "otherthing-dead"
	health = 50
	maxHealth = 50
	obj_damage = 5
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list("nether")
	speak_emote = list("screams")
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	var/phaser = TRUE
	var/datum/action/innate/creature/teleport/teleport
	var/is_phased = FALSE

/mob/living/simple_animal/hostile/netherworld/asteroid
	health = 40
	maxHealth = 40
	faction = list("mining")
	melee_damage_lower = 10
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/netherworld/Initialize()
	. = ..()
	if(phaser)
		teleport = new
		teleport.Grant(src)

/datum/action/innate/creature
	background_icon_state = "bg_default"

/datum/action/innate/creature/teleport
	name = "Teleport"
	desc = "Teleport to wherever you want, as long as you aren't seen."

/obj/effect/dummy/phased_mob/creature
	name = "water"
	icon = 'icons/effects/effects.dmi'
	icon_state = "nothing"
	density = FALSE
	anchored = TRUE
	invisibility = 60
	resistance_flags = LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/canmove = TRUE

/obj/effect/dummy/phased_mob/creature/relaymove(mob/living/user, direction)
	forceMove(get_step(src,direction))

/obj/effect/dummy/phased_mob/creature/ex_act()
	return

/obj/effect/dummy/phased_mob/creature/bullet_act()
	return BULLET_ACT_FORCE_PIERCE

/obj/effect/dummy/phased_mob/creature/singularity_act()
	return

/datum/action/innate/creature/teleport/Activate()
	var/mob/living/simple_animal/hostile/netherworld/N = owner
	var/obj/effect/dummy/phased_mob/creature/holder = null
	if(N.stat == DEAD)
		return
	var/turf/T = get_turf(N)
	if (N.can_be_seen(T) || !do_after(N, 60, target = T))
		to_chat(N, span_warning("You can't phase in or out while being observed and you must stay still!"))
		return
	if (get_dist(N, T) != 0 || N.can_be_seen(T))
		to_chat(N, span_warning("Action cancelled, as you moved while reappearing or someone is now viewing your location."))
		return
	if(N.is_phased)
		holder = N.loc
		N.forceMove(T)
		QDEL_NULL(holder)
		N.is_phased = FALSE
		playsound(get_turf(N), 'sound/effects/podwoosh.ogg', 50, TRUE, -1)
	else
		playsound(get_turf(N), 'sound/effects/podwoosh.ogg', 50, TRUE, -1)
		holder = new /obj/effect/dummy/phased_mob/creature(T)
		N.forceMove(holder)
		N.is_phased = TRUE

/mob/living/simple_animal/hostile/netherworld/proc/can_be_seen(turf/location)
	// Check for darkness
	if(location && location.lighting_object)
		if(location.get_lumcount()<0.1) // No one can see us in the darkness, right?
			return null

	// We aren't in darkness, loop for viewers.
	var/list/check_list = list(src)
	if(location)
		check_list += location

	// This loop will, at most, loop twice.
	for(var/atom/check in check_list)
		for(var/mob/living/M in viewers(world.view + 1, check) - src)
			if(M.client && CanAttack(M) && !M.has_unlimited_silicon_privilege)
				if(!M.is_blind())
					return M
		for(var/obj/mecha/M in view(world.view + 1, check)) //assuming if you can see them they can see you
			if(M.occupant && M.occupant.client)
				if(!M.occupant.is_blind())
					return M.occupant
	return null

/mob/living/simple_animal/hostile/netherworld/migo
	name = "mi-go"
	desc = "A pinkish, fungoid crustacean-like creature with numerous pairs of clawed appendages and a head covered with waving antennae."
	speak_emote = list("screams", "clicks", "chitters", "barks", "moans", "growls", "meows", "reverberates", "roars", "squeaks", "rattles", "exclaims", "yells", "remarks", "mumbles", "jabbers", "stutters", "seethes")
	health = 80
	maxHealth = 80
	icon_state = "mi-go"
	icon_living = "mi-go"
	icon_dead = "mi-go-dead"
	attack_verb_continuous = "lacerates"
	attack_verb_simple = "lacerate"
	speed = -0.5
	var/static/list/migo_sounds
	deathmessage = "wails as its form turns into a pulpy mush."
	deathsound = 'sound/voice/hiss6.ogg'
	phaser = FALSE
	var/sound_prob = 1

/mob/living/simple_animal/hostile/netherworld/migo/asteroid
	faction = list("mining")
	melee_damage_lower = 10
	melee_damage_upper = 10

/mob/living/simple_animal/hostile/netherworld/migo/Initialize()
	. = ..()
	migo_sounds = list('sound/items/bubblewrap.ogg', 'sound/items/change_jaws.ogg', 'sound/items/crowbar.ogg', 'sound/items/drink.ogg', 'sound/items/deconstruct.ogg', 'sound/items/carhorn.ogg', 'sound/items/change_drill.ogg', 'sound/items/dodgeball.ogg', 'sound/items/eatfood.ogg', 'sound/items/megaphone.ogg', 'sound/items/screwdriver.ogg', 'sound/items/weeoo1.ogg', 'sound/items/wirecutter.ogg', 'sound/items/welder.ogg', 'sound/items/zip.ogg', 'sound/items/rped.ogg', 'sound/items/ratchet.ogg', 'sound/items/polaroid1.ogg', 'sound/items/pshoom.ogg', 'sound/items/airhorn.ogg', 'sound/items/geiger/high1.ogg', 'sound/items/geiger/high2.ogg', 'sound/voice/beepsky/creep.ogg', 'sound/voice/beepsky/iamthelaw.ogg', 'sound/voice/ed209_20sec.ogg', 'sound/voice/hiss3.ogg', 'sound/voice/hiss6.ogg', 'sound/voice/medbot/patchedup.ogg', 'sound/voice/medbot/feelbetter.ogg', 'sound/voice/human/manlaugh1.ogg', 'sound/voice/human/womanlaugh.ogg', 'sound/weapons/sear.ogg', 'sound/ambience/antag/clockcultalr.ogg', 'sound/ambience/antag/ling_aler.ogg', 'sound/ambience/antag/tatoralert.ogg', 'sound/ambience/antag/monkey.ogg', 'sound/mecha/nominal.ogg', 'sound/mecha/weapdestr.ogg', 'sound/mecha/critdestr.ogg', 'sound/mecha/imag_enh.ogg', 'sound/effects/adminhelp.ogg', 'sound/effects/alert.ogg', 'sound/effects/attackblob.ogg', 'sound/effects/bamf.ogg', 'sound/effects/blobattack.ogg', 'sound/effects/break_stone.ogg', 'sound/effects/bubbles.ogg', 'sound/effects/bubbles2.ogg', 'sound/effects/clang.ogg', 'sound/effects/clockcult_gateway_disrupted.ogg', 'sound/effects/clownstep2.ogg', 'sound/effects/curse1.ogg', 'sound/effects/dimensional_rend.ogg', 'sound/effects/doorcreaky.ogg', 'sound/effects/empulse.ogg', 'sound/effects/explosion_distant.ogg', 'sound/effects/explosionfar.ogg', 'sound/effects/explosion1.ogg', 'sound/effects/grillehit.ogg', 'sound/effects/genetics.ogg', 'sound/effects/heart_beat.ogg', 'sound/runtime/hyperspace/hyperspace_begin.ogg', 'sound/runtime/hyperspace/hyperspace_end.ogg', 'sound/effects/his_grace_awaken.ogg', 'sound/effects/pai_boot.ogg', 'sound/effects/phasein.ogg', 'sound/effects/picaxe1.ogg', 'sound/effects/ratvar_reveal.ogg', 'sound/effects/sparks1.ogg', 'sound/effects/smoke.ogg', 'sound/effects/splat.ogg', 'sound/effects/snap.ogg', 'sound/effects/tendril_destroyed.ogg', 'sound/effects/supermatter.ogg', 'sound/misc/bloblarm.ogg', 'sound/misc/airraid.ogg', 'sound/misc/bang.ogg','sound/misc/highlander.ogg', 'sound/misc/interference.ogg', 'sound/misc/notice1.ogg', 'sound/misc/notice2.ogg', 'sound/misc/sadtrombone.ogg', 'sound/misc/slip.ogg', 'sound/misc/splort.ogg', 'sound/weapons/armbomb.ogg', 'sound/weapons/beam_sniper.ogg', 'sound/weapons/chainsawhit.ogg', 'sound/weapons/emitter.ogg', 'sound/weapons/emitter2.ogg', 'sound/weapons/blade1.ogg', 'sound/weapons/bladeslice.ogg', 'sound/weapons/blastcannon.ogg', 'sound/weapons/blaster.ogg', 'sound/weapons/bulletflyby3.ogg', 'sound/weapons/circsawhit.ogg', 'sound/weapons/cqchit2.ogg', 'sound/weapons/drill.ogg', 'sound/weapons/genhit1.ogg', 'sound/weapons/gun/pistol/shot_suppressed.ogg', 'sound/weapons/gun/pistol/shot.ogg', 'sound/weapons/handcuffs.ogg', 'sound/weapons/homerun.ogg', 'sound/weapons/kenetic_accel.ogg', 'sound/machines/clockcult/steam_whoosh.ogg', 'sound/machines/fryer/deep_fryer_emerge.ogg', 'sound/machines/airlocks/standard/open.ogg', 'sound/machines/creaking.ogg', 'sound/machines/airlocks/standard/close.ogg', 'sound/machines/airlockforced.ogg', 'sound/machines/airlockopen.ogg', 'sound/machines/alarm.ogg', 'sound/machines/blender.ogg', 'sound/machines/boltsdown.ogg', 'sound/machines/boltsup.ogg', 'sound/machines/buzz-sigh.ogg', 'sound/machines/buzz-two.ogg', 'sound/machines/chime.ogg', 'sound/machines/cryo_warning.ogg', 'sound/machines/defib_charge.ogg', 'sound/machines/defib_failed.ogg', 'sound/machines/defib_ready.ogg', 'sound/machines/defib_zap.ogg', 'sound/machines/deniedbeep.ogg', 'sound/machines/ding.ogg', 'sound/machines/disposalflush.ogg', 'sound/machines/door_close.ogg', 'sound/machines/door_open.ogg', 'sound/machines/engine_alert1.ogg', 'sound/machines/engine_alert2.ogg', 'sound/machines/hiss.ogg', 'sound/machines/honkbot_evil_laugh.ogg', 'sound/machines/juicer.ogg', 'sound/machines/ping.ogg', 'sound/ambience/signal.ogg', 'sound/machines/synth_no.ogg', 'sound/machines/synth_yes.ogg', 'sound/machines/terminal_alert.ogg', 'sound/machines/triple_beep.ogg', 'sound/machines/twobeep.ogg', 'sound/machines/ventcrawl.ogg', 'sound/machines/warning-buzzer.ogg', 'sound/ai/outbreak5.ogg', 'sound/ai/outbreak7.ogg', 'sound/ai/poweroff.ogg', 'sound/ai/radiation.ogg', 'sound/ai/shuttlecalled.ogg', 'sound/ai/shuttledock.ogg', 'sound/ai/shuttlerecalled.ogg', 'sound/ai/aimalf.ogg') //hahahaha fuck you code divers

/mob/living/simple_animal/hostile/netherworld/migo/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	..()
	if(stat)
		return
	var/chosen_sound = pick(migo_sounds)
	playsound(src, chosen_sound, 50, TRUE)

/mob/living/simple_animal/hostile/netherworld/migo/Life()
	..()
	if(stat)
		return
	if(prob(sound_prob))
		var/chosen_sound = pick(migo_sounds)
		playsound(src, chosen_sound, 50, TRUE)

/mob/living/simple_animal/hostile/netherworld/blankbody
	name = "blank body"
	desc = "This looks human enough, but its flesh has an ashy texture, and its face is featureless save an eerie smile."
	icon_state = "blank-body"
	icon_living = "blank-body"
	icon_dead = "blank-dead"
	health = 100
	maxHealth = 100
	melee_damage_lower = 5
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	deathmessage = "falls apart into a fine dust."
	phaser = FALSE
