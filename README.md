
# File Upload and Management System

This Ruby on Rails application allows authenticated users to upload and manage large files. It supports:
- User authentication via email and password.
- Viewing and managing uploaded files.
- Sharing files via tiny URLs.
- Compressing files for efficient storage.

## Prerequisites

Ensure you have the following installed:
- **Ruby** (3.2.1 or compatible)
- **Rails** (7.x)
- **Bundler**: Install via `gem install bundler`

---

## Setup Instructions

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone <repository_url>
cd <repository_name>
```

### 2. Install Dependencies

Run the following command to install the required gems and dependencies:

```bash
bundle install
```

### 3. Set Up the Database

Create the database and run the migrations to set up the schema:

```bash
rails db:create
rails db:migrate
```

### 4. Start the Rails Server

Start the Rails server by running:

```bash
rails s
```

### 5. Access the Application

Open your web browser and navigate to:

```
http://localhost:3000
```

You should be able to view and interact with the app.

---

## Features

- **User Authentication**: Secure login system for users to upload and manage their files.
- **File Management**: Upload, view, and delete files. Metadata such as title and description can be attached.
- **File Sharing**: Generate tiny URLs for public access to uploaded files.
- **File Compression**: Compress uploaded files (such as text or image files) to save storage space.

---


