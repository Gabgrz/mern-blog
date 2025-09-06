#!/bin/bash

echo "🚀 Setting up MERN Blog Application..."

# Check if MongoDB is running
if ! pgrep -x "mongod" > /dev/null; then
    echo "⚠️  MongoDB is not running. Please start MongoDB first:"
    echo "   brew services start mongodb-community"
    echo "   or"
    echo "   sudo systemctl start mongod"
    echo ""
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
