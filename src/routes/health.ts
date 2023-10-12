import { Router,Response,Request } from "express";
const debug = require("debug")("backend:routes:health");
const wrapper = require("express-debug-async-wrap")(debug);

const router = Router();

router.get('/', (req: Request, res: Response)=>{
    res.send("OK")
})




module.exports = router;