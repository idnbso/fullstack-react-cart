import React from 'react';
import ReactDOM from 'react-dom';

import App from './components/App';

ReactDOM.render(
    <App initialData={JSON.parse(window.__initialData__)}/>,
    document.getElementById('root')
);
