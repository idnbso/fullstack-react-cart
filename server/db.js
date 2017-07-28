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

    const res = await client.query('SELECT * from books', []);

    console.log(res.rows);
};

connectToDB()
    .then(() => {});