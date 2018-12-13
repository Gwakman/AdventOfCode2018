function partOne()
  fabric = {}
  claims = {}
  index = 1
  for line in io.lines("Day03/input.txt") do
    i = 1
    claim = {}
    for value in line:gmatch("([^@ :x,]+)") do
      claim[i] =  value
      i = i + 1
    end
    claims[index] = claim
    index = index + 1
  end
  overlapped = 0
  for i = 1, #claims do
    claim = claims[i]
    for x = claim[2] + 1, claim[2] + claim[4] do
      for y = claim[3] + 1, claim[3] + claim[5] do
        if fabric[x .. ":" .. y] == nil then
          fabric[x .. ":" .. y] = "O"
        elseif fabric[x .. ":" .. y] == "O" then
          fabric[x .. ":" .. y] = "X"
        end
      end
    end
  end
  overlapped = 0
  for x = 1, 1000 do
    for y = 1, 1000 do
      if fabric[x .. ":" .. y] == "X" then
        overlapped = overlapped + 1
      end
    end
  end
  return overlapped
end

function partTwo()
  fabric = {}
  claims = {}
  index = 1
  for line in io.lines("Day03/input.txt") do
    i = 1
    claim = {}
    for value in line:gmatch("([^@ :x,]+)") do
      claim[i] =  value
      i = i + 1
    end
    claims[index] = claim
    index = index + 1
  end
  overlapped = 0
  for i = 1, #claims do
    claim = claims[i]
    for x = claim[2] + 1, claim[2] + claim[4] do
      for y = claim[3] + 1, claim[3] + claim[5] do
        if fabric[x .. ":" .. y] == nil then
          fabric[x .. ":" .. y] = "O"
        elseif fabric[x .. ":" .. y] == "O" then
          fabric[x .. ":" .. y] = "X"
        end
      end
    end
  end
  for i = 1, #claims do
    overlap = false
    claim = claims[i]
    for x = claim[2] + 1, claim[2] + claim[4] do
      for y = claim[3] + 1, claim[3] + claim[5] do
        if fabric[x .. ":" .. y] == "X" then
          overlap = true
        end
      end
    end
    if overlap == false then
      return claim[1]
    end
  end
end

print (partOne() .. " square inches of fabric are within two or more claims.")
print ("Claim " .. partTwo() .. " is the one that doesn't overlap.")