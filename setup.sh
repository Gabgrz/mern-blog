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
cd ..

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd my-blog
npm install
cd ..

echo "✅ Setup complete!"
echo ""
echo "To run the application:"
echo "1. Start MongoDB (if not already running)"
echo "2. Start the backend: cd my-blog-backend && npm run dev"
echo "3. Start the frontend: cd my-blog && npm start"
echo "4. Initialize sample data: curl http://localhost:8000/api/init"
echo ""
echo "The app will be available at http://localhost:3000"
