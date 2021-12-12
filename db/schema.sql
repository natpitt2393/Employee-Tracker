DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

--Creating the parent table, department, adding id as the primary key
CREATE TABLE department (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) UNIQUE NOT NULL
);
--creating first child table, role and using department_id as foreign key.
CREATE TABLE role (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INT NOT NULL,
  CONSTRAINT fk_department
  FOREIGN KEY (department_id)
  REFERENCES department(id)
  ON DELETE CASCADE
);
--creating second child table, employee.
CREATE TABLE employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) UNIQUE NOT NULL,
  last_name VARCHAR(30) UNIQUE NOT NULL,
  role_id INT NOT NULL,
  CONSTRAINT fk_role
  FOREIGN KEY (role_id)
  REFERENCES role(id)
  ON DELETE CASCADE,
  manager_id INT,
  CONSTRAINT fk_manager 
  FOREIGN KEY (manager_id)
  REFERENCES employee(id)
  ON DELETE SET NULL
);