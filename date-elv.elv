use str
#Sindarin or Quenya Dates
fn date-elv {| option format |
	#date-elv "option format"
	#A function to print the date with elvish (Sindarin or Quenya) weekday and month names
	#works pretty much like date +"format" except:
	# %A is the full Elvish weekday
	# %B is the full Elvish month name
	# see man date FORMAT for all available options
	#Options:
	#	-Q selects language as Quenya
	#	-S selects language as Sindarin

	var day-dict = []
	var mon-dict = []

	if (==s "-S" $option) {
		set day-dict = [ 
		  &Saturday="Orgillion" 
		  &Sunday="Oranor" 
		  &Monday="Orithil" 
		  &Tuesday="Orgaladh" 
		  &Wednesday="Ormenel" 
		  &Thursday="Orbelain" 
		  &Friday="Oraeron" 
		]

		set mon-dict = [ 
		  &January="Narwain" 
		  &February="Nínui" 
		  &March="Gwaeron" 
		  &April="Gwirith" 
		  &May="Lothron" 
		  &June="Nórui" 
		  &July="Cerveth" 
		  &August="Urui" 
		  &September="Ivanneth" 
		  &October="Narbeleth" 
		  &November="Hithui" 
		  &December="Girithron" 
		]
	}  elif (==s "-Q" $option) {
		set day-dict = [ 
		  &Saturday="Elenya" 
		  &Sunday="Anarya" 
		  &Monday="Isilya" 
		  &Tuesday="Aldúya" 
		  &Wednesday="Menelya" 
		  &Thursday="Valanya" 
		  &Friday="Earenya" 
		]

		set mon-dict = [ 
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
	var sec = (echo '@'(date +'%s'))
	#fetches the current abbreviated day names, and number of month
	var per-A = (date --date=$sec +"%A")
	var per-B = (date --date=$sec +"%B")
	var day-sin = $day-dict[$per-A]
	var mon-sin = $mon-dict[$per-B]
	set format = (str:replace "%A" $day-sin $format)
	set format = (str:replace "%B" $mon-sin $format)

	date --date=$sec +$format
}
