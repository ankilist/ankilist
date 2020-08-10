import React, { useRef } from 'react';
import { Link } from 'react-router-dom';

const Upload = () => {
  const inputEl = useRef(null);

  const handleSubmit = (event) => {
    event.preventDefault();
    // alert( `Selected file - ${inputEl.current.files[0].name}`    );

    // TODO:
    // 1. fix how we are sending the token

    let formData = new FormData();

    formData.append('file', inputEl.current.files[0]);
    formData.append('authenticity_token', document.querySelector("meta[name=csrf-token]").getAttribute("content"));

    fetch("/uploads", {
      method: 'POST',
      body: formData
    }).then( (response) => {
      console.log(response.json());
    });
  }

  return (
    <React.Fragment>
      <form onSubmit={handleSubmit}>
        <label>
          Upload file:
          <input type="file" ref={inputEl} />
        </label>
        <input type="submit" />
      </form>
      <Link to="/">Cancel</Link>
    </React.Fragment>
  )
};

export default Upload;
