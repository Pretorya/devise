🎉 Eventbrite Clone – Rails Application

This project is a minimal but functional clone of Eventbrite, built with Ruby on Rails.
It allows users to sign up, create events, view events, and manage their own profile.

The project focuses on:

Authentication with Devise

Clean MVC architecture

Bootstrap UI

Basic PWA integration

Email notifications with Action Mailer

🚀 Features
👤 Authentication (Devise)

User registration (sign up)

User login / logout

Secure password management

Access control for protected pages

🏠 Home Page (Events Index)

Displays all available events

Each event links to its detailed page

Invitation to create a new event

📄 Event Management

Users can:

Create an event with:

start_date

duration

title

description

price

location

View event details:

title

description

number of participants

creator (email)

start date and end date

location and price

Only authenticated users can create events.

🙋 User Profile Page

Each user has a personal profile page that displays:

Email

First name

Last name

Description

Events created by the user

Security rules:

A user can only access their own profile page

Other users’ profiles are forbidden

Visitors must be logged in to access profile pages

🧭 Navigation Bar (Bootstrap)

The navbar contains:

Home (events list)

Create an event

Authentication dropdown:

If not logged in:

Sign up

Log in

If logged in:

My profile

Log out

✉️ Mailer

A welcome email is sent when a user is created

Emails are sent using Action Mailer with SMTP (Gmail)

Tested locally with Yopmail addresses

📱 Progressive Web App (PWA)

Manifest and service worker enabled

Installable web application (basic PWA support)

🗄 Database Structure
User

Attributes:

email (string)

encrypted_password (string)

first_name (string)

last_name (string)

description (text)

Associations:

has_many :events

has_many :attendances

has_many :participated_events through attendances

Event

Attributes:

start_date (datetime)

duration (integer)

title (string)

description (text)

price (integer)

location (string)

Validations:

start_date must not be in the past

duration must be positive and a multiple of 5

title length between 5 and 140 characters

description length between 20 and 1000 characters

price between 1 and 1000

presence of all fields

Associations:

belongs_to :user (creator)

has_many :attendances

has_many :users through attendances

Attendance

Attributes:

stripe_customer_id (string)

Associations:

belongs_to :user

belongs_to :event

⚙️ Tech Stack

Ruby on Rails 8

PostgreSQL

Devise (authentication)

Bootstrap (frontend UI)

Action Mailer (emails)

PWA support

SMTP (Gmail)

🛠 Installation
git clone <your-repo-url>
cd eventbrite
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server

Visit:
http://localhost:3000

🧪 Seed Data

The seed file creates:

Several users with @yopmail.com emails

Sample events

Sample attendances (which trigger email notifications)

🔐 Access Control

Only logged-in users can:

Create events

Access their profile

A user cannot view another user’s profile

Devise handles session management

📌 Future Improvements

Event registration (Stripe payment)

Profile picture upload (Active Storage)

Admin interface

Event validation system

City-based filtering

Better UI styling