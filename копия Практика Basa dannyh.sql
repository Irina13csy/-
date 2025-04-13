CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "surname" varchar,
  "patronymic" varchar,
  "description" varchar,
  "photo" varchar,
  "city" varchar,
  "interests" varchar,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "title" varchar,
  "body" text,
  "media" varchar,
  "hashtag" varchar,
  "likeCount" integer,
  "views" varchar,
  "comments" text,
  "status" varchar,
  "created_at" timestamp
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "body" text,
  "message_read" varchar,
  "user_id" integer NOT NULL,
  "room_id" varchar,
  "created_at" timestamp
);

CREATE TABLE "media" (
  "photo" varchar,
  "audio" varchar,
  "video" varchar,
  "user_id" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "relationship" (
  "friends" varchar,
  "subscribers" varchar,
  "love_relationships" varchar,
  "user_id" integer NOT NULL,
  "created_at" timestamp
);

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

COMMENT ON COLUMN "posts"."comments" IS 'Content of the comments';

COMMENT ON COLUMN "messages"."body" IS 'Content of the post';

ALTER TABLE "posts" ADD CONSTRAINT "user_posts" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "messages" ADD CONSTRAINT "user_messages" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "media" ADD CONSTRAINT "user_media" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "relationship" ADD CONSTRAINT "user_relationship" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");
