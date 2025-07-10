# Note App API
A modern RESTful API for managing notes, tasks, and projects with user authentication and authorization.

## Overview
This Rails API provides a backend for a note-taking application that allows users to create projects and tasks. It features JWT authentication, policy-based authorization with Pundit, and a service-oriented architecture.

## Features
- User Authentication : Secure signup and login with JWT tokens
- Projects Management : Create, read, update, and delete projects
- Tasks Management : Create, read, update, and delete tasks within projects
- Authorization : Policy-based access control using Pundit
- Service-Oriented Architecture : Clean, maintainable code structure
## Technology Stack
- Ruby on Rails 8.0.2 : API-only application
- PostgreSQL : Database with UUID primary keys
- JWT : JSON Web Tokens for authentication
- Pundit : Authorization policies
- Solid Queue/Cache/Cable : Database-backed adapters for Rails
## Setup and Installation
### Prerequisites
- Ruby 3.x
- PostgreSQL
- Docker (for deployment)
### Local Development
1. Clone the repository
   
   ```
   git clone https://github.com/yourusername/note-app.git
   cd note-app
   ```
2. Install dependencies
   
   ```
   bundle install
   ```
3. Setup the database
   
   ```
   rails db:create db:migrate db:seed
   ```
4. Start the server
   
   ```
   rails server
   ```
## Authentication
All API endpoints (except signup and login) require authentication. Include the JWT token in the Authorization header:

```
Authorization: Bearer your_jwt_token
```
## Authorization
The application uses Pundit policies to ensure users can only access their own projects and tasks:

- Users can only view, edit, and delete their own projects
- Users can only view, edit, and delete tasks that belong to their projects
## Error Handling
The API returns consistent error responses with appropriate HTTP status codes:

```
{
  "success": false,
  "message": "Error message",
  "errors": {}
}
```
## Development
### Code Quality
The project uses RuboCop for code quality and style checking:

```
rubocop
```
### Testing
Run the test suite with:

```
rails test
```

## Contributing
1. Fork the repository
2. Create your feature branch ( git checkout -b feature/amazing-feature )
3. Commit your changes ( git commit -m 'Add some amazing feature' )
4. Push to the branch ( git push origin feature/amazing-feature )
5. Open a Pull Request