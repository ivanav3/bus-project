import React from "react";
import Timetables from "../components/Timetables";
import { useState, useEffect } from "react";
import useData from "../useData";
import SearchTimetable from "../components/SearchTimetable";

const TimetablesPage = () => {
  const [timetables, setTimetables] = useState([]);
  const timetablesData = useData("timetables/");

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
      }
    };
    if (timetablesData && timetablesData.length > 0) {
      formatTT();
    }
  }, [timetablesData]);

  return (
    <div>{timetables ? <Timetables timetables={timetables} /> : <></>}</div>
  );
};

export default TimetablesPage;
