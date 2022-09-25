CREATE TABLE "public"."counters" ("id" serial NOT NULL, "name" text NOT NULL, "value" integer NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "character_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("character_id") REFERENCES "public"."characters"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_counters_updated_at"
BEFORE UPDATE ON "public"."counters"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_counters_updated_at" ON "public"."counters" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
