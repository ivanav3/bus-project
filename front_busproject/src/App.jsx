import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import NavBar from "./components/NavBar";
import TimetablesPage from "./pages/TimetablesPage";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import PagesBar from "./components/PagesBar";
import Home from "./pages/Home";
import Register from "./pages/Register";
import Login from "./pages/Login";
import { useState, useEffect } from "react";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const csrfToken = sessionStorage.getItem("csrf_token");
    if (csrfToken) {
      console.log("ucitavanje jedno");
      setIsLoggedIn(true);
    } else {
      setIsLoggedIn(false);
    }
  }, [setIsLoggedIn]);

  return (
    <div className="App">
      <BrowserRouter>
        <NavBar isLoggedIn={isLoggedIn} setIsLoggedIn={setIsLoggedIn} />
        <PagesBar />
        <Routes>
          <Route path="/" element={<Home />}></Route>
          <Route path="/timetables" element={<TimetablesPage />}></Route>
          <Route path="/register" element={<Register />}></Route>
          <Route
            path="/login"
            element={<Login setIsLoggedIn={setIsLoggedIn} />}
          ></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
