if status is-interactive
    # Commands to run in interactive sessions can go here
end

#custom aliases
alias mars="java -jar ~/Downloads/Mars4_5.jar"
alias sshbbb="sshpass -p 'temppwd' ssh debian@192.168.7.2"
alias uniwork="cd ~/work/computing-work"
alias hyped22="cd ~/work/hyped-2022; code .; cd build; make -j"
alias hyped23="cd ~/work/hyped-2023; code .; cd build; make -j"
alias hyped24="cd ~/work/hyped-2024; code .; cd build; make -j"
alias editfish="nvim ~/.config/fish/config.fish; . ~/.config/fish/config.fish"
alias bat="cat /sys/class/power_supply/BAT0/capacity"
alias gui="Hyprland"
alias shutdown="sudo shutdown now"
alias make="make -j 7"
alias aoc="cd ~/work/advent-of-code-2023/; code .; firefox --new-window 'https://adventofcode.com'"
alias tc="ping -c 1 archlinux.org"
alias bt=bluetoothctl
alias rb="cd ~/work/hyped-2024; rm -rf build; mkdir build; cd build; cmake .."
alias htb="sudo echo; cd ~/work/random-stuff/htb; gnome-terminal --tab -- bash -c 'cd ~/work/random-stuff/htb; exec bash'; sudo openvpn starting_point_Infernox91645.ovpn"
alias cc="cd ~/work/hyped-2024; rm -rf build; mkdir build; cd build; cmake .. -DCROSS=OFF -DPEDANTIC=OFF -DFORMAT=OFF -DCMAKE_CXX_COMPILER=/home/infernox/Downloads/armv7-eabihf--glibc--bleeding-edge-2018.11-1/bin/arm-linux-g++; make -j hyped_debugger hyped_pod"
alias cc23="cd ~/work/hyped-2023; rm -rf build; mkdir build; cd build; cmake .. -DCROSS=OFF -DPEDANTIC=OFF -DFORMAT=OFF -DCMAKE_CXX_COMPILER=/home/infernox/Downloads/armv7-eabihf--glibc--bleeding-edge-2018.11-1/bin/arm-linux-g++; make -j hyped_debugger hyped_pod"
alias gp="git push"
alias isa="cd ~/work/isa; code .; tab ./isa.wiki; tab ./simulator"
alias gld="git log --all --oneline --graph --decorate"
alias gpr="gh pr create"
alias btcf="bluetoothctl connect AC:80:0A:0A:D2:42"
alias btdf="bluetoothctl disconnect AC:80:0A:0A:D2:42"
alias btch="bluetoothctl connect AC:80:0A:6D:F7:4E"
alias btdh="bluetoothctl disconnect AC:80:0A:6D:F7:4E"
alias pushrepl="cd ~/work/hyped-2024/build; make -j hyped_debugger;sshpass -p 'temppwd' scp bin/hyped_debugger debian@192.168.9.2:~"
alias pushreplc="cd ~/work/hyped-2024/build; make -j hyped_debugger; sshpass -p 'temppwd' scp bin/hyped_debugger ../config/template.json debian@192.168.9.2:~; sshpass -p 'temppwd' scp ../lib/motors/config/messages.json debian@192.168.9.2:~/motor_controller_messages.json"
alias nmlog="journalctl -fu NetworkManager"
alias pr="make -j hyped_pod; sshpass -p 'spacex' scp bin/hyped_pod hyped@192.168.7.2:~"
#alias difs="eval command sudo $fish_history[1]"
alias volumeup="pactl set-sink-volume @DEFAULT_SINK@ +10%"
alias volumedown="pactl set-sink-volume @DEFAULT_SINK@ -10%"
alias volumeset="pactl set-sink-volume @DEFAULT_SINK@"
alias vpnc="piactl connect"
alias vpnd="piactl disconnect"
alias vpns="piactl get connectionstate"
alias edithyprland="nvim ~/.config/hypr/hyprland.conf"
alias air-monitor="sshpass -p (cat ~/work/air-monitor/.env) ssh infernox@82.37.120.97 -p 34993"
alias air-analysis="exec code ~/work/air-monitor"
alias erd="erd --no-config"
alias ev="nvim .config/nvim/init.lua"

#abbreviations
abbr -a gc git commit -m
abbr -a gs git status
abbr -a gb git branch
abbr -a ef editfish
abbr -a ga git add
abbr -a ff firefox
abbr -a pacman sudo pacman
abbr -a gl git log
abbr -a et erd -H -d logical -I -i -. -L 1
abbr -a py python3
abbr -a vu volumeup
abbr -a vd volumedown
abbr -a vs volumeset
abbr -a eh edithyprland
abbr -a aa air-analysis

#functions
function gfa
    set -l path "$(git rev-parse --show-toplevel)"
    git add "$path/$argv"
    git clang-format --extensions c,h,cpp,hpp
    find "$path/$argv" \( -name 'CMakeLists.txt' -not -path "./build/*" -not -path "./telemetry/*" \) -exec cmake-format -i {} +
    git add "$path/$argv"
end

function gbp
    set -l path "$(pwd)"
    cd /home/infernox/work/hyped-2024/build
    if make -j && make test
        git push
    else
        set_color red
        echo "Build failed. Push anyway? [y/n]: "
        read --nchars 1 -l response
        if test "$response" = y; or test "$response" = Y
            git push
        end
    end
    cd $path
end

function gcp
    git checkout $argv
    git pull
end

function ros2_on
    export ROS_DOMAIN_ID=42
    export ROS_VERSION=2
    export ROS_PYTHON_VERSION=3
    export ROS_DISTRO=foxy
    source /opt/ros2/foxy/setup.bash
end

function difs
    if count $argv >/dev/null
        if [ $history[$argv[1]] = difs ]
            dsu (math $argv[1] + 1)
        else
            eval command sudo $history[$argv[1]]
        end
    else
        difs 1
    end
end

fish_add_path ~/work/scripts
fish_add_path ~/.cargo/bin
export VISUAL=nvim
