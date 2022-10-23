alter table "public"."counters" drop constraint "counters_character_id_fkey",
  add constraint "counters_character_id_fkey"
  foreign key ("character_id")
  references "public"."characters"
  ("id") on update restrict on delete restrict;
