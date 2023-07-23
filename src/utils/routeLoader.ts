import { Router } from "express";
import { readdirSync, statSync } from "fs";
import path from "path";
const PATH_ROUTER = `src/routes`;
const router = Router();

const clearFileName = (fileName: string)=>{
  return fileName.replace(/\\/g, '/');
}

const routeLoader= (app: any, routerPath = PATH_ROUTER) => {
  readdirSync(routerPath).forEach(file => {
    const filePath = clearFileName(path.join(routerPath, file))
    const stat = statSync(filePath)
    if (stat.isDirectory()) {
      routeLoader(app, path.normalize(filePath))
    } else {
      let route = clearFileName(filePath.replace(PATH_ROUTER, '').replace('.ts', '').replace('index', ''))
      let requireFilePath = path.resolve(filePath)
      app.use(route, require(requireFilePath))
    }
  })
}

export { routeLoader };