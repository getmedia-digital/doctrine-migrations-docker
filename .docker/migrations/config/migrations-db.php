<?php

$port = 3306;

if (isset($_ENV['DB_DRIVER'])) {
    switch ($_ENV['DB_DRIVER']) {
        case 'pdo_mysql':case 'mysql':case 'mysqli':
            $port = 3306;
            break;
        case 'pdo_pgsql':case 'pgsql':
            $port = 5432;
            break;
        default:
            $port = 3306;
            break;
    }
}

return [
    'dbname' => (!empty($_ENV['DB_NAME']))?$_ENV['DB_NAME']:'defaultdb',
    'user' => (!empty($_ENV['DB_USER']))?$_ENV['DB_USER']:'root',
    'password' => (!empty($_ENV['DB_PASSWORD']))?$_ENV['DB_PASSWORD']:null,
    'host' => (!empty($_ENV['DB_HOST']))?$_ENV['DB_HOST']:'localhost',
    'port' => (!empty($_ENV['DB_PORT']))?$_ENV['DB_PORT']:$port,
    'driver' => (!empty($_ENV['DB_DRIVER']))?$_ENV['DB_DRIVER']:'pdo_mysql',
];