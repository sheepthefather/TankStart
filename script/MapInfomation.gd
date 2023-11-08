extends Node
# 4 15
var mapStep:int=64
#var mapSize:Vector2=Vector2(18,10)
var mapSize:Vector2=Vector2(5,5)
var wallArray;

func _init():
#	seed(0)
	var height:int=mapSize.y
	var width:int=mapSize.x
	wallArray=[]
	for i in range(width):
		var rowArray=[];
		for j in range(height):
			rowArray.append(15)
		wallArray.append(rowArray)
	pass

func initWall()->void:
	var height:int=mapSize.y
	var width:int=mapSize.x
	wallArray=[]
	for i in range(width):
		var rowArray=[];
		for j in range(height):
			rowArray.append(15)
		wallArray.append(rowArray)
	
	# create wall
	var usingWall=[]
	usingWall.append([])
	usingWall.append([])
	usingWall.append([])
	usingWall.append([])
	usingWall.append([])
	usingWall[4].append(Vector2(0,0))
	var unusingWall:Array[Vector2]=[]
	for y in range(height):
		for x in range(width):
			if x==0 && y==0:
				continue
			unusingWall.append(Vector2(x,y))
			pass
	# break wall
	while unusingWall.size()!=0:
		# rand a wall

		var randX:int=randi_range(1,4)
		if(usingWall[randX].size()==0):
			continue
		var hitedWall:int=randi_range(0,usingWall[randX].size()-1)
		var arrayPosition:Vector2=Vector2(usingWall[randX][hitedWall].x,usingWall[randX][hitedWall].y)
		var wall=wallArray[arrayPosition.x][arrayPosition.y]
		if wall==0:
			continue
		if (arrayPosition.x==0&&arrayPosition.y==0&&wall==5)||(arrayPosition.x==mapSize.x-1&&arrayPosition.y==0&&wall==9)|| \
			(arrayPosition.x==0&&arrayPosition.y==mapSize.y-1&&wall==6)||(arrayPosition.x==mapSize.x-1&&arrayPosition.y==mapSize.y-1&&wall==10):
			continue
		if (arrayPosition.y==0 && arrayPosition.x!=0&&arrayPosition.x!=mapSize.x-1)&&(wall==1):
			continue
		if (arrayPosition.y==mapSize.y-1 && arrayPosition.x!=0&&arrayPosition.x!=mapSize.x-1)&&(wall==2):
			continue
		if (arrayPosition.x==0 && arrayPosition.y!=0&&arrayPosition.y!=mapSize.y-1)&&(wall==4):
			continue
		if (arrayPosition.x==mapSize.x-1 && arrayPosition.y!=0&&arrayPosition.y!=mapSize.y-1)&&(wall==8):
			continue
		print(unusingWall.size())
		while true:
			var wallBreakDirection:int=randi_range(0,3)
			if wallBreakDirection==0 && arrayPosition.y==0:
				break
			if wallBreakDirection==1 && arrayPosition.y==mapSize.y-1:
				break
			if wallBreakDirection==2 && arrayPosition.x==0:
				break
			if wallBreakDirection==3 && arrayPosition.x==mapSize.x-1:
				break
			
			var bitFlag:int=1
			var vWallBreakDirection:int=0
			var vBitFlag:int=1
			for i in range(wallBreakDirection):
				bitFlag *=2
				pass
			match wallBreakDirection:
				0:
					vWallBreakDirection=1
				1:
					vWallBreakDirection=0
				2:
					vWallBreakDirection=3
				3:
					vWallBreakDirection=2
			for i in range(vWallBreakDirection):
				vBitFlag *=2
				pass
			if (wall & bitFlag)==0:
				break
			var culVector:Vector2=Vector2.ZERO
			match wallBreakDirection:
				0:
					culVector.y=-1
					pass
				1:
					culVector.y=1
					pass
				2:
					culVector.x=-1
					pass
				3:
					culVector.x=1
					pass
			var newArrayPosition:Vector2=arrayPosition+culVector
			if unusingWall.find(newArrayPosition)==-1:
				break
			usingWall[randX-1].append(arrayPosition)
			usingWall[randX].erase(arrayPosition)
			if unusingWall.find(newArrayPosition)>=0:
				usingWall[3].append(newArrayPosition)
				unusingWall.erase(newArrayPosition)
			wall-=bitFlag
			wallArray[arrayPosition.x][arrayPosition.y] = wall
			wallArray[newArrayPosition.x][newArrayPosition.y]-=vBitFlag
			if wallArray[newArrayPosition.x][newArrayPosition.y]==0:
				pass
			break
			pass
		pass
	print(usingWall.size())
	print(wallArray)
	pass
