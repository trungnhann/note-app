# Test Case Documentation for Note App API

## Overview

This document provides a comprehensive set of test cases for the Note App API. Each test case includes a description, preconditions, steps to execute, expected results, and columns for tracking status and notes.

## Test Case Structure

Each test case follows this format:

| Field | Description |
|-------|-------------|
| **Test ID** | Unique identifier for the test case |
| **Module** | The module or feature being tested |
| **Description** | Brief description of what is being tested |
| **Preconditions** | Conditions that must be met before executing the test |
| **Steps** | Numbered steps to execute the test |
| **Test Data** | Sample data to use during testing |
| **Expected Results** | The expected outcome of the test |
| **Status** | Current status of the test (Pass/Fail/Not Tested) |
| **Notes** | Additional information, observations, or issues |

## Authentication Test Cases

### User Registration and Authentication

| Test ID | AUTH-001 |
|---------|----------|
| **Module** | Authentication |
| **Description** | Verify user registration with valid data |
| **Preconditions** | None |
| **Steps** | 1. Send POST request to `/api/v1/auth/register`<br>2. Include valid email, password, first_name, last_name |
| **Test Data** | <pre>{<br>  "email": "test@example.com",<br>  "password": "Password123!",<br>  "first_name": "Test",<br>  "last_name": "User"<br>}</pre> |
| **Expected Results** | - Status code: 201 Created<br>- Response includes user data and JWT token<br>- User is created in the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | AUTH-002 |
|---------|----------|
| **Module** | Authentication |
| **Description** | Verify user registration fails with invalid email format |
| **Preconditions** | None |
| **Steps** | 1. Send POST request to `/api/v1/auth/register`<br>2. Include invalid email format |
| **Test Data** | <pre>{<br>  "email": "invalid-email",<br>  "password": "Password123!",<br>  "first_name": "Test",<br>  "last_name": "User"<br>}</pre> |
| **Expected Results** | - Status code: 422 Unprocessable Entity<br>- Response includes validation error for email |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | AUTH-003 |
|---------|----------|
| **Module** | Authentication |
| **Description** | Verify user login with valid credentials |
| **Preconditions** | User exists in the system |
| **Steps** | 1. Send POST request to `/api/v1/auth/login`<br>2. Include valid email and password |
| **Test Data** | <pre>{<br>  "email": "test@example.com",<br>  "password": "Password123!"<br>}</pre> |
| **Expected Results** | - Status code: 200 OK<br>- Response includes user data and JWT token |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | AUTH-004 |
|---------|----------|
| **Module** | Authentication |
| **Description** | Verify user login fails with invalid credentials |
| **Preconditions** | User exists in the system |
| **Steps** | 1. Send POST request to `/api/v1/auth/login`<br>2. Include valid email but incorrect password |
| **Test Data** | <pre>{<br>  "email": "test@example.com",<br>  "password": "WrongPassword123!"<br>}</pre> |
| **Expected Results** | - Status code: 401 Unauthorized<br>- Response includes error message |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

## Project Test Cases

| Test ID | PROJ-001 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify creating a new project with valid data |
| **Preconditions** | User is authenticated with valid JWT token |
| **Steps** | 1. Send POST request to `/api/v1/projects`<br>2. Include valid project data<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "project": {<br>    "name": "Test Project",<br>    "description": "This is a test project",<br>    "color": "#FF5733"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 201 Created<br>- Response includes project data<br>- Project is created in the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | PROJ-002 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify creating a project fails without name |
| **Preconditions** | User is authenticated with valid JWT token |
| **Steps** | 1. Send POST request to `/api/v1/projects`<br>2. Include project data without name<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "project": {<br>    "description": "This is a test project",<br>    "color": "#FF5733"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 422 Unprocessable Entity<br>- Response includes validation error for name |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | PROJ-003 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify listing all projects for authenticated user |
| **Preconditions** | - User is authenticated with valid JWT token<br>- User has at least one project |
| **Steps** | 1. Send GET request to `/api/v1/projects`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes array of user's projects |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | PROJ-004 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify getting a specific project by ID |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project with specified ID exists and belongs to user |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes project data |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | PROJ-005 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify updating a project with valid data |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project with specified ID exists and belongs to user |
| **Steps** | 1. Send PUT request to `/api/v1/projects/{project_id}`<br>2. Include updated project data<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "project": {<br>    "name": "Updated Project Name",<br>    "description": "Updated description",<br>    "color": "#33FF57"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 200 OK<br>- Response includes updated project data<br>- Project is updated in the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | PROJ-006 |
|---------|----------|
| **Module** | Projects |
| **Description** | Verify deleting a project |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project with specified ID exists and belongs to user |
| **Steps** | 1. Send DELETE request to `/api/v1/projects/{project_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Project is removed from the database<br>- Associated tasks are also removed |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

## Task Test Cases

| Test ID | TASK-001 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify creating a new task with valid data |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user |
| **Steps** | 1. Send POST request to `/api/v1/projects/{project_id}/tasks`<br>2. Include valid task data<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "task": {<br>    "title": "Test Task",<br>    "description": "This is a test task",<br>    "due_date": "2023-12-31",<br>    "priority": "medium",<br>    "status": "pending"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 201 Created<br>- Response includes task data<br>- Task is created in the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-002 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify creating a task fails without title |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user |
| **Steps** | 1. Send POST request to `/api/v1/projects/{project_id}/tasks`<br>2. Include task data without title<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "task": {<br>    "description": "This is a test task",<br>    "due_date": "2023-12-31",<br>    "priority": "medium",<br>    "status": "pending"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 422 Unprocessable Entity<br>- Response includes validation error for title |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-003 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify listing all tasks for a specific project |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user<br>- Project has at least one task |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}/tasks`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes array of project's tasks |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-004 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify getting a specific task by ID |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Task with specified ID exists and belongs to user's project |
| **Steps** | 1. Send GET request to `/api/v1/tasks/{task_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes task data |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-005 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify updating a task with valid data |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Task with specified ID exists and belongs to user's project |
| **Steps** | 1. Send PUT request to `/api/v1/tasks/{task_id}`<br>2. Include updated task data<br>3. Include Authorization header with JWT token |
| **Test Data** | <pre>{<br>  "task": {<br>    "title": "Updated Task Title",<br>    "description": "Updated description",<br>    "due_date": "2024-01-15",<br>    "priority": "high",<br>    "status": "completed"<br>  }<br>}</pre> |
| **Expected Results** | - Status code: 200 OK<br>- Response includes updated task data<br>- Task is updated in the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-006 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify deleting a task |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Task with specified ID exists and belongs to user's project |
| **Steps** | 1. Send DELETE request to `/api/v1/tasks/{task_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Task is removed from the database |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-007 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify toggling task status |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Task with specified ID exists and belongs to user's project |
| **Steps** | 1. Send PUT request to `/api/v1/tasks/{task_id}/toggle_status`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes updated task with toggled status<br>- If task was 'pending', it should now be 'completed' and vice versa<br>- The 'completed' boolean field should be updated accordingly |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-008 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify filtering tasks by status |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user<br>- Project has tasks with different statuses |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}/tasks?status=pending`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes only tasks with 'pending' status |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-009 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify filtering tasks by priority |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user<br>- Project has tasks with different priorities |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}/tasks?priority=high`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes only tasks with 'high' priority |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-010 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify filtering tasks by due date (today's tasks) |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user<br>- Project has tasks with different due dates including today |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}/tasks?today=true`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes only tasks with due date equal to current date |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | TASK-011 |
|---------|----------|
| **Module** | Tasks |
| **Description** | Verify filtering tasks by overdue status |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project exists and belongs to user<br>- Project has tasks with due dates in the past |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}/tasks?overdue=true`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 200 OK<br>- Response includes only tasks with due dates before current date and not completed |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

## Authorization Test Cases

| Test ID | AUTH-005 |
|---------|----------|
| **Module** | Authorization |
| **Description** | Verify accessing a project that doesn't belong to the user |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Project with specified ID exists but belongs to another user |
| **Steps** | 1. Send GET request to `/api/v1/projects/{project_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 403 Forbidden<br>- Response includes unauthorized error message |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | AUTH-006 |
|---------|----------|
| **Module** | Authorization |
| **Description** | Verify accessing a task that doesn't belong to the user's projects |
| **Preconditions** | - User is authenticated with valid JWT token<br>- Task with specified ID exists but belongs to another user's project |
| **Steps** | 1. Send GET request to `/api/v1/tasks/{task_id}`<br>2. Include Authorization header with JWT token |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 403 Forbidden<br>- Response includes unauthorized error message |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | AUTH-007 |
|---------|----------|
| **Module** | Authorization |
| **Description** | Verify accessing API without authentication |
| **Preconditions** | None |
| **Steps** | 1. Send GET request to `/api/v1/projects`<br>2. Do not include Authorization header |
| **Test Data** | N/A |
| **Expected Results** | - Status code: 401 Unauthorized<br>- Response includes authentication error message |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

## Internationalization Test Cases

| Test ID | I18N-001 |
|---------|----------|
| **Module** | Internationalization |
| **Description** | Verify API responses in English |
| **Preconditions** | - User is authenticated with valid JWT token |
| **Steps** | 1. Send request with Accept-Language header set to 'en'<br>2. Perform various API operations |
| **Test Data** | N/A |
| **Expected Results** | - All response messages should be in English |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

| Test ID | I18N-002 |
|---------|----------|
| **Module** | Internationalization |
| **Description** | Verify API responses in Vietnamese |
| **Preconditions** | - User is authenticated with valid JWT token |
| **Steps** | 1. Send request with Accept-Language header set to 'vi'<br>2. Perform various API operations |
| **Test Data** | N/A |
| **Expected Results** | - All response messages should be in Vietnamese |
| **Status** | <select><option>Not Tested</option><option>Pass</option><option>Fail</option></select> |
| **Notes** |  |

## Instructions for Testers

### How to Use This Document

1. **Test Execution**:
   - Execute each test case in the order listed
   - Update the Status column by selecting from the dropdown (Pass/Fail/Not Tested)
   - Add any observations, issues, or additional information in the Notes column

2. **Environment Setup**:
   - Ensure you have access to the API endpoints
   - Use a tool like Postman, cURL, or any API testing tool
   - Keep track of created resources (user accounts, projects, tasks) for testing

3. **Test Data Management**:
   - Create test data as specified in the Test Data column
   - For tests that require existing data, use data created in previous tests

4. **Bug Reporting**:
   - For failed tests, provide detailed information in the Notes column
   - Include actual response, error messages, and steps to reproduce
   - Take screenshots if applicable

### Tips for Effective Testing

- **Boundary Testing**: Test with minimum and maximum values where applicable
- **Negative Testing**: Try invalid inputs to ensure proper error handling
- **Performance Testing**: Note any unusually slow responses
- **Security Testing**: Verify authorization works correctly for all endpoints