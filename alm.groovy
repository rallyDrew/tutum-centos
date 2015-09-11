alm {

    db.name = System.env.DB_NAME ?: 'fatmoose'

    jdbc {
        user.name = db.name
        password = db.name

          service.name = System.env.JDBC_SERVICE_NAME ?: '@//127.0.0.1:12345/orcl'
    }

    data_file_dir = System.env.ORACLE_DATA_FILE_DIR ?: '/u01/app/oracle/oradata/ORCL/datafile/'

}

active = alm
