import React, { Component } from 'react';

import Book from './Book';

/**
 * Book list class component is the root component of the application.
 */
class BookList extends Component {
    /**
     * Book list class component constructor.
     */
    constructor() {
        super();

        this.state = {
            books: [
                {
                    title: 'Harry Potter',
                    author: 'JK Rolling',
                    description: 'This is the first Harry Potter book',
                },
                {
                    title: 'Harry Potter II',
                    author: 'JK Rolling',
                    description: 'This is the second Harry Potter book',
                },
                {
                    title: 'Harry Potter III',
                    author: 'JK Rolling',
                    description: 'This is the third Harry Potter book',
                },
            ],
        };
    }

    /**
     * Renders the books stored in the current state of the component.
     */
    renderBooks() {
        return this.state.books.map((book, index) => {
            return (
                <Book
                    key={index}
                    title={book.title}
                    author={book.author}
                    description={book.description}
                />
            );
        });
    }

    /**
     * Renders the Book list component with JSX.
     * @returns {HTML} - the html component
     */
    render() {
        return (
            <div>
                {this.renderBooks()}
            </div>
        );
    }
}

export default BookList;