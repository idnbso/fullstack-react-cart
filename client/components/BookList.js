import React, { Component } from 'react';

import Book from './Book';

/**
 * Book list class component is the root component of the application.
 */
const BookList = (props) => {
    return (
        <div>
            {renderBooks(props)}
        </div>
    );
};

const renderBooks = ({ books, onBookClick}) => {
    return books.map((book, index) => {
        return (
            <Book
                key={index}
                onBookClick={onBookClick}
                book={book}
            />
        );
    });
};

export default BookList;