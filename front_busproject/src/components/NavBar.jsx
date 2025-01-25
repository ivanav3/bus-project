import React from "react";
import imgSrc from "../assets/img/one.png";
import { useNavigate } from "react-router-dom";

const NavBar = ({ isLoggedIn, setIsLoggedIn }) => {
  let navigate = useNavigate();

  const onClickRegister = () => {
    navigate("/register");
  };

  const onClickLogin = () => {
    navigate("/login");
  };

  const handleLogout = () => {
    sessionStorage.removeItem("username");
    sessionStorage.removeItem("first_name");
    sessionStorage.removeItem("last_name");
    sessionStorage.removeItem("token");
    setIsLoggedIn(false);
  };

  return (
    <div className="navBar">
      <a href="/">
        <img src={imgSrc} alt="bus-picture" className="img" />
      </a>
      {isLoggedIn ? (
        <div>
          <button className="menu-button">
            ☰
            <div className="dropdown" onClick={() => handleLogout()}>
              Logout
            </div>
          </button>
        </div>
      ) : (
        <div className="buttons">
          <button onClick={onClickRegister}>Register</button>
          <button onClick={onClickLogin}>Login</button>
        </div>
      )}
    </div>
  );
};

export default NavBar;
