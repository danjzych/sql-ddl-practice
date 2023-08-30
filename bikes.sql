CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code VARCHAR(4) PRIMARY KEY,
    model VARCHAR(25) NOT NULL,
    price NUMERIC(6, 2) NOT NULL
);

CREATE TABLE orders (
    id serial PRIMARY KEY,
    customer REFERENCES customers NOT NULL,
    order_date DATE NOT NULL
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id REFERENCES orders NOT NULL,
    customer REFERENCES customers NOT NULL,
    code REFERENCES bikes NOT NULL,
    total_cost NUMERIC(10, 2) NOT NULL,
    note TEXT
);