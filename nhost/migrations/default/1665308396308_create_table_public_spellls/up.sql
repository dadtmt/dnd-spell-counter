CREATE TABLE "public"."spellls" ("id" serial NOT NULL, "dndindex" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "character_id" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("character_id") REFERENCES "public"."characters"("id") ON UPDATE restrict ON DELETE restrict);
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
CREATE TRIGGER "set_public_spellls_updated_at"
BEFORE UPDATE ON "public"."spellls"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_spellls_updated_at" ON "public"."spellls" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
