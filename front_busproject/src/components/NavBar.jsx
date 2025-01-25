import React from "react";
import imgSrc from "../assets/img/one.png";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const NavBar = ({ isLoggedIn, setIsLoggedIn }) => {
  let navigate = useNavigate();

  const onClickRegister = () => {
    navigate("/register");
  };

  const onClickLogin = () => {
    navigate("/login");
  };

  const handleLogout = () => {
    sessionStorage.removeItem("id");
    sessionStorage.removeItem("username");
    sessionStorage.removeItem("first_name");
    sessionStorage.removeItem("last_name");
    sessionStorage.removeItem("token");
    setIsLoggedIn(false);
    navigate("/");
  };

  const handleDeleteAccountRoute = () => {
    const id = sessionStorage.getItem("id");
    const username = sessionStorage.getItem("username");
    axios
      .delete("timetables/user/delete", {
        data: { id: id, username: username },
      })
      .then((response) => {
        navigate("/");
      })
      .catch((error) => {
        alert("An error occurred. Please try again.");
      });
  };

  const handleDeleteAccount = () => {
    const userConfirmed = window.confirm(
      "Are you sure you want to delete your account?"
    );
    if (userConfirmed) {
      handleDeleteAccountRoute();
      sessionStorage.removeItem("id");
      sessionStorage.removeItem("username");
      sessionStorage.removeItem("first_name");
      sessionStorage.removeItem("last_name");
      sessionStorage.removeItem("token");
      setIsLoggedIn(false);
      alert("Account deleted!");
    } else {
      alert("Account deletion canceled.");
    }
  };

  const handleResetPassword = () => {
    navigate("/resetPassword");
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
            <div className="dropdown">
              <div
                className="dropdown-item"
                onClick={() => handleResetPassword()}
              >
                Reset password
              </div>
              <div
                className="dropdown-item"
                onClick={() => handleDeleteAccount()}
              >
                Delete account
              </div>

              <div className="dropdown-item" onClick={() => handleLogout()}>
                Logout
              </div>
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
