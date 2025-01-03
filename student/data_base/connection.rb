require 'pg'
begin
	con = PG.connect(
		dbname: 'students',
		user: 'postgres',
		password: '1234',
		host: 'localhost',
		port: 5432
		)
	puts "Соединение с базой установлено"
	con.close
rescue PG::Error => e
	puts "Ошибка подключения: #{e.message}"
end