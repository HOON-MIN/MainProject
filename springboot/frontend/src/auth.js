import axios from "axios";

const users = [
  { id: "test1", pwd: "123", name: "Kim" },
  { id: "test2", pwd: "456", name: "Lee" },
  { id: "test3", pwd: "789", name: "Park" },
];

const username = "김훈민";
const user2 = {};
user2.name = username;
console.log("users2", user2);

axios.get("/member/memberlist").then((res) => {
  users.push(...res.data);
});
console.log(users);
export function SignIn({ id, pwd }) {
  const user = users.find((user) => user.id === id && user.pwd === pwd);
  localStorage.setItem("id", user.name);
  localStorage.setItem("num", user.num);
  if (user === undefined) throw new Error();
  return user;
}
