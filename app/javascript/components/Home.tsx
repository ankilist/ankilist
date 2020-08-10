import React from 'react';
import Card from './Card';

export default () => (
  <div className="grid">
    <h1>AnkiList</h1>
    <h2>Turn Language lists into Anki cards effortlessly</h2>
    <section className="card-section">
      <Card header="Upload a list" body="Upload a text file containing words to be converted" button="Upload"/>
      <Card header="Paste a list" body="Paste a list of words directly to be converted" button="Paste"/>
    </section>
  </div>
);
