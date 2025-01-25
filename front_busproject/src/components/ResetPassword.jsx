import React from "react";
import { useState } from "react";
import axios from "axios";

const ResetPassword = () => {
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const handleSubmit = (e) => {
    e.preventDefault();
    if (newPassword !== confirmPassword) {
      alert("New password and confirmation do not match.");
      return;
    }
    const id = sessionStorage.getItem("id");
    const username = sessionStorage.getItem("username");
    axios
      .post("timetables/user/verify", {
        username: username,
        password: oldPassword,
      })
      .then((response) => {
        if (response.status === 200) {
          return axios.put("timetables/user/resetPassword", {
            id: id,
            username: username,
            password: newPassword,
          });
        } else {
          throw new Error("Verification failed");
        }
      })
      .then((resetResponse) => {
        console.log(id + " " + " username " + " " + newPassword);
        console.log(resetResponse.data);
        alert("Successfully changed password!");
      })
      .catch((error) => {
        alert("An error occurred. Please try again.");
      });
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="oldPassword" style={{ marginRight: "50px" }}>
          Old:
        </label>
        <input
          type="password"
          id="oldPassword"
          value={oldPassword}
          onChange={(e) => setOldPassword(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="newPassword" style={{ marginRight: "44px" }}>
          New:
        </label>
        <input
          type="password"
          id="newPassword"
          value={newPassword}
          onChange={(e) => setNewPassword(e.target.value)}
          required
        />
      </div>
      <div>
        <label htmlFor="confirmPassword" style={{ marginRight: "29px" }}>
          Repeat:
        </label>
        <input
          type="password"
          id="confirmPassword"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          required
        />
      </div>
      <button type="submit">Reset password</button>
    </form>
  );
};

export default ResetPassword;
