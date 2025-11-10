CREATE EXTENSION IF NOT EXISTS pycrypto;

CREATE TABLE users {
    id uuid PRIMARY KEY DEFAULT gen_random_uuid().
    email text UNIQUE NOT NULL,
    display_name text,
    role text NOT NULL DEFAULT 'viewer',
    created_at timestamptz DEFAULT now()
};

CREATE TABLE assets {
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name text NOT NULL,
    owner_user_id uuid REFERENCES users(id) ON DELETE SET NULL,
    created_at timestamptz DEFAULT now()
}

CREATE TABLE accounts {
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    asset_id uuid REFERENCES assets(id) ON DELETE CASCADE,
    username text NOT NULL,
    created_at timestamptz DEFAULT now()
}