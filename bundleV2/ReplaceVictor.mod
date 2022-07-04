return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`ReplaceVictor` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("ReplaceVictor", {
			mod_script       = "scripts/mods/ReplaceVictor/ReplaceVictor",
			mod_data         = "scripts/mods/ReplaceVictor/ReplaceVictor_data",
			mod_localization = "scripts/mods/ReplaceVictor/ReplaceVictor_localization",
		})
	end,
	packages = {
		"resource_packages/ReplaceVictor/ReplaceVictor",
	},
}
