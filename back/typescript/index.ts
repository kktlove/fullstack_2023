import express = require('express');
import { Express, Request, Response } from "express";
import multer = require('multer');
import { Multer } from "multer";
import cors = require("cors");
import { json, urlencoded } from "body-parser";
import { readFile, mkdirSync, existsSync } from "fs";
import { init } from "./modules/mysql";
import {
  OkPacket,
  QueryError,
  Connection,
  RowDataPacket,
  ResultSetHeader,
} from "mysql2";

const app: Express = express();
const conn: Connection = init();
const whitelist: string[] = ["http://localhost:3300"]; // 접속 허용 주소
const upload: Multer = multer({
  storage: multer.diskStorage({
    destination: (req, file, callback) => {
      console.log(file),
        existsSync("./uploads/") || mkdirSync("./uploads/", { recursive: !0 }),
        callback(null, "./uploads/");
    },
    filename: (req, file, callback) => {
      callback(null, file.originalname);
    },
  }),
});

type StaticOrigin = boolean | string | RegExp | (boolean | string | RegExp)[];
type error = QueryError | null;
type result =
  | RowDataPacket[]
  | RowDataPacket[][]
  | OkPacket
  | OkPacket[]
  | ResultSetHeader;

app.set("port", process.env.PORT || 3300);
app.set("host", process.env.HOST || "127.0.0.1");

app.use(json());
app.use(urlencoded({ extended: false }));
app.use(
  cors({
    origin(
      req: string | undefined,
      res: (err: Error | null, origin?: StaticOrigin | undefined) => void
    ) {
      console.log("접속된 주소: " + req),
        -1 == whitelist.indexOf(req || "") && req
          ? res(Error("허가되지 않은 주소입니다."))
          : res(null, !0);
    },
    credentials: !0,
    optionsSuccessStatus: 200,
  })
);

// 게시글 목록 보기
app.get("/view", (req: Request, res: Response) => {
  var sql: string = "select * from notice";
  conn.query(sql, (err: error, result: result) => {
    if (err) console.log("query is not excuted: " + err);
    else res.send(result);
  });
});

// 게시글 쓰기
app.post("/insert", upload.single("img"), (req: Request, res: Response) => {
  var body: any = req.body;
  var sql: string = "SELECT count(*)+1 as bnum FROM notice";
  conn.query(sql, (err: error, result: any) => {
    if (err) console.log("query is not excuted: " + err);
    else {
      var sql: string =
        "insert intonotice (bnum,id,title,content,writedate) values(?,?,?,?,NOW())";
      var params: any[] = [result[0].bnum, body.id, body.title, body.content];
      conn.query(sql, params, (err: error) => {
        if (err) console.log("query is not excuted: " + err);
        else if (req.file != null) {
          // 만약 업로드 된 파일이 있다면
          var sql: string =
            "insert into file (bnum,savefile,filetype,writedate) values (?,?,?,now())";
          var params: any[] = [
            result[0].bnum,
            req.file.originalname,
            req.file.mimetype,
          ];
          conn.query(sql, params, (err: error) => {
            if (err) console.log("query is not excuted: " + err);
            else res.sendStatus(200);
          });
        } else res.sendStatus(200);
      });
    }
  });
});

// 게시글 보기
app.get("/read/:bnum", (req: Request, res: Response) => {
  var sql: string = "select * from notice where bnum=" + req.params.bnum;
  conn.query(sql, (err: error, result: result) => {
    if (err) console.log("query is not excuted: " + err);
    else res.send(result);
  });
});

// 게시글 수정
app.post("/update/:bnum", (req: Request, res: Response) => {
  var body: any = req.body;
  var sql: string =
    "update notice set id=?, title=?, content=? where bnum=" + req.params.bnum;
  var params: any[] = [body.id, body.title, body.content];
  conn.query(sql, params, (err: error) => {
    if (err) console.log("query is not excuted: " + err);
    else res.sendStatus(200);
  });
});

// 게시글 삭제
app.get("/delete/:bnum", (req: Request, res: Response) => {
  var sql: string = "delete from notice where bnum=" + req.params.bnum;
  conn.query(sql, (err: error) => {
    if (err) { console.log("query is not excuted: " + err); }
    else { res.sendStatus(200); }
  });
});

// 이미지 파일 불러오기
app.get("/img/:bnum", (req: Request, res: Response) => {
  var sql: string = "select * from file where bnum=" + req.params.bnum;
  conn.query(sql, (err: error, result: any) => {
    if (err) console.log("query is not excuted: " + err);
    else if (result.length != 0) {
      readFile(
        "uploads/" + result[0].savefile,
        (err: NodeJS.ErrnoException | null, data: Buffer) => {
          res.writeHead(200, { "Context-Type": "text/html" });
          res.end(data);
        }
      );
    } else res.sendStatus(200);
  });
});

app.listen(app.get("port"), app.get("host"), () =>
  console.log(
    "Server is running on : " + app.get("host") + ":" + app.get("port")
  )
);