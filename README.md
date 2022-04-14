# README

This is a simple app demonstrating the duplication of check constraints with
the existence of multiple schemas.

1. `docker compose up`
1. `bin/rails db:create db:schema:load`
1. Load new schema via `psql -h localhost -U postgres -d check_demo_development -p 8001 -f dump.sql`
1. `bin/rails db:schema:dump`
1. Verify schema now has duplicate check constraints in it.

```
diff --git a/db/schema.rb b/db/schema.rb
index df5b30b..2f719a6 100644
--- a/db/schema.rb
+++ b/db/schema.rb
@@ -19,6 +19,7 @@ ActiveRecord::Schema[7.0].define(version: 2022_04_14_184250) do
     t.datetime "created_at", null: false
     t.datetime "updated_at", null: false
     t.check_constraint "email IS NOT NULL", name: "users_email_null"
+    t.check_constraint "email IS NOT NULL", name: "users_email_null"
   end

 end
```
Which results in an error:

```
rails db:drop db:create db:schema:load
Dropped database 'check_demo_development'
Dropped database 'check_demo_test'
Created database 'check_demo_development'
Created database 'check_demo_test'
rails aborted!
ActiveRecord::StatementInvalid: PG::DuplicateObject: ERROR:  check constraint "users_email_null" already exists
/Users/frank/code/check-demo/db/schema.rb:17:in `block in <main>'
/Users/frank/code/check-demo/db/schema.rb:13:in `<main>'

Caused by:
PG::DuplicateObject: ERROR:  check constraint "users_email_null" already exists
/Users/frank/code/check-demo/db/schema.rb:17:in `block in <main>'
/Users/frank/code/check-demo/db/schema.rb:13:in `<main>'
Tasks: TOP => db:schema:load
(See full trace by running task with --trace)
```
