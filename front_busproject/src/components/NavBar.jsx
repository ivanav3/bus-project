import React from "react";
import imgSrc from "../assets/img/one.png";
import { useNavigate } from "react-router-dom";

const NavBar = () => {
  const navigate = useNavigate();

  const onClickRegister = () => {
    navigate("/register");
  };

  return (
    <div className="navBar">
      <a href="/">
        <img src={imgSrc} alt="bus-picture" className="img" />
      </a>
      <div className="buttons">
        <button onClick={onClickRegister}>Register</button>
        <button>Login</button>
      </div>
    </div>
  );
};

export default NavBar;
