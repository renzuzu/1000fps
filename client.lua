function requestmodel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do 
		Citizen.Wait(1)
		RequestModel(model)
	end
end

local loaded = false
Citizen.CreateThread(function()
    requestmodel('s_f_y_stripper_01')
    requestmodel('ig_bankman')
    loaded = true
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(0.7)
        SetVehicleDensityMultiplierThisFrame(0.7)
        SetRandomVehicleDensityMultiplierThisFrame(0.7)
        DisableOcclusionThisFrame()
        SetDisableDecalRenderingThisFrame()
        OverrideLodscaleThisFrame(0.3)
        Wait(0)
    end
end)

-- AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
--     local ped = {
--         's_f_y_stripper_01',
--         'ig_bankman'
--     }
--     if model == 402729631 or model == 1457690978 or model == GetHashKey('a_c_pigeon') or model == GetHashKey('a_c_chickenhawk') then
--         setters.setModel('a_c_seagull') -- you can use a hash as well
--     else
--         -- setters.setModel(ped[math.random(0,1)]) -- you can use a hash as well
--         -- unusedBool, spawnZ = GetGroundZAndNormalFor_3dCoord(x, y, 9999.0, 1)
--         -- setters.setPosition(x, y, spawnZ)
--     end

--     -- you can also CancelEvent() to skip creating the ped
-- end)

Citizen.CreateThread(function()

    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(1000)
    end
    local task = {}
    local vehicle = {}
    Wait(1000)
    --SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
    --AddRelationshipGroup("RACER")
    --SetRelationshipBetweenGroups(5, GetHashKey("RACER"), GetHashKey("PLAYER"))
    RopeDrawShadowEnabled(false)
    CascadeShadowsClearShadowSampleType()
    DisableVehicleDistantlights(true)
    N_0x5f6df3d92271e8a1(false)
    CascadeShadowsSetAircraftMode(false)
    CascadeShadowsEnableEntityTracker(true)
    CascadeShadowsSetDynamicDepthMode(false)
    CascadeShadowsSetEntityTrackerScale(0.0)
    CascadeShadowsSetDynamicDepthValue(0.0)
    CascadeShadowsSetCascadeBoundsScale(0.0)
    SetFlashLightFadeDistance(5.0)
    SetLightsCutoffDistanceTweak(5.0)
    DistantCopCarSirens(false)
    while true do
        SetWeatherTypePersist("CLEAR")
		SetWeatherTypeNowPersist("CLEAR")
		SetWeatherTypeNow("CLEAR")
		SetOverrideWeather("CLEAR")
        local veh_pool = GetGamePool('CVehicle')
        RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 50.0)
        for k,v in pairs(veh_pool) do
            if #(GetEntityCoords(PlayerPedId(), false) - GetEntityCoords(v, false)) < 100 then
                local driver = GetPedInVehicleSeat(v, -1)
                -- if task[v] ~= nil and task[v] == driver then
                --     if DoesEntityExist(driver) then
                --         if #(GetEntityCoords(PlayerPedId(), false) - GetEntityCoords(v, false)) > 200 then
                --             task[v] = nil
                --             ----print("too far, deleting..")
                --         end
                --     else
                --         ----print("deleted by engine")
                --         task[v] = nil
                --     end
                -- end
                if not IsPedAPlayer(driver) and driver ~= 0 then
                    SetPedAlertness(driver, true)
                    SetPedAllowVehiclesOverride(driver, true)
                    SetPedAsEnemy(driver, true)
                    SetPedCombatAttributes(driver, 52) -- 46 ignore traffic
                    SetPedEnableWeaponBlocking(driver, true)
                    SetPedSeeingRange(driver, 1000000.0)
                    SetPedHearingRange(driver, 1000000.0)
                    SetVehicleCanBeUsedByFleeingPeds(v, true)
                    SetVehicleIsRacing(v,true)
                    SetVehicleMaxSpeed(v,500.0)
                    StopPedSpeaking(driver, true)
                    SetDriverRacingModifier(driver,100.0)
                    SetDriverAbility(driver, 100.0)        -- values between 0.0 and 1.0 are allowed.
                    SetDriverAggressiveness(driver, 100.0) -- values between 0.0 and 1.0 are allowed.
                    SetDriveTaskMaxCruiseSpeed(driver,500.0)
                    SetVehicleLodMultiplier(v,0.0)
                    RemoveVehicleHighDetailModel(v)
                    SetVehicleEnveffScale(v,0.0)
                    SetDisableSuperdummyMode(v)
                    SetDisableVehicleUnk(v,true)
                    SetDisableVehicleUnk_2(v,true)
                    SetVehicleShadowEffect(v,-1,-1)
                    SetFarDrawVehicles(false)
                    TaskVehicleTempAction(driver,v,32,10)
                    TaskVehicleDriveToCoordLongrange(driver, v, GetEntityCoords(v, false)+vec3(100.0,100.0,100.0), 400.0, 787260, 10.0)
                    SetDriveTaskCruiseSpeed(PlayerPedId(),300.0)
                    SetDriveTaskMaxCruiseSpeed(true,300.0)
                    SetVehicleHandlingField(v, "CHandlingData", "AIHandling", "SPORTS_CAR")
                    print("gago")
                    --TaskVehicleDriveToCoordLongrange(driver, v, GetEntityCoords(v, false)+vec3(100.0,100.0,100.0), 400.0, 787260, 10.0)
                end
            end
        end
        -- SetDriveTaskDrivingStyle(GetPlayerPed(-1), 787260)
        -- SetDriveTaskCruiseSpeed(GetPlayerPed(-1),400.0)
        -- SetDriverRacingModifier(GetPlayerPed(-1),1.0)
        -- SetDriverAbility(GetPlayerPed(-1), 1.0)        -- values between 0.0 and 1.0 are allowed.
        -- SetDriverAggressiveness(GetPlayerPed(-1), 1.0) -- values between 0.0 and 1.0 are allowed.
        -- SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1),400.0)
        -- SetPedKeepTask(GetPlayerPed(-1), true)
        --TaskVehicleTempAction(GetPlayerPed(-1),vehicle,32,10.0)
        Wait(2000)
    end
end)

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(1000)
    end
    local task = {}
    local vehicle = {}
    while true do
        local ped = PlayerPedId()
        for k,v in pairs(GetGamePool('CPed')) do
            ----print(v,"ped")
            if v ~= ped and #(GetEntityCoords(ped) - GetEntityCoords(v)) > 100 then
                if not IsEntityAMissionEntity(v) then
                    SetEntityAsNoLongerNeeded(v)
                end
                --SetEntityAlpha(v,0,false)
                --SetEntityLodDist(v,10)
            elseif v ~= ped then
                --ResetEntityAlpha(v)
                --SetEntityVisible(v, true)
                --SetEntityLodDist(v,100)
                StopPedSpeaking(v, true)
                SetPedAoBlobRendering(v,false)
            end
        end
        for k,v in pairs(GetGamePool('CObject')) do
            if #(GetEntityCoords(ped) - GetEntityCoords(v)) > 100 then
                if not IsEntityAMissionEntity(v) then
                    SetObjectAsNoLongerNeeded(v)
                end
                SetEntityAlpha(v,0,false)
                SetEntityLodDist(v,10)
            else
                ResetEntityAlpha(v)
                SetEntityVisible(v, true)
                SetEntityLodDist(v,100)
            end
        end
        for k,v in pairs(GetGamePool('CVehicle')) do
            Wait(11)
            if #(GetEntityCoords(ped,true) - GetEntityCoords(v,true)) > 150 then
                --SetEntityAsNoLongerNeeded(v)
                SetEntityAlpha(v,0,false)
                SetEntityVisible(v, false)
                SetEntityLodDist(v,10)
            else
                PerformanceUpgradeVehicle(v,false)
                ResetEntityAlpha(v)
                SetEntityVisible(v, true)
                SetEntityLodDist(v,150)
            end
        end
        SetBackfaceculling(true)
        DisableVehicleDistantlights(true)
        SetDistantCarsEnabled(false)
        --SetReduceVehicleModelBudget(true)
        SetSnowLevel(1.0)
        SetTimeScale(1.0)
        ShouldUseMetricMeasurements()
        DisableHeadBlendPaletteColor(v)
        SetRainLevel(0.0)
        SetWindSpeed(0.0)
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(1000)
    end
    local task = {}
    local vehicle = {}
    Wait(1000)
    --SetPedRelationshipGroupHash(GetPlayerPed(-1), GetHashKey("PLAYER"))
    --AddRelationshipGroup("RACER")
    --SetRelationshipBetweenGroups(5, GetHashKey("RACER"), GetHashKey("PLAYER"))
    --print("peds")
    while true do
        --SetPedLodMultiplier(v,0.7) 
        for k,v in pairs(GetGamePool('CPed')) do
            ----print(v,"ped")
            SetPedLodMultiplier(v,0.0)  
            SetEntityAlpha(v,255,false)
            if not IsPedAPlayer(v) and IsPedInAnyVehicle(v) then

            elseif GetVehiclePedIsIn(v) == 0 then
                SetBlockingOfNonTemporaryEvents(v, true)
                --SetPedLodMultiplier(v,1.0)
            end
            SetPedAoBlobRendering(v,false)
        end
        --SetPedPopulationBudget(1)
        --SetVehiclePopulationBudget(2)
        -- SetDriveTaskDrivingStyle(GetPlayerPed(-1), 787260)
        -- SetDriveTaskCruiseSpeed(GetPlayerPed(-1),400.0)
        -- SetDriverRacingModifier(GetPlayerPed(-1),1.0)
        -- SetDriverAbility(GetPlayerPed(-1), 1.0)        -- values between 0.0 and 1.0 are allowed.
        -- SetDriverAggressiveness(GetPlayerPed(-1), 1.0) -- values between 0.0 and 1.0 are allowed.
        -- SetDriveTaskMaxCruiseSpeed(GetPlayerPed(-1),400.0)
        -- SetPedKeepTask(GetPlayerPed(-1), true)
        --TaskVehicleTempAction(GetPlayerPed(-1),vehicle,32,10.0)
        --TaskVehicleDriveToCoordLongrange(GetPlayerPed(-1), getveh(), x, y, z, 400.0, 787260, 10.0)
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    Wait(2000)
    SetRiotModeEnabled(false)
    while true do
        ClearAllBrokenGlass()
        ClearAllHelpMessages()
        LeaderboardsReadClearAll()
        ClearBrief()
        ClearGpsFlags()
        ClearPrints()
        ClearSmallPrints()
        ClearReplayStats()
        LeaderboardsClearCacheData()
        ClearFocus()
        ClearHdArea()
        ClearPedBloodDamage(PlayerPedId())
        ClearPedWetness(PlayerPedId())
        ClearPedEnvDirt(PlayerPedId())
        ResetPedVisibleDamage(PlayerPedId())
        ClearExtraTimecycleModifier()
        ClearTimecycleModifier()
        ClearOverrideWeather()
        ClearHdArea()
        DisableVehicleDistantlights(false)
        DisableScreenblurFade()
        SetRainLevel(0.0)
        SetWindSpeed(0.0)
        Citizen.Wait(1500)
    end
end)

function forwardvect(v,speed)
	speed = speed / 7
	return GetEntityForwardVector(v) * speed
end

local performanceModIndices = {11,12,13,16}
function PerformanceUpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleModKit(vehicle, 0)
        for i = 0, 49 do
            local modType = i
            max = GetNumVehicleMods(vehicle, modType) - 1
            SetVehicleMod(vehicle, tonumber(modType), tonumber(max), customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
    end
end

-- RegisterCommand('testupgrade', function(source, args, raw)
--     PerformanceUpgradeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), false)
-- end)