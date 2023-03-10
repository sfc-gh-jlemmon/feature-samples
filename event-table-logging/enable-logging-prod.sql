alter account ACCOUNTID set ENABLE_USER_LOGGER=true parameter_comment='enable event logging';
alter account ACCOUNTID set ENABLE_EVENT_TABLES=true  parameter_comment='enable event logging';

//   - To enable logging for Java and Python stored procedure
alter account ACCOUNTID set ENABLE_EVENT_LOGGING_FOR_SNOWPARK_STORED_PROCEDURES=true parameter_comment='enable event logging';
//   - To enable Java UDTF logging 
alter account ACCOUNTID set ENABLE_JAVA_UDTF_EVENT_LOGGING=true parameter_comment='enable event logging';
//   - To enable Python UDF/UDTF logging
alter account ACCOUNTID set ENABLE_PYTHON_UDF_LOGGING=true parameter_comment='enable event logging';
alter account ACCOUNTID set ENABLE_PYTHON_UDTF_EVENT_LOGGING=true parameter_comment='enable event logging';
//   - To enable JavaScript UDF and stored procedure
alter account ACCOUNTID set ENABLE_JS_USER_LOGGING=true parameter_comment='enable event logging';
//   - To enable JavaScript UDTF logging
alter account ACCOUNTID set ENABLE_JS_UDTF_USER_LOGGING=true parameter_comment='enable event logging';
//   - To enable snowscript logging 
alter account ACCOUNTID set ENABLE_SQL_LOGGING_FUNCTIONS=true parameter_comment='enable event logging';
