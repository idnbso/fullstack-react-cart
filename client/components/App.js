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
            reviews: {},
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
     * Fetches the rating for a selected book by its id value.
     * @param bookId - the id value of the book
     * @returns {Promise.<void>} - the promise after the book is fetched
     */
    async fetchReviewsForBook(bookId) {
        if (this.state.reviews[ bookId ]) {
            return;
        }

        const response = await axios.get(`http://localhost:8080/api/books/${bookId}/reviews`);
        const reviews = response.data;
        this.setState((prevState) => {
            const currentReviews = prevState.reviews;
            currentReviews[ bookId ] = reviews;
            return { reviews: currentReviews };
        });
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
                <BookList
                    books={books}
                    onBookClick={this.fetchReviewsForBook.bind(this)}
                />
            </div>
        );
    }
}

export default App;