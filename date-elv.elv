#Sindarin Dates
fn date-elv [format]{
	#date-elv "format"
	#A function to print the date with elvish (Sindarin) weekday and month names
	#works pretty much like date +"format" except:
	# %A is the full Sindarin weekday
	# %B is the full Sindarin month name
	# see man date FORMAT for all available options

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
	
	#seconds since '70
	sec = (echo '@'(date +'%s'))
	#fetches the current abbreviated day names, and number of month
	per-A = (date --date=$sec +"%A")
	per-B = (date --date=$sec +"%B")
	day-sin = $day-dict[$per-A]
	mon-sin = $mon-dict[$per-B]
	format = (replaces &max=-1 "%A" $day-sin $format)
	format = (replaces &max=-1 "%B" $mon-sin $format)

	date --date=$sec +$format
}
