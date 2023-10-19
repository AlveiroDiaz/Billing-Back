import { Router } from "express";
import { UsersService } from "../services/users.service";
import { autenticationMiddleware } from "../middleware/AuthenticationMiddleware";
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
    const { role } = req.query;
    const result = await UsersService.getUsersByRole(""+role);
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }

});


router.post('/test', autenticationMiddleware(), async (req, res) => {
  try{
    
    res.send('ok');
    
  }catch (error) {
    res.send(error.message);
  }

});

module.exports = router;
