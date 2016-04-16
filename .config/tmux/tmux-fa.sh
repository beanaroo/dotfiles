#!/bin/bash

case "$1" in

    -session) 
        echo " "
        ;;
    -pane)
        echo " "
        ;;
    -cpu)
        echo " $(ps --pid $2 --ppid $2 -So pcpu= | paste -sd+ | bc)"
        ;;
    -mem)
        echo " $(ps --pid $2 --ppid $2 -So pmem= | paste -sd+ | bc)"
        ;;
    -cmd)
        case "$2" in

            #)       echo ""
            #    ;;
            #)       echo ""
            #    ;;
            youtube-viewer|youtube-dl)       echo " "
                                    ;;
            ssh|scp)                echo " "
                                    ;;
            dmesg|journalctl)       echo " "
                                    ;;
            gdb|coredumpctl)        echo " "
                                    ;;
            git)                    echo " "
                                    ;;
            mutt)                   echo " "
                                    ;;
            mpv|gnome-mpv|ffmpeg)   echo " "
                                    ;;
            parted|fdisk|gdisk)     echo " "
                                    ;;
            steel|kpcli)            echo " "
                                    ;;
            rtv)                    echo " "
                                    ;;
            ranger)                 echo " "
                                    ;;
            less|more)              echo " "
                                    ;;
            virsh)                  echo "  "
                                    ;;
            issi|WeeChat)                  echo " "
                                    ;;
            htop|top)               echo " "
                                    ;;
            vi|vim|nvim)            echo " "
                                    ;;
            man)                    echo " "
                                    ;;
            zsh)                    echo ""
                                    ;;
            *)                      echo ""
                                    ;;
        esac
        ;;

esac
