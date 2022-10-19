alter table "public"."writtenspells" alter column "castable" set default 'False';
alter table "public"."writtenspells" alter column "castable" set not null;
