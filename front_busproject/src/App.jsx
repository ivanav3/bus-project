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
import ResetPassword from "./components/ResetPassword";
import TicketsTable from "./components/TicketsTable";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    const csrfToken = sessionStorage.getItem("token");
    if (csrfToken) {
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
          <Route
            path="/timetables"
            element={<TimetablesPage isLoggedIn={isLoggedIn} />}
          ></Route>
          <Route path="/register" element={<Register />}></Route>
          <Route
            path="/login"
            element={<Login setIsLoggedIn={setIsLoggedIn} />}
          ></Route>
          <Route path="/resetPassword" element={<ResetPassword />}></Route>
          <Route path="/myTickets" element={<TicketsTable />}></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
