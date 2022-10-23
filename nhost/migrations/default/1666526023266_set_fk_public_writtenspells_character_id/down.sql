alter table "public"."writtenspells" drop constraint "writtenspells_character_id_fkey",
  add constraint "spellls_character_id_fkey"
  foreign key ("character_id")
  references "public"."characters"
  ("id") on update restrict on delete restrict;
