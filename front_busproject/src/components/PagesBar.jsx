import React from "react";
import { Link } from "react-router-dom";

const PagesBar = () => {
  return (
    <div className="pages-bar">
      <Link to="/">
        <div className="page-button">Home</div>
      </Link>
      <Link to="/timetables" className="link-page">
        <div className="page-button">Timetables</div>
      </Link>
    </div>
  );
};

export default PagesBar;
