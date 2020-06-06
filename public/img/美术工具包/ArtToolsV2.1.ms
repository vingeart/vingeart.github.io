macroScript VinGe_ArtTools category:"VinGe_Tools" tooltip:"ArtTools" buttonText:"ArtTools"
(
if	VinGe宏==undefined  then
(
	global  e_bit=struct e_bit
	(
			fn 保存 位图=
	(
		try return save 位图 gamma:1.0 quiet:true catch return save 位图 quiet:true
	),
		fn 节点截图 节点集:Selection=--反回位图
		(
			节点集=节点集 as array
			视口矩阵=viewport.getTM()
			actionMan.executeAction 0 "311"
			其它节点=for i in objects  where findItem 节点集 i==0 and not(i.isHidden) collect i
			hide 其它节点
			当前选择=selection as array
			clearSelection()
			max views redraw
			位图=gw.getViewportDib()------------------------------截图
			select 当前选择
			viewport.setTM 视口矩阵
			close 位图
			unhide 其它节点
			位图
		)
		
 

	)
 

	global  e_mtl=struct e_mtl
	(
		fn 渲染材质贴图 材质 保存路径 格式:".jpg" 大小:[512,512] 比例:100 类型:13  is大小:false is路径:false is格式:false is渲染贴图:true is渲染位图:true is预览:true 文件名集:#()=
		(
			-- 文件名集=#()
			 if 材质==undefined then return ok 
			 材质集=e_mtl.获取材质内所有材质 材质
			 append 材质集 材质
			 for 材质 in 材质集 do
			 (
				for i in 1 to getNumSubTexmaps 材质 do
				(
					if 类型 < 13 and classof 材质==Standardmaterial and i != 类型 then Continue
					贴图=(getSubTexmap 材质 i)
					if classof 贴图==Bitmaptexture then if findItem 文件名集 贴图.fileName!=0 then Continue
					--m=D_渲染贴图 贴图 保存路径   格式     大小      比例      is大小        is路径             is格式         is渲染贴图      is渲染位图    is预览
					m=e_map.渲染贴图 贴图 保存路径 格式:格式 大小:大小 比例:比例 is大小:is大小 is路径:is路径 is格式:is格式 is渲染贴图:is渲染贴图 is渲染位图:is渲染位图 is预览:is预览
					setSubTexmap 材质 i m
					if classof 贴图==Bitmaptexture then append 文件名集 贴图.fileName
				)
			 )
			 ok
			 --return 文件名集 
		),
		
		fn 清除贴图 &mtl 纹理名 位图名 类型ID 材质ID=
		(
			if mtl==undefined then return undefined 
			for i in 1 to getNumSubTexmaps mtl do
			(	
				--print 类型ID
				map=getSubTexmap mtl i
				if 材质ID==undefined and 类型ID==undefined and 纹理名==undefined and 位图名==undefined then map=undefined
				if 类型ID!=undefined then 
				(
					if i!=类型ID then continue
					if 纹理名==undefined and 位图名==undefined then map=undefined
				)
				if 位图名!=undefined then map= e_map.按名清除贴图 map 位图名 is文件名:true
				if 纹理名!=undefined then  map=e_map.按名清除贴图 map 纹理名 is文件名:false
				
				setSubTexmap mtl i map
			)
			if 材质ID!=undefined and 材质ID<=getNumSubMtls mtl then
			(
				m=mtl
				mtl=(getSubMtl mtl 材质ID)
				e_mtl.清除贴图 &mtl 纹理名 位图名 类型ID 材质ID
				mtl=m
			)
			else for i in 1 to getNumSubMtls mtl do
			(
				m=mtl
				mtl=(getSubMtl mtl i)
				e_mtl.清除贴图  &mtl 纹理名 位图名 类型ID undefined
				mtl=m
			)
			mtl
		),
		
		fn 获取选择的材质 节点集:Selection 是否深度获取:false=
		(
			材质集=#()

			  for i in 节点集 do if finditem 材质集 i.material==0 and i.material!= undefined then append 材质集 i.material 

			if 是否深度获取 then
			(
				深度获取集=#()
				for m in 材质集 do 
				(
					append  深度获取集 m
					内有材质=e_mtl.获取材质内所有材质  m
					for mm in 内有材质 do 
					(
						if finditem 深度获取集 mm==0 then append  深度获取集 mm
					)
				)
				return 深度获取集
			)
			else return 材质集
		),
		
		 fn 获取材质内所有材质 材质=
		 (
			 材质集=#()
			 if 材质==undefined then return 材质集
			 ciunt=getNumSubMtls 材质
			 if ciunt == 0 then return 材质集 
			 for i in 1 to ciunt do 
				(
					m=getSubMtl 材质 i
					if m!=undefined  and findItem 材质集 m==0 then
					(
						append 材质集 m
						ms=e_mtl.获取材质内所有材质 m
						 for i in 1 to ms.count do if  findItem 材质集 ms[i]==0 then append 材质集 ms[i]
					)

				)
			 return 材质集 
		 ),
		
		fn 获取材质内所有贴图 材质=
		(
			贴图集=#()
			if 材质==undefined then return 贴图集
			for i in 1 to getNumSubTexmaps 材质 do
			(
				m=(getSubTexmap 材质 i)
				贴图集+=e_map.获取贴图内所有贴图 m
				if findItem 贴图集 m==0 and m!=undefined then append 贴图集 m
			)
			for i in 1 to getNumSubMtls 材质 do
			(
				mtl=getSubMtl 材质 i
				贴图集+=e_mtl.获取材质内所有贴图 mtl
			)
			贴图集
		),
		fn 获取材质内所有位图贴图 材质=
		(
			for i in 获取材质内所有贴图 材质 where classof i==Bitmaptexture collect i
		)
	)
 

	global  E_实行工能=struct E_实行工能
	(
		fn 进度条执行 函数 数组:Selection 名字:"批处理:" 扩展:undefined =
		(
			count=数组.count
			progressstart 名字
			setProgressCancel false
			for i in 1 to count do
			(
				if getProgressCancel() then exit 
				progressUpdate(100*i/count)
				if   扩展!=undefined then 函数 数组[i]  i 扩展
				else 函数 数组[i]  i
			)
			progressEnd()
		)
	)


	global  E_文件=struct E_文件
	(

 	fn 增加文件 文件=
	(
		global 文件集
		if 文件集==undefined then 文件集=#()
		if finditem 文件集 文件==0 then append 文件集 文件
	),
	fn 获取物体文件集 节点集=
	(
		文件集=#()
		for i in 节点集 do enumerateFiles i E_文件.增加文件
	    k=文件集
		文件集=undefined
		k
	),

	fn 导出文件 文件名 节点集 资源路径:""  是否归零:false  显示UI:true 是否渲染图:true 是否截图:false=
	(
		fullMaps =#()
		undo "撤销" on 
		(
			--s=$
			select 节点集
			
			if 是否归零 then $.pos=[0,0,0]
 
			类型=getFilenameType 文件名

			if makeDir(getFilenamePath 文件名) then 
			(
				if 是否截图 then 
				(
					缩列图=e_bit.节点截图 节点集:节点集
					缩列图.filename=(getFilenamePath  文件名) + (getFilenameFile 文件名) + ".png"
					e_bit.保存 缩列图
				)
				if 是否渲染图 then
				(
					缩列图=e_bit.节点渲染图 [512,512] 节点集:节点集
					if 是否截图 then 缩列图.filename=(getFilenamePath  文件名) + (getFilenameFile 文件名) + "_渲染图.png"
					else 缩列图.filename=(getFilenamePath  文件名) + (getFilenameFile 文件名) + ".png"
					e_bit.保存 缩列图
				)
				case 类型 of
				(
					".max":
					(
						if 资源路径!="" then if makeDir 资源路径 then
						(
							位图名集=E_文件.获取物体文件集 节点集
							for i in 位图名集 do
							(
								map=资源路径+(filenameFromPath i)
								copyFile (mapPaths.getFullFilePath i) map
								append fullMaps map
							)
						)
						saveNodes 节点集 文件名 
					)
					".fbx": if 显示UI then  exportFile 文件名 selectedOnly:true else exportFile 文件名 #noPrompt selectedOnly:true 
					".obj": if 显示UI then  exportFile 文件名 selectedOnly:true else exportFile 文件名 #noPrompt selectedOnly:true 
				)
			)
			--select s
		)
		max undo 
		fullMaps
	)
	 
	)
 

)


global floaterM
rollout 批量处理 "批处理" width:330 height:255
(
	
	GroupBox A_grp1 "批量导入导出" pos:[5,135] width:320 height:115
	edittext A_exportPathUI "" pos:[70,155] width:206 height:22 readOnly:true across:3 
 
 
 
	dropdownList A_ddl9 "" pos:[237,202] width:51 height:22 items:#(".max", ".fbx", ".obj")
	checkbox A_chk1 "坐标归0" pos:[11,182] width:78 height:15 checked:true 
 
 

	button A_SetExportPathButton "..." pos:[284,155] width:25 height:22 toolTip:"显式设置导出路径"
	button A_btn16 "导出" pos:[15,226] width:100 height:20
	button A_btn17 "导入" pos:[125,226] width:100 height:20
	 
	GroupBox grp25 " 批量命名" pos:[5,10] width:320 height:115
	label lbl5 "前缀：" pos:[105,30] width:60 height:15
	label lbl1 "保留位数：" pos:[259,30] width:60 height:15
	dropdownList ddl7 "" pos:[260,50] width:55 height:22 items:#("1", "2", "3", "4", "5") selection:3 
 
 
 
	checkbox chk7 "是否截图" pos:[134,202] width:70 height:15 checked:false
	checkbox chk4 "使用物体名" pos:[135,182] width:80 height:15 checked:true
 
	label lbl4 "+" pos:[243,53] width:16 height:15
	edittext edt2 "" pos:[97,50] width:138 height:20
	button btn11 "开始处理" pos:[15,100] width:100 height:20
	label lbl13 "选择指定模型进行批处理    (自定义)+(001/002/003/....)" pos:[15,80] width:300 height:20
	dropdownList ddl9 "" pos:[10,50] width:80 height:22 items:#("材质命名", "物体命名")
	button btn30 "材质名等于物体名" pos:[150,100] width:100 height:20
	checkbox chk2 "一个物体一个文件" pos:[10,202] width:120 height:15 checked:true
	label lbl87 "文件格式：" pos:[234,182] width:60 height:15
	label lbl11 "类型：" pos:[12,30] width:40 height:15
	label lbl72 "选择路径：" pos:[10,159] width:60 height:17
	
	fn 保留位字符 数字 保留位=
	(
		numStr= 数字 as String
		if numStr.count < 保留位 then 
		(
			count= 保留位 - numStr.count
			
			str=""
			
			for i=1 to count do str+="0"
				
			
			return str + numStr
		)
		
		return numStr
	-- 	else
	-- 	(
	-- 		str=""
	-- 		
	-- 		for i=1 to 保留位   do str  = numStr[numStr.count - i +1] + str
	-- 			
	-- 		return str 
	-- 	)
	)
	fn UI =
	(
		edt2.text="新名字"
		
		--btn11.caption="开始" + ddl9.items[ddl9.selection]
		if	VinGe宏!=undefined  then  btn9.visible=false
 
		btn30.visible=	ddl9.items[ddl9.selection]=="材质命名"
		/* if	ddl9.items[ddl9.selection]=="图片命名" then
		(	
			 
			-- lbl2.visible=true
			-- ddl2.visible=true
			-- lbl3.visible=true
			lbl13.text="修改硬盘中的图片文件名,及图片格式规则:\n(自定义)+(001/002/003/....) +(图片格式)"
		)
		else */
		(
			-- lbl2.visible=false
			-- ddl2.visible=false
			-- lbl3.visible=false
			lbl13.text="选择指定模型进行批处理\n(自定义)+(001/002/003/....)"
		)
	)
	/*fn 执行图片命名 贴图 n 扩展=
	(
		文件成功的=扩展[1]
		文件原成功的=扩展[2]
		id=扩展[3]
		保留位=扩展[4]
		格式=扩展[5]
		NamePrefix=扩展[6]
		if classof 贴图==Bitmaptexture then  
		(
			fileName = mapPaths.getFullFilePath   贴图.fileName
			item=findItem 文件原成功的 fileName
			if item ==0 then
			(
				fileType =getFilenameType  fileName
				ml=getFilenamePath  fileName
				newfileName=""
				if 格式!="" and 格式!=fileType then 
				( 
					newfileName =		ml   +  NamePrefix  +( 保留位字符 id 保留位) + 格式
					if fileName!=newfileName then
					(
					--
						try 
						(
							map=贴图.bitmap 
							map.filename=newfileName
							try save map gamma:1.0 quiet:true catch   save map quiet:true
							close map
							贴图.fileName=newfileName
							append 文件成功的  newfileName
							append 文件原成功的   fileName
							
							DeleteFile fileName
							id+=1
						)
						catch()
					 )
				 )
				 else
				(
					newfileName = ml   +  NamePrefix  +( 保留位字符 id 保留位) + fileType
					renameFile	fileName	newfileName
					 
					贴图.fileName=newfileName
					id+=1
				)
			)
			else 贴图.fileName=文件成功的[item]
		)
		扩展[3]=id
	)*/
 
	fn 执行物体命名 obj n 扩展=
	(
		obj.name=扩展[1] + ( 保留位字符 n 扩展[2])
	)
 
	

	

	on A_SetExportPathButton pressed do
	(
		if (doesfileexist (exportPath as String)) then thePath = getSavepath initialDir:(exportPath)
		else thePath = getSavepath initialDir:(maxfilepath)
	
		if thePath != undefined then 
		(
			--exportPath = thePath
			--SetAppData rootNode 77900 exportPath
		    A_exportPathUI.text = thePath	
		)
	)
	on A_btn16 pressed do
	(
		PathL =A_exportPathUI.text 
		
		
		if not makeDir PathL then
		(
			messagebox "文件夹路径写法不对" title:"提示"
			return false
		)
	
		objs=Selection as array
		if objs.count==0 then
		(
			messagebox "请选择物体   "  title:"提示"
			return ok
		)
		
		
		macros.run "Medit Tools" "clear_medit_slots"    --清空材质编辑器
		ATSOps.Refresh()                                --刷新
		id=1
		
		if	chk2.checked then
		(
			isshow=true
			
			for m in objs do 
			(
				
				file=""
			if chk4.checked then
			(
				file = PathL + "\\" + m.name  +    A_ddl9.items[A_ddl9.selection] 
			)
			else 
			(
				
				file = PathL + "\\" +  (保留位字符 id 3) +    A_ddl9.items[A_ddl9.selection] 
			)
				
				--file = PathL + "\\" + A_edt2.text +  (保留位字符 id 3) +    A_ddl9.items[A_ddl9.selection] 
				E_文件.导出文件 file #(m) 资源路径:PathL 是否归零:A_chk1.checked 显示UI:isshow 是否渲染图:false  是否截图:chk7.checked
				id+=1
				
				isshow=false
			)
		)
		else
		(
			file=""
			if chk4.checked then
			(
				file = PathL + "\\" + objs[1].name  +    A_ddl9.items[A_ddl9.selection] 
			)
			else 
			(
				
				file = PathL + "\\" +    A_ddl9.items[A_ddl9.selection] 
			)
			E_文件.导出文件 file objs 资源路径:PathL 是否归零:A_chk1.checked 是否渲染图:false  是否截图:chk7.checked
		)
	)
	on A_btn17 pressed do
	(
		shouUi=true
		firectory =A_exportPathUI.text 
		if not makeDir firectory then
		(
			messagebox "文件夹路径写法不对   " title:"提示"
			return ok
		)
		dir =dotNetobject "System.IO.DirectoryInfo" firectory
	    listFile   = dir.GetFileSystemInfos()
	    FullNames=for m in listFile where A_ddl9.items[A_ddl9.selection]  ==  (getFilenameType m.FullName) collect  m.FullName
		if FullNames.count==0 then 
		(
	     	messagebox "没有找到模型文件   " title:"提示"
			return ok
		)
		for 文件名 in FullNames do 
		(
			case getFilenameType 文件名 of
			(
				".max": 
				(
					clearSelection()
					mergeMAXFile 文件名 (getmaxfileobjectnames 文件名) #select #mergeDups #renameMtlDups
					mapPaths.add(getFilenamePath 文件名)
				)
				".obj": 
				(
					clearSelection()
					if shouUi then importFile 文件名  
					else importFile 文件名  #noPrompt
					mapPaths.add(getFilenamePath 文件名)
					 
				)
				".fbx": 
				(
					clearSelection()
					if shouUi then importFile 文件名  
					else importFile 文件名  #noPrompt
					mapPaths.add(getFilenamePath 文件名)
					 
				)
			)
			shouUi=false
		)
		
		
	)
	on chk4 changed state do
		ui()
	on btn11 pressed do
	(
		if edt2.text=="" then  
		(
		   messagebox "前缀名不能为空   " title:"提示"
		   return ok
		)
	    objs= Selection
	    if objs.count==0 then messagebox "请选择多个物体   " title:"提示"
		else 
		(
			case ddl9.items[ddl9.selection] of
			(
				"材质命名":(
					材质集=e_mtl.获取选择的材质 节点集:objs 是否深度获取:true
				     if 材质集.count==0 then 
					 (
						 messagebox "没有找到材质" title:"提示"
						 return ok
					 )
				    E_实行工能.进度条执行 执行物体命名 名字:"选择命名" 数组:材质集 扩展:#(edt2.text ,ddl7.selection)
				)
				"物体命名":(
					E_实行工能.进度条执行 执行物体命名 名字:"物体命名" 数组:objs 扩展:#(edt2.text ,ddl7.selection)
				)
			)
		)
	)
	on ddl9 selected sel do
		UI()
	on btn30 pressed do
	(
		a=getcurrentselection()
		if a.count!=0 then
		(
			for i in 1 to a.count do 
			(
				if a[i].material!=undefined then a[i].material.name=a[i].name
			)
		)
		else messagebox "请选择物体   " title:"提示"
	)
)


rollout 材质组 "材质" width:320 height:80
(
	button btn20 "按材质选择" pos:[5,30] width:100 height:20 toolTip:"选择一个物体后，点击，可以选择场景内所有该材质的物体"
	button btn21 "按材质塌陷" pos:[110,30] width:100 height:20 toolTip:"所选择的物体内，塌陷相同材质的物体。此步骤不可返回，请谨慎。"
	button btn22 "合并模型" pos:[215,30] width:100 height:20 toolTip:"合并场景内相同材质球的模型"
	button btn23 "清空材质球" pos:[110,55] width:100 height:20
	button btn24 "赋予同一材质球" pos:[110,5] width:100 height:20
	button btn25 "选择空物体" pos:[5,55] width:100 height:20 toolTip:"没有网格的物体"
	button btn26 "选择无材质物体" pos:[215,55] width:100 height:20
	button btn27 "合并同名材质球" pos:[5,5] width:100 height:20
	
	on btn20 pressed do
	(
	-----  按材质选择  -----
	  if selection.count==0 then
		(
		PushPrompt "请先选择物体..."
		)
		else
	(
	sel=#()
	  if selection[1]!=undefined then
	  mtl = selection[1].material 
	  if mtl != undefined then
	  for i in objects where i.isHidden == false and i.material == mtl do append sel i
	  if sel.count != 0 then select sel  
	)
	-----  按材质选择  -----
	)
	on btn21 pressed do
	(
	-----  按材质塌陷  -----
	  if selection.count==0 then
		(
		PushPrompt "请先选择物体..."
		)
		else
		(
		converttopoly $
		max group explode
		-----  提出所选物体的材质  -----
		sel=(selection as array)
		mtl=#()
		append mtl sel[1].material
	
		for e in sel do
		(
		n=0
		for m in mtl do
		(
		try
		(
		if e.material==m then
		(
		n+=1
		)
		)catch()
		)
		if n==0 then
		(
		append  mtl e.material 
		)
		)
		-----  END  -----
	
		-----  按材质分别塌陷物体  -----
		progressstart "Easyfrog_Collapse():"
		for e=1 to mtl.count do
		(
		progressupdate (100.0 * e / mtl.count)
		ef=#()
		for s = 1 to selection.count do 
		(
		if selection[s].material==mtl[e] then
		(
		append ef selection[s]
		)
		)
	
		for n=1 to ef.count do
		(
		try
		(
		polyop.attach ef[1] ef[n+1]
		)catch()
		)
	    
		)
		converttomesh $
		progressEnd()
		)
		-----  END  -----
	-----  按材质塌陷  -----
	)
	on btn22 pressed do
	(
	-----  合并模型  -----
		disableSceneRedraw()
		matcoll = #()
		objset = #()
		for i in 1 to scenematerials.count do
			(
			append matcoll scenematerials[i].name
			)
		undo on
		for t in 1 to scenematerials.count do
			(
			meditMaterials[24] = scenematerials[t]
			objset = objects as array
			objmatset = #()
			for g in 1 to objset.count do
				(
				if objset[g].material != undefined then
					(
					if objset[g].material.name == matcoll[t] then
						(
						append objmatset objset[g]
						)
					)
				)
			if objmatset.count > 1 then
				(
				root_obj = objmatset[1]
				convertTo root_obj TriMeshGeometry
				for y in 2 to objmatset.count do
					(
					attach root_obj objmatset[y]
					)
				root_obj.name = matcoll[t]
				)
			if objmatset.count == 1 then
				(
				objmatset[1].name = matcoll[t]
				)
			)
		enableSceneRedraw()
		completeRedraw()
	-----  合并模型  -----
	)
	on btn23 pressed do
	(
	-----  清空材质球  -----
		for i=1 to meditmaterials.count do 
		(
			meditmaterials[i]=standard()
			meditmaterials[i].name=(i as string+"-Default")
		)
		for i=1 to 24 do updateMTLInMedit meditmaterials[i]
		max mtledit
	-----  清空材质球  -----
	)
	on btn24 pressed do
	(
	-----  赋予同一材质球  -----
	objs=for i in selection where Superclassof i==Geometryclass collect i
			
			
			objs_mtl=#()
			objs=for i in selection where Superclassof i==Geometryclass collect i
			if objs.count==0 then messagebox "请选择要导入的几何物体" title:"提示"
			else 
			(
				 m=Standardmaterial()
				for i in objs  do  i.material=m
				meditMaterials[meditMaterials.count]=m
	-- 				for i in objs  do 
	-- 				(
	-- 					
	-- 					append objs_mtl i
	-- 					
	-- 				)
				--for i in 1 to objs_mtl.count where i<25 do meditMaterials[i]=objs_mtl[i].material
			)
			
			actionMan.executeAction 0 "50048"
	-----  赋予同一材质球  -----
	)
	on btn25 pressed do
	(
	-----  选择空物体  -----
		fn select0FaceObj =
	( 
		clearSelection()
		num=0
		for obj in geometry do (fv=getPolygonCount obj ;if fv[1]==0 do (num+=1;selectMore obj) )
		pushPrompt (num as string+" objects are zero face")
	) 
	select0FaceObj()
	-----  选择空物体  -----
	)
	on btn26 pressed do
	(
	-----  选择无材质物体  -----
	pt=#()
	for e in geometry do
	(
	if e.material==undefined then 
	append pt e
	)
	for s in shapes do
	(
	if s.material==undefined then
	append pt s
	)
	select pt
	-----  选择无材质物体  -----
	)
	on btn27 pressed do
	(	print ("mergeSameNameMatStart: "+localTime)
		baseM=#() --没有同名的材质
		baseMN=#()--没有同名的材质的名字
		noUseM=#()--除baseM外的同名的材质
		sm=scenematerials
		if sm.count>1 do(--if scene have no material do nothing
		baseM[1]=sm[1]
		baseMn[1]=sm[1].name
		numM=sm.count
		for i=2 to numM do --找出场景中没有同名的所有材质（同名的只取第一个）
		(
			mc=sm[i].name
			itm=findItem baseMn mc
			if itm == 0 then (append baseM sm[i];append baseMN sm[i].name) else append noUseM sm[i]
		)
		print ("analyse Scenematerial: "+localTime)
		numB=baseM.count
		geo=geometry as array
		numG=geo.count
	
		if noUseM.count>0 do for i=1 to numG do --合并同名材质
		(
			try( 
				ib=findItem baseMN (geo[i].material.name)
				if geo[i].material !=baseM[ib] do geo[i].material=baseM[ib] 
			)	catch continue
		)
		print ("merge sameNameMat:     "+localTime)
		numNO=noUseM.count
		for m=1 to numNo do deleteItem sm (findItem sm noUseM[m])--删除多余材质
		print ("finished:              "+localTime)
		)--end if sm.count>1
	)
)


rollout 模型组 "模型" width:320 height:30
(
	button btn69 "轴心点居中" pos:[5,5] width:100 height:20
	button btn70 "复制模型" pos:[110,5] width:100 height:20 toolTip:"多个Max之间的复制粘贴"
	button btn71 "粘贴模型" pos:[215,5] width:100 height:20 toolTip:"多个Max之间的复制粘贴"
	
	on btn69 pressed do
	(
	-----  轴心点居中  -----
		$.pivot=$.center
	-----  轴心点居中  -----
	)
	on btn70 pressed do
	(
	-----  复制模型  -----
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastefile.max" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
		
		if $ != undefined do 
			saveNodes $ thecopypastestring --this saves ("copies") the objects as a file
	-----  复制模型  -----
	)
	on btn71 pressed do
	(
	-----  粘贴模型  -----
		thecopypastedir = getdir #autoback -- CHANGE THIS TO ANY FOLDER YOU WANT
		thecopypastefile = "\pastefile.max" --this is the filename to save as...
		thecopypastestring = thecopypastedir + thecopypastefile --this is the complete string
	
		mergemaxfile (thecopypastedir + thecopypastefile) #select --this merges ("pastes") and selects  objects from file
	-----  粘贴模型  -----
	)
)


rollout other "其他" width:330 height:30
(
	button btn33 "归档" pos:[115,5] width:100 height:20
	
	on btn33 pressed do
	(
			-----  归档  -----
			actionMan.executeAction 0 "40085"
			-----  归档  -----
		)
)


rollout 说明 "说明文档" width:330 height:513
(
	button btn11 "版本更新" pos:[210,5] width:100 height:20
	label lbl31 "a、材质命名：" pos:[10,131] width:91 height:15
	label lbl32 "        例如：前缀名为：Ice，保留位数为3。则批量生成的命名为Ice001、Ice002..." pos:[10,198] width:310 height:28
	label lbl33 "        可以在前缀那输入自定义名称和选择保留位数，其中保留位数为序列号。然后点击开始处理，即可批量修改所选择物体的材质球名称" pos:[10,151] width:310 height:47
	GroupBox grp11 "批量命名" pos:[5,117] width:320 height:258
	label lbl34 "注意事项：" pos:[10,31] width:68 height:15
	label lbl69 "        单位设置里的 系统单位设置 改为厘米。材质球系统使用精简版材质球编辑器，使用6 X 4示例窗。" pos:[10,51] width:300 height:30
	label lbl20 "介绍说明：" pos:[10,91] width:88 height:15
	label lbl21 "        如果点击“材质球等于物体名”则会直接更改材质球的名称为物体的名称" pos:[10,235] width:310 height:30
	label lbl22 "b、物体命名" pos:[10,272] width:115 height:15
	label lbl23 "        选中想要修改名称的物体，在前缀那输入自定义名称和选择保留位数，其中保留位数为序列号。 然后点击开始处理，即可批量修改所选择物体的名称" pos:[10,291] width:310 height:45
	label lbl24 "        例如：前缀名为：Ice，保留位数为3。则批量生成的命名为Ice001、Ice002..." pos:[10,340] width:310 height:29
	label lbl26 "        当物体的贴图合并后，直接全选想要共用一个材质球的物体，然后点击该按钮，即可在材质编辑器中赋予它们同一个材质球。" pos:[10,411] width:310 height:43
	label lbl27 "        由于大部分人的习惯会先使用前面的材质球，所以新生成的材质球放在最后面那个。（材质编辑器需要使用6 X 4示例窗查看）" pos:[10,456] width:310 height:46
	GroupBox grp6 "赋予同一材质球" pos:[5,387] width:320 height:115
	label lbl13 "版权所有： VinGe (QQ:295978222)" pos:[10,5] width:180 height:15
 
	on btn11 pressed do
		shellLaunch  @"http://vingeart.cn/2018-02-09-fbx%E7%BE%8E%E6%9C%AF%E5%B7%A5%E5%85%B7%E5%8C%85/" "http://vingeart.cn"
)


if	VinGe宏 !=undefined  do closeRolloutFloater floaterM
floaterM=newRolloutFloater "美术工具包_V2.1" 345 350
addRollout 说明 floaterM rolledUp:true
addRollout 批量处理 floaterM
addRollout 材质组 floaterM rolledUp:false
addRollout 模型组 floaterM rolledUp:false
addRollout other floaterM rolledUp:false
)