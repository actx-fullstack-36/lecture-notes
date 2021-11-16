mysql-first-take.md# MySQL Commands, Variables, and DDL

## MySQL
- **database** - where we store data for our applications
    - This is really just a file system, but MySQL gives us some special indexing capabilities
- **MySQL** - the program that stores our data and manages our databases

## Sample MySQL file
```MySQL
drop table if exists articleTag;
drop table if exists article;
drop table if exists tag;
drop table if exists author;

create table author(
    authorId binary(16) not null,
    authorActivationToken char(32),
    authorAvatarUrl varchar(255),
    authorEmail varchar(128) not null,
    authorHash char(97) not null,
    authorUsername varchar(32) not null,
    unique(authorEmail),
    unique(authorUsername),
    index(authorEmail),
    primary key(authorId)
);

create table tag(
    tagId binary(16) not null,
    tagName varchar(32) not null,
    primary key(tagId)
);

create table article(
    articleId binary(16) not null,
    articleAuthorId binary(16) not null,
    articleContent blob not null,
    articleDate datetime(6) not null,
    articleImage varchar(255),
    index(articleAuthorId),
    foreign key(articleAuthorId) references author(authorId),
    primary key(articleId)
);

create table articleTag(
    articleTagArticleId binary(16),
    articleTagTagId binary(16),
    index(articleTagArticleId),
    index(articleTagTagId),
    foreign key(articleTagArticleId) references article(articleId),
    foreign key(articleTagTagId) references tag(tagId),
    primary key(articleTagArticleId, articleTagTagId)
);
```
- Tables must be added from strongest to weakest, and dropped in opposite order

## Data Types
- BINARY
    - blocks of data comprised of 1s & 0s
        - represented as hexidecimal digits (0-F) for human readability
    - every two hexidecimal digits (0-F) in the UUID can be stored as 1 byte in binary
        - 50% less space compared to a string type
    - faster to search than strings
    - we use BINARY(16) to store UUIDs for PKs/FKs
    - https://dev.mysql.com/doc/refman/8.0/en/binary-varbinary.html

- CHAR & VARCHAR
    - CHAR(8) vs VARCHAR(8) Example: fuzzy
        - CHAR : `F U Z Z Y _ _ _` - 3 bytes wasted
        - VARCHAR : `F U Z Z Y (nul)` - nul is a stop byte, so only 1 extra byte
    - CHAR is faster for read/write/search, VARCHAR is more flexible
    - CHAR <= 255 and VARCHAR <= 65535
    - Use VARCHAR for human readable data
    - Use CHAR for fixed-width strings
    - https://dev.mysql.com/doc/refman/8.0/en/char.html

- INT
    - SIGNED vs UNSIGNED : allow/disallow negatives
    - MySQL has 5 different sizes:
        - TINYINT
        - SIGNED [-128, 127]
        - UNSIGNED [0, 255]
        - SMALLINT
        - MEDIUMINT
        - INT
        - BIGINT
    - Use the correct size for your data
    - https://dev.mysql.com/doc/refman/8.0/en/integer-types.html

- DECIMAL
    - used for float variables
    - DECIMAL(s, d) will give you a number with s significant figures and d decimal places, where s >= d
        - e.g. DECIMAL(5, 3): [-99.999, 99.999]
        - e.g. DECIMAL(7, 2): [-99999.99, 99999.99]
    - https://dev.mysql.com/doc/refman/8.0/en/floating-point-types.html

- DATE and DATETIME
    - beginning of time: 1970-01-01 00:00:00 UTC
    - UTC is Europe/London time zone (no daylight savings)
    - DATETIME(6) : Y-m-d H:i:s.u with 6 decimal places
    - DATE : same without time
    - TIME : same without date
    - YEAR : Avoid. SQL can only store >= 1980.  Instead use SMALLINT
    - TIMESTAMP(6) : same as DATETIME(6) except mySQL automagically fills it in for you on INSERT and/or UPDATE - INSERT only by default
    - Usually use DATETIME or TIMESTAMP
    - https://dev.mysql.com/doc/refman/8.0/en/date-and-time-types.html
