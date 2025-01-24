import React, { useState, useEffect } from "react";
import OneTimetable from "./OneTimetable";
import useData from "../useData";

const Timetables = () => {
  const [timetables, setTimetables] = useState([]);
  const timetablesData = useData("timetables/");

  const [timetable, setTimetable] = useState(null);

  console.log(timetablesData);

  useEffect(() => {
    const formatTT = () => {
      if (timetablesData) {
        let formattedTT = timetablesData.map((timetable) => ({
          id: timetable.id,
          from: timetable.departure_city.name,
          to: timetable.arrival_city.name,
          date: new Date(timetable.date),
          time: timetable.time,
        }));
        formattedTT.sort((a, b) => {
          return a.date - b.date;
        });
        formattedTT.sort((a, b) => {
          return a.time - b.time;
        });

        setTimetables(formattedTT);
        setTimetable(formattedTT[0]);
      }
    };
    if (timetablesData && timetablesData.length > 0) {
      formatTT();
    }
  }, [timetablesData]);

  return (
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
  );
};

export default Timetables;
