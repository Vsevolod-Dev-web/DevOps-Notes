***Data Area*** - это директория в файловой системе, где хранятся все данные базы. PostgreSQL позволяет указывать любое data area.

По дефолту, data area (data directory) - `/usr/local/pgsql/data` or `/var/lib/pgsql/data`

Стоит понимать, что перед работой\использованием базы, необходимо инициализировать ***data area***. Этим занимается служба initdb, устанавливаемая вместе с PostgreSQL.