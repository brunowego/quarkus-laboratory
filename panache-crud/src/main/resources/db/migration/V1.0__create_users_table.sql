-- create users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(80) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL
);

-- insert first user
INSERT INTO users (id, username, email, fname, lname) VALUES
    (uuid_generate_v4(), 'johndoe', 'johndoe@example.com', 'John', 'Doe'),
    ('6045fb5d-177b-43df-b118-4bfe5eaee8c8', 'richardroe', 'richardroe@example.com', 'Richard', 'Roe');
