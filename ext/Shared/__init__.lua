Events:Subscribe('Partition:Loaded', function(partition)
    for _, instance in pairs(partition.instances) do
        if instance:Is('SoldierWeaponBlueprint') then
            
            -- SoldierWeaponBlueprint GUID for the RPG
            -- https://github.com/Powback/Venice-EBX/blob/master/Weapons/RPG7/RPG7.txt
            local blueprintGuid = Guid("5AEB6BE2-1D46-8857-6CBE-17ADB6625809")
            
            -- Only continue if this instance has the GUID we want
            if (instance.instanceGuid == blueprintGuid ) then
                local blueprint = SoldierWeaponBlueprint(instance)
                local weaponData = SoldierWeaponData(blueprint.object)
                
                -- Make the primaryFire attribute writable
                weaponData.weaponFiring.primaryFire:MakeWritable()

                local weapon = weaponData.weaponFiring.primaryFire

                -- Adjust the ROF
                weapon.fireLogic.rateOfFire = 500
                weapon.fireLogic.clientFireRateMultiplier = 500

                -- These are the defaults for reload times but can be adjusted
                weapon.fireLogic.reloadTimeBulletsLeft = 4.8
                weapon.fireLogic.reloadTime = 4.8

                -- Set the RPG firemode to full auto
                weapon.fireLogic.fireLogicType = 2

                -- Set the magazine capacity to 50
                weapon.ammo.magazineCapacity = 50

            end
        end
    end
end)