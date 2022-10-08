alter table "public"."counters" alter column "current_value" set default '0';
alter table "public"."counters" alter column "current_value" set not null;
