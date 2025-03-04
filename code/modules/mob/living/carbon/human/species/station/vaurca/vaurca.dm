/datum/species/bug
	name = "Vaurca Worker"
	short_name = "vau"
	name_plural = "Type A"
	bodytype = "Vaurca"
	age_min = 1
	age_max = 20
	economic_modifier = 2
	language = LANGUAGE_VAURCA
	primitive_form = "V'krexi"
	greater_form = "Vaurca Warrior"
	icobase = 'icons/mob/human_races/vaurca/r_vaurca.dmi'
	deform = 'icons/mob/human_races/vaurca/r_vaurca.dmi'
	preview_icon = 'icons/mob/human_races/vaurca/vaurca_preview.dmi'
	name_language = LANGUAGE_VAURCA
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/claws,
		/datum/unarmed_attack/bite/sharp
	)
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/bug
	rarity_value = 4
	slowdown = 1
	darksight = 8 //USELESS
	eyes = "vaurca_eyes" //makes it so that eye colour is not changed when skin colour is.
	eyes_are_impermeable = TRUE
	brute_mod = 0.5
	burn_mod = 1.5 //2x was a bit too much. we'll see how this goes.
	toxins_mod = 2 //they're not used to all our weird human bacteria.
	oxy_mod = 0.6
	radiation_mod = 0.2 //almost total radiation protection
	bleed_mod = 2.2
	warning_low_pressure = 50
	hazard_low_pressure = 0
	ethanol_resistance = 2
	taste_sensitivity = TASTE_SENSITIVE
	reagent_tag = IS_VAURCA
	siemens_coefficient = 1 //setting it to 0 would be redundant due to LordLag's snowflake checks, plus batons/tasers use siemens now too.
	breath_type = "phoron"
	poison_type = "nitrogen" //a species that breathes plasma shouldn't be poisoned by it.
	mob_size = 13 //their half an inch thick exoskeleton and impressive height, plus all of their mechanical organs.
	natural_climbing = TRUE
	climb_coeff = 0.75

	blurb = "Type A are the most common type of Vaurca and can be seen as the 'backbone' of Vaurcae societies. Their most prevalent feature is their hardened exoskeleton, varying in colors \
	in accordance to their hive. It is approximately half an inch thick among all Type A Vaurca. The carapace provides protection against harsh radiation, solar \
	and otherwise, and acts as a pressure-suit to seal their soft inner core from the outside world. This allows most Type A Vaurca to have extended EVA \
	expeditions, assuming they have internals. They are bipedal, and compared to warriors they are better suited for EVA and environments, and more resistant to brute force thanks to their \
	thicker carapace, but also a fair bit slower and less agile. \
	<b>Type A are comfortable in any department except security. There will almost never be a Worker in a security position, as they are as a type disposed against combat.</b>"

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 600 //Default 1000
	flags = NO_SLIP | NO_CHUBBY
	spawn_flags = CAN_JOIN | IS_WHITELISTED
	appearance_flags = HAS_SKIN_COLOR | HAS_HAIR_COLOR
	blood_color = "#E6E600" // dark yellow
	flesh_color = "#E6E600"
	base_color = "#575757"

	halloss_message = "crumbles to the ground, too weak to continue fighting."

	heat_discomfort_strings = list(
		"Your blood feels like its boiling in the heat.",
		"You feel uncomfortably warm.",
		"Your carapace feels hot as the sun."
	)

	cold_discomfort_strings = list(
		"You chitter in the cold.",
		"You shiver suddenly.",
		"Your carapace is ice to the touch."
	)

	stamina = 100			  // Long period of sprinting, but relatively low speed gain
	sprint_speed_factor = 0.7
	sprint_cost_factor = 0.30
	stamina_recovery = 2	//slow recovery

	has_organ = list(
		"neural socket"       = /obj/item/organ/vaurca/neuralsocket,
		"lungs"               = /obj/item/organ/lungs/vaurca,
		"filtration bit"      = /obj/item/organ/vaurca/filtrationbit,
		"right heart"         = /obj/item/organ/heart/right,
		"left heart"          = /obj/item/organ/heart/left,
		"phoron reserve tank" = /obj/item/organ/vaurca/preserve,
		"liver"               = /obj/item/organ/liver/vaurca,
		"kidneys"             = /obj/item/organ/kidneys/vaurca,
		"brain"               = /obj/item/organ/brain/vaurca,
		"eyes"                = /obj/item/organ/eyes/vaurca
	)

	has_limbs = list(
		"chest" =  list("path" = /obj/item/organ/external/chest/vaurca),
		"groin" =  list("path" = /obj/item/organ/external/groin/vaurca),
		"head" =   list("path" = /obj/item/organ/external/head/vaurca),
		"l_arm" =  list("path" = /obj/item/organ/external/arm/vaurca),
		"r_arm" =  list("path" = /obj/item/organ/external/arm/right/vaurca),
		"l_leg" =  list("path" = /obj/item/organ/external/leg/vaurca),
		"r_leg" =  list("path" = /obj/item/organ/external/leg/right/vaurca),
		"l_hand" = list("path" = /obj/item/organ/external/hand/vaurca),
		"r_hand" = list("path" = /obj/item/organ/external/hand/right/vaurca),
		"l_foot" = list("path" = /obj/item/organ/external/foot/vaurca),
		"r_foot" = list("path" = /obj/item/organ/external/foot/right/vaurca)
		)

	default_h_style = "Classic Antennae"

	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw

	allowed_citizenships = list(CITIZENSHIP_ZORA, CITIZENSHIP_IZWESKI, CITIZENSHIP_BIESEL, CITIZENSHIP_ERIDANI, CITIZENSHIP_JARGON)
	allowed_religions = list(RELIGION_HIVEPANTHEON, RELIGION_PREIMMINENNCE, RELIGION_PILOTDREAM, RELIGION_NONE, RELIGION_OTHER)

/datum/species/bug/before_equip(var/mob/living/carbon/human/H)
	. = ..()
	H.gender = NEUTER
	var/obj/item/clothing/shoes/sandal/S = new /obj/item/clothing/shoes/sandal(H)
	if(H.equip_to_slot_or_del(S,slot_shoes))
		S.autodrobe_no_remove = 1
	var/obj/item/clothing/mask/breath/M = new /obj/item/clothing/mask/breath(H)
	if(H.equip_to_slot_or_del(M, slot_wear_mask))
		M.autodrobe_no_remove = 1

/datum/species/bug/equip_later_gear(var/mob/living/carbon/human/H)
	if(istype(H.get_equipped_item(slot_back), /obj/item/weapon/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/inhaler/phoron_special(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/reagent_containers/inhaler/phoron_special(H), slot_r_hand)

/datum/species/bug/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	return ..()
