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
    'dbname' => $_ENV['DB_NAME'],
    'user' => $_ENV['DB_USER'],
    'password' => $_ENV['DB_PASSWORD'],
    'host' => $_ENV['DB_HOST'],
    'port' => (!empty($_ENV['DB_PORT']))?$_ENV['DB_PORT']:$port,
    'driver' => (!empty($_ENV['DB_DRIVER']))?$_ENV['DB_DRIVER']:'pdo_mysql',
];