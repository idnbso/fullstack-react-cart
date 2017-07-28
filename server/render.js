const React = require('react');
const ReactDOMServer = require('react-dom/server');
import axios from 'axios';

import App from '../client/components/App';

export default async () => {
    const response = await axios.get('http://localhost:8080/api/books/');
    const initialData = response.data;

    return {
        markup: ReactDOMServer.renderToString(<App initialData={initialData}/>),
        initialData,
    };
};
