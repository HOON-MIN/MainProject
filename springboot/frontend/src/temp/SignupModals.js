import React, { useState } from "react";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import "../css/signupModal.css";
import logo from "../img/logo.png";
import axios from "axios";

const SignupModals = (props) => {
  const [mem_id, setMem_id] = useState("");
  const [mem_pwd, setMem_pwd] = useState("");
  const [mem_name, setMem_name] = useState("");
  const [email, setEmail] = useState("");
  const [ssn, setSsn] = useState("");
  const [tel, setTel] = useState("");
  const [addr, setAddr] = useState("");

  const signUpDB = (mem_id, mem_pwd, mem_name, ssn, tel, email, addr) => {
    console.log("회원가입", mem_id, mem_pwd, mem_name, ssn, tel, email, addr);
    axios
      .post("member/addMemberReact", null, {
        params: {
          id: mem_id,
          pwd: mem_pwd,
          name: mem_name,
          ssn: ssn,
          tel: tel,
          email: email,
          addr: addr,
        },
      })
      .then((res) => {
        console.log(res.params);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <Modal
      {...props}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">회원가입</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <div className="Container signupContainer">
          <form className="validation-form" onSubmit={signUpDB}>
            <div className="mb-3">
              <label for="mem_id">아이디</label>
              <input
                type="text"
                className="form-control"
                onChange={(e) => {
                  setMem_id(e.target.value);
                }}
                required
              />
            </div>

            <div className="row">
              <div className="col-md-6 mb-3">
                <label for="mem_pw">비밀번호 </label>
                <input
                  type="password"
                  className="form-control"
                  onChange={(e) => {
                    setMem_pwd(e.target.value);
                  }}
                  required
                />
              </div>

              <div className="col-md-6 mb-3">
                <label for="pwdChk">비밀번호 확인</label>
                <input
                  type="password"
                  className="form-control"
                  id="pwdChk"
                  name="pwdChk"
                />
                <div className="invalid-feedback">비밀번호를 입력해주세요.</div>
              </div>
            </div>

            <div className="mb-3">
              <label for="mem_name">이름</label>
              <input
                type="text"
                className="form-control"
                onChange={(e) => {
                  setMem_name(e.target.value);
                }}
                placeholder="김OO"
                required
              />
              <div className="invalid-feedback">이름을 입력해주세요.</div>
            </div>

            <div className="mb-3">
              <label for="mem_jubun">주민번호 </label>
              <input
                type="text"
                className="form-control"
                onChange={(e) => {
                  setSsn(e.target.value);
                }}
                placeholder="000000-1"
                required
              />
              <div className="invalid-feedback">주민번호를 입력해주세요.</div>
            </div>

            <div className="mb-3">
              <label for="mem_email">휴대폰번호</label>
              <input
                type="mem_phone"
                className="form-control"
                onChange={(e) => {
                  setTel(e.target.value);
                }}
                placeholder="010-0000-0000"
                required
              />
              <div className="invalid-feedback">휴대폰를 입력해주세요</div>
            </div>

            <div className="mb-3">
              <label for="email">이메일</label>
              <input
                type="email"
                className="form-control"
                onChange={(e) => {
                  setEmail(e.target.value);
                }}
                placeholder="you@example.com"
                required
              />
              <div className="invalid-feedback">이메일을 입력해주세요.</div>
            </div>

            <div className="mb-5">
              <label for="addr">주소</label>
              <input
                type="text"
                className="form-control"
                onChange={(e) => {
                  setAddr(e.target.value);
                }}
                required
              />
            </div>

            <div className="custom-control custom-checkbox text-center ">
              <input
                type="checkbox"
                className="custom-control-input"
                id="aggrement"
                required
              />
              <label className="custom-control-label" for="aggrement">
                개인정보 수집 및 이용에 동의합니다.
              </label>
            </div>

            <div className="mb-4 text-center">
              <button
                className="btn btn-primary text-white btn-block mt-3"
                type="submit"
              >
                가입완료
              </button>
            </div>
          </form>
        </div>
      </Modal.Body>
    </Modal>
  );
};

export default SignupModals;
