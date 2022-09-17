import React, { useState } from "react";

const Categories = (props) => {
  const [category, setCategory] = useState([]);
  const test = [];
  props.doctor.map((majors) => {
    test.push(majors.dmajor);
  });
  const uniqueTest = test.filter(
    (category, index) => test.indexOf(category) === index
  );
  console.log(uniqueTest);

  {
    uniqueTest.map((category, index) => console.log(index));
  }

  return (
    <ul className="nav nav-tabs justify-content-center">
      <li className="nav-item">
        <a className="nav-link active" aria-current="page" href="#">
          모든 진료과
        </a>
      </li>

      {uniqueTest.map((category, index) => (
        <li className="nav-item">
          <a className="nav-link" href="#">
            {category}
          </a>
        </li>
      ))}
    </ul>
  );
};

export default Categories;
