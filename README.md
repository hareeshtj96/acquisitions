**Acquisitions API**

A production-ready Express.js REST API for user management, authentication, and role-based access control (RBAC).

Built with modern backend tools like Drizzle ORM, Neon PostgreSQL, and Arcjet security, this project focuses on scalability, security, and clean architecture.

**Features**

**Authentication**

JWT-based authentication stored in HTTP-only cookies

Secure signup, signin, and logout

**User Management**

Full CRUD operations

Role-based permissions (Admin vs User)

**Security**

Rate limiting

Bot protection & request shielding using Arcjet

**Database**

PostgreSQL (Neon)

Type-safe queries with Drizzle ORM

**Docker Support**

Development & production-ready setups

**Code Quality**

ESLint + Prettier configured

**Testing**

Jest + Supertest for API testing

**Tech Stack**

Backend: Node.js, Express.js

Database: PostgreSQL (Neon)

ORM: Drizzle ORM

Authentication: JWT (cookies)

Security: Arcjet

Testing: Jest, Supertest

Containerization: Docker

**Getting Started**
**Prerequisites**

Node.js (v20+ recommended)

Docker (for local database setup)

npm or yarn

**Clone Repository**
git clone https://github.com/hareeshtj96/acquisitions.git
cd acquisitions

**Environment Variables**

Create:

.env.development

.env.production

Example:

# Database
DATABASE_URL=postgresql://neon:npg@localhost:5432/neondb

# JWT
JWT_SECRET=your-super-secret-key

# Arcjet
ARCJET_KEY=your-arcjet-key

# Optional
PORT=3000
LOG_LEVEL=info

Running the Application
Using Docker (Recommended)
Development Mode
npm run dev:docker

Includes:

Neon local database

Hot reload with nodemon

Auto migrations

**Production Mode**
npm run prod:docker
**Without Docker**
npm install
npm run db:migrate
npm start

**API Endpoints**
**Public Routes**
Method	Endpoint	Description
GET	/	Welcome message
GET	/health	Health check
GET	/api	API status
POST	/api/auth/sign-up	Register user
POST	/api/auth/sign-in	Login user
POST	/api/auth/sign-out	Logout user
**Protected Routes (Require Auth)**
Method	Endpoint	Description
GET	/api/users	Get all users
GET	/api/users/:id	Get user by ID
PUT	/api/users/:id	Update user (self/admin)
DELETE	/api/users/:id	Delete user (admin only)

**Authentication & Authorization**

JWT stored in HTTP-only cookies

Token verified via middleware

User data attached to req.user

Role-based access:

user

admin

**Database (Drizzle + Neon)**

Schema: src/models/user.model.js

Commands:
npm run db:generate   # Generate migrations
npm run db:migrate    # Apply migrations
npm run db:studio     # Open DB UI

**Testing**
npm test
**Linting & Formatting**
npm run lint
npm run lint:fix
npm run format
npm run format:check


