const { Client } = require('pg');
const client = new Client({
    user: 'idan',
    password: 'loloftw1234',
    host: '10.0.0.13',
    port: 5432,
    database: 'books-dev',
});

const connectToDB = async () => {
    await client.connect();
};

connectToDB()
    .then(() => console.log('Connected to PostgresSQL database...'));

export default client;