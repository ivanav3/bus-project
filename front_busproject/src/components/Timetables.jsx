import React, { useState, useEffect } from "react";
import OneTimetable from "./OneTimetable";
import useData from "../useData";
import SearchTimetable from "./SearchTimetable";
import TimetablesTable from "./TimetablesTable";

const Timetables = ({ timetables }) => {
  return (
    <>
      <SearchTimetable search_timetables={timetables} />
      <TimetablesTable timetables={timetables} />
    </>
  );
};

export default Timetables;
