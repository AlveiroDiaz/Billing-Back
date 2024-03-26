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

router.get('/roles/hint', async (req, res) => {
  try{
    const { role, page } = req.query;
    const itemsPerPage = 14;
    const offset = (+page - 1);
    console.log(">>>>> pagina",offset);
    
    const result = await UsersService.getUsersByRoleHint(""+role,+itemsPerPage,offset);
   
    
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }
});

router.get('/roles/filters', async (req, res) => {
  try{
    const { role, page, name, placa, phone } = req.query;
    const itemsPerPage = 14;
    const offset = (+page - 1);
    console.log(">>>>> pagina",offset);

    let filterData: filterData ; 
    filterData.name = String(name);
    filterData.phone = String(phone);
    filterData.placa = String(placa);
  
    
    const result = await UsersService.getUsersByFilters(""+role,+itemsPerPage,offset,filterData);
   
    
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }
});

router.post('/', async (req, res) => {
  try{
    const { name, surname, phone, role, email } = req.body;
    const result = await UsersService.createUser(name,surname,phone,role, email);
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
