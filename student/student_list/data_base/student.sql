CREATE TABLE IF NOT EXISTS student (
    id SERIAL PRIMARY KEY,
    surname VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50) NOT NULL,
    birthdate DATE,
    phone VARCHAR(20),
    mail VARCHAR(50),
    telegram VARCHAR(50),
    git VARCHAR(100)
);