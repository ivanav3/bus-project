import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import NavBar from "./components/NavBar";
import TimetablesPage from "./pages/TimetablesPage";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import PagesBar from "./components/PagesBar";
import Home from "./pages/Home";

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <NavBar />
        <PagesBar />
        <Routes>
          <Route path="/" element={<Home />}></Route>
          <Route path="/timetables" element={<TimetablesPage />}></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
