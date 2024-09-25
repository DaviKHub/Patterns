def count_div_non_div_by_3(n)
  count = 0
  (1..Math.sqrt(n)).each do |i|
    # использование итерационного цикла от 1 до квадратного корня n
    if n % i == 0
      count += 1 if i % 3 != 0
      count += 1 if (n / i) % 3 != 0 and n / i != i
    end
  end
  return count
end

def min_odd_digit(n)
  digits = []
  while n > 0
    digits.append(n % 10) if (n % 10) % 2 != 0
    n /= 10
  end
  return digits.min || nil
end


print "Введите число: "
n = gets.to_i.abs # to_i - преобразование строки в целое десятичное
print "Количество делителей, которые не кратны 3: #{count_div_non_div_by_3(n)}\n"
print "Минимальная нечетная цифра: #{min_odd_digit(n)}\n"