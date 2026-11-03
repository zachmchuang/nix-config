{ ... }:

{
	services.keyd = {
		enable = true;

		keyboards.default = {
			ids = [ "*" ];

			settings = {
				main = {
					leftalt = "leftmeta";
					leftmeta = "leftalt";
					rightalt = "rightmeta";
					sysrq = "rightalt";
					capslock = "overload(capslock, esc)";
					esc = "capslock";
					"[" = "overload(control, [)";
					"]" = "overload(alt, ])";
					favorites = "print";
				};

				shift = {
					leftshift = "capslock";
					rightshift = "capslock";
				};

				"capslock:C" = {
					h = "left";
					k = "up";
					j = "down";
					l = "right";
					";" = "home";
					"'" = "end";
					s = "print";
				};
			};
		};
	};
}

