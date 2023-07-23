import { Request, Response, NextFunction } from "express";


function requiredFields (fields: string[]) {
    return function (req: Request, res: Response, next: NextFunction) {
      for (const field of fields) {
        if (!(field in req.body)) {
          const error = new Error(`Missing required field in body`)
          return next(error)
        }
      }
      next()
    }
  }

export { requiredFields }