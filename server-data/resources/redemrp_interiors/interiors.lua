Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local valbank_interior_id = 12290

    local interior_sets_for_valbank_interior = {
        "val_bank_int_curtainsopen",
        "val_bank_front_windows",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_valbank_interior) do
      if not IsInteriorEntitySetActive(valbank_interior_id,v) then
        ActivateInteriorEntitySet(valbank_interior_id,v)
        print("Valentine Bank Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local valsaloon_interior_id = 21250

    local interior_sets_for_valsaloon_interior = {
        "front_windows",
        "val_saloon_br03_bed",
        "4_chair_poker_set",
        "val_saloon_br03_bed",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_valsaloon_interior) do
      if not IsInteriorEntitySetActive(valsaloon_interior_id,v) then
        ActivateInteriorEntitySet(valsaloon_interior_id,v)
        print("Valentine Saloon Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local valjail_interior_id = 7170

    local interior_sets_for_valjail_interior = {
        "val_jail_int_walla",
        "val_jail_int_wallb",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_valjail_interior) do
      if not IsInteriorEntitySetActive(valjail_interior_id,v) then
        ActivateInteriorEntitySet(valjail_interior_id,v)
        print("Valentine Jail Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local valgen_interior_id = 45826

    local interior_sets_for_valgen_interior = {
        "val_genstore_night_light",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_valgen_interior) do
      if not IsInteriorEntitySetActive(valgen_interior_id,v) then
        ActivateInteriorEntitySet(valgen_interior_id,v)
        print("Valentine General Store Nightlight Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local korrigan_interior_id = 51202

    local interior_sets_for_korrigan_interior = {
        "korrigan_props_poker",
        --"korrigan_props_default",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_korrigan_interior) do
      if not IsInteriorEntitySetActive(korrigan_interior_id,v) then
        ActivateInteriorEntitySet(korrigan_interior_id,v)
        print("Riverboat Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local beechers_interior_id = 50690

    local interior_sets_for_beechers_interior = {
        --"bee_01_masterBR_bed03",
        "Beechers_after_Marston8_Abigail2.2",
        "Beechers_after_Marston8_Abigail2.2_dressing",
        --"Beechers_after_2.2",
        --"Beechers_decorated_after_Abigail3",
        --"IntGrp_livingrm_furniture_fancy",
        --"bee_01_house_fireplace_on",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_beechers_interior) do
      if not IsInteriorEntitySetActive(beechers_interior_id,v) then
        ActivateInteriorEntitySet(beechers_interior_id,v)
        print("Beechers Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local bronte_interior_id = 49154

    local interior_sets_for_bronte_interior = {
        "bronte_shutters_open",
        "bronte_glass_unbreakable",
        "bronte_sp_dressing",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_bronte_interior) do
      if not IsInteriorEntitySetActive(bronte_interior_id,v) then
        ActivateInteriorEntitySet(bronte_interior_id,v)
        print("Bronte? Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local bra_interior_id = 72706

    local interior_sets_for_bra_interior = {
        "bra_mansion_WindowsStatic",
        "bra_int_bedroom_clean",
        "bra_mansion_dining_groups",
        "bra_mansion_dining_vfx",
        "bra_mansion_parlor_vfx",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_bra_interior) do
      if not IsInteriorEntitySetActive(bra_interior_id,v) then
        ActivateInteriorEntitySet(bra_interior_id,v)
        print("Braithwaite Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local rhoshrf_interior_id = 40194

    local interior_sets_for_rhoshrf_interior = {
        "rho_sheriff_int_explosion",
        "rho_sheriff_int_JBO1_01",
        "rho_sheriff_int_JBO1_02",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_rhoshrf_interior) do
      if not IsInteriorEntitySetActive(rhoshrf_interior_id,v) then
        ActivateInteriorEntitySet(rhoshrf_interior_id,v)
        print("Rhodes Sheriff Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local newcombank_interior_id = 42754

    local interior_sets_for_newcombank_interior = {
        "new_com_bank_before",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_newcombank_interior) do
      if not IsInteriorEntitySetActive(newcombank_interior_id,v) then
        ActivateInteriorEntitySet(newcombank_interior_id,v)
        print("New Com Bank Interior Activated")
      end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1500)    

    local rhosaloon_interior_id = 54274

    local interior_sets_for_rhosaloon_interior = {
        "rho_sal_tables_01",
        "rho_saloon_int_rentSign",
    }

    -- activate some interior entity sets. 
    for k,v in pairs(interior_sets_for_rhosaloon_interior) do
      if not IsInteriorEntitySetActive(rhosaloon_interior_id,v) then
        ActivateInteriorEntitySet(rhosaloon_interior_id,v)
        print("Rhodes Saloon Interior Activated")
      end
    end
end)