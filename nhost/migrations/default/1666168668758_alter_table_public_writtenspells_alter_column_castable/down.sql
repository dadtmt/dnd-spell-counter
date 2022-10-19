alter table "public"."writtenspells" alter column "castable" drop not null;
alter table "public"."writtenspells" alter column "castable" set default 'false';
