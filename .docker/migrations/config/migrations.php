<?php

return [
    'name' => ($_ENV['MIGRATIONS_NAME'])?$_ENV['MIGRATIONS_NAME']:'Migrations',
    'migrations_namespace' => ($_ENV['MIGRATIONS_NAMESPACE'])?$_ENV['MIGRATIONS_NAMESPACE']:'App\Migrations',
    'table_name' => ($_ENV['MIGRATIONS_TABLE_NAME'])?$_ENV['MIGRATIONS_TABLE_NAME']:'doctrine_migration_versions',
    'column_name' => ($_ENV['MIGRATIONS_NAME_COL'])?$_ENV['MIGRATIONS_NAME_COL']:'version',
    'column_length' => ($_ENV['MIGRATIONS_COL_LENGTH'])?$_ENV['MIGRATIONS_COL_LENGTH']:14,
    'executed_at_column_name' => ($_ENV['MIGRATIONS_EXECUTED_COL'])?$_ENV['MIGRATIONS_EXECUTED_COL']:'executed_at',
    'migrations_directory' => '/srv/migrations',
    'all_or_nothing' => ($_ENV['MIGRATIONS_ALL_OR_NOTHING'])?$_ENV['MIGRATIONS_ALL_OR_NOTHING']:true,
    'check_database_platform' => ($_ENV['MIGRATIONS_CHECK_PLATFORM'])?$_ENV['MIGRATIONS_CHECK_PLATFORM']:true,
];