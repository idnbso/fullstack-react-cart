import React, { Component } from 'react';

import BookList from './BookList';

/**
 * App class component is the root component of the application.
 */
class App extends Component {
    /**
     * App class component constructor.
     */
    constructor() {
        super();

        this.state = {
            answer: 42,
        };
    }

    /**
     * Renders the App component with JSX.
     * @returns {HTML} - the html component
     */
    render() {
        return (
            <div>
                <h2>Hello from component {this.state.answer}</h2>
                <BookList/>
            </div>
        );
    }
}

export default App;