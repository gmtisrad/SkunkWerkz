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
    entity_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- Create Entity Table
-- account_id: directly associates the entity with the
--  account that owns it. An entity must belong to an account.
-- type_key: Whether an entity is a "seeker", or an "agent"
CREATE TABLE entities (
    id INT NOT NULL AUTO_INCREMENT,
    account_id INT NOT NULL,
    type_key VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id)
        REFERENCES accounts (id)
);

-- Create Jobs Table
-- entity_id: Associates a job with an "agent" type entity.
-- title: the title of the job
CREATE TABLE jobs (
    id INT NOT NULL AUTO_INCREMENT,
    originator_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, originator_id),
    FOREIGN KEY (originator_id)
        REFERENCES entities (id)
);

-- Create Carts table
-- entity_id: defines which entity owns this cart. The cart belongs to an entity
--  because you want to be able to reference the cart from another account.
CREATE TABLE carts (
    id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    job_id INT NOT NULL,
    cart_id INT NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, job_id, cart_id),
    FOREIGN KEY (job_id)
        REFERENCES jobs (id),
    FOREIGN KEY (cart_id)
        REFERENCES carts (id)
);

-- Create Shelf table
-- entity_id: defines which entity owns the shelf. The shelf belongs to an entity
--  because you want to be able to reference th shelf from another account.
CREATE TABLE shelves (
    id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, entity_id),
    FOREIGN KEY (entity_id)
        REFERENCES entities (id)
);

-- Create ShelfItems table
-- job_id: defines the connection job the association relates to.
-- entity_id: defines the 'agent' the job relates to.
CREATE TABLE shelf_items (
    id INT NOT NULL AUTO_INCREMENT,
    job_id INT NOT NULL,
    shelf_id INT NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, job_id, shelf_id),
    FOREIGN KEY (shelf_id)
        REFERENCES shelves (id),
    FOREIGN KEY (job_id)
        REFERENCES jobs (id)
);

-- Now let's throw in some mock dataz

-- Create a seeker account
-- A seeker account has a cart and an entity associated with it.
INSERT INTO accounts (entity_id, first_name, last_name, email, password) VALUES (1, 'Root', 'Internal', 'root@skunkwerkz.com', '$2y$12$YGgoJBS061Atqy.HhPUpsu7rPf97GKxQobrxsEEgctTqW3BSrR3he');
INSERT INTO entities (account_id, type_key) VALUES(1, 'seeker');
INSERT INTO carts (entity_id) values(1);

-- Create an agent account
-- An agent account has a shelf and an entity associated with it.
INSERT INTO accounts (entity_id, first_name, last_name, email, password) values (2, "Root2", "Internal", "root2@skunkwerkz.com", "$2y$12$YGgoJBS061Atqy.HhPUpsu7rPf97GKxQobrxsEEgctTqW3BSrR3he");
INSERT INTO entities (account_id, type_key) VALUES(2, 'agent');
INSERT INTO shelves (entity_id) values(2);



-- Create some jobz, assign them to the 'agent' entity
INSERT INTO jobs (originator_id, title) VALUES(2, 'job 1');
INSERT INTO jobs (originator_id, title) VALUES(2, 'job 2');
INSERT INTO jobs (originator_id, title) VALUES(2, 'job 3');
INSERT INTO jobs (originator_id, title) VALUES(2, 'job 4');
INSERT INTO shelf_items (shelf_id, job_id) VALUES(1, 1);
INSERT INTO shelf_items (shelf_id, job_id) VALUES(1, 2);
INSERT INTO shelf_items (shelf_id, job_id) VALUES(1, 3);
INSERT INTO shelf_items (shelf_id, job_id) VALUES(1, 4);

-- Assign dem jobs to the 'seeker' user
INSERT INTO cart_items (cart_id, job_id) VALUES(1, 1);
INSERT INTO cart_items (cart_id, job_id) VALUES(1, 2);
INSERT INTO cart_items (cart_id, job_id) VALUES(1, 3);
INSERT INTO cart_items (cart_id, job_id) VALUES(1, 4);
