import React, { Component } from 'react';
import axios from 'axios';

import BookList from './BookList';

/**
 * App class component is the root component of the application.
 */
class App extends Component {
    /**
     * App class component constructor.
     */
    constructor(props) {
        super(props);

        this.state = {
            books: this.props.initialData,
        };
    }

    /**
     * Runs after the component is mounted on the DOM.
     */
    async componentDidMount() {
        const response = await axios.get('http://localhost:8080/api/books/');
        const books = response.data;
        this.setState({ books });
    }

    /**
     * Renders the App component with JSX.
     * @returns {XML} - the html component
     */
    render() {
        const { books } = this.state;

        return (
            <div>
                <h2>The Books List</h2>
                <BookList books={books}/>
            </div>
        );
    }
}

export default App;