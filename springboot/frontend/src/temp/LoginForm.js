import React, { useEffect, useState, history } from "react";
import Modal from "react-bootstrap/Modal";
import logo from "../img/logo.png";
import "../css/loginModal.css";
import axios from "axios";
import { Navigate, useNavigate, useLocation } from "react-router-dom";

const LoginForm = (props) => {
  const authenticated = props.authenticated;
  const login = props.login;
  const [id, setId] = useState("");
  const [pwd, setPwd] = useState("");
  const location = useLocation();

  const handleClick = () => {
    try {
      login({ id, pwd });
    } catch (e) {
      alert("Failed to login");
      setId("");
      setPwd("");
    }
  };

  const { from } = location.state || { from: { pathname: "/" } };
  if (authenticated) return <Navigate to={from} />;

  return (
    <Modal
      {...props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          Modal heading
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <div className="container loginContainer">
          <div className="text-center">
            <img src={logo} height="80" className="d-inline-block align-top" />
          </div>
          <div className="mb-3">
            <label className="form-label">아이디</label>
            <input
              className="form-control"
              value={id}
              onChange={({ target: { value } }) => setId(value)}
              type="text"
            />
          </div>
          <div className="mb-3">
            <label className="form-label">비밀번호</label>
            <input
              className="form-control"
              value={pwd}
              onChange={({ target: { value } }) => setPwd(value)}
              type="password"
              placeholder="password"
            />
          </div>
          <div className="mb-3 button">
            <button
              className="btn btn-outline-dark btn-sm"
              onClick={handleClick}
            >
              로그인
            </button>
          </div>

          <div className="links">
            <a href="memberId">아이디 찾기</a> <span>|</span>{" "}
            <a href="memberPw">비밀번호 찾기</a> <span>|</span>{" "}
            <a href="memberRegist">회원가입</a>
          </div>
        </div>
      </Modal.Body>
      <Modal.Footer>
        <button onClick={props.onHide}>Close</button>
      </Modal.Footer>
    </Modal>
  );
};

export default LoginForm;

// const loginModule = (e) => {
//   e.preventDefault();
//   setMsg("Loading...");
//   if (!inputId) {
//     return alert("ID를 입력하세요.");
//   } else if (!inputPw) {
//     return alert("Password를 입력하세요.");
//   } else {
//     let body = {
//       id: inputId,
//       pwd: inputPw,
//     };
//     axios.post("member/loginReact", body).then((res) => {
//       setLoading(false);
//       setTimeout(() => setMsg(""), 1500);
//       // code = 데이터 상태
//       const code = res.status;
//       setUser(res.data);
//       {
//         user && localStorage.setItem("name", user.name);
//         user && localStorage.setItem("num", user.num);
//       }
//       if (code === 400) {
//         // 비어있는
//         alert("비어있는 내용입니다.");
//       } else if (code === 401) {
//         // 존재하지 않는 id
//         alert("존재하지 않는 id입니다.");
//       } else if (code === 402) {
//         // 비밀번호가 틀렸을때
//         alert("비밀번호가 일치하지 않습니다.");
//       } else {
//         console.log(user);
//       }
//     });
//   }
//   setLoading(true);
//   setLog(localStorage.getItem("name"));
//   console.log(log);
//   alert("로그인되었습니다.");
//   props.onHide(false);
//   navigate("/dlist");
// };
