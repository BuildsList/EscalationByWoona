//coldwar languages

/proc/add_team_language(var/mob/living/carbon/human/target)
	if(!ishuman(target))
		return

	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.faction_tag)
		return

	H.remove_language(LANGUAGE_GALCOM)

	var/datum/language/L = null
	switch(H.chosenSlot.faction_tag)
		if("usmc")
			H.add_language(LANGUAGE_ENGLISH)
			L = all_languages[LANGUAGE_ENGLISH]

		if("cccp")
			H.add_language(LANGUAGE_RUSSIAN)
			L = all_languages[LANGUAGE_RUSSIAN]

		if("csla")
			H.add_language(LANGUAGE_CZECH)
			L = all_languages[LANGUAGE_CZECH]

		if("bund")
			H.add_language(LANGUAGE_GERMAN)
			L = all_languages[LANGUAGE_GERMAN]

	if(L)
		H.default_language = L

	return 1

/proc/add_other_languages(var/mob/living/carbon/human/target)

	if(!ishuman(target))
		return

	var/mob/living/carbon/human/H = target

	if(!H.chosenSlot || !H.chosenSlot.also_known_languages.len)
		return

	var/i

	for(i in H.chosenSlot.also_known_languages)
		if(prob(H.chosenSlot.also_known_languages[i]))
			H.add_language(i)

/datum/language/escalation
	name = "Escalation language"
	desc = "Nothing. Just code stuff"
	speech_verb = "says"
	whisper_verb = "whispers"
	flags = RESTRICTED

/datum/language/escalation/get_spoken_verb(var/msg_end)
	switch(msg_end)
		if("!")
			return pick("exclaims", "shouts", "yells") //TODO: make the basic proc handle lists of verbs.
		if("?")
			return ask_verb
	return speech_verb

/datum/language/escalation/russian
	name = "Russian"
	desc = "This is the languaged used by the Soviet Army."
	colour = "russian"
	key = "r"
	syllables = list("zhena", "reb", "kot", "tvoy", "vodka", "blyad", "lenin", "ponimat", "zhit", "kley", "sto", "yat", "si", "det", "re", "be", "nok", "chto", "tovarish", "kak", "govor", "navernoe", "da", "net", "horosho", "pochemu", "privet", "ebat", "krovat", "stol", "za", "ryad", "ka", "voyna", "dumat", "patroni", "fashisti", "zdorovie", "day", "dengi", "nemci", "chehi", "odin", "dva", "soyuz", "holod", "granata", "ne", "re", "ru", "rukzak")

/datum/language/escalation/czech
	name = "Czech"
	desc = "This is the languaged used by the CSLA."
	colour = "czech"
	key = "z"
	syllables = list("byt", "ten", "ze", "ktery", "pan", "hlava", "zem", "lide", "doba", "dobry", "cely", "tvrdy", "roz", "hodny", "nezlomny", "staly", "scvrnkly", "ener", "gicky", "nezmen", "iteln�", "�i", "ved", "dur", "pec", "d�t", "b�t", "ten", "on", "na", "�e", "kter�", "p�n", "�ivot", "clo", "vek", "pr�", "zeme", "lid�", "dob", "hlav", "m�t", "moci", "muse", "vedet", "cht�t", "j�t", "r�ci", "cel�", "�iv�", "trvanliv�", "hou", "�ev", "nat�", "dobr�")

/datum/language/escalation/english
	name = "English"
	desc = "This is the languaged used by the American Army."
	colour = "english"
	key = "e"
	syllables = list("al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it", "le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to", "ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin", "his", "ing", "ion", "ith", "not", "ome", "oul", "our", "sho", "ted", "ter", "tha", "the", "thi", "tio", "uld", "ver", "was", "wit", "you")

/datum/language/escalation/german
	name = "German"
	desc = "This is the languaged used by the Bundeswehr."
	colour = "german"
	key = "gr"
	syllables = list("das", "die", "k�n", "nen", "sein", "hab", "der", "�hn", "ehrl", "gro�", "erst", "jetzt", "auf", "sch�n", "sp�ter", "m�g", "lich", "wech", "fleis", "zwischen", "wechseln", "hei�en", "adolph", "hitler", "reich", "langsam", "sp�len", "messer", "entschuldigen", "dann", "dort", "fuhrer", "mein", "shickse", "scheisse", "drauf", "fick", "biberpelz", "oktoberfest", "bier", "frankfurters")