import React from 'react';

const Book = ({ author, title, description }) => {
    return (
        <div>
            <h3>{title}</h3>
            <h5>{author}</h5>
            <p>{description}</p>
        </div>
    );
};

export default Book;