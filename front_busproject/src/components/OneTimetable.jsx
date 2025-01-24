import React from "react";

const OneTimetable = ({ timetable }) => {
  return (
    <tr>
      <th scope="row">{timetable.id}</th>
      <td>{timetable.from}</td>
      <td>{timetable.to}</td>
      <td>{timetable.date.toLocaleDateString()}</td>
      <td>{timetable.time}</td>
    </tr>
  );
};

export default OneTimetable;
