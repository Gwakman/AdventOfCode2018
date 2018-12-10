function partOne()
  frequency = 0
  for line in io.lines("Day01/input.txt") do
    frequency = frequency + line
  end
  return frequency
end

function partTwo()
  frequency = 0
  index = 1
  foundFrequencies = {}
  boucle = 1
  while boucle == 1 do
    for line in io.lines("Day01/input.txt") do
      frequency = frequency + line
      foundFrequencies[index] = frequency
      for i = 1, index - 1 do
        if frequency == foundFrequencies[i] then
          return frequency
        end
      end
    index = index + 1
    end
  end
end

print ("The resulting frequency is " .. part_one())
print ("The first frequency reached twice is " .. part_two())