-- Create SkunkWerkz DB
CREATE DATABASE skunkwerkz;

-- Use the SkunkWerkz DB
USE skunkwerkz;

-- Create Account Table
-- entity_id: directly associates the account with
--  its own entity. Meaning, the entity belongs to the
--  account and vise versa.
CREATE TABLE accounts (
    id int,
    entity_id int,
)

-- Create Entity Table
-- account_id: directly associates the entity with the
--  account that owns it.
-- type_key: Whether an entity is a "job" or a "seeker"
CREATE TABLE entities (
    id int,
    account_id int,
    type_key varchar(255),
)

-- Create Carts table
-- Will finish this later, getting docker to work with node/React/express took some time/energy!