# sindarin-term
elvish (sindarin) date printing for the elvish shell

### installtion
just use `epm` the built in elvish package manager.
```
use epm
epm:install github.com/jkbr-19/sindarin-term
```
To access the function put this in your `rc.elv`
```
use github.com/jkbr-19/sindarin-term/date-elv
```
Some example output:
```
~> date-elv:date-elv "%A: %d.%B TA. %Y"
Oranor: 19.Narwain TA. 2019
```
As you can see it works pretty much like regular old `date +"format"` but replaces `%A` with the Sindarin name for the current weekday and `%B` with the Sindarin month. Pull requests are welcome
