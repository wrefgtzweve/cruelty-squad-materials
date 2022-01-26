local materials = {}

local function randomizeMaterials()
    for i = 1, 194 do
        local temp = Material( "crueltysquad/crueltysquad (" .. i .. ").png", "noclamp smooth" )
        table.insert( materials, temp:GetTexture( "$basetexture" ) )
    end

    local mapMaterials = {}
    for _, b in ipairs( game.GetWorld():GetBrushSurfaces() ) do
        if not b:IsWater() then
            mapMaterials[b:GetMaterial():GetName()] = true
        end
    end

    for name in pairs( mapMaterials ) do
        local mat = Material( name )
        mat:SetTexture( "$basetexture", materials[math.random( 1, #materials )] )
        mat:SetUndefined( "$bumpmap" )
        mat:SetUndefined( "$detail" )
        mat:SetUndefined( "$basetexture2" )
        mat:SetUndefined( "$envmap" )
    end
end

hook.Add( "InitPostEntity", "LoadCrueltySquadMaterials", function()
    randomizeMaterials()
    randomizeMaterials()
end)

concommand.Add( "crueltysquad_randomize", randomizeMaterials )
