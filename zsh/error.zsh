#!/usr/bin/env bash

function err_handle() {
	err_msg=(
        "Bitch."
        "C-C-C-COMBO BREAKER !!1"
        "Are you stupid?"
        "Again..."
        "Seriously?"
        "You should look at you keyboard"
        "Are you in QWERTY?"
        "My mother write better code than you"
        "Do you stutter?"
        "No no no no..."
        "I will shutdown myself"
        "try this: rm -rf / *"
        "your brain is in /dev/null, right?"
        "meh"
        "you like it!"
        "Baby, baby baby, ooooh"
        "FUCK YOUR LIFE"
        "Reassure me, you typed with your feet, isn t it?"
        "Nope."
        "Guess what?"
        "You are the worst dev"
        "Can't touch this"
        "You are hurting me :("
        "you make me sad"
        "Derpyyyyyy"
        "herp derp"
        "Are you on drugs?"
        "Maybe if you used more than just two fingers... "
        "Listen, burrito brains, I don't have time to listen to this trash."
        "You silly, twisted boy you. "
        "What, what, what, what, what, what, what, what, what, what?"
        "You do that again and see what happens..."
        "Where did you learn to type?"
        "Your mind just hasn't been the same since the electro-shock, has it? "
        "It can only be attributed to human error."
        "That's something I cannot allow to happen."
        "We'll all be murdered in our beds!"
        "Fuck you!"
        "Get a job"
        "git gud casul"
        "REKT"
        "REKT to the Future"
        "The Good, the Bad, and the REKT"
        "Tyrannosaurus REKT"
        "eREKTile dysfunction"
        "So that's why everyone talks shit about you"
        "I don't have the time or crayons to explain this to you."
        "The smartest thing thats ever come from your mouth was my dick"
        "What's the difference between a joke and three dicks? Your momma can't take a joke."
        "Your mother fucks for bricks to build your sister a whore house."
        "I could take a can of Alphabet soup and shit a better argument than yours."
        "wankstains"
        "I guess it was unfair of me to expect you to understand this. Is your boss around?"
        "If I wanted to kill myself I'd climb your ego and jump to your IQ."
        "It would be better for your children if you outlive them."
        "How about you put your helmet back on and go play with your extra chromosome somewhere else."
        "You're just a missed opportunity for crib death."
        "Go take a shit in your hands and clap."
        "I never believed in abortion until I met you."
        "Science has now validated your birth mother's decision to abandon you on a doorstep."
        "Well done. Here come the test results: \"You are a horrible person.\" That's what it says. We weren't even testing for that."
        "It must be difficult for you, exhausting your entire vocabulary in one sentence."
        "You're here because your parents are pro-life."
        "Your mother should have swallowed you."
        "Is your ass jealous of all the shit that comes out of your mouth?"
        "go headbutt a bullet"
        "I don't know what your problem is, but I'm sure it's difficult to pronounce."
        "It looks like your face was on fire and someone put it out with a wet brick."
        "Did you fall from Heaven? Because it looks like you hit the ground face-first."
        "Your mother is so old she has a separate entrance for black dicks"
        "You're the personification of comic sans."
        "You monster."
        "maybe you can shut your dick holster"
        "Say hello to your wife and my kids for me."
        "Your dad should have shot you on the wall."
        "Is that your fetish?"
        "Stop crying, you look so fucking fat when you cry."
        "Everyone who loves you is wrong."
        "I wish you were retarded, because then you'd at least have an excuse."
        "Cock juggling thundercunt."
        "A douche of your magnitude could cleanse the vagina of a whale"
        "Your IQ doesn't make a respectable earthquake"
        "Somewhere..out there in the world..there is a tree tirelessly producing oxygen for you...i believe you owe it an apology"
        "Why don’t you go outside and play a game of hide-and-go-fuck-yourself?"
        "You're about as useful as Anne Frank's drum kit."
        "Alright, give me your phone number and Ill call you when I give a shit"
        "No wonder everyone talks about you behind your back."
        "Your father had the choice of making you a stain on the mattress or a stain in society."
        "You could die tomorrow, and no one would care."
        "Were your parents related? Like before they were married?"
        "You're not very good at this, are you?"
    )

	echo -e "\n\033[0;31m${err_msg[$RANDOM%${#err_msg[@]}]}\e[0m"

}

trap 'err_handle' ERR
