import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import NavBar from "./components/NavBar";
import Timetables from "./components/Timetables";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="App">
      <NavBar></NavBar>
      <Timetables />
    </div>
  );
}

export default App;
