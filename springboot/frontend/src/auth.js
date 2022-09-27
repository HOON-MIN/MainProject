import axios from "axios";

// 인증 체크
const users = [
  { id: "test1", pwd: "123", name: "김훈민", tel: "010-8787-8787", num: "0" },
];
axios.get("/member/memberlist").then((res) => {
  users.push(...res.data);
});

console.log(users);
export function SignIn({ id, pwd }) {
  const user = users.find((user) => user.id === id && user.pwd === pwd);
  localStorage.setItem("num", user.num);
  localStorage.setItem("id", user.name);
  localStorage.setItem("tel", user.tel);
  localStorage.setItem("addr", user.addr);
  if (user === undefined) throw new Error();
  return user;
}
