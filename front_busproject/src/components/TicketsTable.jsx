import React, { useState, useEffect } from "react";
import OneTicket from "./OneTicket";
import axios from "axios";
const TicketsTable = () => {
  const [tickets, setTickets] = useState([]);

  useEffect(() => {
    const user_id = sessionStorage.getItem("id");
    axios
      .get("tickets/user", { params: { user_id: user_id } })
      .then((response) => {
        setTickets(response.data);
      })
      .catch((error) => {
        alert("An error occurred. Please try again.");
      });
  }, []);

  return (
    <>
      <table className="table table-hover">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Passenger Count</th>
            <th scope="col">Timetable ID</th>
            <th scope="col">User (Your) ID</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket) => (
            <OneTicket key={ticket.id} ticket={ticket} />
          ))}
        </tbody>
      </table>
    </>
  );
};

export default TicketsTable;
