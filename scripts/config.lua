Setup.Package
{
 	vendor = "liflg.org",
 	id = "kohan",
 	description = "Kohan",
 	version = "1.3.1-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "kohan-disc",
		description = "Kohan: Immortal Sovereigns Loki Disc",
		uniquefile = "bin/x86/kohan"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Kohan: Immortal Sovereigns",
		bytes = 633397971,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Kohan: Immortal Sovereigns",
                        genericname = "Kohan: Immortal Sovereigns",
                        tooltip = "Play Kohan: Immortal Sovereigns",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/kohan.dynamic.sh",
                        category = "Game",
                },

		Setup.File {
			source = "media://kohan-disc/",
			wildcards = { "Cinematics/*", "Maps/*", "SAI/*", "*.TGW", "QuickStart.txt", "README*", "icon*"},
		},

		Setup.File {
			source = "media://kohan-disc/bin/x86/",
			permissions = "0755",
		},
		
		Setup.File 
		{
			wildcards = "kohan.sh",
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = "README.liflg"
		},

		Setup.Option {
			required = true,
			value = true,
			description = "Apply Patch 1.3.1",
			tooltip = "Latest update from Loki",
			bytes = 85893120,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.3.1.tar.xz/",
				filter = function(dest)
					if ( string.match( dest, "kohan.dynamic" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File
			{
				allowoverwrite = true,
				permissions = "0755",
				wildcards = "kohan.dynamic.sh",
			},
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Install Loki-Compat libs",
			tooltip = "Required on new distributions",
			bytes = 5477376, 
			Setup.File{
				allowoverwrite = true,
				source = "base:///loki_compat_libs-1.3.tar.xz/",
			},
		},
	},
}			
