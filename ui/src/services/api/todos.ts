import api from "./api";

export const getTodos = async () => {
  const response = await api.get("/todos");
  return response.data;
};
