import React from "react";

const Mypage = () => {
  const user = useSelector((state) => state.user);
  const dispatch = useDispatch();

  const LogoutFunc = () => {
    console.log("로그아웃");
    dispatch(clearUser());
  };

  return (
    <>
      <h1>MyPage</h1>
      <p>{user.name}님, 안녕하세요!</p>
      <button onClick={() => LogoutFunc()}>로그아웃</button>
    </>
  );
};

export default Mypage;
