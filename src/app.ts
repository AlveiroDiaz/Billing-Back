import "reflect-metadata";
import "dotenv/config";
import express, { NextFunction, Request, Response } from "express";
import cors from "cors";
import { routeLoader } from "./utils/routeLoader";
import  BodyParser  from "body-parser";
const debug = require('debug')('backend:server')
const logger = require('morgan-debug')

const PORT = process.env.PORT || 3000;

const app = express();
app.use(cors({
  origin: '*'
}));
app.use(BodyParser.json({ strict: false, type: '*/json', limit: 50 * 1024 * 1024 }))
app.use(BodyParser.urlencoded({ extended: true }))

//Logger
app.use(logger('backend:requests', 'START :method :url', {
    immediate: true,
    skip (req: Request, res: Response) {
      return req.path === '/health'
    }
  }))
  app.use(logger('backend:requests', 'DONE :method :url :status :res[content-length] - :response-time ms', {
    skip (req: Request, res: Response) {
      return req.originalUrl === '/health'
    }
  }))

//Routes loader
routeLoader(app);


// Error handler
app.use((err: any, req: Request, res:Response, next: NextFunction) => {
    err.status = err.status || 400
    const betterDebug = err.debug ? err.debug : debug
    delete err.debug
    if (err.status < 500) delete err.stack
    betterDebug(err)
  
    const jsonToSend = { message: err.message, error: err.error === 'undefined' ? 'errorConstants.UNKNOWN_ERROR' : err.error }
    if (err.errors) jsonToSend.error = err.errors.map((er: { message: any; }) => er.message || er)
  
    res.status(err.status)
    res.json(jsonToSend)
  })


app.listen(PORT, ()=> console.log('Listen port ', PORT));
