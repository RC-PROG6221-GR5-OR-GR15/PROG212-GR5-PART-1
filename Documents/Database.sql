Create Database EventManagementDB;

USE EventManagementDB;
--User Table
CREATE TABLE `USER` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME NULL,
    is_active BOOLEAN DEFAULT TRUE
);
--Role Table
CREATE TABLE `ROLE` (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
--User Role

CREATE TABLE USERROLE (
    userrole_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    assigned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    assigned_by INT,

    CONSTRAINT fk_userrole_user
        FOREIGN KEY (user_id)
        REFERENCES `USER`(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_userrole_role
        FOREIGN KEY (role_id)
        REFERENCES `ROLE`(role_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_userrole_assigned_by
        FOREIGN KEY (assigned_by)
        REFERENCES `USER`(user_id)
        ON DELETE SET NULL,

    UNIQUE (user_id, role_id)
);

--Event Table
CREATE TABLE EVENT (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue VARCHAR(150),
    location VARCHAR(150),
    distance_km DECIMAL(10,2),
    event_type VARCHAR(100),
    entry_fee DECIMAL(10,2) DEFAULT 0.00,
    status VARCHAR(50) DEFAULT 'Upcoming',
    created_by INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_event_created_by
        FOREIGN KEY (created_by)
        REFERENCES `USER`(user_id)
        ON DELETE RESTRICT
);
-- Category Table
CREATE TABLE CATEGORY (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    min_age INT,
    max_age INT,
    gender_restriction VARCHAR(50),
    max_participants INT,
    entry_fee DECIMAL(10,2) DEFAULT 0.00,
    created_by INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_category_event
        FOREIGN KEY (event_id)
        REFERENCES EVENT(event_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_category_created_by
        FOREIGN KEY (created_by)
        REFERENCES `USER`(user_id)
        ON DELETE SET NULL,

    CHECK (min_age IS NULL OR max_age IS NULL OR min_age <= max_age)
);
