-- +goose Up
CREATE TABLE feeds (
    id UUID NOT NULL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    name TEXT NOT NULL,
    url TEXT UNIQUE NOT NULL,
    user_id UUID NOT NULL,
    last_fetched_at TIMESTAMP,
    CONSTRAINT fk_user_id
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);

-- +goose Down
DROP TABLE feeds;