import React from "react"
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';


function Header(){
    return(
      <Navbar bg="primary" variant="dark">
          <Container>
            <Navbar.Brand href="#home">우리의 로고</Navbar.Brand>
            <Nav className="justify-content-end">
              <Nav.Link href="#login">로그인</Nav.Link>
              <Nav.Link href="#join">회원가입</Nav.Link>
              <Nav.Link href="#mypage" disabled>마이페이지</Nav.Link>
            </Nav>
          </Container>
        </Navbar>
    )
  }
  export default Header