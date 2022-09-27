import React from "react";
import Modal from "react-bootstrap/Modal";
import logo from "../img/logo.png";
import "../css/loginModal.css";

const LoginModal = (props) => {
  return (
    <div>
      <Modal
        {...props}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            <div className="text-center">로그인</div>
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div class="container loginContainer">
            <div className="text-center">
              <img
                src={logo}
                height="80"
                className="d-inline-block align-top"
              />
            </div>
            <form action="loginProcess" method="post">
              <div class="mb-3">
                <label class="form-label" for="mem_id">
                  아이디
                </label>
                <input
                  class="form-control"
                  type="text"
                  name="mem_id"
                  id="mem_id"
                />
              </div>
              <div class="mb-3">
                <label class="form-label" for="mem_pwd">
                  비밀번호
                </label>
                <input
                  class="form-control"
                  type="password"
                  name="mem_pw"
                  id="mem_pw"
                />
              </div>
              <div class="mb-3 button">
                <button class="btn btn-outline-dark btn-sm" type="submit">
                  로그인
                </button>
              </div>
            </form>

            <div class="links">
              <a href="memberId">아이디 찾기</a> <span>|</span>{" "}
              <a href="memberPw">비밀번호 찾기</a> <span>|</span>{" "}
              <a href="memberRegist">회원가입</a>
            </div>
          </div>
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default LoginModal;
