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

    console.log('Connected to PostgresSQL database...');
};

connectToDB()
    .then(() => {});

export default client;