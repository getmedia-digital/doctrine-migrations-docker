# Doctrine Migrations Docker

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/getmedia/doctrine-migrations?style=flat-square)

## Configuration

### Environmental variables

| Key | Description | Default value |
| --- | --- | --- |
| DB_DRIVER |  | pdo_mysql |
| DB_HOST |  | localhost |
| DB_NAME |  | defaultdb |
| DB_PORT |  | 3306 |
| DB_USER |  | root |
| DB_PASSWORD |  | (null) |
| MIGRATIONS_NAME |  | Migrations |
| MIGRATIONS_NAMESPACE |  | App\Migrations |
| MIGRATIONS_DIR |  | /srv/doctrine/migrations |
| MIGRATIONS_TABLE_NAME |  | doctrine_migration_versions |
| MIGRATIONS_NAME_COL |  | version |
| MIGRATIONS_COL_LENGTH |  | 14 |
| MIGRATIONS_EXECUTED_COL |  | executed_at |
| MIGRATIONS_ALL_OR_NOTHING |  | true |
| MIGRATIONS_CHECK_PLATFORM |  | true |

### Custom configuration

## Usage

```bash
docker run getmedia/doctrine-migrations
```

## Support

## Maintenance