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




module.exports = router;
