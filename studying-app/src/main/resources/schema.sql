/** ユーザー登録 */
CREATE TABLE users(
	user_id BIGINT NOT NULL AUTO_INCREMENT,
	user_name VARCHAR(20) NOT NULL,
	email VARCHAR(254) NOT NULL,
	password VARCHAR(255) NOT NULL ,
	
	PRIMARY KEY (user_id),
	
	UNIQUE(email)
	
) ENGINE=InnoDB;

/** 学習カテゴリー */
CREATE TABLE study_category(
	category_id BIGINT NOT NULL AUTO_INCREMENT,
	user_id BIGINT NOT NULL,
	category_title VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (category_id),
	
	UNIQUE(category_id, user_id),
	
	UNIQUE(user_id, category_title),
	
	FOREIGN KEY (user_id) REFERENCES users(user_id)
	
) ENGINE=InnoDB;

/** 学習項目 */
CREATE TABLE study_content(
	content_id BIGINT NOT NULL AUTO_INCREMENT,
	user_id BIGINT NOT NULL,
	category_id BIGINT NULL,
	content_title VARCHAR(50) NOT NULL,
	content_desc TEXT,
	
	PRIMARY KEY (content_id),
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	
	FOREIGN KEY (category_id, user_id) REFERENCES study_category(category_id, user_id)
	
) ENGINE=InnoDB;

/** 詳細タスク */
CREATE TABLE IF NOT EXISTS detail_task(
	task_id BIGINT NOT NULL AUTO_INCREMENT,
	content_id BIGINT NOT NULL,
	task_title VARCHAR(50) NOT NULL,
	task_desc TEXT,
	task_status BOOLEAN NOT NULL DEFAULT FALSE,
	
	PRIMARY KEY (task_id),
	
	FOREIGN KEY (content_id) REFERENCES study_content(content_id)
	
) ENGINE=InnoDB;

/** ポモドーロタイマー履歴 */
CREATE TABLE timer_log(
	log_id BIGINT NOT NULL AUTO_INCREMENT,
	task_id BIGINT NOT NULL,
	study_time INT NOT NULL,
	break_time INT NOT NULL,
	start_at DATETIME NOT NULL,
	end_at DATETIME NOT NULL,
	
	PRIMARY KEY (log_id),
	
	FOREIGN KEY (task_id) REFERENCES detail_task(task_id)
	
) ENGINE=InnoDB;