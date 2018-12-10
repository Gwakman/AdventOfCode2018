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
      print(found)
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

print("The checksum of the list of box IDs is " .. part_one())