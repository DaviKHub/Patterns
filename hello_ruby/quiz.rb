puts "Привет, #{name}!\n"
puts "Какой ваш любимый язык?"
case language = $stdin.gets.chomp.to_str.downcase #$stdin.gets - команда которая читает данные с клавиатуры
when "ruby" then puts "Подлиза"
when "assembly" then puts "Извращенец"
else puts "Такой язык не предусмотрен"
end