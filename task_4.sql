SELECT
    COLUMN_NAME AS COLUMN_NAME,
    COLUMN_TYPE AS DATA_TYPE,
    IS_NULLABLE AS IS_NULLABLE,
    COLUMN_DEFAULT AS COLUMN_DEFAULT,
    COLUMN_KEY AS COLUMN_KEY,
    EXTRA AS EXTRA
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = DB_NAME()
    AND TABLE_NAME = 'books'
ORDER BY
    ORDINAL_POSITION;