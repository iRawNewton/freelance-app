/*
Admin table 
CREATE TABLE Admin (
  admin_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone BIGINT,
  password_hash VARCHAR(100) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  profile_picture VARCHAR(255),
  role ENUM('admin', 'super_admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  last_login TIMESTAMP,
  is_active BOOLEAN NOT NULL DEFAULT true
);
*/

/* 
INSERT INTO users (username, password_hash) VALUES ('john_doe', SHA2('user_password', 256));
*/
/* 
SELECT * FROM Admin WHERE password_hash = SHA2('user_password', 256)
*/


/* 
INSERT INTO `Admin` (`admin_id`, `username`, `email`, `phone`, `password_hash`, `full_name`, `profile_picture`, `role`, `created_at`, `last_login`, `is_active`) VALUES (NULL, 'johndoe', 'johndoe@gmail.com', '9999888822', 'password', 'John Doe', 'google.com', 'admin', current_timestamp(), '0000-00-00 00:00:00.000000', '1');
 */