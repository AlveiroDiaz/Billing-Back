import { Router } from "express";
import { UsersService } from "../services/users.service";
const debug = require("debug")("backend:routes:auth");

const router = Router();

router.get('/phone/:phone', async (req, res) => {
  try{
    const { phone } = req.params;
    const result = await UsersService.getUsersByPhone(phone);
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }
});

router.get('/roles', async (req, res) => {
  try{
    const { role, page } = req.query;
    const itemsPerPage = 11;
    const result = await UsersService.getUsersByRole(""+role, +page, itemsPerPage)
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }

});

module.exports = router;
