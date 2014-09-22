#!/bin/bash -f
currentwindowname=`tmux list-window | tr '\t' ' ' | sed -n -e '/(active)/s/^[^:]*: *\([^ ]*\) .*/\1/gp'`;
currentwindow=`tmux list-window | tr '\t' ' ' | grep active | sed 's/:.*//'`;
currentpane=`tmux list-panes | tr '\t' ' ' | grep active | sed 's/:.*//'`;
panecount=`tmux list-panes | wc -l`;
inzoom=`tmux list-window | tr '\t' ' ' | grep active | grep zoom | sed 's/:.*//'`
if [ $panecount -ne 1 ]; then
    inzoom="";
fi
if [ $inzoom ]; then
    lastpane=`echo $currentwindowname | rev | cut -f 1 -d '@' | rev`;
    lastwindow=`echo $currentwindowname | cut -f 2- -d '@' | rev | cut -f 2- -d '@' | rev`;
    tmux select-window -t $lastwindow;
    tmux select-pane -t $lastpane;
    tmux swap-pane -s $currentwindowname;
    echo $lastwindow
    echo $lastpane
    echo $currentwindow
   
    tmux kill-window -t $currentwindow;
else
    newwindowname=zoom@$currentwindow@$currentpane;
    tmux new-window -d -n $newwindowname;
    tmux swap-pane -s $newwindowname;
    tmux select-window -t $newwindowname;
fi
