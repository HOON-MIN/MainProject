// import React, { useState } from "react";
// import Nav from "react-bootstrap/Nav";

// const Categories = (props) => {
//   console.log("디테일", props.selectCategory);
//   //왠지 모르겠지만... 계속 4번 담겨서 다시 리팩토링..
//   const refCategory = [];
//   props.categories.map((category) => {
//     refCategory.push(category.cname);
//   });

//   //중복 다시 제거..
//   const resCategory = refCategory.filter(
//     (number, index) => refCategory.indexOf(number) === index
//   );

//   return (
//     <Nav fill variant="tabs" defaultActiveKey="dlist">
//       <Nav.Item>
//         <Nav.Link eventKey="dlist" key="모든진료과">
//           모든진료과
//         </Nav.Link>
//       </Nav.Item>
//       {resCategory.map((e, index) => (
//         <Nav.Item>
//           <Nav.Link
//             key={e}
//             eventKey={index}
//             active={props.selectCategory === e}
//             onClick={() => props.onSelect(e)}
//           >
//             {e}
//           </Nav.Link>
//         </Nav.Item>
//       ))}
//     </Nav>
//   );
// };

// export default Categories;

// JSP 부트스트랩
// <ul className="nav nav-pills justify-content-center">
//   <li className="nav-item">
//     <a className="nav-link active" aria-current="page" href="#">
//       모든 진료과
//     </a>
//   </li>

//   {uniqueTest.map((category, index) => (
//     <li className="nav-item">
//       <a className="nav-link" href="#">
//         {category}
//       </a>
//     </li>
//   ))}
// </ul>
