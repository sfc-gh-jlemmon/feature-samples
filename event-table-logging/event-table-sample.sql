-- https://docs.snowflake.com/en/LIMITEDACCESS/logging.html#introduction

USE ROLE SYSADMIN;
CREATE DATABASE EVENTS;
CREATE SCHEMA EVENTS.EVENTDATA;

USE ROLE ACCOUNTADMIN;

CREATE EVENT TABLE events.eventdata.events_table;
ALTER ACCOUNT SET EVENT_TABLE = events.eventdata.events_table;


-- Set up logging for a DB
ALTER DATABASE A_TEST_DB SET LOG_LEVEL = INFO;


-- Create Python UDF
create or replace function A_TEST_DB.A_TEST_SCHEMA.addone_py(i int)
returns int
language python
runtime_version = 3.8
handler = 'udf'
as $$
import logging

logger = logging.getLogger("mylog")

def udf(i):

    logger.info("Adding 1 to " + str(i))
    return i+1
$$;

select A_TEST_DB.A_TEST_SCHEMA.addone_py(9);

ALTER FUNCTION A_TEST_DB.A_TEST_SCHEMA.addone_py(int) set log_level = debug;


// Snowflake Scripting Logging
CREATE OR REPLACE PROCEDURE A_TEST_DB.A_TEST_SCHEMA.my_echo(message VARCHAR)
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS
DECLARE log_msg VARCHAR;
BEGIN

  log_msg := 'Message: ' || message;
  
  SYSTEM$LOG('info', log_msg);
  SYSTEM$LOG_INFO(log_msg);

  SYSTEM$LOG('error', 'Error message');
  SYSTEM$LOG_ERROR('Error message');

  SYSTEM$LOG('warning', 'Warning message');
  SYSTEM$LOG_WARN('Warning message');

  SYSTEM$LOG('debug', 'Debug message');
  SYSTEM$LOG_DEBUG('Debug message');

  SYSTEM$LOG('trace', 'Trace message');
  SYSTEM$LOG_TRACE('Trace message');

  SYSTEM$LOG('fatal', 'Fatal message');
  SYSTEM$LOG_FATAL('Fatal message');
  
  RETURN message;
END;

ALTER PROCEDURE A_TEST_DB.A_TEST_SCHEMA.my_echo(VARCHAR) set log_level = debug;

CALL A_TEST_DB.A_TEST_SCHEMA.my_echo('hello');



select * from events.eventdata.events_table;

ALTER ACCOUNT UNSET EVENT_TABLE;
