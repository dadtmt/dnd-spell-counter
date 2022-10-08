alter table "public"."counters" alter column "value" drop not null;
alter table "public"."counters" add column "value" int4;
