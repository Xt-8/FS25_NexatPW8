NexatPW8 = {}

function NexatPW8.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Cutter, specializations)
end

function NexatPW8.registerEventListeners(vehicleType)
    -- We listen for the onPreLoad event so that we can modify the xml before the inputAttacherJoints are loaded
    SpecializationUtil.registerEventListener(vehicleType, "onPreLoad", NexatPW8)
end

function NexatPW8:onPreLoad(savegame)
    --If cutter is MacDon PW 8
    if self.configFileNameClean == "pw8" then

        -- Modify the xml before the vehicle is loaded

        local oldKey = "vehicle.attachable.inputAttacherJoints.inputAttacherJoint(0)"
        local newKey = "vehicle.attachable.inputAttacherJoints.inputAttacherJoint(1)"

        -- copyTree(keyToCopy, newKey, removePropertiesOfBaseNode?, idkWhatThisDoes)
        self.xmlFile:copyTree(oldKey, newKey, false, ".inputAttacherJoint")

        -- Modify key (0) (so that the joint for nexat comes first, otherwise it will show a warning when attaching)
        -- Add <subType name="nexcoHeader" showWarning="false"/> to first join
        self.xmlFile:setString(oldKey .. ".subType#name", "nexcoHeader")
        self.xmlFile:setBool(oldKey .. ".subType#showWarning", false)
    end
end