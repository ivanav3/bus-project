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

  const [departureSearchQuery, setDepartureSearchQuery] = useState("");
  const [arrivalSearchQuery, setArrivalSearchQuery] = useState("");
  const [filteredDepartureCities, setFilteredDepartureCities] = useState([]);
  const [filteredArrivalCities, setFilteredArrivalCities] = useState([]);

  const handleDepartureInputChange = (e) => {
    const query = e.target.value;
    setDepartureSearchQuery(query);

    if (query.length > 0) {
      const filtered = cities.filter((city) =>
        city.name.toLowerCase().includes(query.toLowerCase())
      );
      setFilteredDepartureCities(filtered);
    } else {
      setFilteredDepartureCities([]);
    }
  };

  const handleArrivalInputChange = (e) => {
    const query = e.target.value;
    setArrivalSearchQuery(query);

    if (query.length > 0) {
      const filtered = cities.filter((city) =>
        city.name.toLowerCase().includes(query.toLowerCase())
      );
      setFilteredArrivalCities(filtered);
    } else {
      setFilteredArrivalCities([]);
    }
  };

  const handleDepartureSelect = (cityName) => {
    setDeparture(cityName);
    setDepartureSearchQuery(cityName);
    setFilteredDepartureCities([]);
  };

  const handleArrivalSelect = (cityName) => {
    setArrival(cityName);
    setArrivalSearchQuery(cityName);
    setFilteredArrivalCities([]);
  };

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
    const tempD = departure;
    const depSQ = departureSearchQuery;

    setDeparture(arrival);
    setDepartureSearchQuery(arrivalSearchQuery);

    setArrival(tempD);
    setArrivalSearchQuery(depSQ);

    handleDepartureInputChange({ target: { value: arrivalSearchQuery } });
    handleArrivalInputChange({ target: { value: departureSearchQuery } });
  };
  return (
    <div>
      <h2>Search</h2>
      <form onSubmit={handleSubmit}>
        <div className="upper-form">
          <div style={{ margin: "10px 10px 10px 10px" }}>
            <label htmlFor="departure">From:</label>
            <input
              id="departure"
              type="text"
              value={departureSearchQuery}
              onChange={handleDepartureInputChange}
              placeholder="Start typing..."
              style={{ width: "100%", margin: "10px 10px 10px 10px" }}
            />
            <select
              id="departure"
              value={departureSearchQuery}
              onChange={(e) => handleDepartureSelect(e.target.value)}
              style={{
                width: "100%",
                padding: "8px",
                margin: "10px 10px 10px 10px",
              }}
            >
              <option value="">Select a city</option>
              {filteredDepartureCities.length > 0 ? (
                filteredDepartureCities.map((city) => (
                  <option key={city.id} value={city.name}>
                    {city.name}
                  </option>
                ))
              ) : (
                <option value="">No cities found</option>
              )}
            </select>
          </div>
          <div style={{ margin: "10px 10px 10px 10px" }}>
            <label htmlFor="arrival">To:</label>
            <input
              id="arrival"
              type="text"
              value={arrivalSearchQuery}
              onChange={handleArrivalInputChange}
              placeholder="Start typing..."
              style={{ width: "100%", margin: "10px 10px 10px 10px" }}
            />
            <select
              id="arrival"
              value={arrivalSearchQuery}
              onChange={(e) => handleArrivalSelect(e.target.value)}
              style={{
                width: "100%",
                padding: "8px",
                margin: "10px 10px 10px 10px",
              }}
            >
              <option value="">Select a city</option>
              {filteredArrivalCities.length > 0 ? (
                filteredArrivalCities.map((city) => (
                  <option key={city.id} value={city.name}>
                    {city.name}
                  </option>
                ))
              ) : (
                <option value="">No cities found</option>
              )}
            </select>
          </div>
        </div>

        <div class="upper-form lower-form">
          <div>
            <label htmlFor="date">Date:</label>
            <input
              type="date"
              id="date"
              value={date}
              onChange={(e) => setDate(e.target.value)}
              style={{
                width: "100%",
                padding: "8px",
                margin: "10px 10px 10px 10px",
              }}
            />
          </div>

          <button type="submit">Submit</button>
          <button onClick={swapCities}>Swap Cities</button>
        </div>
      </form>

      <div>
        {result.length > 0 ? (
          <>
            <h2>Matching results</h2>
            <TimetablesTable timetables={result} />
          </>
        ) : (
          <p></p>
        )}
      </div>
    </div>
  );
};

export default SearchTimetable;
