package main

import "os"
import "fmt"

func main() {
	app := os.Args[1]
	switch app {
	case "youtube-viewer", "youtube-dl":
		fmt.Println(" ", app)
	case "ssh", "scp":
		fmt.Println(" ", app)
	case "dmesg", "journalctl":
		fmt.Println(" ", app)
	case "gdb", "coredumpctl":
		fmt.Println(" ", app)
	case "git":
		fmt.Println(" ", app)
	case "mutt":
		fmt.Println(" ", app)
	case "mpv", "gnome-mpv", "ffmpeg":
		fmt.Println(" ", app)
	case "parted", "fdisk", "gdisk":
		fmt.Println(" ", app)
	case "steel", "kpcli":
		fmt.Println(" ", app)
	case "rtv":
		fmt.Println(" ", app)
	case "ranger":
		fmt.Println(" ", app)
	case "less", "more":
		fmt.Println(" ", app)
	case "virsh":
		fmt.Println("  ", app)
	case "issi", "WeeChat":
		fmt.Println(" ", app)
	case "htop", "top":
		fmt.Println(" ", app)
	case "vi", "vim", "nvim":
		fmt.Println(" ", app)
	case "man":
		fmt.Println(" ", app)
	case "zsh":
		fmt.Println("", app)
	default:
		fmt.Println("", app)
	}
}
