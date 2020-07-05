import React from 'react';

type CardProps = { header: string, body: string, button: string };
const Card: React.FC<CardProps> = ({ header, body, button }) => {
  return (
    <div className="card">
      <h5>{header}</h5>
      <p>{body}</p>
      <button type="button">{button}</button>
    </div>
  )
};

export default Card;
