def change_distribution(change)
  money = [1000, 500, 200, 100, 50, 20, 10, 5, 2, 1, 0.5, 0.2, 0.1, 0.05, 0.02, 0.01]
  distribution = [0] * money.length
  counter = 0
  while change > 0 do
  	while (change - money[counter]) >= 0 do
      distribution[counter] += 1
      change -= money[counter]
    end
    counter += 1
  end
  return Hash[money.zip distribution]
end

p change_distribution(123)