#Sindarin Dates
fn date-elv [format]{
	#date-elv "format"
	#A function to print the date with elvish (Sindarin) weekday and month names
	#works pretty much like date +"format" except:
	# %a is the full Sindarin weekday
	# %m is the full Sindarin month name
	# see man date FORMAT for all available options

	day-dict = [ &Fri="Ordillion" &Sat="Oranor" &Sun="Orithil" &Mon="Orgaladh" &Tue="Ormenel" &Wed="Orbelain" &Thu="Oraeron" ]
	mon-dict = [ "Narwain" "Nínui" "Gwaeron" "Gwirith" "Lothron" "Nórui" "Cerweth" "Urui" "Ivanneth" "Narbeleth" "Hithui" "Girithron" ]
	#seconds since '70
	sec = (echo '@'(date +'%s'))
	#fetches the current abbreviated day names, and number of month
	per-a = (date --date=$sec +"%a")
	per-m = (date --date=$sec +"%m")
	day-sin = $day-dict[$per-a]
	mon-sin = $mon-dict[(- $per-m 1)]
	format = (replaces &max=-1 "%a" $day-sin $format)
	format = (replaces &max=-1 "%m" $mon-sin $format)

	date --date=$sec +$format
}
