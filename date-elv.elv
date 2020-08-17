use str
#Sindarin or Quenya Dates
fn date-elv [ option format ]{
	#date-elv "option format"
	#A function to print the date with elvish (Sindarin or Quenya) weekday and month names
	#works pretty much like date +"format" except:
	# %A is the full Elvish weekday
	# %B is the full Elvish month name
	# see man date FORMAT for all available options
	#Options:
	#	-Q selects language as Quenya
	#	-S selects language as Sindarin

	day-dict = []
	mon-dict = []

	if (==s "-S" $option) {
		day-dict = [ 
		  &Saturday="Orgillion" 
		  &Sunday="Oranor" 
		  &Monday="Orithil" 
		  &Tuesday="Orgaladh" 
		  &Wednesday="Ormenel" 
		  &Thursday="Orbelain" 
		  &Friday="Oraeron" 
		]

		mon-dict = [ 
		  &January="Narwain" 
		  &February="Nínui" 
		  &March="Gwaeron" 
		  &April="Gwirith" 
		  &May="Lothron" 
		  &June="Nórui" 
		  &July="Cerweth" 
		  &August="Urui" 
		  &September="Ivanneth" 
		  &October="Narbeleth" 
		  &November="Hithui" 
		  &December="Girithron" 
		]
	}  elif (==s "-Q" $option) {
		day-dict = [ 
		  &Saturday="Elenya" 
		  &Sunday="Anarya" 
		  &Monday="Isilya" 
		  &Tuesday="Aldúya" 
		  &Wednesday="Menelya" 
		  &Thursday="Valanya" 
		  &Friday="Earenya" 
		]

		mon-dict = [ 
		  &January="Narvinye" 
		  &February="Nénime" 
		  &March="Súlime" 
		  &April="Víresse" 
		  &May="Lótesse" 
		  &June="Nárië" 
		  &July="Cermië" 
		  &August="Úrime" 
		  &September="Yavannië" 
		  &October="Narqelië" 
		  &November="Hísime"
		  &December="Ringare" 
		]
	} else {
		echo "unknown option: $option"
		return
	}
	
	#seconds since '70
	sec = (echo '@'(date +'%s'))
	#fetches the current abbreviated day names, and number of month
	per-A = (date --date=$sec +"%A")
	per-B = (date --date=$sec +"%B")
	day-sin = $day-dict[$per-A]
	mon-sin = $mon-dict[$per-B]
	format = (str:replace "%A" $day-sin $format)
	format = (str:replace "%B" $mon-sin $format)

	date --date=$sec +$format
}
