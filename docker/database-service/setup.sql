-- Create SkunkWerkz DB
-- CREATE DATABASE skunkwerkz;

-- Use the SkunkWerkz DB
USE skunkwerkz;

-- Create Account Table
-- entity_id: directly associates the account with
--  its own entity. Meaning, the entity belongs to the
--  account and vise versa. An account doesn't necessarily
--  need to have an entity right off the bat (this could change)
CREATE TABLE accounts (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    entity_id INT
);

-- Create Entity Table
-- account_id: directly associates the entity with the
--  account that owns it. An entity must belong to an account.
-- type_key: Whether an entity is a "job" or a "seeker"
CREATE TABLE entities (
    id INT NOT NULL AUTO_INCREMENT,
    account_id INT NOT NULL,
    type_key VARCHAR(255) NOT NULL,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id)
        REFERENCES accounts (id)
);

-- Create Carts table
-- entity_id: defines which entity owns this cart. The cart belongs to an entity
--  because you want to be able to represent the cart from another account.
CREATE TABLE carts (
    id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    PRIMARY KEY (id, entity_id),
    FOREIGN KEY (entity_id)
        REFERENCES entities (id)
);

-- Create CartItems table
-- entity_id: Links another entity to a cart, which belongs to another entity. This
--  defines the relationship between two entities.
-- cart_id: This is the cart that belongs to the entity we are linking tos id.
CREATE TABLE cart_items (
    id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    cart_id INT NOT NULL,
    PRIMARY KEY (id, entity_id, cart_id),
    FOREIGN KEY (entity_id)
        REFERENCES entities (id),
    FOREIGN KEY (cart_id)
        REFERENCES carts (id)
);