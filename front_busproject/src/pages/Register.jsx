import React from "react";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Register = () => {
  let navigate = useNavigate();

  const [formData, setFormData] = useState({
    username: "",
    first_name: "",
    last_name: "",
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const emailRegex = /^[a-zA-Z0-9._]+@[a-zA-Z0-9._]+\.[a-zA-Z]{2,}$/;
    if (!emailRegex.test(formData.email)) {
      alert("Please enter a valid email address.");
      return;
    }

    if (formData.password.length < 5) {
      alert("Password needs to be at least 5 characters long.");
      return;
    }
    axios
      .post("timetables/user/new", formData)
      .then((response) => {
        alert("Successfully registered!");
        navigate("/");
      })
      .catch((error) => {
        alert("Error occured. Try again!");
      });
  };

  return (
    <form>
      <div>
        <label htmlFor="username" className="register-lbl">
          Username:
        </label>
        <input
          type="text"
          id="username"
          name="username"
          value={formData.username}
          onChange={handleChange}
          required
          className="register-input"
        />
      </div>

      <div>
        <label htmlFor="firstName" className="register-lbl">
          First name:{" "}
        </label>
        <input
          type="text"
          id="firstName"
          name="first_name"
          value={formData.first_name}
          onChange={handleChange}
          required
          className="register-input"
        />
      </div>

      <div>
        <label htmlFor="lastName" className="register-lbl">
          Last name:
        </label>
        <input
          type="text"
          id="lastName"
          name="last_name"
          value={formData.last_name}
          onChange={handleChange}
          required
          className="register-input"
        />
      </div>

      <div>
        <label htmlFor="email" className="register-lbl">
          Email:
        </label>
        <input
          type="email"
          id="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          required
          className="register-input"
        />
      </div>

      <div>
        <label htmlFor="password" className="register-lbl">
          Password:
        </label>
        <input
          type="password"
          id="password"
          name="password"
          value={formData.password}
          onChange={handleChange}
          required
          className="register-input"
        />
      </div>

      <button type="submit" onClick={handleSubmit}>
        Submit
      </button>
    </form>
  );
};
export default Register;
