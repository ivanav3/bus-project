import React from "react";
import { useState, useEffect } from "react";
import useData from "../useData";
import TimetablesTable from "./TimetablesTable";

const SearchTimetable = ({ search_timetables }) => {
  const today = new Date().toISOString().split("T")[0];
  const [departure, setDeparture] = useState("");
  const [arrival, setArrival] = useState("");
  const [date, setDate] = useState(today);
  const [result, setResult] = useState("");

  const [cities, setCities] = useState([]);
  const citiesData = useData("timetables/cities");

  useEffect(() => {
    const formatCity = () => {
      if (citiesData) {
        let formattedCities = citiesData.map((city) => ({
          id: city.id,
          name: city.name,
          postal_code: city.postal_code,
        }));
        console.log("formatirani gradovi: " + formattedCities);
        setCities(formattedCities);
      }
    };
    if (citiesData && citiesData.length > 0) {
      formatCity();
    }
  }, [citiesData]);

  const filterTimetables = () => {
    const filteredTT = search_timetables.filter((timetable) => {
      const departureCityName = timetable.from || "";
      const arrivalCityName = timetable.to || "";
      return (
        departureCityName.toLowerCase().includes(departure.toLowerCase()) &&
        arrivalCityName.toLowerCase().includes(arrival.toLowerCase()) &&
        timetable.date.toISOString().split("T")[0] === date
      );
    });
    setResult(filteredTT);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    filterTimetables();
  };

  const swapCities = () => {
    const temp = departure;
    setDeparture(arrival);
    setArrival(temp);
  };
  return (
    <div>
      <h2>Search</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="departure">From:</label>
          <select
            id="departure"
            value={departure}
            onChange={(e) => setDeparture(e.target.value)}
          >
            <option value="">Select a city</option>
            {cities.map((city) => (
              <option key={city.id} value={city.name}>
                {city.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="arrival">To:</label>
          <select
            id="arrival"
            value={arrival}
            onChange={(e) => setArrival(e.target.value)}
          >
            <option value="">Select a city</option>
            {cities.map((city) => (
              <option key={city.id} value={city.name}>
                {city.name}
              </option>
            ))}
          </select>
        </div>

        <div>
          <label htmlFor="date">Date:</label>
          <input
            type="date"
            id="date"
            value={date}
            onChange={(e) => setDate(e.target.value)}
          />
        </div>

        <button type="submit">Submit</button>
      </form>
      <button onClick={swapCities} style={{ marginTop: "10px" }}>
        Swap Cities
      </button>
      <div>
        {result.length > 0 ? <TimetablesTable timetables={result} /> : <p></p>}
      </div>
    </div>
  );
};

export default SearchTimetable;
