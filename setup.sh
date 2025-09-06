#!/bin/bash

echo "🚀 Setting up MERN Blog Application..."

# Check if MongoDB is installed
if ! command -v mongod &> /dev/null; then
    echo "❌ MongoDB is not installed. Installing MongoDB Community Edition..."
    echo ""
    echo "Installing MongoDB using Homebrew..."
    brew tap mongodb/brew
    brew install mongodb-community@8.0
    echo ""
fi

# Check if MongoDB is running
if ! pgrep -x "mongod" > /dev/null; then
    echo "⚠️  MongoDB is not running. Starting MongoDB..."
    brew services start mongodb-community@8.0
    sleep 3
    
    # Verify MongoDB started successfully
    if pgrep -x "mongod" > /dev/null; then
        echo "✅ MongoDB started successfully!"
    else
        echo "❌ Failed to start MongoDB. Please start it manually:"
        echo "   brew services start mongodb-community@8.0"
        echo ""
        exit 1
    fi
else
    echo "✅ MongoDB is already running!"
fi

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd my-blog-backend
npm install
if [ $? -ne 0 ]; then
    echo "❌ Backend dependency installation failed"
    exit 1
fi
cd ..

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd my-blog
npm install
if [ $? -ne 0 ]; then
    echo "❌ Frontend dependency installation failed"
    exit 1
fi
cd ..

echo "✅ Setup complete!"
echo ""
echo "🚀 To run the application, open 3 terminals and run:"
echo ""
echo "Terminal 1 - MongoDB (if not already running):"
echo "  brew services start mongodb-community@8.0"
echo ""
echo "Terminal 2 - Backend:"
echo "  cd my-blog-backend && npm run dev"
echo ""
echo "Terminal 3 - Frontend:"
echo "  cd my-blog && npm start"
echo ""
echo "Then initialize sample data:"
echo "  curl http://localhost:8000/api/init"
echo ""
echo "🌐 The app will be available at http://localhost:3000"
