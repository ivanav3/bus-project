import React, { useState, useEffect } from "react";
import OneTimetable from "./OneTimetable";
import useData from "../useData";

const TimetablesTable = ({ timetables }) => {
  return (
    <>
      <table className="table table-hover">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">From</th>
            <th scope="col">To</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
          </tr>
        </thead>
        <tbody>
          {timetables.map((timetable) => (
            <OneTimetable key={timetable.id} timetable={timetable} />
          ))}
        </tbody>
      </table>
    </>
  );
};

export default TimetablesTable;
