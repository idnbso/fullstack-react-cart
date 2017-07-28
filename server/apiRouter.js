/* eslint-disable new-cap */
const express = require('express');

import db from './db';

const router = express.Router();

router.get('/books', async (req, res) => {
    const result = await db.query('SELECT * from books', []);

    await res.send(result.rows);
});

router.get('/books/:bookId/reviews', async (req, res) => {
    const { bookId } = req.params;

    const result = await db.query(
        'SELECT * from reviews WHERE book_id = $1',
        [ bookId ]
    );

    await res.send(result.rows);
});

export default router;