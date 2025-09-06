# MERN Blog

A modern full-stack blog application built with MongoDB, Express.js, React 18, and Node.js.

> **📅 Last Tested & Verified:** September 2025 
> This application has been tested and verified to work with the latest compatible versions of all dependencies as of September 2025.

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
- **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
- **MongoDB Community Edition** installed and running on localhost:27017
- **Homebrew** (for macOS) - [Install here](https://brew.sh/)

#### Installing MongoDB on macOS

If you don't have MongoDB installed, follow these steps:

1. **Install MongoDB using Homebrew:**
   ```bash
   # Add MongoDB tap
   brew tap mongodb/brew
   
   # Install MongoDB Community Edition
   brew install mongodb-community@8.0
   ```

2. **Start MongoDB as a macOS service (recommended):**
   ```bash
   brew services start mongodb-community@8.0
   ```

3. **Verify MongoDB is running:**
   ```bash
   # Check service status
   brew services list | grep mongodb
   
   # Or check processes
   ps aux | grep mongod
   
   # Or connect to verify
   mongosh
   ```

4. **Stop MongoDB when needed:**
   ```bash
   brew services stop mongodb-community@8.0
   ```

> **Note:** If you encounter security errors on macOS, go to System Preferences > Security & Privacy > General and click "Allow Anyway" for mongod.

For more details, see the [official MongoDB installation guide](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/).

### Easy Setup

Run the setup script (handles MongoDB installation and startup):
```bash
./setup.sh
```

### Manual Setup

**⚠️ Important: Follow these steps in order for the application to work correctly.**

1. **Install Dependencies:**
   ```bash
   # Backend
   cd my-blog-backend
   npm install
   
   # Frontend
   cd ../my-blog
   npm install
   ```

2. **Start the Application (3 terminals required):**
   
   **Terminal 1 - Start MongoDB:**
   ```bash
   # Check if MongoDB is running
   brew services list | grep mongodb
   
   # If not running, start it
   brew services start mongodb-community@8.0
   ```
   
   **Terminal 2 - Start Backend:**
   ```bash
   cd my-blog-backend
   npm run dev
   # Should show: "Server listening on port 8000"
   ```
   
   **Terminal 3 - Start Frontend:**
   ```bash
   cd my-blog
   npm start
   # Should show: "Compiled successfully!" and open browser
   ```

3. **Initialize Sample Data:**
   ```bash
   # In a new terminal or after backend is running
   curl http://localhost:8000/api/init
   # Should return: {"message":"Database initialized with sample data"}
   ```

4. **Access the Application:**
   - **Frontend**: http://localhost:3000 (opens automatically)
   - **Backend API**: http://localhost:8000
   - **Network Access**: http://192.168.0.11:3000 (for other devices)

### Development Commands

```bash
# Backend development
cd my-blog-backend
npm run dev          # Start with nodemon (auto-restart)

# Frontend development  
cd my-blog
npm start            # Start development server
npm run build        # Create production build
npm test             # Run tests
```

### Troubleshooting

**If frontend won't start:**
```bash
cd my-blog
rm -rf node_modules package-lock.json
npm install
npm start
```

**If backend won't start:**
- Ensure MongoDB is running: `brew services list | grep mongodb`
- Check port 8000 is free: `lsof -i :8000`

**If API calls fail:**
- Verify backend is running on port 8000
- Check MongoDB is running: `mongosh`

### Quick Verification

Once everything is running, verify the setup:

```bash
# Check MongoDB
brew services list | grep mongodb

# Check backend API
curl http://localhost:8000/api/init

# Check frontend
curl -I http://localhost:3000
```

**Expected Results:**
- MongoDB: `mongodb-community@8.0 started`
- Backend: `{"message":"Database initialized with sample data"}`
- Frontend: `HTTP/1.1 200 OK`

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

- ✅ **React 18** with modern hooks and concurrent features
- ✅ **React Router v6** with new routing syntax
- ✅ **Latest Express.js 4.18.2** and MongoDB 6.3.0 driver
- ✅ **ES6+ modules** (no Babel needed)
- ✅ **CORS support** for better development
- ✅ **Error handling and validation** with proper HTTP status codes
- ✅ **Easy setup script** with automatic MongoDB installation
- ✅ **Security vulnerabilities fixed** - All npm vulnerabilities resolved
- ✅ **Production ready** - Optimized build with no security issues
- ✅ **Comprehensive documentation** with troubleshooting guide

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes and test thoroughly
4. Commit your changes: `git commit -m 'Add feature'`
5. Push to the branch: `git push origin feature-name`
6. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).
