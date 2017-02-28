echo_git_branch () {
	BRANCH=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [[ -n $BRANCH ]]; then echo " $BRANCH"; fi
}

PS1="\[\033[31m\]\w\[\033[m\]\[\033[36m\]\$(echo_git_branch)\[\033[m\] \$ "

xcreset() {
	xcrun simctl delete unavailable
	xcrun simctl erase all
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
	rm -rf ~/Library/Caches/com.apple.dt.Xcode/*
	# defaults delete com.apple.dt.Xcode
}

xcopen() {
	open *.xcworkspace &>/dev/null || open *.xcodeproj &>/dev/null || open Package.swift  &>/dev/null
}

export -f xcreset
export -f xcopen
