import { Router } from "express";
import { ServicesService } from "../services/services.service";
import { VehiclesService } from "../services/vehicles.service";
import { CatalogsService } from "../services/catalogs.service";
const debug = require("debug")("backend:routes:auth");

const router = Router(); 


router.get('/brands', async (req, res) => {
  try{
    const result = await CatalogsService.getAllBrands();
    res.send(result);
  }catch (error) {
    res.send(error.message);
  }
});

router.get('/models/:idMarca', async (req, res) => {
  try {
    const { idMarca } = req.params;
    const result = await CatalogsService.getModelsByBrandId(parseInt(idMarca));
    res.send(result);
  } catch (error) {
    res.send(error.message);
  }
});


module.exports = router;
