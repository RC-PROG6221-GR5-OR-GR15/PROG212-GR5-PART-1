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
