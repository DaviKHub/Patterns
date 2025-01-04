require 'pg'
begin
  connection = PG.connect(
    dbname: 'students',
    user: 'postgres',
    password: '1234',
    host: 'localhost',
    port: 5432
  )
  puts "Соединение с базой установлено"
  result = connection.exec("SELECT * FROM student;")
  result.each do |row|
    puts "ID: #{row['id']}, Фамилия: #{row['surname']}, Имя: #{row['name']}, Отчество: #{row['patronymic']}, Дата рождения: #{row['birthdate']}, Телефон: #{row['phone']}, Mail: #{row['mail']}, Telegram: #{row['telegram']}, Git: #{row['git']}"
  end

rescue PG::Error => e
  puts "Ошибка подключения: #{e.message}"
ensure
  connection.close if connection
end