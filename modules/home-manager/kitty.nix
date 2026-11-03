{ lib, config, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "MesloLGS Nerd Font Mono";
			size = 12;
		};
		keybindings = {
			"ctrl+v" = "paste_from_clipboard";
			"ctrl+c" = "copy_and_clear_or_interrupt";
			"ctrl+backspace" = "send_text all \\x17";
		};
		settings = {
			background_opacity = 0.9;
			hide_window_decorations = "yes";
			enable_audio_bell = "no";
			confirm_os_window_close = 2;
		};
	};
}
