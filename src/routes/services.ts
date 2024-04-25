import { Router } from "express";
import { ServicesService } from "../services/services.service";
const debug = require("debug")("backend:routes:auth");

const router = Router(); 

router.get('/catServices/:typeVehicle', async (req, res) => {
  try{
    const { typeVehicle } = req.params; // Obtén el valor de typeVehicle de los parámetros de la URL
    const result = await ServicesService.getCatServices(+typeVehicle);
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }

});

router.get('/service', async (req, res) => {
  try {
        
    const page = parseInt(req.query.page as string, 10) || 1; 
    const status = req.query.status as string; 

    console.log(">>>>>>",page , status);

    const pageSize = 10; 
    
    const result = await ServicesService.getServices(status,page,pageSize);

    res.send(result);
  } catch (error) {
    res.status(500).send({ error: error.message });
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

    router.get('/user/:userId/status/:status', async (req, res) => {
      const { userId,  status} = req.params;
      
    
      console.log("userId: " + userId);
      console.log("status: " + status);
      
      try {
        const result = await ServicesService.getServicesByUserAndStatus(
          "" + userId,
          "" + status
        );

          console.log(">>>> respuesta" , result);
          
        res.send(result);
      } catch (error) {
        res.send(error);
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
