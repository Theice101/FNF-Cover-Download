function onCreate()
	if difficulty == 0 then
		addLuaScript('taikoInput')
	end
	makeLuaSprite('bg','characters/zanta/bg',-52.6,86.65)
	makeAnimatedLuaSprite('gate','characters/zanta/gate',1099.85,-3.7)
	addAnimationByIndices('gate','close','gate','0',24)
	addAnimationByIndices('gate','open','gate','1',24)
	objectPlayAnimation('gate','close')
	addLuaSprite('bg',false)





	makeAnimatedLuaSprite('santa','characters/zanta/Santa',1550.65,92.95)

	addAnimationByPrefix('santa','idle','santa0',24,false)
	addAnimationByPrefix('santa','alt','santa alt',24,false)
	addAnimationByPrefix('santa','hurt','santa hurt',24,false)
	addAnimationByPrefix('santa','bald','santa BALD',24,false)
	addLuaSprite('santa',false)
	objectPlayAnimation('santa','idle')








	addLuaSprite('gate',false)

	makeAnimatedLuaSprite('Theiceass','characters/zanta/Theiceass',50,0)

	addAnimationByPrefix('Theiceass','idle','Theiceass idle',24,false)
	addAnimationByPrefix('Theiceass','singLEFT','Theiceass left',24,false)
	addAnimationByPrefix('Theiceass','singDOWN','Theiceass gun down',24,false)
	addAnimationByPrefix('Theiceass','singUP','Theiceass up',24,false)
	addAnimationByPrefix('Theiceass','singRIGHT','Theiceass right',24,false)
	addAnimationByPrefix('Theiceass','idleboobs','Theiceass gun idle',24,false)
	addAnimationByPrefix('Theiceass','shoot','Theiceass shoot',24,false)
	addAnimationByPrefix('Theiceass','shot','Theiceass shot',24,false)
	
	scaleObject('Theiceass', 0.6, 0.6);


	addLuaSprite('Theiceass',true)



	makeAnimatedLuaSprite('Geekass','characters/zanta/Geekass',-150,0)
	addAnimationByIndices('Geekass','idle','Geekass idle','0',24)
	addAnimationByIndices('Geekass','hm','Geekass idle','1',24)
	
	scaleObject('Geekass', 0.5, 0.5);
		
	addLuaSprite('Geekass',true)

	makeLuaSprite('bartop','',0,0)
	makeGraphic('bartop',1280,100,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','',0,620)
	makeGraphic('barbot',1280,100,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('bartop',0,0)
	setScrollFactor('barbot',0,0)
	setObjectCamera('bartop','hud')
	setObjectCamera('barbot','hud')
end

local originy = 0
function onCreatePost()
	originy = getProperty('boyfriend.y')

	setProperty('gf.visible',false)
	
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end


	--triggerEvent('Camera Follow Pos','900','360')
	setProperty('camFollow.y',360)
	setProperty('camFollow.x',900)
	setProperty('camPos.x',0)
	setProperty('camPos.y',0)
	setProperty('camGame.scroll.x',640)
	setProperty('camGame.scroll.y',360)


	

end


function goodNoteHit(id,d,t,s)

	if getPropertyFromGroup('notes',id,'gfNote') then
	TheiceassAnim(d)
	end

end
function opponentNoteHit(id,d,t,s)

	if getPropertyFromGroup('notes',id,'gfNote') then
	TheiceassAnim(d)
	end


end
function TheiceassAnim(anim)

	anims = {'singLEFT','singDOWN','singUP','singRIGHT'}

	doTweenY('Theiceassss','Theiceass.offset',0,100,'linear')
	objectPlayAnimation('Theiceass',anims[anim+1])
	runTimer('Theiceasssing',(stepCrochet/1000)*6.1)

end
function onUpdatePost()
	--setProperty('camHUD.zoom',0.8)


end
function onTimerCompleted(t,l,ll)

	if t == "Theiceasssing" then
		objectPlayAnimation('Theiceass','idleboobs')
	end

end
function onEvent(n,v1,v2)

if n == "duet" then

	duet = v1 == "true"

end

if n == "edd sing" then
setProperty('health',getProperty('health')+0.01)
		setProperty('boyfriend.y',originy+20)
		doTweenY('wifjwif','boyfriend',originy,0.08,'linear')

end
if n == "Theiceass sing" then
TheiceassAnim(tonumber(v1))

end

end
function onBeatHit()
	if duet then
			triggerEvent('Camera Follow Pos','1000','360')

	else
		if mustHitSection then
		
			triggerEvent('Camera Follow Pos','600','360')

		else
			triggerEvent('Camera Follow Pos','1440','360')

		end
	end

	setProperty('Geekass.y',186+40)
	doTweenY('Geekassbounce','Geekass',100,0.15,'circOut')

	setProperty('Theiceass.y',50.25+20)
	doTweenY('Theiceassbounce','Theiceass',0,0.15,'cubeOut')


end
