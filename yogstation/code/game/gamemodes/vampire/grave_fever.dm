/datum/disease/vampire
	name = "Grave Fever"
	max_stages = 3
	stage_prob = 5
	spread_text = "Non-Contagious"
	spread_flags = DISEASE_SPREAD_SPECIAL
	cure_text = "Spaceacillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "Grave Dust"
	cure_chance = 20
	viable_mobtypes = list(/mob/living/carbon/human)
	severity = DISEASE_SEVERITY_DANGEROUS
	disease_flags = CURABLE

/datum/disease/vampire/stage_act()
	..()
	var/toxdamage = stage * 2
	var/stuntime = (stage * 2) * 10

	if(prob(10))
		affected_mob.emote(pick("cough","groan", "gasp"))

	if(prob(15))
		if(prob(33))
			to_chat(affected_mob, span_danger("You feel sickly and weak."))
		affected_mob.adjustToxLoss(toxdamage)

	if(prob(5))
		to_chat(affected_mob, span_danger("Your joints ache horribly!"))
		affected_mob.Knockdown(stuntime)
		affected_mob.Stun(stuntime)
