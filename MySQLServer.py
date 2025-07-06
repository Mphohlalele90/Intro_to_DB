import mysql.connector
from mysql.connector import errorcode

try:
    # Connect to MySQL server
    conn = mysql.connector.connect(
        host="localhost",      # or your server address
        user="root",           # replace with your MySQL username
        password="674692"  # replace with your MySQL password
    )
    cursor = conn.cursor()

    # Try to create the database
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print(f"Failed creating database: {err}")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Error: Something is wrong with your username or password.")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Error: Database does not exist.")
    else:
        print(f"Connection Error: {err}")
finally:
    # Clean up: close cursor and connection
    try:
        if cursor:
            cursor.close()
        if conn:
            conn.close()
    except NameError:
        pass