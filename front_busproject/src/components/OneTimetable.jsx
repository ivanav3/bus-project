import React from "react";
import { useState } from "react";
import axios from "axios";

const OneTimetable = ({ timetable }) => {
  const handleBuyTicket = () => {
    const passengerCount = document.getElementById("passengerCount").value;

    if (!passengerCount || passengerCount < 1) {
      alert("Please enter a valid number of passengers.");
    } else {
      const user_id = sessionStorage.getItem("id");
      console.log("user_id je " + user_id);
      axios
        .post("tickets/new", {
          user_id: user_id,
          passenger_count: passengerCount,
          timetable_id: timetable.id,
        })
        .then((response) => {
          alert("You bought a ticket!");
        })
        .catch((error) => {
          alert("Error occured. Try again!");
        });
    }
  };

  return (
    <>
      <tr>
        <th scope="row">{timetable.id}</th>
        <td>{timetable.from}</td>
        <td>{timetable.to}</td>
        <td>{timetable.date.toLocaleDateString()}</td>
        <td>{timetable.time}</td>
        <td>
          {sessionStorage.getItem("token") && (
            <>
              <input
                type="number"
                style={{ height: "30px", marginLeft: "10px", fontSize: "16px" }}
                placeholder="Number of passengers"
                min="1"
                id="passengerCount"
              />
              <button
                style={{ height: "40px", width: "70px", fontSize: "20px" }}
                onClick={handleBuyTicket}
              >
                Buy
              </button>
            </>
          )}
        </td>
      </tr>
    </>
  );
};

export default OneTimetable;
