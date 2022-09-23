import axios from "axios";

const users = [
  { id: "test1", pwd: "123", name: "김훈민", tel: "010-8787-8787", num: "0" },
  { id: "test2", pwd: "456", name: "Lee" },
  { id: "test3", pwd: "789", name: "Park" },
];

axios.get("/member/memberlist").then((res) => {
  users.push(...res.data);
});
console.log(users);
export function SignIn({ id, pwd }) {
  console.log("auth");
  const user = users.find((user) => user.id === id && user.pwd === pwd);
  localStorage.setItem("num", user.num);
  localStorage.setItem("id", user.name);
  localStorage.setItem("tel", user.tel);
  if (user === undefined) throw new Error();
  return user;
}
