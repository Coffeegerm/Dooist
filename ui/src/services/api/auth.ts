import api from "./api";

export async function logUserIn(email: string, password: string) {
  return api.post("/auth/login", { email, password }).then((res) => res.data);
}
