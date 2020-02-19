-- Databricks notebook source
DROP DATABASE IF EXISTS RL_sso CASCADE;

CREATE DATABASE IF NOT EXISTS RL_sso
    COMMENT "SSO RL"
    LOCATION "/mnt/USR_DEV/EJ/DB/RL_SSO";

-- COMMAND ----------

-- MAGIC %python
-- MAGIC #Schleife über account
-- MAGIC folders = dbutils.fs.ls("/mnt/RAW/SSO/test/")
-- MAGIC #json_fields = []
-- MAGIC for name in folders:
-- MAGIC   folder_name = name[1].strip('/')
-- MAGIC   try:
-- MAGIC     print("DROP TABLE IF EXISTS rl_sso."+str(folder_name))
-- MAGIC     spark.sql("DROP TABLE IF EXISTS rl_sso."+str(folder_name))
-- MAGIC     
-- MAGIC     print("Creating table: rl_sso."+str(folder_name))
-- MAGIC     spark.catalog.createTable("rl_sso."+str(folder_name), '/mnt/RAW/SSO/test/'+str(folder_name), source='json', inferSchema='false')
-- MAGIC   except Exception as e:
-- MAGIC     print('error', e)

-- COMMAND ----------

