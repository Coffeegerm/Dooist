// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from "next";
import { getTodos } from "@/services/api/todos";

type Data = {
  todos: any[];
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<Data>
) {
  const todos = await getTodos();
  res.status(200).json({ todos });
}
