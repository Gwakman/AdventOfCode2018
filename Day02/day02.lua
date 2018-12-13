function partOne()
  countDouble = 0
  countTriple = 0
  for line in io.lines("Day02/input.txt") do
    double = false
    triple = false
    for i = 1, #line do
      letter = line:sub(i, i)
      index = 1
      _, found = line:gsub(letter, letter)
      if found == 2 then
        double = true
      end
      if found == 3 then
        triple = true
      end
      i = i + 1
    end
    if double == true then
      countDouble = countDouble + 1
    end
    if triple == true then
      countTriple = countTriple + 1
    end
  end
  return countDouble * countTriple
end

function partTwo()
  tStrings = {}
  index = 1
  for line in io.lines("Day02/input.txt") do
    tString = {}
    for i = 1, #line do
      tString[i] = line:sub(i,i)
    end
    tStrings[index] = tString
    index = index + 1
  end
  found = false
  index = 1
  while found == false do
    string = tStrings[index]
    for i = index + 1, #tStrings do
      compareString = tStrings[i]
      difference = 0
      for i = 1, #string do
        if string[i] ~= compareString[i] then
          difference = difference + 1
        end
      end
      if difference == 1 then
        commonLetters = ""
        for i = 1, #string do
          if string[i] == compareString[i] then
            commonLetters = commonLetters .. string[i]
          end
        end
        return commonLetters
      end
    end
    index = index + 1
  end
end

print("The checksum of the list of box IDs is " .. partOne())
print("The common letters between the two correct box IDs are " .. partTwo())