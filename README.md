# MERN Blog

A modern full-stack blog application built with MongoDB, Express.js, React 18, and Node.js.

## Features

- Article listing and individual article pages
- Upvoting system for articles
- Comment system for articles
- Responsive navigation
- About page
- Modern React 18 with hooks
- ES6+ backend with native modules

## Tech Stack

**Frontend:**
- React 18.2.0
- React Router DOM 6.20.1
- React Scripts 5.0.1
- CSS3

**Backend:**
- Node.js (ES6+ modules)
- Express.js 4.18.2
- MongoDB 6.3.0
- CORS support

## Quick Start

### Prerequisites
- Node.js (v14 or higher)
- MongoDB running on localhost:27017

### Easy Setup

Run the setup script:
```bash
./setup.sh
```

### Manual Setup

1. **Install Dependencies:**
   ```bash
   # Backend
   cd my-blog-backend
   npm install
   
   # Frontend
   cd ../my-blog
   npm install
   ```

2. **Start the Application:**
   ```bash
   # Terminal 1 - Backend
   cd my-blog-backend
   npm run dev
   
   # Terminal 2 - Frontend
   cd my-blog
   npm start
   ```

3. **Initialize Sample Data:**
   ```bash
   curl http://localhost:8000/api/init
   ```

4. **Access the app:**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000

## API Endpoints

- `GET /api/init` - Initialize database with sample data
- `GET /api/articles/:name` - Get article by name
- `POST /api/articles/:name/upvote` - Upvote article
- `POST /api/articles/:name/add-comment` - Add comment to article

## Project Structure

```
mern-my-blog/
├── my-blog/              # React 18 frontend
│   ├── src/
│   │   ├── components/   # Reusable components
│   │   └── pages/        # Page components
│   └── public/
├── my-blog-backend/      # Express backend
│   └── src/
│       └── server.js     # Main server file
└── setup.sh             # Setup script
```

## What's New

- ✅ Updated to React 18 with modern hooks
- ✅ React Router v6 with new routing syntax
- ✅ Latest Express.js and MongoDB driver
- ✅ ES6+ modules (no Babel needed)
- ✅ CORS support for better development
- ✅ Error handling and validation
- ✅ Easy setup script
