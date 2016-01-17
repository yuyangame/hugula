------------------------------------------------
--  Copyright © 2013-2014   Hugula: Arpg game Engine
--   
--  author pu
------------------------------------------------
local CUtils=CUtils
local FileHelper=toluacs.FileHelper   --luanet.import_type("FileHelper")
local Loader = Loader
local Model = Model
local json = json
local split = split

local url_unit="Unit"

local line_count
local row_num
local sheet_name
function json.onDecodeError(message, text, location, etc)
    print(string.format("json.onDecodeError %s line:%d,row:%d %s ",sheet_name,line_count,row_num,text))
    print(location)
end
--parse key value to luaTable
local function decode_to_Lua(text)
	local datas={}
	local lines = string.split(text,"\n")
	local names = lines[2]
	local columNames = string.split(names,";")
	local CNLen = #columNames

	line_count=#lines-1
	for i=3,line_count do
		line = lines[i]
		local temp = string.split(line,";")
		local tempData = {}
		local tempItem 
		for i=1,CNLen do
			tempItem =  temp[i]
            row_num = i
			if tempItem then 
				tempItem = string.gsub(tempItem,'\\n','\n')
				local f = string.sub(tempItem,1,1)
				if f=="[" or f=="{" then tempItem = json:decode(tempItem)
				elseif string.match(tempItem,"^%d*%.?%d*$") then tempItem=tonumber(tempItem) end					
			end
			tempData[columNames[i]] =tempItem
		end
		datas[temp[1]] = tempData
	end
	return datas
end

local function decode_unit(data)
	Model.units=data
end

local function decode_ziptxt(name,context)
    sheet_name = name
	local data=decode_to_Lua(context)
	if name == url_unit then decode_unit(data)
	end
	print(name.."  decoded     ")
end


local function load_comp(req)
	FileHelper.UnpackConfigAssetBundleFn(req.assetBundle,decode_ziptxt)
	print(req.data)
	print(req.www)
	req.assetBundle:Unload(false)
	req.www:Dispose()
end

local function load_config_zip()
	local url=CUtils.GetFileFullPath(CUtils.GetAssetPath("font1.u3d"))
	Loader:get_resource(url,load_comp,false)
end

load_config_zip()