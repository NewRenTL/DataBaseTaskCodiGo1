
/*
CREATE TABLE IF NOT EXISTS teacher(
    teacher_id serial primary key,
    teacher_name varchar(100) not null,
    teacher_surname varchar(100) not null,
    teacher_email varchar(100) not null unique
);
*/



CREATE TABLE IF NOT EXISTS users(
    user_id serial primary key,
    username varchar(100) not null unique,
    email varchar(100) not null unique,
    address varchar(100) not null
);

CREATE TABLE IF NOT EXISTS category(
    category_id serial primary key,
    category_name varchar(100) not null unique ,
    description text
);

CREATE TABLE IF NOT EXISTS post(
    post_id serial primary key,
    user_id_fk integer not null ,
    title varchar(100) not null,
    content text not null ,
    creation_date date default current_date
);

ALTER TABLE post ADD CONSTRAINT fk_user_id_post FOREIGN KEY(user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS post_category(
    post_id integer not null,
    category_id integer not null
);

ALTER TABLE post_category ADD PRIMARY KEY(post_id,category_id);

ALTER TABLE post_category ADD CONSTRAINT fk_post_id_pcat FOREIGN KEY(post_id) REFERENCES post(post_id) ON DELETE CASCADE;
ALTER TABLE post_category ADD CONSTRAINT fk_category_id_pcat FOREIGN KEY(category_id) REFERENCES category(category_id) ;

CREATE TABLE IF NOT EXISTS comments(
    comment_id serial primary key,
    user_id integer not null,
    post_id integer not null,
    content text not null,
    number_reactions integer not null default 0
);

ALTER TABLE comments ADD CONSTRAINT fk_user_id_cmm FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE;
ALTER TABLE comments ADD CONSTRAINT fk_post_id_cmm FOREIGN KEY(post_id) REFERENCES post(post_id) ON DELETE CASCADE;



