def change_distribution(change)
  money = [1000.00, 500.00, 200.00, 100.00, 50.00, 20.00, 10.00, 5.00, 2.00, 1.00, 0.50, 0.20, 0.10, 0.05, 0.02, 0.01]
  distribution = [0] * money.length
  counter = 0
  while change > 0 do
    p change
    p money[counter]
  	while (change - money[counter]) >= 0 do
      distribution[counter] += 1
      change = (change - money[counter]).round(2)
    end
    counter += 1
  end
  return Hash[money.zip distribution]
end

p change_distribution(199.99)