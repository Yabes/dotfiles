export comboCounter=-1

typeset -A comboList
comboList=(2 "Poetic" 3 "Cute" 4 "Adorable" 5 "Sweet" 6 "Naughty" 7 "Lucky" 8 "Swell" 9 "Stylish" 10 "Fancy" 11 "King" 12 "Killer" 13 "Unfortunate" 14 "Genial" 15 "Precocious" 16 "Spiffy" 17 "Milquetoast" 18 "Barely Legal" 19 "Impeccable" 20 "Visionary" 21 "Ambitious" 22 "Keen" 23 "Jocund" 24 "Provocative" 25 "Saucy" 26 "Vexing" 27 "Trite" 28 "Winsome" 29 "Cinematic" 30 "Devastating" 31 "Radical" 32 "Anatiferous" 33 "Ostentatious" 34 "Crass" 35 "Fetching" 36 "Impetuous" 37 "In A Row" 38 "Maniacal" 39 "Bawdy" 40 "Draconian" 41 "Saturnine" 42 "Meaningful" 43 "Effervescent" 44 "Trapezoidal" 45 "Competent" 46 "Puckish" 47 "Lamentable" 48 "Feckless" 49 "Luminous" 50 "Ritzy" 51 "Feline" 52 "Haphazard" 53 "Cromulent" 54 "Flashy" 55 "Diligent" 56 "Macabre" 57 "Mincing" 58 "Stodgy" 59 "Brazen" 60 "Swashbuckling" 61 "Bovine" 62 "Stupefying" 63 "Stalwart" 64 "Urbane" 65 "Jurassic" 66 "Devilish" 67 "Lackadaisical" 68 "Festive" 69 "Dude\!" 70 "Savage" 71 "Ursine" 72 "Melodramatic" 73 "Formidable" 74 "Efficient" 75 "Credible" 76 "Moribund" 77 "Luckier" 78 "Upsetting" 79 "Excessive" 80 "Ultra" 81 "Porcine" 82 "Wanton" 83 "Odious" 84 "Meaty" 85 "Disciplined" 86 "Ominous" 87 "Noncommittal" 88 "Swollen" 89 "Cryptic" 90 "Rubenesque" 91 "Serpentine" 92 "Carnivorous" 93 "Tenebrescent" 94 "Grisly" 95 "Colossal" 96 "Retromingent" 97 "Unreasonable" 98 "Cruciferous" 99 "Spectacular" 100 "Centennial" 101 "Binary" 110 "Courageous" 111 "Legendary" 120 "Disturbing" 121 "Gigawatt" 123 "Chromatic" 130 "Overwhelming" 140 "Brutal" 150 "Superlative" 160 "Cumbersome" 170 "Barbaric" 180 "Righteous" 187 "Murderous" 190 "Absurd" 200 "Biennial" 201 "Acrobatic" 210 "Inspirational" 214 "Romantic" 220 "Punishing" 222 "Duplicitous" 230 "Uncouth" 240 "Mercurial" 250 "Comical" 260 "Unfathomable" 270 "Sanguine" 280 "Penultimate" 281 "Ultimate" 290 "Ingratiating" 300 "Madness" 314 "Algebraic" 333 "Puissant" 350 "Bodacious" 400 "Radioactive" 403 "Forbidden" 404 "Not Found" 410 "Feculent" 420 "Everyday" 430 "Sartorial" 440 "Crapulous" 444 "Quaquaversal" 450 "Nauseating" 500 "Decadent" 550 "Nebulous" 555 "Nepenthean" 600 "Grueling" 616 "Infernal" 650 "Whimsical" 666 "Diabolical" 700 "Distinguished" 750 "Laborious" 777 "Luckiest" 800 "Vertiginous" 808 "Stately" 850 "Exhausting" 888 "Grotesque" 900 "Salty" 950 "Inconceivable" 999 "You Can Stop Now")

function combo() {
	err=$?
	if [[ $err -eq 0 ]] ; then
		comboCounter=$((comboCounter + 1))
		msg=$comboList[$comboCounter]
		[ -n "$msg" ] && comboMessage=$msg
        [[ $comboCounter -eq 1 ]] && comboMessage=''
	else
		comboCounter=0
		comboMessage="C-C-C-C-COMBO BREAKER"
	fi
    
    RPROMPT=$comboMessage
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd combo

