alter table "public"."counters" alter column "current_value" drop not null;
ALTER TABLE "public"."counters" ALTER COLUMN "current_value" drop default;
