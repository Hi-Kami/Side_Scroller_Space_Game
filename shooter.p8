pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--ini
local pl--player
local enemylist
local bulletlist
local explosionlist
local starlist

function _init()
	pl=player:new(10,64,bulletlist)
	enemylist={}
	bulletlist={}
	explosionlist={}
	starlist={}
end
-->8
--update
function _update()
	--update background
	for b in all(bulletlist) do
		if(b.update()) del(bulletlist,b)
	end
	--update explosions
	--update picups
	--update enemy
	player:update()
	--update interface
end
-->8
--render
function _draw()
	cls()
	--draw background
	for b in all(bulletlist) do
			b.render()
	end
	--draw explosions
	--draw picups
	--draw enemy
	player:draw()
	--draw interface
	
		--print("")
	end
-->8
--player class
player={x=0,y=0}

function player:new(x,y,bulletlisthandle)
	tmp={}
	setmetatable(tmp,self)
	self.x=x
	self.y=y
	self.missleammo=3
	self.lazerpoints={}
	self.maxlazer=0
	self.currentlazer=1
	self.bulletlisthandle=bulletlisthandle
	self.maxlazer=0
	self.lazerpoints={}
	getlistofpixcels(self.lazerpoints,8,0,self.maxlazer)
	self.__index=self
	return tmp
end

function player:draw()
	spr(0,self.x,self.y)
	print(self.maxlazer)
end

function player:update()
--unput
	--movement
		if(btn(0) and self.x>0) self.x -= 1
  if(btn(1) and self.x<119) self.x += 1
  if(btn(2) and self.y>0) self.y -= 1
  if(btn(3) and self.y<119) self.y += 1
 --attack
 	if(btnp(4))self:firebullet()
 	if(btnp(5) and self.missleammo>0) self:firemissle()
 
end

function player:firebullet()

	if(self.currentlazer>self.maxlazer) then
		self.currentlazer=1
	end
		
		add(bulletlisthandle,bullet:new(self.lazerpoints[self.currentlazer][1],self.lazerpoints[self.currentlazer][2],true))
		self.currentlazer+=1
end

function player:firemissle()
end


-->8
--enemy class
enemy={x,y}
-->8
--bullets & explosions classes
bullet={x,y,d}

function bullet:new(x,y,d)
	tmp={}
	setmetatable(tmp,self)
	self.x=x
	self.y=y
	self.d=d
	self.__index=self
	return tmp
end

function bullet:update()
	if(self.d)then--player
		self.x+=2
		if(self.x>128)then 
			return true
		end
	else--enemy
		--todo
	end
	return false
end

function bullet:render()
	if(self.d)then--player
		spr(6, self.x, self.y, 0.5, 0.2)
	else--enemy
		--spr(6, self.x, self.y, 5, 8)
	end
end

explosion={}
-->8
--utility func
 	
function getlistofpixcels(list,col,sprite,ammount)
	for x=0,8 do
		for y=0,8 do
			if( sget( ( ( sprite * 8 ) + x ), ( ( sprite * 8 ) + y ) ) == col ) then 
				add(list,{x,y})
				ammount+=1
			end
		end
	end
end
__gfx__
0555000000035500000355550550000000003500000055518888bbbb000000000000000000000000000000000000000000000000000000000000000000000000
555777000000551000555500035510000000550000055551a9a97778000000000000000000000000000000000000000000000000000000000000000000000000
57777780010005500355510000035550000350000055555003300000000000000000000000000000000000000000000000000000000000000000000000000000
ccccc77755555dd55dd5000000000dd500dd51000335dd503bb30000000000000000000000000000000000000000000000000000000000000000000000000000
ccccc77755555dd55dd5000000000dd500dd51000335dd503bb30000000000000000000000000000000000000000000000000000000000000000000000000000
57777780010005500355510000035550000350000055555003300000000000000000000000000000000000000000000000000000000000000000000000000000
55577700000055100055550003551000000055000005555100000000000000000000000000000000000000000000000000000000000000000000000000000000
05550000000355000003555505500000000035000000555100000000000000000000000000000000000000000000000000000000000000000000000000000000
