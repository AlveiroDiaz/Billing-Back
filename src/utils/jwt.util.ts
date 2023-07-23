import { sign, verify, decode } from "jsonwebtoken";
import { Login } from "./models/commons/auth.common";

export class JWT {
  static decode(token: string): any {
    return verify(token, process.env.JWT_SECRET, { algorithms: ["HS256"] });
  }

  static verify(token: string): boolean {
    try {
      this.decode(token);
      return true;
    } catch (error) {
      return false;
    }
  }

  static create(user: Login): string | null {
    try {
      return this.code(user);
    } catch (error) {
      return null;
    }
  }

  static code(user: Login): string {
    return sign(
      {
        data: user,
      },
      process.env.JWT_SECRET,
      { expiresIn: "5m", algorithm: "HS256" }
    );
  }

  static decodeToken(token: string):any {
    return decode(token);
  }
}
