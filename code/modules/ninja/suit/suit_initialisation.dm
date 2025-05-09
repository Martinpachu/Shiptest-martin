#define NINJA_LOCK_PHASE 1
#define NINJA_ICON_GENERATE_PHASE 3
#define NINJA_COMPLETE_PHASE 6
#define NINJA_DEINIT_LOGOFF_PHASE 1
#define NINJA_DEINIT_STEALTH_PHASE 5

GLOBAL_LIST_INIT(ninja_initialize_messages, list(
	"Now initializing...",
	"Securing external locking mechanism...\nNeural-net established.",
	"Extending neural-net interface...\nNow monitoring brain wave pattern...",
	"Linking neural-net interface...\nPattern <b class='nicegreen'>GREEN</b>, continuing operation.",
	"VOID-shift device status: <B>ONLINE</B>.\nCLOAK-tech device status: <B>ONLINE</B>.",
	"Primary system status: <B>ONLINE</B>.\nBackup system status: <B>ONLINE</B>.\nCurrent energy capacity: ",
	"All systems operational. Welcome to <B>SpiderOS</B>, "
))

GLOBAL_LIST_INIT(ninja_deinitialize_messages, list(
	"Now de-initializing...",
	"Shutting down <B>SpiderOS</B>.",
	"Primary system status: <B>OFFLINE</B>.\nBackup system status: <B>OFFLINE</B>.",
	"VOID-shift device status: <B>OFFLINE</B>.\nCLOAK-tech device status: <B>OFFLINE</B>.",
	"Disconnecting neural-net interface...<b class='nicegreen'>Success</b>.",
	"Disengaging neural-net interface... <b class='nicegreen'>Success</b>.",
	"Unsecuring external locking mechanism...\nNeural-net abolished.\nOperation status: <B>FINISHED</B>."
))

/**
 * Toggles the ninja suit on/off
 *
 * Attempts to initialize or deinitialize the ninja suit
 */
/obj/item/clothing/suit/space/space_ninja/proc/toggle_on_off()
	. = TRUE
	if(s_busy)
		to_chat(loc, "[span_warning("ERROR")]: You cannot use this function at this time.")
		return FALSE
	s_busy = TRUE
	if(s_initialized)
		deinitialize()
		STOP_PROCESSING(SSobj, src)                   //WS Edit - Ninja Buttons Fix (Issue #339)
	else
		ninitialize()
		START_PROCESSING(SSobj, src)                  //WS Edit - Ninja Buttons Fix (Issue #339)

/**
 * Initializes the ninja suit
 *
 * Initializes the ninja suit through seven phases, each of which calls this proc with an incremented phase
 * Arguments:
 * * delay - The delay between each phase of initialization
 * * U - The human who is being affected by the suit
 * * phase - The phase of initialization
 */
/obj/item/clothing/suit/space/space_ninja/proc/ninitialize(delay = s_delay, mob/living/carbon/human/U = loc, phase = 0)
	if(!U || !U.mind)
		s_busy = FALSE
		return
	if (phase > NINJA_LOCK_PHASE && (U.stat == DEAD || U.health <= 0))
		to_chat(U, span_danger("<B>FÄAL ï¿½Rrï¿½R</B>: 344--93#ï¿½&&21 BRï¿½ï¿½N |/|/aVï¿½ PATT$RN <B>RED</B>\nA-A-aBï¿½rTï¿½NG..."))
		unlock_suit()
		s_busy = FALSE
		return

	var/message = GLOB.ninja_initialize_messages[phase + 1]
	switch(phase)
		if (NINJA_LOCK_PHASE)
			if(!lock_suit(U))//To lock the suit onto wearer.
				s_busy = FALSE
				return
		if (NINJA_ICON_GENERATE_PHASE)
			lockIcons(U)//Check for icons.
			U.regenerate_icons()
		if (NINJA_COMPLETE_PHASE - 1)
			message += "<B>[DisplayEnergy(cell.charge)]</B>."
		if (NINJA_COMPLETE_PHASE)
			message += "[U.real_name]."
			s_initialized = TRUE
			s_busy = FALSE

	to_chat(U, span_notice("[message]"))
	playsound(U, 'sound/effects/sparks1.ogg', 10, TRUE)

	if (phase < NINJA_COMPLETE_PHASE)
		addtimer(CALLBACK(src, PROC_REF(ninitialize), delay, U, phase + 1), delay)

/**
 * Deinitializes the ninja suit
 *
 * Deinitializes the ninja suit through eight phases, each of which calls this proc with an incremented phase
 * Arguments:
 * * delay - The delay between each phase of deinitialization
 * * U - The human who is being affected by the suit
 * * phase - The phase of deinitialization
 */
/obj/item/clothing/suit/space/space_ninja/proc/deinitialize(delay = s_delay, mob/living/carbon/human/U = affecting == loc ? affecting : null, phase = 0)
	if (!U || !U.mind)
		s_busy = FALSE
		return
	if (phase == 0 && alert("Are you certain you wish to remove the suit? This will take time and remove all abilities.",,"Yes","No") == "No")
		s_busy = FALSE
		return

	var/message = GLOB.ninja_deinitialize_messages[phase + 1]
	switch(phase)
		if(NINJA_DEINIT_LOGOFF_PHASE)
			message = "Logging off, [U.real_name]. " + message
		if(NINJA_DEINIT_STEALTH_PHASE)
			cancel_stealth()
	to_chat(U, span_notice("[message]"))
	playsound(U, 'sound/items/deconstruct.ogg', 10, TRUE)

	if (phase < NINJA_COMPLETE_PHASE)
		addtimer(CALLBACK(src, PROC_REF(deinitialize), delay, U, phase + 1), delay)
	else
		unlock_suit()
		U.regenerate_icons()
		s_initialized = FALSE
		s_busy = FALSE

#undef NINJA_LOCK_PHASE
#undef NINJA_ICON_GENERATE_PHASE
#undef NINJA_COMPLETE_PHASE
#undef NINJA_DEINIT_LOGOFF_PHASE
#undef NINJA_DEINIT_STEALTH_PHASE
