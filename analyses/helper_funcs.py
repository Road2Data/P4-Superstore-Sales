import os
from dotenv import load_dotenv


def generate_url():
    """Generate the URL object necessary for a SQL Alchemy Engine."""

    # Load credentials from .env file, synthesize URL object, and SQLAlchemy engine.
    load_dotenv()

    # Fix to phantom 'token;' issue.
    user = str(os.getenv('USER')).replace(';', '')
    password = str(os.getenv('PASS')).replace(';', '')
    port = str(os.getenv('PORT')).replace(';', '')

    url = 'mysql://{}:{}@{}/superstore'.format(user, password, port)

    return url


def aesthetic_split(in_str: str) -> str:
    """Insert spaces between distinct word tokens in a concatenated string."""

    result_str = ''

    for i, char in enumerate(in_str):
        # Check if the current character is uppercase and the previous one is lowercase
        if char.isupper() and i > 0 and in_str[i - 1].islower():
            result_str += " "

        result_str += char

    return result_str