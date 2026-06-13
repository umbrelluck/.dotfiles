--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
local windowrules = {}

windowrules.setup = function()
	hl.window_rule({
		name = "suppress-maximize-events",
		match = { class = ".*" },
		suppress_event = "maximize",
	})

	hl.window_rule({
		name = "fix-xwayland-drags",
		match = {
			class = "^$",
			title = "^$",
			xwayland = true,
			float = true,
			fullscreen = false,
			pin = false,
		},
		no_focus = true,
	})

	hl.window_rule({
		name = "xwayland-videobridge",
		match = { class = "xwaylandvideobridge" },
		opacity = 0.0,
		no_anim = true,
		no_initial_focus = true,
		max_size = "1 1",
		no_blur = true,
		no_focus = true,
	})

	hl.window_rule({
		name = "move-hyprland-run",
		match = { class = "hyprland-run" },
		move = "20 monitor_h-120",
		float = true,
	})

	hl.window_rule({
		name = "pwvucontrol",
		match = { class = "com.saivert.pwvucontrol" },
		float = true,
		size = "820 370",
		move = "1093 40",
	})

	hl.window_rule({
		name = "mission-center",
		match = { class = "io.missioncenter.MissionCenter" },
		float = true,
		center = true,
	})

	hl.window_rule({
		name = "bluetuith",
		match = { class = "bluetuith" },
		float = true,
		size = "820 355",
		move = "1093 40",
	})

	hl.window_rule({
		name = "btop",
		match = { class = "btop" },
		float = true,
		maximize = true,
		center = true,
	})

	hl.window_rule({
		name = "qalculate",
		match = { class = "Qalculate" },
		float = true,
		center = true,
	})

	hl.window_rule({
		name = "Zen browser placement",
		match = { class = "zen", title = "Zen Browser" },
		workspace = "1 silent",
		maximize = true,
	})

	hl.window_rule({
		name = "zen-save-as",
		match = { class = ".*zen.*", title = ".*Save As.*" },
		animation = "slide left",
	})

	hl.window_rule({
		name = "google-account-web",
		match = { title = ".*Вхід – облікові записи Google.*" },
		float = true,
		center = true,
		size = "850 940",
	})

	hl.window_rule({
		name = "xdg-desktop-portal",
		match = { class = "xdg-desktop-portal", title = ".*(Open|Save).*" },
		float = true,
		center = true,
		size = "1140 650",
		animation = "slide left",
	})

	hl.window_rule({
		name = "file-manager-script",
		match = { class = "file-manager" },
		float = true,
		center = true,
		size = "1800 900",
	})

	-- Zotero Rules
	hl.window_rule({
		name = "zotero-citations-progress",
		match = { class = "Zotero", title = "Quick Format Citation|Progress" },
		float = true,
		center = true,
		size = "800 800",
		max_size = "800 35",
	})

	hl.window_rule({
		name = "zotero-settings",
		match = { class = "Zotero", title = "Zotero Settings" },
		float = true,
		center = true,
		size = "1090 650",
	})

	-- NAPS2
	hl.window_rule({
		name = "naps2-main",
		match = { class = "naps2", title = "^$" },
		float = true,
		center = true,
		size = "1140 650",
		animation = "slide left",
	})

	-- VirtualBox
	hl.window_rule({
		name = "virtualbox-settings",
		match = { class = "VirtualBox", title = ".*Settings" },
		float = true,
		center = true,
		no_blur = true,
	})

	-- Автоматичне призначення робочих столів
	hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "5 silent" })
	hl.window_rule({ match = { class = "discord" }, workspace = "7 silent" })
	hl.window_rule({ match = { class = "Spotify" }, workspace = "7 silent" })
	hl.window_rule({ match = { class = "steam" }, workspace = "6 silent" })
	hl.window_rule({ match = { class = "heroic" }, workspace = 5 })

	-- Складні правила для ігор
	hl.window_rule({
		name = "beyond-all-reason",
		match = { class = "Beyond-All-Reason" },
		float = true,
		center = true,
		workspace = "6 silent",
	})

	hl.window_rule({
		name = "move-hyprland-run",
		match = { class = "hyprland-run" },
		move = "20 monitor_h-120",
		float = true,
	})

	hl.window_rule({
		name = "pwvucontrol",
		match = { class = "com.saivert.pwvucontrol" },
		float = true,
		size = "820 370",
		move = "1093 40",
	})

	hl.window_rule({
		name = "mission-center",
		match = { class = "io.missioncenter.MissionCenter" },
		float = true,
		center = true,
	})

	hl.window_rule({
		name = "bluetuith",
		match = { class = "bluetuith" },
		float = true,
		size = "820 355",
		move = "1093 40",
	})

	hl.window_rule({
		name = "btop",
		match = { class = "btop" },
		float = true,
		maximize = true,
		center = true,
	})

	hl.window_rule({
		name = "qalculate",
		match = { class = "Qalculate" },
		float = true,
		center = true,
	})

	hl.window_rule({
		name = "zen-save-as",
		match = { class = ".*zen.*", title = ".*Save As.*" },
		animation = "slide left",
	})

	hl.window_rule({
		name = "google-account-web",
		match = { title = ".*Вхід – облікові записи Google.*" },
		float = true,
		center = true,
		size = "850 940",
	})

	hl.window_rule({
		name = "xdg-desktop-portal",
		match = { class = "xdg-desktop-portal", title = ".*(Open|Save).*" },
		float = true,
		center = true,
		size = "1140 650",
		animation = "slide left",
	})

	hl.window_rule({
		name = "file-manager-script",
		match = { class = "file-manager" },
		float = true,
		center = true,
		size = "1800 900",
	})

	-- Zotero Rules
	hl.window_rule({
		name = "zotero-citations-progress",
		match = { class = "Zotero", title = "Quick Format Citation|Progress" },
		float = true,
		center = true,
		size = "800 800",
		max_size = "800 35",
	})

	hl.window_rule({
		name = "zotero-settings",
		match = { class = "Zotero", title = "Zotero Settings" },
		float = true,
		center = true,
		size = "1090 650",
	})

	-- NAPS2
	hl.window_rule({
		name = "naps2-main",
		match = { class = "naps2", title = "^$" },
		float = true,
		center = true,
		size = "1140 650",
		animation = "slide left",
	})

	-- VirtualBox
	hl.window_rule({
		name = "virtualbox-settings",
		match = { class = "VirtualBox", title = ".*Settings" },
		float = true,
		center = true,
		no_blur = true,
	})

	-- Автоматичне призначення робочих столів
	hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "5 silent" })
	hl.window_rule({ match = { class = "discord" }, workspace = "7 silent" })
	hl.window_rule({ match = { class = "Spotify" }, workspace = "7 silent" })
	hl.window_rule({ match = { class = "steam" }, workspace = "6 silent" })
	hl.window_rule({ match = { class = "heroic" }, workspace = 5 })

	-- Складні правила для ігор
	hl.window_rule({
		name = "beyond-all-reason",
		match = { class = "Beyond-All-Reason" },
		float = true,
		center = true,
		workspace = "6 silent",
	})

	hl.window_rule({
		name = "epic-games",
		match = { class = ".*epicgameslauncher.exe.*", title = ".*Epic Games Launcher.*" },
		workspace = "6 silent",
	})

	hl.window_rule({
		name = "epic-games",
		match = { class = ".*epicgameslauncher.exe.*", title = ".*Epic Games Launcher.*" },
		workspace = "6 silent",
	})

	------

	-- Окремі правила, що випали:

	hl.window_rule({
		name = "overskride",
		match = { title = "overskride" },
		float = true,
		size = "980 690",
		move = "920 40",
	})

	hl.window_rule({
		name = "calendar",
		match = { class = "calendar" },
		float = true,
		size = "1310 725",
		move = "305 40",
	})

	hl.window_rule({
		name = "updates-to-install",
		match = { class = "updates_install" },
		float = true,
		size = "1110 690",
	})

	hl.window_rule({
		name = "blender-launcher",
		match = { class = "blenderlauncher" },
		float = true,
		size = "640 480",
		move = "640 250",
	})

	hl.window_rule({
		name = "blender-main",
		match = { class = "blender" },
		float = true,
		maximize = true,
	})

	hl.window_rule({
		name = "zotero-citations-add",
		match = { class = "Zotero", title = "Add/Edit Citation" },
		float = true,
		center = true,
		size = "900 400",
	})

	hl.window_rule({
		name = "qView",
		match = { class = ".*com.interversehq.qView.*" },
		float = true,
		center = true,
		size = "1170 880",
	})

	hl.window_rule({
		name = "copyq",
		match = { class = ".*com.github.hluk.copyq.*" },
		float = true,
		size = "1020 720",
		move = "155 40",
	})

	hl.window_rule({
		name = "fileroller-extract",
		match = { class = "org.gnome.FileRoller", title = ".*Extract.*" },
		center = true,
	})

	-- Специфічне правило для Spring (Beyond All Reason)
	hl.window_rule({
		match = { class = "spring", title = "Beyond All Reason" },
		workspace = "6 silent",
	})

	-- Правило для Lutris
	hl.window_rule({
		name = "lutris-workspace",
		match = { class = ".*net.lutris.Lutris.*" },
		workspace = "6 silent",
	})

	-- Додаткове правило для NAPS2 (діалоги)
	hl.window_rule({
		name = "naps2-scanner-dialogs",
		match = { class = "naps2", title = ".*%(.*%).*" },
		float = true,
		center = true,
		size = "450 100",
	})

	hl.window_rule({
		name = "xdg-save-path",
		match = { title = ".*Choose save path.*" },
		float = true,
		center = true,
		size = "1140 650",
		animation = "slide left",
	})

	-- Те саме коротке правило для BAR, яке було окремим рядком
	hl.window_rule({
		match = { class = "spring", title = "Beyond All Reason" },
		workspace = "6 silent",
	})

	-- Уточнення для Zotero (Quick Format Citation та Progress)
	-- В оригіналі вони були в одному правилі через pipe (|)
	hl.window_rule({
		name = "zotero-citations-progress",
		match = {
			class = "Zotero",
			title = "Quick Format Citation|Progress",
		},
		float = true,
		center = true,
		size = "800 800",
		max_size = "800 35",
	})
end

return windowrules
