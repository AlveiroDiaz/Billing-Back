import { Router, Response, Request } from "express";
import { requiredFields } from "../../middleware/requiredFieldsMiddleware";
import { CustomerService } from "../../services/customers.service";
const router= Router();

router.post('/',async (req: Request, res: Response)=>{
    const result = await CustomerService.getCustomers()
    console.log(req.body);
    res.send(result)
})

module.exports = router;