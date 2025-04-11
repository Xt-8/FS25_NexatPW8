g_specializationManager:addSpecialization("nexatPW8", "NexatPW8", g_currentModDirectory.."nexatPW8.lua")

registerNexatPW8 = {}

function registerNexatPW8:register(name)
    local cutter = g_vehicleTypeManager:getTypeByName("cutter")
    if cutter ~= nil then
        if cutter.specializationsByName["FS25_nexatPW8.nexatPW8"] == nil then
            g_vehicleTypeManager:addSpecialization(cutter.name, "FS25_nexatPW8.nexatPW8")
        end
    end
end

TypeManager.finalizeTypes = Utils.prependedFunction(TypeManager.finalizeTypes, registerNexatPW8.register)