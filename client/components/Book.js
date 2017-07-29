import React from 'react';

const Book = ({ book, onBookClick }) => {
    const { id, title, author, description} = book;
    return (
        <div onClick={onBookClick.bind(null, id)}>
            <h3>{title}</h3>
            <h5>{author}</h5>
            <p>{description}</p>
        </div>
    );
};

export default Book;