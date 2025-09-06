# MERN Blog

A full-stack blog application built with MongoDB, Express.js, React, and Node.js.

## Features

- Article listing and individual article pages
- Upvoting system for articles
- Comment system for articles
- Responsive navigation
- About page

## Tech Stack

**Frontend:**
- React 16.8.6
- React Router DOM
- CSS3

**Backend:**
- Node.js
- Express.js
- MongoDB
- Babel (ES6+ support)

## Quick Start

### Prerequisites
- Node.js
- MongoDB running on localhost:27017

### Installation

1. **Backend Setup:**
   ```bash
   cd my-blog-backend
   npm install
   npm start
   ```

2. **Frontend Setup:**
   ```bash
   cd my-blog
   npm install
   npm start
   ```

3. **Access the app:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000

## API Endpoints

- `GET /api/articles/:name` - Get article by name
- `POST /api/articles/:name/upvote` - Upvote article
- `POST /api/articles/:name/add-comment` - Add comment to article

## Project Structure

```
mern-my-blog/
├── my-blog/              # React frontend
│   ├── src/
│   │   ├── components/   # Reusable components
│   │   └── pages/        # Page components
│   └── public/
└── my-blog-backend/      # Express backend
    └── src/
        └── server.js     # Main server file
```
