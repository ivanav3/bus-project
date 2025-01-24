import React from "react";
import imgSrc from "../assets/img/one.png";

const NavBar = ({ onClick, label }) => {
  return (
    <div className="navBar">
      <a href="/">
        <img src={imgSrc} alt="bus-picture" className="img" />
      </a>
      <div className="buttons">
        <button onClick={onClick}>Register</button>
        <button onClick={onClick}>Login</button>
      </div>
    </div>
  );
};

export default NavBar;
