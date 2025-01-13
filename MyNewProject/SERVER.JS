const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: true }));

// Serve the HTML file
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'login.html'));
});

// Handle login form submission
app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    // Read the text file with allowed users
    fs.readFile('users.txt', 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading file:', err);
            res.send('An error occurred while reading user data.');
            return;
        }

        const users = data.split('\n').map(line => line.trim());
        const loginValid = users.some(line => {
            const [storedUser, storedPass] = line.split(':');
            return storedUser === username && (!password || storedPass === password);
        });

        if (loginValid) {
            res.send('Login successful! Welcome to the website.');
        } else {
            res.redirect('/create-account'); // Redirect to the create account page
        }
    });
});

// Registration page (if login fails)
app.get('/create-account', (req, res) => {
    res.sendFile(path.join(__dirname, 'create_new_account.html')); // Serve the account creation page
});

// Create new account handler
app.post('/create-account', (req, res) => {
    const { username, password } = req.body;

    // Write the new user to the users.txt file (you may need to validate or hash the password in a real app)
    fs.appendFile('users.txt', `${username}:${password}\n`, (err) => {
        if (err) {
            console.error('Error saving user:', err);
            res.send('An error occurred while saving the user.');
            return;
        }
        res.send('Account created successfully! You can now log in.');
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
