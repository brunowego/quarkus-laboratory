-- create users table
CREATE TABLE IF NOT EXISTS users (
    id UUID DEFAULT uuid_generate_v4(),
    username VARCHAR(80) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,

    PRIMARY KEY(id)
);

-- create user addresses table
CREATE TABLE IF NOT EXISTS user_addresses (
    id UUID DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50) NOT NULL,
    address3 VARCHAR(50),
    postal_code VARCHAR(20) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country_code VARCHAR(3) NOT NULL,

    PRIMARY KEY(id)
);

ALTER TABLE user_addresses ADD CONSTRAINT "users-user_addresses"
FOREIGN KEY (user_id)
REFERENCES users(id);

-- insert users
INSERT INTO users (id, username, email, fname, lname) VALUES
    ('4596c4d3-2525-4ab6-8fb0-75bed149617a', 'johndoe', 'johndoe@example.com', 'John', 'Doe'),
    ('6045fb5d-177b-43df-b118-4bfe5eaee8c8', 'richardroe', 'richardroe@example.com', 'Richard', 'Roe');

-- insert user addresses
INSERT INTO user_addresses (id, user_id, address1, address2, address3, postal_code, city, state, country_code) VALUES
    ('fd378927-e2cc-487c-87a2-b5dda4e496d2', '4596c4d3-2525-4ab6-8fb0-75bed149617a', '3452', 'Hickman Street', '', '60173', 'Schaumburg', 'Illinois', 'USA'),
    ('1c915e6c-fd33-43a0-a13f-7bd0ad0f15db', '6045fb5d-177b-43df-b118-4bfe5eaee8c8', '1113', 'Roosevelt Street', '', '94520', 'Concord', 'California', 'USA');
