import React from "react";
import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const Login = ({ setIsLoggedIn }) => {
  let navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = () => {
    axios
      .post("timetables/user/login", { username, password })
      .then((response) => {
        sessionStorage.setItem("username", response.data.username);
        sessionStorage.setItem("first_name", response.data.first_name);
        sessionStorage.setItem("last_name", response.data.last_name);
        sessionStorage.setItem("token", response.data.csrf_token);
        setIsLoggedIn(true);
        alert("You are logged in!");
        navigate("/");
      })
      .catch((error) => {
        alert("An error occurred. Please try again.");
      });
  };

  return (
    <div>
      <div style={{ marginTop: "50px" }}>
        <label htmlFor="username-input" style={{ marginRight: "10px" }}>
          Username:
        </label>
        <input
          id="username-input"
          type="text"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          style={{ marginRight: "30px" }}
        />
        <label htmlFor="password-input" style={{ marginLeft: "10px" }}>
          Password:
        </label>
        <input
          id="password-input"
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          style={{ marginLeft: "30px" }}
        />
      </div>

      <button onClick={handleLogin}>OK</button>
    </div>
  );
};

export default Login;
