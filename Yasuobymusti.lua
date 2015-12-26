if GetObjectName(GetMyHero()) ~= "Yasuo" then return end

require("Inspired")

YasuoMenu = Menu("Yasuo", "Yasuo")	
YasuoMenu:SubMenu("Combo", "Combo")
YasuoMenu.Combo:Boolean("Q", "Use Q", true)
YasuoMenu.Combo:Boolean("E", "Use E", false)
YasuoMenu.Combo:Boolean("R", "Use R", false)
YasuoMenu.Combo:Boolean("RHP", "Use R HP", true)
YasuoMenu.Combo:Slider("RP", " R HP Enemy", 45, 1, 100, 1)

YasuoMenu:SubMenu("Harass", "Harass")
YasuoMenu.Harass:Boolean("Q", "Use Q ", true)

YasuoMenu:SubMenu("AutoQ", "AutoQ")
YasuoMenu.AutoQ:Boolean("AQ", "Use Q ", false)

YasuoMenu:SubMenu("DMG", "Draw DMG")
YasuoMenu.DMG:Boolean("Q", "Draw Q Dmg", true)
YasuoMenu.DMG:Boolean("E", "Draw E Dmg", true)
YasuoMenu.DMG:Boolean("R", "Draw R Dmg", true)

YasuoMenu:SubMenu("LaneClear", "LaneClear")
YasuoMenu.LaneClear:Boolean("LQ", "LaneClear with Q", true)
YasuoMenu.LaneClear:Boolean("LE", "LaneClear with E", false)
YasuoMenu.LaneClear:Boolean("LHE", "Lasthit whit E in LaneClear", true)

YasuoMenu:SubMenu("JungleClear", "JungleClear")
YasuoMenu.JungleClear:Boolean("JQ", "JungleClear with Q", true)
YasuoMenu.JungleClear:Boolean("JE", "JungleClear with E", true)

YasuoMenu:SubMenu("Lasthit", "Lasthit")
YasuoMenu.Lasthit:Boolean("Q", "Lasthit with Q", true)
YasuoMenu.Lasthit:Boolean("E", "Lasthit with E", false)

YasuoMenu:SubMenu("Killsteal", "Killsteal")
YasuoMenu.Killsteal:Boolean("Q", "Killsteal with Q", true)
YasuoMenu.Killsteal:Boolean("E", "Killsteal with E", true)
YasuoMenu.Killsteal:Boolean("R", "Killsteal with R", true)

YasuoMenu:SubMenu("Drawings", "Drawings")
YasuoMenu.Drawings:Boolean("Q", "Draw Q Range", true)
YasuoMenu.Drawings:Boolean("EQ", "Draw EQ Range", false)
YasuoMenu.Drawings:Boolean("E", "Draw E Range", false)
YasuoMenu.Drawings:Boolean("R", "Draw R Range", false)
YasuoMenu.Drawings:Boolean("Mouse", "Draw Mouse E Range", false)

 ---COMBOOO---
OnTick(function(myHero)
        if IOW:Mode() == "Combo" then
                       local mousePos = GetMousePos()
                        local target = GetCurrentTarget()
                         
                        

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GetDistance(myHero, target) <= 450 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, target) <= 300  and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GetDistance(myHero, target) <= 450 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(target, 470) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 0 and GetDistance(myHero, target) <= 300 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1200,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and QPred.HitChance == 1 and ValidTarget(target, 1000) and GetDistance(myHero, target) <= 950 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 1000) and QPred.HitChance == 1 and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, target) <= 300 and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 475) and GetDistance(target ,mousePos) <= 100 and YasuoMenu.Combo.E:Value() then
                        CastTargetSpell(target, _E)
                        end

                        if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 1300) and YasuoMenu.Combo.R:Value() then
                        CastSpell(_R)
                        end

						if CanUseSpell(myHero, _R) == READY and ValidTarget(target, 1300) and YasuoMenu.Combo.RHP:Value() and CanUseSpell(myHero,_R) == READY and YasuoMenu.Combo.RP:Value() and (GetCurrentHP(target)/GetMaxHP(target))*100 <= YasuoMenu.Combo.RP:Value() then
                        CastSpell(_R)
                        end

end
end)
---HARASS----
OnTick(function(myHero)
                        
                        if IOW:Mode() == "Harass" then
                       
                        local target = GetCurrentTarget()

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetDistance(myHero, target) <= 400 and QPred.HitChance == 1 and ValidTarget(target, 470) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and GetDistance(myHero, target) <= 400 and ValidTarget(target, 470) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1200,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and QPred.HitChance == 1 and GetDistance(myHero, target) <= 1000 and ValidTarget(target, 950) and YasuoMenu.Combo.Q:Value() then 
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        
                        end

        end
		
----LANECLEAR---
        if IOW:Mode() == "LaneClear" then
for i=1, IOW.mobs.maxObjects do
        local minion = IOW.mobs.objects[i]
local mousePos = GetMousePos()
    local minionPos = GetOrigin(minion)

                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),math.huge,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 520) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end
        
                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),math.huge,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 520) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),1200,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and ValidTarget(minion, 1000) and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, minion) <= 300 and YasuoMenu.LaneClear.LQ:Value() then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end
                        if CanUseSpell(myHero, _E) == READY and ValidTarget(minion, 475) and GetDistance(minion ,mousePos) <= 100 and YasuoMenu.LaneClear.LE:Value() then
                        CastTargetSpell(minion, _E)
                    end
                        if CanUseSpell(myHero, _E) == READY and ValidTarget(minion, 475) and GetDistance(minion ,mousePos) <= 100 and YasuoMenu.LaneClear.LHE:Value() and GetCurrentHP(minion) < CalcDamage(myHero, minion, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero)))) then
                        CastTargetSpell(minion, _E)
        end
    end
end
---JUNGLECLEAR----
if IOW:Mode() == "LaneClear" then
for _,jungle in pairs(minionManager.objects) do
if GetTeam(jungle) == 300 then 
local mousePos = GetMousePos()
local junglePos = GetOrigin(jungle)

                        local QPred = GetPredictionForPlayer(myHeroPos(),jungle,GetMoveSpeed(jungle),math.huge,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(jungle, 520) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end
        
                        local QPred = GetPredictionForPlayer(myHeroPos(),jungle,GetMoveSpeed(jungle),math.huge,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(jungle, 520) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),jungle,GetMoveSpeed(jungle),1200,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and ValidTarget(jungle, 1000) and YasuoMenu.JungleClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        elseif CanUseSpell(myHero, _Q) == READY and ValidTarget(jungle, 1000) and GotBuff(myHero, "yasuodashcalar") == 1 and GetDistance(myHero, jungle) <= 300 and YasuoMenu.LaneClear.JQ:Value() then 
                        CastSkillShot(_Q,junglePos.x, junglePos.y, junglePos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and ValidTarget(jungle, 475) and GetDistance(jungle ,mousePos) <= 100 and YasuoMenu.JungleClear.JE:Value() then
                        CastTargetSpell(jungle, _E)


       
        end
	end
    end
end
---LASTHIT---
      if IOW:Mode() == "LastHit" then
for i=1, IOW.mobs.maxObjects do
        local minion = IOW.mobs.objects[i]
local mousePos = GetMousePos()
local minionPos = GetOrigin(minion)

                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),math.huge,250,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 520) and YasuoMenu.Lasthit.Q:Value() and GetCurrentHP(minion) < CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),math.huge,271,520,15,false,false)
                        if CanUseSpell(myHero, _Q) == READY and ValidTarget(minion, 520) and YasuoMenu.Lasthit.Q:Value()and GetCurrentHP(minion) < CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        local QPred = GetPredictionForPlayer(myHeroPos(),minion,GetMoveSpeed(minion),1200,250,1100,55,false,false)
                        if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and ValidTarget(minion, 1000) and YasuoMenu.Lasthit.Q:Value() and GetCurrentHP(minion) < CalcDamage(myHero, minion, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                        CastSkillShot(_Q,minionPos.x, minionPos.y, minionPos.z)
                        end

                        if CanUseSpell(myHero, _E) == READY and ValidTarget(minion, 475) and YasuoMenu.Lasthit.E:Value() and GetDistance(minion ,mousePos) <= 100 and GetCurrentHP(minion) < CalcDamage(myHero, minion, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero)))) then
                        CastTargetSpell(minion, _E)

        end
    end
end
---AUTOQ----
local target = GetCurrentTarget()

                       local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,250,520,15,false,false)
                       if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 520) and GetDistance(myHero, target) <= 400 and YasuoMenu.AutoQ.AQ:Value() then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                       end

                       local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,271,520,15,false,false)
                       if CanUseSpell(myHero, _Q) == READY and ValidTarget(target, 520) and GetDistance(myHero, target) <= 400 and YasuoMenu.AutoQ.AQ:Value() then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                       end

                       local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1200,250,1100,55,false,false)
                       if CanUseSpell(myHero, _Q) == READY and GetCastName(myHero, _Q) == "yasuoq3w" and ValidTarget(target, 1100) and GetDistance(myHero, target) <= 1000 and YasuoMenu.AutoQ.AQ:Value() then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                   
                    end
 ---KILLSTEAL----
for i,enemy in pairs(GetEnemyHeroes()) do
local QPred = GetPredictionForPlayer(myHeroPos(),enemy,GetMoveSpeed(enemy),1200,250,GetCastRange(myHero,_Q),90,false,false)              
               
                if CanUseSpell(myHero, _Q) == READY and YasuoMenu.Killsteal.Q:Value() and QPred.HitChance == 1 and ValidTarget(enemy,GetCastRange(myHero,_Q)) and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then 
                 CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                 end

                 if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy, 1300) and YasuoMenu.Killsteal.R:Value() and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0) then
                 CastSpell(_R)
                 end

                 if CanUseSpell(myHero, _E) == READY and ValidTarget(enemy, 475) and YasuoMenu.Killsteal.E:Value() and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero)))) then
                        CastTargetSpell(enemy, _E)
                        end
end
end)
 ---DRAWINGS----
OnDraw(function(myHero)

for i,enemy in pairs(GetEnemyHeroes()) do

    if CanUseSpell(myHero,_Q) == READY and ValidTarget(enemy, 2000) and YasuoMenu.DMG.Q:Value() then
    local trueDMG = CalcDamage(myHero, enemy, (20*GetCastLevel(myHero,_Q) + 1.0*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if CanUseSpell(myHero,_E) == READY and ValidTarget(enemy, 2000) and YasuoMenu.DMG.E:Value() then 
    local trueDMG = CalcDamage(myHero, enemy, 0, (30*GetCastLevel(myHero,_E) + 40 + 0.6*(GetBonusAP(myHero))))
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end

    if ValidTarget(enemy, 2000) and YasuoMenu.DMG.R:Value() then 
    local trueDMG = CalcDamage(myHero, enemy, (100*GetCastLevel(myHero,_R) + 100 + 1.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero))),0)
    DrawDmgOverHpBar(enemy,GetCurrentHP(enemy),trueDMG,0,0xffffff00)
    end
    
end

local mousePos = GetMousePos()

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "YasuoQW" then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,475,3,100,0xffffff00) end

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "yasuoq2w" then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,475,3,100,0xffffff00) end

if YasuoMenu.Drawings.Q:Value() and GetCastName(myHero, _Q) == "yasuoq3w" then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,1000,3,100,0xffffff00) end

if YasuoMenu.Drawings.E:Value() then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,475,3,100,0xffffff00) end

if YasuoMenu.Drawings.EQ:Value() then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,300,3,100,0xffffff00) end

if YasuoMenu.Drawings.R:Value() then DrawCircle(myHeroPos().x, myHeroPos().y, myHeroPos().z,1200,3,100,0xffffff00) end

if YasuoMenu.Drawings.Mouse:Value() then DrawCircle(mousePos.x, mousePos.y, mousePos.z,100,3,100,0xffffff00) end


end)

PrintChat("High Noon Yasuo by Musti")
PrintChat("Credits to: Zypppy - This is a reworked version of his script.")
PrintChat("Version 1.1")
