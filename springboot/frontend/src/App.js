import React, {useState,useEffect} from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  const [message, setMessage] = useState("");

  useEffect(() =>{
    fetch('/hello')
      .then(response => response.text())
      .then(message => {
        setMessage(message);
      });
  },[])
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          이렇게 하면 되는걸까요?
          {message}
        </a>
      </header>
    </div>
  );
}

export default App;
