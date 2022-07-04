local mod = get_mod("ReplaceVictor")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de


local rep_sub_path = "keep_painting_ver_victor01"
local rep_material = "materials/lukejoebob"
local unit_path = "units/portrait"

-- Replace Victor painting

mod:hook(KeepDecorationPaintingExtension, "_apply_material_by_sub_path", function(func, self, subpath)
  if subpath ~= rep_sub_path then 
    return func(self, subpath)
  end

  local painting_unit = self._painting_unit

    if Unit.alive(painting_unit) then
        local slot = self._slot
        Unit.set_material(painting_unit, slot, rep_material )
    end
end)

-- Spawn a standalone copy inside Catrinne's room

mod:hook_safe(KeepDecorationSystem, "init", function(...)
    local world = Managers.world:world("level_world")
    local current_level = Managers.state.game_mode._level_key
    -- Make sure it only spawns in the keep 
    -- but also spawns for all variants of the keep
    if world and string.find(current_level, "inn_level") then
        mod:echo("[%s]: Spawning Custom Painting", mod:get_name())
        local position = Vector3(-39.3026, 40.3393, 19.8499)
        local rotation = Quaternion.from_elements(0.01,-0.01,0.7,-0.72235)
        local unit = World.spawn_unit(world, unit_path, position, rotation)
    end
end)