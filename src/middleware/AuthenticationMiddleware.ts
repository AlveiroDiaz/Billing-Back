import { Request, Response, NextFunction } from "express";


function autenticationMiddleware () {
    return function (req: Request, res: Response, next: NextFunction) {
     const token = req.headers.authorization;
     if(!token){
        res.status(401).json(
          {message : "Not authorizer"}
        );
     }
     next();
    }
  }

export { autenticationMiddleware }