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

router.get('/service', async (req, res) => {
  try{
    const result = await ServicesService.getServices();
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


  router.patch('/status/:serviceid', async (req, res) => {
    const { serviceid } = req.params;
    const { status } = req.body;
    try{
      const result = await ServicesService.modificateStatusService(+serviceid,status);
      if(result){
        res.json({ status: 'Servicio actualizado' });
      }else{
        res.status(500).json({ error: 'Error al modificar el estado de un servicio' });
      }
      
    }catch (error) {
      res.send(error.message);
    }
    });

    router.get('/date', async (req, res) => {
      const { startDate, endDate, workerId } = req.query;
    
      console.log("startDate: " + startDate);
      console.log("endDate: " + endDate);
      console.log("workerId: " + workerId)
      
      try {
        const result = await ServicesService.getServiceByDate(
          "" + startDate,
          "" + endDate,
          workerId !== undefined ? Number(workerId) : null
        );
        res.send(result);
      } catch (error) {
        res.send(error);
      }
    });
    




module.exports = router;
