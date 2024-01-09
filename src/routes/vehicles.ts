import { Router } from "express";
import { ServicesService } from "../services/services.service";
import { VehiclesService } from "../services/vehicles.service";
const debug = require("debug")("backend:routes:auth");

const router = Router(); 


router.get('/placa', async (req, res) => {
  try{
    const { placa } = req.query;
    const result = await VehiclesService.getVehicleByPlaca(""+placa);
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }
});

router.post('/', async (req, res) => {
  try{
    const { placa, marca, modelo, color, ownerId, typeVehicle } = req.body;
    const result = await VehiclesService.createVehicle(placa, marca, modelo, color, ownerId, typeVehicle);
    if(result) res.json({ status: 'Vehículo agregado' });
  }catch (error) {
    res.send(error.message);
  }
});

module.exports = router;
