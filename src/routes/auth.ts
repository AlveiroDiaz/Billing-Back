import { Request, Response, Router } from "express";
import { Login, RefreshToken } from "utils/models/commons/auth.common";
import { AuthService } from "../services/auth.service";
const debug = require("debug")("backend:routes:auth");

const router = Router();

router.post("/logup", (req: Request, res: Response) => {
  res.send("OK");
});

router.post("/login", async (req: Request, res: Response) => {
  try {
    const request: Login = req.body;
    const result = AuthService.SigIn(request);
    console.log("🚀 ~ file: auth.ts:16 ~ router.post ~ result:", result);
    res.send(result);
  } catch (error) {
    res.send(error.message);
  }
});

router.post("/logout", (req: Request, res: Response) => {
  res.send("OK");
});

router.post("/refresh-token", (req: Request, res: Response) => {
  try {
    const request: RefreshToken = req.body;
    const result = AuthService.RefreshToken(request);
    console.log("🚀 ~ file: auth.ts:31 ~ router.post ~ result:", result);
    res.send(result);
  } catch (error) {}
});

router.post("/forgot-password", (req: Request, res: Response) => {
  res.send("OK");
});

router.post("/decode-test", (req: Request, res: Response) => {
  try {
    const result = AuthService.DecodeToken(req.body.token);
    res.send(result);
  } catch (error) {
    res.send(error);
  }
});

module.exports = router;
