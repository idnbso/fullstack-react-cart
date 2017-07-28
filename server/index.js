const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.static('client'));
app.set('view engine', 'ejs');

import serverRender from './render';
import apiRouter from './apiRouter';

app.get('/', async (req, res) => {
    const {markup, initialData} = await serverRender();

    res.render('index', {
        markup,
        initialData,
    });
});

app.use('/api', apiRouter);

app.listen(8080, () => {
    console.log('Server is running...');
});