alter table "public"."writtenspells" drop constraint "spellls_character_id_fkey",
  add constraint "writtenspells_character_id_fkey"
  foreign key ("character_id")
  references "public"."characters"
  ("id") on update restrict on delete cascade;
