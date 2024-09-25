puts "Привет, #{name}!\n"
puts "Какой ваш любимый язык?"
case language = $stdin.gets.chomp.to_str.downcase #$stdin.gets - команда которая читает данные с клавиатуры
when "ruby" then puts "Подлиза"
when "assembly" then puts "Извращенец"
else puts "Такой язык не предусмотрен"
end
puts "Введите команду языка Ruby:"
eval($stdin.gets.chomp) #eval запускает пользовательский код, написанный на ruby
puts "Введите команду операционной системы:"
system($stdin.gets.chomp) #system зaпускает команду операционной системы