#!/bin/zsh

ATTACHED="$(zellij ls | rg --invert-match EXITED | wc -l)"

if [[ $ATTACHED == 0 ]]; 
then zellij
else zellij attach --index $(($ATTACHED-1))
fi
