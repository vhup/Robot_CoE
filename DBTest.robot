*** Settings ***
Library  DatabaseLibrary

*** Test Cases ***
Test DB Connection
  
	Connect To Database Using Custom Params   jaydebeapi   'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@//10.0.2.39:49161/xe', ['system', 'oracle'], '/lib/ojdbc6.jar'
	@{Numbers}    Query    SELECT sysdate from dual
	Log    ${Numbers[0]}



