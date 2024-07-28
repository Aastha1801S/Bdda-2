-- Drop the database if it exists
DROP DATABASE IF EXISTS EventManagement;

-- Create the database
CREATE DATABASE EventManagement;
USE EventManagement;

-- Create the Organizer table
CREATE TABLE Organizer (
    OrganizerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- Create the Venue table
CREATE TABLE Venue (
    VenueID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    Capacity INT
);

-- Create the Speaker table
CREATE TABLE Speaker (
    SpeakerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Bio TEXT
);

-- Create the Event table
CREATE TABLE Event (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Date DATE,
    Description TEXT,
    OrganizerID INT,
    VenueID INT,
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);

-- Create the Attendee table
CREATE TABLE Attendee (
    AttendeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255)
);

-- Create the Ticket table
CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT,
    AttendeeID INT,
    Price DECIMAL(10, 2),
    SeatNumber VARCHAR(50),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);

-- Create the Sponsor table
CREATE TABLE Sponsor (
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- Create the Session table
CREATE TABLE Session (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT,
    Name VARCHAR(255) NOT NULL,
    SpeakerID INT,
    Time DATETIME,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (SpeakerID) REFERENCES Speaker(SpeakerID)
);

-- Create the Marketing Campaign table
CREATE TABLE MarketingCampaign (
    CampaignID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10, 2),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

-- Create the Promotion table
CREATE TABLE Promotion (
    PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    CampaignID INT,
    Discount DECIMAL(5, 2),
    Description TEXT,
    FOREIGN KEY (CampaignID) REFERENCES MarketingCampaign(CampaignID)
);
