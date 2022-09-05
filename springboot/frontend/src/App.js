import React, {useState,useEffect} from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    axios({
      method: "GET",
      url: "https://jsonplaceholder.typicode.com/users",
    }).then((response) => setUsers(response.data));
  });

  useEffect(() => {
    fetch("/hello")
      .then((response) => response.text())
      .then((date) => {
        setDate(date);
      });
  }, []);
  return (
    <BrowserRouter>
      <Header />
      {date}
      <Routes>
        <Route
          path="/"
          element={
            <header className="App-header">
              <img src={logo} className="App-logo" alt="logo" />
            </header>
          }
        ></Route>

        <Route path="/date" element={<span>{date}</span>}></Route>

        <Route path="/login" element={<Login />}></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
