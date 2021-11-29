#!/bin/bash

GameBoard=(" " " " " " " " " " " " " " " " " ")
current_player="x"

echo_GameBoard()
{

    echo "${GameBoard[0]}|${GameBoard[1]}|${GameBoard[2]}"
    echo "- - -"
    echo "${GameBoard[3]}|${GameBoard[4]}|${GameBoard[5]}"
    echo "- - -"
    echo "${GameBoard[6]}|${GameBoard[7]}|${GameBoard[8]}"
}

update_player()
{
    if [ $current_player == "x" ]
    then
        current_player="o"
    else
        current_player="x"
    fi
}

update_gameBoard()
{
    echo "Enter s to save, enter r to read game"
    read -p "Enter move ${current_player}-[player] (digit from 0 to 8), please: " move

    if [ GameBoard[$move] == " " ]
    then
        GameBoard[$move]=$current_player
    elif [ $move == "s"]
    then
        touch plik
        echo "${GameBoard[*]}" > plik
        clear
        echo "Gra zapisana"
    elif [ $move == "r"]
    then
        read -a GameBoard < plik
    else
        update_gameBoard
    fi
}

playWithComputer()
{
    for number in {0 .. 8}
    do
        if [ GameBoard[$move] = " "]
        then
            GameBoard[$move] = $current_player
            break
        fi
    done
}

check_game_state()
{
    if [ GameBoard[0] == $current_player && GameBoard[1] == $current_player && GameBoard[2] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[3] == $current_player && GameBoard[4] == $current_player && GameBoard[5] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[6] == $current_player && GameBoard[7] == $current_player && GameBoard[8] == $current_player ]
        echo "The winner is $current_player-player"
        exit 0
    then

    if [ GameBoard[0] == $current_player && GameBoard[3] == $current_player && GameBoard[6] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[1] == $current_player && GameBoard[4] == $current_player && GameBoard[7] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[2] == $current_player && GameBoard[5] == $current_player && GameBoard[8] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[0] == $current_player && GameBoard[5] == $current_player && GameBoard[8] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi

    if [ GameBoard[2] == $current_player && GameBoard[5] == $current_player && GameBoard[6] == $current_player ]
    then
        echo "The winner is $current_player-player"
        exit 0
    fi
}

while :;
do
    echo_GameBoard
    update_gameBoard
    check_gameState
    update_player
    clear
done
