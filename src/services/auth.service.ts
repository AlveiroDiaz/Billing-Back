
import { JWT } from "../utils/jwt.util";
import { Login, RefreshToken } from "utils/models/commons/auth.common";


export class AuthService {
    static SigIn(user: Login): string{
        const token = JWT.create(user);
        return token;
    }

    static RefreshToken(token: RefreshToken): string {
        const tokenNew = JWT.verify(token.token);
        if(tokenNew){
            return token.token;
        }else{
            return "VENCIDO";
        }
    }

    static DecodeToken(token: string): any{
        return JWT.decodeToken(token);
    }

}