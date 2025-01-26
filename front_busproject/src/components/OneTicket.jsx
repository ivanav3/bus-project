import React from "react";
const OneTicket = ({ ticket }) => {
  return (
    <>
      <tr>
        <th scope="row">{ticket.id}</th>
        <td>{ticket.passenger_count}</td>
        <td>{ticket.timetable_id}</td>
        <td>{ticket.user_id}</td>
      </tr>
    </>
  );
};

export default OneTicket;
