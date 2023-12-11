CREATE TABLE admin (
    admin_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(50)
);

CREATE TABLE camera (
    camera_id INT PRIMARY KEY,
    club VARCHAR(255),
    report VARCHAR(255),
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);

CREATE TABLE maintenancelog (
    Maintenance_id INT PRIMARY KEY,
    Date_recorded DATE,
    status VARCHAR(50),
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);

CREATE TABLE schedule (
    Schedule_id INT PRIMARY KEY,
    h_descp VARCHAR(255),
    type VARCHAR(50),
    date DATE,
    time TIME,
    place VARCHAR(100),
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);

CREATE TABLE roomBooking (
    Booking_id INT PRIMARY KEY,
    Date DATE,
    place VARCHAR(100),
    time TIME,
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE fitness_goal (
    goal_id INT PRIMARY KEY,
    goal_weight DECIMAL(5, 2),
    goal_BMI DECIMAL(5, 2),
    goal_Descp VARCHAR(255),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Metrics (
    member_ID INT,
    metric_id INT PRIMARY KEY,
    weight DECIMAL(5, 2),
    height DECIMAL(5, 2),
    BMI DECIMAL(5, 2),
    curr_descp VARCHAR(255),
    FOREIGN KEY (member_ID) REFERENCES Member(member_id)
);

CREATE TABLE DashBoard (
    member_id INT,
    dashboard_id INT PRIMARY KEY,
    routine VARCHAR(255),
    achievement VARCHAR(255),
    stat VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_type VARCHAR(50),
    evt_descrp VARCHAR(255),
    time TIME,
    place VARCHAR(100),
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE roomBooking (
    Booking_id INT PRIMARY KEY,
    Date DATE,
    place VARCHAR(100),
    time TIME,
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE trainer (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    certification VARCHAR(100),
    availability VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE trainingSession (
    training_id INT PRIMARY KEY,
    time TIME,
    place VARCHAR(100),
    trainer_id INT,
    schedule_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE notification (
    noti_id INT PRIMARY KEY,
    noti_descp VARCHAR(255),
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE progress_notes (
    note_id INT PRIMARY KEY,
    note_descp VARCHAR(255),
    training_id INT,
    FOREIGN KEY (training_id) REFERENCES trainingSession(training_id)
);

CREATE TABLE event (
    event_id INT PRIMARY KEY,
    Event_type VARCHAR(50),
    schedule_id INT,
    FOREIGN KEY (schedule_id) REFERENCES schedule(Schedule_id)
);

CREATE TABLE loyalty (
    loyalty_id INT PRIMARY KEY,
    points INT
);

CREATE TABLE billing (
    billing_id INT PRIMARY KEY,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE
);