import React from 'react';

const Card: React.FC = () => {
  return (
    <div className="card">
      <h5>Upload a list</h5>
      <p>Upload a text file containing words to be converted</p>
      <button type="button">Upload</button>
    </div>
  )
};

export default Card;
