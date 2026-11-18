/** ユーザー登録 */
CREATE TABLE IF NOT EXISTS users(
	user_id BIGINT NOT NULL PRIMARY KEY,
	user_name VARCHAR(20) NOT NULL,
	email VARCHAR(254) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL 
)

/** 学習項目 */
CREATE TABLE IF NOT EXISTS content(
	content_id BIGINT PRIMARY KEY NOT NULL,
	user_id BIGINT FUNCTION KEY NOT NULL,
	content_title VARCHAR(50) NOT NULL,
	content_desc TEXT
)

/** 詳細タスク */
CREATE TABLE IF NOT EXISTS detailTask(
	task_id BIGINT PRIMARY KEY NOT NULL,
	content_id BIGINT FUNCTION KEY NOT NULL,
	task_title VARCHAR(50) NOT NULL,
	task_desc TEXT,
	task_status BOOLEAN NOT NULL
)

/** ポモドーロタイマー履歴 */
CREATE TABLE IF NOT EXISTS time_log(
	log_id BIGINT PRIMARY KEY NOT NULL,
	task_id BIGINT FUNCTION KEY NOT NULL,
	study_time 
)