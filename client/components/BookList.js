import React, { Component } from 'react';

import Book from './Book';

/**
 * Book list class component is the root component of the application.
 */
const BookList = ({ books }) => {
    return (
        <div>
            {renderBooks(books)}
        </div>
    );
};

const renderBooks = (books) => {
    return books.map((book, index) => {
        return (
            <Book key={index} {...book} />
        );
    });
};

export default BookList;