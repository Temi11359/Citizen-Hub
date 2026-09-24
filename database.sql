CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
SHOW TABLES;
INSERT INTO departments (name, description) VALUES
('Administration & Human Resources', 'Handles administrative and personnel matters.'),
('Budget', 'Responsible for budget planning and preparation.'),
('Accounts & Finance', 'Handles financial records, accounts and council finances.'),
('Works & Infrastructure', 'Oversees infrastructure, roads and public works.'),
('Legal', 'Provides legal and regulatory support to the council.'),
('Tourism', 'Handles tourism and cultural development activities.'),
('ICT', 'Manages information and communication technology services.'),
('Education', 'Supports education-related programs and initiatives.'),
('Women Affairs & Poverty Alleviation', 'Supports women and community empowerment programs.'),
('Agriculture', 'Supports agricultural and community development initiatives.');
SELECT * FROM departments;
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
SHOW TABLES;
INSERT INTO services (name, description, department_id) VALUES
('Certificate of Origin', 'Application and processing of local government origin certificates.', 1),
('Trade & Business Permits', 'Licensing and registration support for businesses.', 3),
('Marriage Registration', 'Official marriage registration services at the council registry.', 1),
('Community Health Services', 'Access to primary healthcare and community health programs.', 8);
SELECT * FROM services;
CREATE TABLE announcements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    announcement_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
SHOW TABLES;
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    location VARCHAR(200),
    status VARCHAR(50),
    project_date DATE
);
SHOW TABLES;
CREATE TABLE citizens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(30),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SHOW TABLES;
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    message TEXT NOT NULL,
    response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (citizen_id) REFERENCES citizens(id)
);
SHOW TABLES;
INSERT INTO announcements
(title, content, announcement_date, department_id)
VALUES
(
    'Community Empowerment Program Registration',
    'The Department of Women Affairs & Poverty Alleviation invites residents to register for the upcoming vocational skill acquisition session.',
    '2026-09-24',
    9
),
(
    'Notice on Environmental Sanitation Exercise',
    'Residents and commercial operators are advised to maintain proper clearance of drainage systems surrounding their facilities.',
    '2026-09-24',
    1
);
SELECT * FROM announcements;
INSERT INTO projects
(name, description, location, status, project_date)
VALUES
(
    'Road Rehabilitation Project',
    'Asphalt overlay and drainage construction to minimize flooding and ease traffic flow.',
    'Central Isheri Road',
    'Completed',
    '2026-01-15'
),
(
    'Primary Health Centre Upgrade',
    'Expansion of medical wards and installation of modern diagnostic equipment.',
    'Olofin Community Health Secretariat',
    'Ongoing',
    '2026-03-01'
);
SELECT * FROM projects;
SHOW TABLES;
