#!/bin/zsh

# Define um intervalo para comparar se houve alteração de foco:
interval () {sleep 0.1}
# Define o nome do módulo da polybar para o comando polybar-msg
module="xwindow"
# Define qual hook do módlo dve ser acionado para att a label
optn=2

oldTitle=""

while true; do
	interval
	newTitle=$(xdotool getactivewindow getwindowname | awk -F"—|-" '{print $NF}')
	[[ $oldTitle != $newTitle ]] && \
		{
			oldTitle=$newTitle
			echo $newTitle >| /tmp/xwindow
			polybar-msg hook $module $optn

		} || continue
done
