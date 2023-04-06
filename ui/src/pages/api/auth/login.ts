import { logUserIn } from "@/services/api/auth";
import type { NextApiRequest, NextApiResponse } from "next";

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  const { email, password } = req.body;
  console.log({ req });
  if (!email || !password) {
    return res.status(400).json({ message: "Email and password are required" });
  }
  const result = await logUserIn(email, password);
  res.status(200).json(result);
}
