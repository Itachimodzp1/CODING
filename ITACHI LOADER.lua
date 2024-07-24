server = "http://itachip1.pythonanywhere.com/"
tg = "https://t.me/ItachiModzz"

c = gg.makeRequest(server.."/mykey").content

ch = gg.prompt(
	{'Enter your key and pres ok to continue'},
	{[1] = c},
	{[1] = 'text'})

if ch == nill then
 gg.alert("Please enter key and press ok")
   os.exit()
end

pass = ch[1]

str = pass
if string.find(str, "/") then
  gg.alert("Invlied Key")
  os.exit()
end

if pass == "" then
      x = gg.alert("Wrong key\n Get key form here \n\n"..tg,"copy link")
   if x == 1 then 
      gg.copyText(server)
   end
   os.exit()
end

a = gg.makeRequest(server.."/login/"..pass.."").content

if a == "true" then
   gg.alert("Login Success")
elseif a =="false" then
   x = gg.alert("Wrong key\n Get key form here \n\n "..server,"copy link")
   if x == 1 then 
      gg.copyText(server)
   end
   os.exit()
else
  gg.alert("No response form server/No internet Connection")
  os.exit()
end

  function setValues(address, flags, value) gg.setValues({[1] = {address = address, flags = flags, value = value}}) end
local running = true
function setvalue(address,flags,value)
local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end
function split(szFullString, szSeparator)
    local nSplitArray = {}
    local nFindStartIndex = 1
    local nSplitIndex = 1
    
    while true do
        local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
        
        if not nFindLastIndex then
            nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
            break
        end
        
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
        nFindStartIndex = nFindLastIndex + string.len(szSeparator)
        nSplitIndex = nSplitIndex + 1
    end
    
    return nSplitArray
end
function xgxc(szpy, qmxg)
    for x = 1, #qmxg do
        local xgpy = szpy + qmxg[x]["offset"]
        local xglx = qmxg[x]["type"]
        local xgsz = qmxg[x]["value"]
        local xgdj = qmxg[x]["freeze"]
        
        if xgdj == nil or xgdj == "" then
            gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}})
        else
            gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}})
        end
    end
end
function xqmnb(qmnb)
gg.clearResults()
    gg.clearResults()
    gg.setRanges(qmnb[1]["memory"])
    gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])
    
    if gg.getResultCount() > 0 then
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])
        
        local sl = gg.getResults(999999)
        local sz = gg.getResultCount()
        
        if sz > 999999 then
            sz = 999999
        end
        
        for i = 1, sz do
            local pdjg = true
            for v = 4, #qmnb do
                local pysz = {}
                pysz[1] = {}
                pysz[1].address = sl[i].address + qmnb[v]["offset"]
                pysz[1].flags = qmnb[v]["type"]
                local szpy = gg.getValues(pysz)
                local pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value
                local szpd = split(pdpd, ";")
                local tzszpd = szpd[1]
                local pyszpd = szpd[2]
                
                if tzszpd ~= pyszpd then
                    pdjg = false
                    break
                end
            end
            
            if pdjg then
                xgxc(sl[i].address, qmxg)
            end
        end
    end
end
function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    
    local data = {}
    local base = Search[1][2]
    
    if count > 0 then
        for k = 2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base
            local num = Search[k][1]
            
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {}
                tmp[#tmp].address = v.address + offset
                tmp[#tmp].flags = v.flags
            end
            
            tmp = gg.getValues(tmp)
            
            for i, v in ipairs(tmp) do
                if tostring(v.value) ~= tostring(num) then
                    result[i].isUseful = false
                end
            end
        end
        
        for i, v in ipairs(result) do
            if v.isUseful then
                data[#data+1] = v.address
            end
        end
        
        if #data > 0 then
            local t = {}
            local base = Search[1][2]
            
            for i = 1, #data do
                for k, w in ipairs(Write) do
                    local offset = w[2] - base
                    t[#t+1] = {}
                    t[#t].address = data[i] + offset
                    t[#t].flags = Type
                    t[#t].value = w[1]
                    
                    if w[3] == true then
                        local item = {}
                        item[#item+1] = t[#t]
                        item[#item].freeze = true
                        gg.addListItems(item)
                    end
                end
            end
            
            gg.setValues(t)
            gg.addListItems(t)
            return true
        else
            return false
        end
    else
        return false
    end
end
 
           function split(A0_2269, A1_2270)
    for _FORV_6_ in (A0_2269 .. A1_2270):gmatch(_UPVALUE0_("282e2d29") .. A1_2270) do
      table.insert({}, _FORV_6_)
    end 
 
    return {}
  end 
 
  
  function setValuesOrFreeze(A0_2271, A1_2272)
    local L2_2273
    L2_2273 = {}
    for _FORV_6_ = 1, #A1_2272 do
      if A1_2272[_FORV_6_].freeze then
        table.insert(L2_2273, {address = A0_2271 + A1_2272[_FORV_6_].offset, flags = A1_2272[_FORV_6_].type, value = A1_2272[_FORV_6_].value, ["freeze"] = A1_2272[_FORV_6_].freeze})
      else
gg.setValues({{address = A0_2271 + A1_2272[_FORV_6_].offset, flags = A1_2272[_FORV_6_].type, value = A1_2272[_FORV_6_].value, ["freeze"] = A1_2272[_FORV_6_].freeze}})
      end 
 
    end 
 
    if #L2_2273 > 0 then
      gg.addListItems(L2_2273)
    end 
 
  end 
 
  
  function xqmnb(A0_2274)
    gg["clearResults"]()
    gg["setRanges"](A0_2274[1].memory)
    gg["searchNumber"](A0_2274[3].value, A0_2274[3].type)
    if gg.getResultCount() == 0 then
      return
    end 
 
    gg["refineNumber"](A0_2274[3].value, A0_2274[3].type)
    if gg.getResultCount() == 0 then
      return
    end 
 
    for _FORV_6_ = 1, #gg["getResults"](math.min(gg.getResultCount(), 10000)) do
      for _FORV_11_ = 4, #A0_2274 do
        if true and split(A0_2274[_FORV_11_].lv .. ";" .. gg.getValues({{address = gg["getResults"](math.min(gg.getResultCount(), 10000))[_FORV_6_].address + A0_2274[_FORV_11_].offset, flags = A0_2274[_FORV_11_].type}})[1].value, ";")[1] ~= split(A0_2274[_FORV_11_].lv .. ";" .. gg.getValues({{address = gg["getResults"](math.min(gg.getResultCount(), 10000))[_FORV_6_].address + A0_2274[_FORV_11_].offset, flags = A0_2274[_FORV_11_].type}})[1].value, ";")[2] then
        end 
 
      end 
 
      if false then
        setValuesOrFreeze(gg["getResults"](math.min(gg.getResultCount(), 10000))[_FORV_6_].address, qmxg)
      end 
 
    end 
 
  end 
 
  
  function searchWrite(A0_2275, A1_2276, A2_2277)
    gg["clearResults"]()
    gg["searchNumber"](A0_2275[1][1], A2_2277)
    if gg.getResultCount() == 0 then
      return false
    end 
 
    for _FORV_9_, _FORV_10_ in ipairs((gg["getResults"](math.min(gg.getResultCount(), 10000)))) do
      _FORV_10_.isUseful = true
    end 
 
    for _FORV_9_ = 2, #A0_2275 do
      for _FORV_14_, _FORV_15_ in ipairs((gg["getResults"](math.min(gg.getResultCount(), 10000)))) do
        if _FORV_15_.isUseful and tostring(gg.getValues({{address = _FORV_15_.address + (A0_2275[_FORV_9_][2] - A0_2275[1][2]), flags = _FORV_15_.flags}})[1].value) ~= tostring(A0_2275[_FORV_9_][1]) then
          _FORV_15_.isUseful = false
        end 
 
      end 
 
    end 
 
    for _FORV_9_, _FORV_10_ in ipairs((gg["getResults"](math.min(gg.getResultCount(), 10000)))) do
      if _FORV_10_.isUseful then
        table.insert({}, _FORV_10_.address)
      end 
 
    end 
 
    if #{} > 0 then
      for _FORV_10_, _FORV_11_ in ipairs({}) do
        for _FORV_15_, _FORV_16_ in ipairs(A1_2276) do
          if _FORV_16_[3] then
    gg.addListItems({{address = _FORV_11_ + (_FORV_16_[2] - A0_2275[1][2]), flags = A2_2277, value = _FORV_16_[1], ["freeze"] = true}})
          end 
 
          table.insert({}, {address = _FORV_11_ + (_FORV_16_[2] - A0_2275[1][2]), flags = A2_2277, value = _FORV_16_[1], ["freeze"] = true})
        end 
 
      end 
 
      gg.setValues({})
      gg.addListItems({})
    else
      return false
    end 
 
  end 
 
  
  function setvalue(A0_2278, A1_2279, A2_2280)
    local L3_2281
    L3_2281 = {}
    L3_2281[1] = {}
    L3_2281[1].address = A0_2278
    L3_2281[1].flags = A1_2279
    L3_2281[1].value = A2_2280
    gg.setValues(L3_2281)
  end 


    
function xgxc(A0_27, A1_28)

local L2_29, L3_30, L4_31, L5_32
L2_29 = 1
L3_30 = #A1_28
for _FORV_5_ = 1, #A1_28 do 
xgpy = A0_27 + A1_28[_FORV_5_].offset
xglx = A1_28[_FORV_5_].type
xgsz = A1_28[_FORV_5_].value
gg.setValues({
[1] = {
address = xgpy,
flags = xglx,
value = xgsz
}
})
xgsl = xgsl + 1
end 

end 


function xqmnb(A0_33)
gg.clearResults()
gg.setRanges(A0_33[1].memory)
gg.searchNumber(A0_33[3].value, A0_33[3].type)
if gg.getResultCount() == 0 then
gg.toast(A0_33[2].name .. " Active")
else
gg.refineNumber(A0_33[3].value, A0_33[3].type)
gg.refineNumber(A0_33[3].value, A0_33[3].type)
gg.refineNumber(A0_33[3].value, A0_33[3].type)
if gg.getResultCount() == 0 then
gg.toast(A0_33[2].name .. " Active")
else
sl = gg.getResults(999999)
sz = gg.getResultCount()
xgsl = 0
if 999999 < sz then
sz = 999999
end 

for _FORV_4_ = 1, sz do 
pdsz = true
for _FORV_8_ = 4, #A0_33 do 
if pdsz == true then
pysz = {}
pysz[1] = {}
pysz[1].address = sl[_FORV_4_].address + A0_33[_FORV_8_].offset
pysz[1].flags = A0_33[_FORV_8_].type
szpy = gg.getValues(pysz)
pdpd = A0_33[_FORV_8_].lv .. ";" .. szpy[1].value
szpd = split(pdpd, ";")
tzszpd = szpd[1]
pyszpd = szpd[2]
if tzszpd == pyszpd then
pdjg = true
pdsz = true
else
pdjg = false
pdsz = false
end 

end 

end 

if pdjg == true then
szpy = sl[_FORV_4_].address
xgxc(szpy, qmxg)
xgjg = true
end 

end 

if xgjg == true then
gg.toast(A0_33[2].name .. " " .. xgsl)
else
gg.toast(A0_33[2].name .. " Xong")
end 

end 

end 

end 


local info = gg.getTargetInfo()
if info == nil then
  print("Can't retrieve information about the process")
else
  if info.x64 then
    CheckBit = "x64"
  else
    CheckBit = "x32"
  end 

end 



save_td = {};
Check = 0;
gg.setVisible(true)
gg.setRanges(0)

gg.getTargetInfo()
gg.clearResults()





form_td = {
'𝗕𝗬𝗣𝗔𝗦𝗦 𝗔𝗡𝗧𝗜 𝗖𝗛𝗘𝗔𝗧',
'𝗕𝗬𝗣𝗔𝗦𝗦 𝗔𝗡𝗧𝗜 𝗥𝗘𝗣𝗢𝗥𝗧',
'𝗕𝗬𝗣𝗔𝗦𝗦 𝗟𝗢𝗕𝗕𝗬',
'𝗕𝗬𝗣𝗔𝗦𝗦 𝗟𝗢𝗚𝗢',
'𝗠𝗔𝗣𝗛𝗔𝗖𝗞         𝗜𝗡 𝗚𝗔𝗠𝗘',
'𝗗𝗥𝗢𝗡𝗘 𝗩𝗜𝗘𝗪     𝗜𝗡 𝗚𝗔𝗠𝗘',
'𝗛𝗜𝗚𝗛 𝗗𝗔𝗠𝗔𝗚𝗘   𝗜𝗡 𝗚𝗔𝗠𝗘',
'𝗨𝗣𝗚𝗥𝗔𝗗𝗘 𝗙𝗣𝗦   𝗜𝗡 𝗚𝗔𝗠𝗘',
'𝗘𝗫𝗜𝗧 𝗜𝗧𝗔𝗖𝗛𝗜 𝗟𝗢𝗔𝗗𝗘𝗥',
}
function MainForm()
ItachiCheat = gg.choice(
form_td,
Check,
"𝐈𝐓𝐀𝐂𝐇𝐈 𝐌𝐎𝐃𝐙 𝐌𝐋𝐁𝐁 𝐕𝐈𝐏\n𝐕𝐞𝐫𝐬𝐢𝐨𝐧 = 𝟏.𝟖.𝟗𝟐.𝟗𝟕𝟎𝟐\n𝐏𝐚𝐜𝐤𝐚𝐠𝐞 𝐍𝐚𝐦𝐞 = 𝐌𝐨𝐛𝐢𝐥𝐞 𝐋𝐞𝐠𝐞𝐧𝐝 𝐔𝐧𝐢𝐭𝐲𝐊𝐢𝐥𝐥𝐬𝐌𝐞\n𝐒𝐭𝐚𝐭𝐮𝐬 = 𝐒𝐚𝐟𝐞")
if ItachiCheat == 1 then
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x5c1539c, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x5c1539c + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x2f9d390, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x2f9d390 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x2f9d394, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x2f9d394 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x5c15398, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x5c15398 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x57EBF28, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x57EBF28 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x57E7D90, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x57E7D90 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D600, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D600 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D608, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D608 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D618, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D618 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D620, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D620 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D630, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D630 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D638, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D638 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D640, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D640 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D648, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D648 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D650, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D650 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D660, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D660 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D668, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D668 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D678, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D678 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D680, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D680 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D690, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D690 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D698, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D698 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D6A8, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D6A8 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D6B0, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D6B0 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D6C0, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D6C0 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D6C8, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D6C8 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
local LibStart = gg.getRangesList('liblogic.so')[1].start
local values = {
    { address = LibStart + 0x12D6D8, value = 'h C0 03 5F D6', flags = 4 },
    { address = LibStart + (0x12D6D8 + 0x4), value = 'h C0 03 5F D6', flags = 4 }
}
for _, v in ipairs(values) do
    gg.setValues({ v })
end
gg.alert("𝐀𝐍𝐓𝐈 𝐂𝐇𝐄𝐀𝐓 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
Check = ItachiCheat
save_td[1] = Check
end 

if ItachiCheat == 2 then

local LibStart = gg.getRangesList('liblogic.so')[1].start
gg.setValues({ -- table(d689ec6)
	[1] = { -- table(9101e87)
		['address'] = 0xe0cd2b0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(8c61c23)
	[1] = { -- table(efed520)
		['address'] = 0xe0cd310,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(fcc234c)
	[1] = { -- table(5745f95)
		['address'] = 0xe0cd344,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(2086011)
	[1] = { -- table(8fc4576)
		['address'] = 0xe0cd374,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(a5f4302)
	[1] = { -- table(6865413)
		['address'] = 0xe0cd470,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(debb6d6)
	[1] = { -- table(e963d57)
		['address'] = 0xe0cd4a0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(70d3b5e)
	[1] = { -- table(16d1b3f)
		['address'] = 0xe0cd4d8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(210c1c2)
	[1] = { -- table(a37cbd3)
		['address'] = 0x25e0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(cdc3ae6)
	[1] = { -- table(79b5827)
		['address'] = 0x2628,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(6b12aca)
	[1] = { -- table(6b4f43b)
		['address'] = 0x27c0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(fd9d56e)
	[1] = { -- table(fdb940f)
		['address'] = 0x2a24,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(f4d3ed2)
	[1] = { -- table(573eba3)
		['address'] = 0x2a70,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(7132af6)
	[1] = { -- table(a846ef7)
		['address'] = 0x2ae0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.clearResults()

gg.setValues({ -- table(b7978e8)
	[1] = { -- table(ff5b01)
		['address'] = 0xe2892bc,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(8d0692c)
	[1] = { -- table(4d05ff5)
		['address'] = 0xe2892d8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(10d2630)
	[1] = { -- table(d5c12a9)
		['address'] = 0xe28930c,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(fea13f4)
	[1] = { -- table(b77071d)
		['address'] = 0xe289310,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(255ebdb)
	[1] = { -- table(2d45678)
		['address'] = 0xe28933c,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(e6fd1bc)
	[1] = { -- table(aebc545)
		['address'] = 0xe289350,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(dea57fd)
	[1] = { -- table(e44bcf2)
		['address'] = 0xe1791cb0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(8b3c284)
	[1] = { -- table(fe63a6d)
		['address'] = 0xe1791cc4,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(9c94a25)
	[1] = { -- table(cea07fa)
		['address'] = 0xe1791cf0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(f4064c)
	[1] = { -- table(c9a0695)
		['address'] = 0xe1791cf4,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(211be02)
	[1] = { -- table(feb313)
		['address'] = 0xe1791d28,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.setValues({ -- table(1fd4681)
	[1] = { -- table(c99b67)
		['address'] = 0xe1791d44,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h 00 00 00 00',
	},
})
gg.clearResults()
gg.alert("𝐀𝐍𝐓𝐈 𝐑𝐄𝐏𝐎𝐑𝐓 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
Check = ItachiCheat
save_td[2] = Check
end


if ItachiCheat == 3 then
local LibStart = gg.getRangesList('liblogic.so')[1].start
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(":cheat", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ -- table(d920f3c)
	[1] = { -- table(c3cf4c5)
		['address'] = 3171953268.0,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 10,
	},
})
gg.searchNumber(":SDKReport", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":strTraceLog", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":GetTraceLog", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":mainTracePath", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":md5", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":MD5", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":kill", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":Cache", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":anti", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":login", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.clearResults()
gg.searchNumber(":terminate", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.setValues({ 
	[1] = { 
		['address'] = 3171953268.0,
		['flags'] = 4, 
		['value'] = 10,
	},
})
gg.setValues({ -- table(b1c1716)
	[1] = { -- table(b02b897)
		['address'] = 0x7fff3718dc1c,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(6196323)
	[1] = { -- table(5161020)
		['address'] = 0x7fff3718deac,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(5f6139b)
	[1] = { -- table(8a1c338)
		['address'] = 0x7fff3718e438,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(5bf198b)
	[1] = { -- table(8a86a68)
		['address'] = 0x7fff3718ef78,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(cff3d98)
	[1] = { -- table(901b9f1)
		['address'] = 0x7fff3718f560,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(93cc8)
	[1] = { -- table(f240161)
		['address'] = 0x7fff3718fa18,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(49d2d3)
	[1] = { -- table(fdd3e10)
		['address'] = 0x7fff371904a8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(582bf28)
	[1] = { -- table(fd9c441)
		['address'] = 0x7fff37190b44,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(6784258)
	[1] = { -- table(d7b3fb1)
		['address'] = 0x7fff37191030,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(a0532a3)
	[1] = { -- table(6b669a0)
		['address'] = 0x7fff371916ac,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(fc3ccb8)
	[1] = { -- table(d0e6a91)
		['address'] = 0x7fff37191dc8,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(63390a6)
	[1] = { -- table(6b5ae7)
		['address'] = 0x7fff37191eac,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 

gg.setValues({ -- table(9d08571)
	[1] = { -- table(cd76f56)
		['address'] = 0x7fff37192140,
		['flags'] = 4, -- gg.TYPE_DWORD
		['value'] = 'h C0 03 5F D6',
	},
}) 
gg.clearResults()
gg.clearResults()
gg.clearList()
gg.clearList()
gg.alert("𝐁𝐘𝐏𝐀𝐒𝐒 𝐋𝐎𝐁𝐁𝐘 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
Check = ItachiCheat
save_td[3] = Check
end



if ItachiCheat == 4 then
    function L45_85()
      os.rename("/storage/emulated/0/Android/data/com.mobile.legends/cache", "/storage/emulated/0/Android/data/com.mobile.legends/Bijikers")
      os.rename("/sdcard/Android/data/com.mobile.legends/cache", "/sdcard/Android/data/com.mobile.legends/Bijikers")
      os.rename("/storage/emulated/0/Android/data/com.mobile.legends/files/UnityCache", "/storage/emulated/0/Android/data/com.mobile.legends/files/Bijikers")
      os.rename("/sdcard/Android/data/com.mobile.legends/files/UnityCache", "/sdcard/Android/data/com.mobile.legends/files/Bijikers")
      os.rename("/storage/emulated/0/Android/data/com.parallel.space.pro/0/com.mobile.legends/files/dragon2017/BattleRecord", "/storage/emulated/0/Android/data/com.parallel.space.pro/0/com.mobile.legends/files/dragon2017/Bijikers")
      os.rename("/sdcard/Android/data/com.mobile.legends/files/dragon2017/BattleRecord", "/sdcard/Android/data/com.mobile.legends/files/dragon2017/Bijikers")
      os.rename("/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/cache", "/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/Bijikers")
      os.rename("/sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/cache", "//sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/Bijikers")
      os.rename("/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/UnityCache", "/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/Bijikers")
      os.rename("/sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/UnityCache", "/sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/Bijikers")
      os.rename("/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/dragon2017/BattleRecord", "/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/dragon2017/Bijikers")
      os.rename("/sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/dragon2017/BattleRecord", "/sdcard/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/dragon2017/Bijikers")
      os.remove("/storage/emulated/0/Android/data/com.mobile.legends/cache")
      os.remove("/storage/emulated/0/Android/data/com.mobile.legends/files/dragon2017/BattleRecord")
      os.remove("/storage/emulated/0/Android/data/com.mobile.legends/files/UnityCache")
      os.remove("/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/cache")
      os.remove("/storage/emulated/0/Android/data/com.parallel.space.pro/parallel_lite/0/com.mobile.legends/files/dragon2017/BattleRecord")
      os.remove("/storage/emulated/0/Android/data/com.parallel.space.lite.arm64/parallel_lite/0/com.mobile.legends/files/UnityCache")
      os.remove("/data/data/com.mobile.legends/code_cache")
      os.remove("/data/data/com.mobile.legends/cache")
      os.remove("/data/data/com.mobile.legends/cache/WebView/Crash Reports")
      gg["toast"]("10%")
      gg["sleep"](100)
      gg["toast"]("30%")
      gg["sleep"](100)
      gg["toast"]("60%")
      gg["sleep"](100)
      gg["toast"]("80%")
      gg["sleep"](100)
      gg["toast"]("100%")
      gg["sleep"](100)
      gg["toast"]("Cleared")
      gg["sleep"](100)
      gg.alert("𝗕𝗬𝗣𝗔𝗦𝗦 𝗟𝗢𝗚𝗢 𝗔𝗖𝗧𝗜𝗩𝗔𝗧𝗘")
      START()
    end
Check = ItachiCheat
save_td[4] = Check
end

if ItachiCheat == 5 then
so = gg.getRangesList('liblogic.so')[1].start
py = 0x4A8BAAC
setvalue(so + py, 32, "h20 00 80 D2 C0 03 5F D6")
so = gg.getRangesList('liblogic.so')[1].start
py = 0x412DDA8
setvalue(so + py, 32, "h20 00 80 D2 C0 03 5F D6")
gg.toast("𝐌𝐀𝐏𝐇𝐀𝐂𝐊 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
Check = ItachiCheat
save_td[5] = Check
end

if ItachiCheat == 6 then
gg.setRanges(gg.REGION_C_BSS | gg.REGION_ANONYMOUS)
gg.searchNumber("1089806008;-1053839852;1089722122", gg.TYPE_DWORD)
gg.searchNumber("1089806008", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("1092616192", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_BSS | gg.REGION_ANONYMOUS)
gg.searchNumber("1092616192;-1053839852;1089722122", gg.TYPE_DWORD)
gg.searchNumber("-1053839852", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("-1050620723", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_BSS | gg.REGION_ANONYMOUS)
gg.searchNumber("1092616192;-1050620723;1089722122", gg.TYPE_DWORD)
gg.searchNumber("1089722122", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("1092584735", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_BSS | gg.REGION_ANONYMOUS)
gg.searchNumber("-1057677640;-1057761526;1110143140", gg.TYPE_DWORD)
gg.searchNumber("-1057677640", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("-1054867456", gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_C_BSS | gg.REGION_ANONYMOUS)
gg.searchNumber("-1054867456;-1057761526;1110143140", gg.TYPE_DWORD)
gg.searchNumber("-1057761526", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("-1054898913", gg.TYPE_DWORD)
gg.alert("𝐃𝐑𝐎𝐍𝐄 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
gg.clearResults()
Check = ItachiCheat
save_td[6] = Check
end

if ItachiCheat == 7 then
il2cpp=gg.getRangesList("liblogic.so")[1].start
setValues(il2cpp + 0x4DC66BC, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x4DC66BC + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x4DC66BC + 0x8, 16, 10000)
setValues(il2cpp + 0x49BFCDC, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x49BFCDC + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x49BFCDC + 0x8, 16, 10000)
setValues(il2cpp + 0x511DF74, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x511DF74 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x511DF74 + 0x8, 16, 10000)
setValues(il2cpp + 0x37ED63C, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x37ED63C + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x37ED63C + 0x8, 16, 10000)
gg.clearResults()
gg.toast("𝐇𝐈𝐆𝐇 𝐃𝐀𝐌𝐀𝐆𝐄 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
gg.clearResults()
Check = ItachiCheat
save_td[7] = Check
end


if ItachiCheat == 8 then
il2cpp=gg.getRangesList("liblogic.so")[1].start
setValues(il2cpp + 0x35ab8d0, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35ab8d0 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35ab8d0 + 0x8, 16, 120)
setValues(il2cpp + 0x35abb9c, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35abb9c + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35abb9c + 0x8, 16, 120)
setValues(il2cpp + 0x35abee4, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35abee4 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35abee4 + 0x8, 16, 120)
setValues(il2cpp + 0x35ac084, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35ac084 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35ac084 + 0x8, 16, 120)
setValues(il2cpp + 0x35ac264, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35ac264 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35ac264 + 0x8, 16, 120)
setValues(il2cpp + 0x35ac5fc, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35ac5fc + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35ac5fc + 0x8, 16, 120)
setValues(il2cpp + 0x35ac6a4, 4, "~A ADDLE	 R0, R0, #32")
setValues(il2cpp + 0x35ac6a4 + 0x4, 4, "~A8 RET")
setValues(il2cpp + 0x35ac6a4 + 0x8, 16, 120)
gg.clearResults()
gg.toast("𝐔𝐏𝐆𝐑𝐀𝐃𝐄 𝐅𝐏𝐒 𝐀𝐂𝐓𝐈𝐕𝐀𝐓𝐄")
gg.sleep("2000")
gg.clearResults()
Check = ItachiCheat
save_td[8] = Check
end





if ItachiCheat == 9 then
while true do
gg.clearResults()
gg.clearResults()
gg.clearList()
gg.clearList()
gg.clearResults()
gg.clearList(f)
gg.clearResults()
gg.clearList(f)
gg.clearList()
gg.setVisible(true)
print("  𝗧𝗛𝗔𝗡𝗞𝗬𝗢𝗨 𝗙𝗢𝗥 𝗨𝗦𝗜𝗡𝗚 𝗠𝗔𝗥𝗞𝗢𝗡𝗧𝗢𝗣 𝗦𝗖𝗥𝗜𝗣𝗧! ")
print("")
print("  𝐒𝐔𝐁𝐒𝐂𝐑𝐈𝐁𝐄 𝐓𝐎 𝐌𝐘 𝐂𝐇𝐀𝐍𝐍𝐄𝐋:https://t.me/MarkOnTop ")

gg.setRanges(0)
os.exit()
end
gg.isVisible(true)
end



XGCK = -1
end


while(true)do
if gg.isVisible(true) then
XGCK=1
gg.setVisible(false)
end
gg.clearResults()
if XGCK==1 then
MainForm()
end
end
