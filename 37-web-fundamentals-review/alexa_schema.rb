# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170116194753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type", limit: 255
    t.string   "city",             limit: 255
    t.string   "province",         limit: 255
    t.string   "country",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "postal_code",      limit: 6
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "summary"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "solution",       limit: 255
    t.integer  "cohort_id"
    t.integer  "copied_from_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "publish",                    default: true
    t.date     "due_date"
    t.boolean  "accept_uploads",             default: false
    t.integer  "original_id"
    t.boolean  "progress_page",              default: true
  end

  add_index "assignments", ["cohort_id"], name: "index_assignments_on_cohort_id", using: :btree
  add_index "assignments", ["original_id"], name: "index_assignments_on_original_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "student_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "date_and_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",        limit: 255
    t.integer  "feeling"
    t.integer  "cohort_id"
  end

  create_table "auditors", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_course_id"
  end

  create_table "breakouts", force: :cascade do |t|
    t.string   "topic",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.integer  "cached_weighted_score",             default: 0
    t.datetime "archived_at"
  end

  add_index "breakouts", ["cached_weighted_score"], name: "index_breakouts_on_cached_weighted_score", using: :btree

  create_table "choices", force: :cascade do |t|
    t.string   "content",     limit: 255
    t.boolean  "correct",                 default: false, null: false
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "choices_quiz_submissions", id: false, force: :cascade do |t|
    t.integer "quiz_submission_id", null: false
    t.integer "choice_id",          null: false
  end

  create_table "cohort_memberships", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "cohortable_id"
    t.string   "cohortable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cohort_memberships", ["cohort_id"], name: "index_cohort_memberships_on_cohort_id", using: :btree
  add_index "cohort_memberships", ["cohortable_id", "cohortable_type"], name: "index_cohort_memberships_on_cohortable_id_and_cohortable_type", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "forked",                 default: false
    t.integer  "course_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "website",     limit: 255
    t.string   "logo",        limit: 255
    t.string   "slug",        limit: 255
    t.text     "description"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                  default: true
  end

  create_table "company_reps", force: :cascade do |t|
    t.string   "skype",      limit: 255
    t.string   "phone",      limit: 255
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "part_time",              default: false
    t.boolean  "active",                 default: true,  null: false
  end

  create_table "employer_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.text     "body"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employer_messages", ["student_id"], name: "index_employer_messages_on_student_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.string   "email",              limit: 255
    t.string   "token",              limit: 255
    t.string   "specific_user_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cohort_id"
    t.integer  "company_id"
    t.datetime "accepted_at"
    t.datetime "last_sent_at"
  end

  add_index "invites", ["token"], name: "index_invites_on_token", unique: true, using: :btree

  create_table "job_postings", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "categories",  limit: 255
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description"
    t.string   "video_url",      limit: 255
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cohort_id"
    t.text     "summary"
    t.integer  "copied_from_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.integer  "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree

  create_table "quiz_submissions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "quiz_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_submissions", ["quiz_id"], name: "index_quiz_submissions_on_quiz_id", using: :btree
  add_index "quiz_submissions", ["student_id"], name: "index_quiz_submissions_on_student_id", using: :btree

  create_table "quizzes", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description"
    t.integer  "cohort_id"
    t.integer  "staff_id"
    t.datetime "scheduled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_questions"
  end

  add_index "quizzes", ["cohort_id"], name: "index_quizzes_on_cohort_id", using: :btree
  add_index "quizzes", ["staff_id"], name: "index_quizzes_on_staff_id", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "url",        limit: 255
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lesson_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "student_id"
    t.string  "name",       limit: 255
  end

  create_table "staffs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github",            limit: 255
    t.string   "linkedin",          limit: 255
    t.string   "twitter",           limit: 255
    t.string   "website",           limit: 255
    t.string   "bio",               limit: 255
    t.string   "skype",             limit: 255
    t.string   "slug",              limit: 255
    t.integer  "current_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "github",                  limit: 255
    t.string   "linkedin",                limit: 255
    t.string   "twitter",                 limit: 255
    t.string   "website",                 limit: 255
    t.text     "bio"
    t.string   "skype",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                    limit: 255
    t.string   "resume",                  limit: 255
    t.string   "photo",                   limit: 255
    t.string   "education",               limit: 255
    t.string   "interests",               limit: 255
    t.boolean  "participate_hb",                      default: false
    t.integer  "current_course_id"
    t.boolean  "job_searching",                       default: false
    t.boolean  "job_posting_notify",                  default: false
    t.string   "emergency_name"
    t.string   "emergency_relationship"
    t.string   "emergency_address_line1"
    t.string   "emergency_city"
    t.string   "emergency_province"
    t.string   "emergency_postal_code"
    t.string   "emergency_phone"
    t.string   "birth_date"
    t.string   "phone"
    t.string   "desired_position"
    t.string   "project_name"
    t.string   "project_url"
    t.string   "previous_position"
    t.string   "previous_organization"
    t.boolean  "relocation"
    t.string   "development_skills"
    t.string   "design_skills"
    t.string   "business_skills"
    t.string   "location"
    t.string   "profile_avatar"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "assignment_id"
    t.string   "url",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.string   "upload",        limit: 255
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "responder_id"
    t.string   "subject",            limit: 255
    t.string   "target",             limit: 255
    t.datetime "requester_complete"
    t.datetime "responder_complete"
    t.datetime "responded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "cancelled_at"
    t.integer  "cohort_id"
  end

  add_index "tickets", ["requester_id"], name: "index_tickets_on_requester_id", using: :btree
  add_index "tickets", ["responder_id", "requester_id"], name: "index_tickets_on_responder_id_and_requester_id", using: :btree
  add_index "tickets", ["responder_id"], name: "index_tickets_on_responder_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                           limit: 255
    t.string   "crypted_password",                limit: 255
    t.string   "salt",                            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token",               limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "first_name",                      limit: 255
    t.string   "last_name",                       limit: 255
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "specific_user_type",              limit: 255
    t.integer  "specific_user_id"
    t.string   "photo",                           limit: 255
    t.boolean  "terms_of_service"
    t.string   "referral_token",                  limit: 6
  end

  add_index "users", ["referral_token"], name: "index_users_on_referral_token", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type", limit: 255
    t.integer  "voter_id"
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "work_experiences", force: :cascade do |t|
    t.integer "student_id"
    t.string  "company_name", limit: 255
    t.string  "title",        limit: 255
    t.date    "start_date"
    t.date    "end_date"
  end

  add_foreign_key "employer_messages", "students"
end
