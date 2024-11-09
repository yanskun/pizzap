DATABASE_URL=postgres://pizzap_user:P%40ssw0rd@localhost:5433/pizzap_db

migrate:
	@DATABASE_URL=$(DATABASE_URL) sqlx migrate run
