/* create tables */

/* Admin table

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
 
 
service table 
----------------------------------------
CREATE TABLE Services (
  service_id INT AUTO_INCREMENT PRIMARY KEY,
  service_name VARCHAR(255) NOT NULL,
  image_url VARCHAR(255) DEFAULT NULL
);


ServiceCategories
-----------------------------------------
CREATE TABLE ServiceCategories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



sub categories
-----------------------------------------
CREATE TABLE ServiceSubcategories (
    subcategory_id INT AUTO_INCREMENT PRIMARY KEY,
    subcategory_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (parent_category_id) REFERENCES ServiceCategories(category_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



Users
-----------------------------------------
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone BIGINT,
    language_proficiency VARCHAR(50),
    iso_code VARCHAR(11),
    residence_country VARCHAR(100),
    residence_state VARCHAR(100),
    residence_city VARCHAR(100),
    user_bio TEXT,
    profile_picture_url VARCHAR(255),
    registration_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login_timestamp TIMESTAMP,
    UNIQUE (email)
);




Freelance Project
------------------------------------------
CREATE TABLE FreelanceProjects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    project_category INT(11) NOT NULL,
    project_subcategory INT(11),
    project_title VARCHAR(255) NOT NULL,
    project_views INT DEFAULT 0,
    project_min_delivery_time INT,
    project_description TEXT,
    services_provided TEXT,
    tools_and_technologies TEXT,
    project_service_id INT,
    project_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    project_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_service_id) REFERENCES Services(service_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (project_category) REFERENCES ServiceCategories(category_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (project_subcategory) REFERENCES ServiceSubcategories(subcategory_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

Gallery Images
--------------------------------------------
CREATE TABLE ProjectGallery (
    photo_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    photo_url VARCHAR(255) NOT NULL,
    upload_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES FreelanceProjects(project_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


FAQs
--------------------------------------------
CREATE TABLE FAQs (
    faq_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    question_text TEXT NOT NULL,
    answer_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES FreelanceProjects(project_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


Pricings
--------------------------------------------
-- Create the packages table
CREATE TABLE Packages (
    packages_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    type ENUM('multiple', 'onetime'),
    name ENUM('starter', 'pro', 'premium', 'onetime'),
    description TEXT,
    price DOUBLE,
    FOREIGN KEY (project_id) REFERENCES FreelanceProjects(project_id)
);

-- Create the package_features table
CREATE TABLE package_features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    package_id INT,
    description TEXT,
    FOREIGN KEY (package_id) REFERENCES packages(id)
);




Education
--------------------------------------------
CREATE TABLE Education (
    education_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    institution_name VARCHAR(255) NOT NULL,
    degree_obtained VARCHAR(255),
    field_of_study VARCHAR(255),
    start_date DATE,
    end_date DATE,
    grade_or_gpa DECIMAL(4, 2),
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

Experience
--------------------------------------------
CREATE TABLE Experience (
    experience_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(255),
    start_date DATE,
    end_date DATE,
    is_current BOOLEAN, -- New column to indicate current employment
    description TEXT,
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);







*******************************************
while inserting

-- Insert data into FreelanceProjects table
INSERT INTO FreelanceProjects (category, sub_category, title, ...other_columns)
VALUES ('Category A', 'Subcategory 1', 'Project Title', ...);

-- Get the last inserted project_id
SET @project_id = LAST_INSERT_ID();

-- Insert data into ProjectImages table for the same project
INSERT INTO ProjectImages (project_id, image_url)
VALUES
    (@project_id, 'image1.jpg'),
    (@project_id, 'image2.jpg'),
    ...;

-- Insert data into ProjectFAQs table for the same project
INSERT INTO ProjectFAQs (project_id, question, answer)
VALUES
    (@project_id, 'FAQ 1', 'Answer 1'),
    (@project_id, 'FAQ 2', 'Answer 2'),
    ...;

-- Insert data into PricingDetails table for the same project
INSERT INTO PricingDetails (project_id, pricing_type, pricing_amount, pricing_remarks)
VALUES
    (@project_id, 'basic', 100.00, 'Basic pricing remarks'),
    (@project_id, 'standard', 150.00, 'Standard pricing remarks'),
    (@project_id, 'premium', 200.00, 'Premium pricing remarks');



possible query for gallery
SELECT
    p.product_id,
    p.product_name,
    GROUP_CONCAT(pi.photo_url) AS product_images
FROM
    Products p
LEFT JOIN
    ProductImages pi ON p.product_id = pi.product_id
GROUP BY
    p.product_id, p.product_name;



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


// as a freelancer

/* 
id,
category,
sub category,
title,
views,
english level
country
state
city
minimum delivery time

service description
service i provide

tools and technologies to be used

*/
// gallery image
// faqs
/*


******************************************
In this version, the fields have been reorganized for better readability:

Core User Information:

user_id: Primary key identifier for each user.
username: User's unique username.
email: User's email address, used for login and communication.
password_hash: Hashed password for security.
Personal Information:

first_name: User's first name.
last_name: User's last name.
Additional Details:

english_level: User's proficiency in English.
country: User's country of residence.
state: User's state or region.
city: User's city.
Profile Information:

biography: User's profile biography or description.
profile_picture: Path or URL to the user's profile picture.
Timestamps and Constraints:

registration_date: Timestamp of when the user registered.
last_login: Timestamp of the user's last login.
UNIQUE (email): Ensures that each email is unique to avoid duplicate accounts.
This organization groups related fields together and makes the structure of the table more intuitive.
*/
