-- create users table
CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT uuid_generate_v4(),
    username varchar(80) UNIQUE NOT NULL,

    PRIMARY KEY(id)
);

-- create user_profile table
CREATE TABLE IF NOT EXISTS user_profile (
    user_id UUID DEFAULT uuid_generate_v4(),
    email varchar(255) UNIQUE NOT NULL,
    fname varchar(50) NOT NULL,
    lname varchar(50) NOT NULL,

    PRIMARY KEY(user_id)
);

ALTER TABLE user_profile ADD CONSTRAINT "users-user_profile"
FOREIGN KEY (user_id)
REFERENCES users(id);

-- insert users
INSERT INTO users (id, username) VALUES
    ('4596c4d3-2525-4ab6-8fb0-75bed149617a', 'johndoe'),
    ('6045fb5d-177b-43df-b118-4bfe5eaee8c8', 'richardroe');

INSERT INTO user_profile (user_id, email, fname, lname) VALUES
    ('4596c4d3-2525-4ab6-8fb0-75bed149617a', 'johndoe@example.com', 'John', 'Doe'),
    ('6045fb5d-177b-43df-b118-4bfe5eaee8c8', 'richardroe@example.com', 'Richard', 'Roe');
