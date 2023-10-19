import { Router } from "express";
import { ServicesService } from "../services/services.service";
const debug = require("debug")("backend:routes:auth");

const router = Router(); 

router.get('/catServices', async (req, res) => {
  try{
    const result = await ServicesService.getCatServices();
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }

});

router.post('/service', async (req, res) => {
  const { userId, service, status, vehicleId } = req.body;
  try{
    const result = await ServicesService.createService(userId, service, status, vehicleId);

    if(result){
      res.json({ status: 'Servicio agregado' });
    }else{
      res.status(500).json({ error: 'Error interno del servidor' });
    }
    
  }catch (error) {
    res.send(error.message);
  }
  });




module.exports = router;
