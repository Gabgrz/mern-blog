import express from 'express';
import { MongoClient } from 'mongodb';
import path from 'path';
import { fileURLToPath } from 'url';
import cors from 'cors';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Sample articles data
const sampleArticles = [
    {
        name: 'learn-react',
        upvotes: 0,
        comments: [],
    }, {
        name: 'learn-node',
        upvotes: 0,
        comments: [],
    }, {
        name: 'my-thoughts-on-resumes',
        upvotes: 0,
        comments: [],
    },
];

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '/build')));

const withDB = async (operations, res) => {
    try {
        const client = new MongoClient('mongodb://localhost:27017');
        await client.connect();
        const db = client.db('my-blog');
    
        await operations(db);
    
        await client.close();
    } catch (error) {
        res.status(500).json({ message: 'Error connecting to db', error: error.message });
    }
}

// Initialize sample data
app.get('/api/init', async (req, res) => {
    withDB(async (db) => {
        const articlesCollection = db.collection('articles');
        
        // Clear existing articles
        await articlesCollection.deleteMany({});
        
        // Insert sample articles
        await articlesCollection.insertMany(sampleArticles);
        
        res.status(200).json({ message: 'Database initialized with sample data' });
    }, res);
});

app.get('/api/articles/:name', async (req, res) => {
    withDB(async (db) => {
        const articleName = req.params.name;
        const articleInfo = await db.collection('articles').findOne({ name: articleName });
        
        if (!articleInfo) {
            res.status(404).json({ message: 'Article not found' });
            return;
        }
        
        res.status(200).json(articleInfo);
    }, res);
});

app.post('/api/articles/:name/upvote', async (req, res) => {
    withDB(async (db) => {
        const articleName = req.params.name;
    
        const articleInfo = await db.collection('articles').findOne({ name: articleName });
        
        if (!articleInfo) {
            res.status(404).json({ message: 'Article not found' });
            return;
        }
        
        await db.collection('articles').updateOne({ name: articleName }, {
            '$set': {
                upvotes: articleInfo.upvotes + 1,
            },
        });
        
        const updatedArticleInfo = await db.collection('articles').findOne({ name: articleName });
        res.status(200).json(updatedArticleInfo);
    }, res);
});

app.post('/api/articles/:name/add-comment', async (req, res) => {
    const { username, text } = req.body;
    const articleName = req.params.name;

    if (!username || !text) {
        res.status(400).json({ message: 'Username and text are required' });
        return;
    }

    withDB(async (db) => {
        const articleInfo = await db.collection('articles').findOne({ name: articleName });
        
        if (!articleInfo) {
            res.status(404).json({ message: 'Article not found' });
            return;
        }
        
        await db.collection('articles').updateOne({ name: articleName }, {
            '$set': {
                comments: articleInfo.comments.concat({ username, text }),
            },
        });
        
        const updatedArticleInfo = await db.collection('articles').findOne({ name: articleName });
        res.status(200).json(updatedArticleInfo);
    }, res);
});

app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, '/build/index.html'));
});

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));