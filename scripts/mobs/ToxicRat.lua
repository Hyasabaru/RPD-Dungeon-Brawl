

local RPD = require "scripts/lib/commonClasses"

local mob = require "scripts/lib/mobs"

local kinds = {}

kinds[1] = {}

kinds[1].blob = RPD.Blobs.ToxicGas

kinds[1].immunity = RPD.Blobs.ToxicGas

kinds[1].speck = RPD.Sfx.Speck.TOXIC

local function ToxicityRat()

    local data

    return {

        stats = function(self)

            data = mob.restoreData(self)

            data.kind = data.kind or math.random(1, 3)

            mob.storeData(self,data)

            self:addImmunity(kinds[data.kind].immunity)

        end,

        act = function(self)

            RPD.placeBlob(kinds[data.kind].blob, self:getPos(), 50);

        end

    }

end

return mob.init(ToxicityRat())
