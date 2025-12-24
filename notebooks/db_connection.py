from sqlalchemy import create_engine, types
from sqlalchemy import text # to be able to pass string
from dotenv import dotenv_values


def start_engine():
    config = dotenv_values()

    pg_user = config['POSTGRES_USER']  # align the key label with your .env file !
    pg_host = config['POSTGRES_HOST']
    pg_port = config['POSTGRES_PORT']
    pg_db = config['POSTGRES_DB']
    pg_schema = config['POSTGRES_SCHEMA']
    pg_pass = config['POSTGRES_PASS']

    url = f'postgresql://{pg_user}:{pg_pass}@{pg_host}:{pg_port}/{pg_db}'

    engine = create_engine(url, echo=False)

    with engine.begin() as conn: 
        result = conn.execute(text(f'SET search_path TO {pg_schema};'))
    return engine
