"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express = require("express");
var multer = require("multer");
var cors = require("cors");
var body_parser_1 = require("body-parser");
var fs_1 = require("fs");
var mysql_1 = require("./modules/mysql");
var app = express();
var conn = (0, mysql_1.init)();
var whitelist = ["http://localhost:3000"]; // 접속 허용 주소
var upload = multer({
    storage: multer.diskStorage({
        destination: function (req, file, callback) {
            console.log(file),
                (0, fs_1.existsSync)("./uploads/") || (0, fs_1.mkdirSync)("./uploads/", { recursive: !0 }),
                callback(null, "./uploads/");
        },
        filename: function (req, file, callback) {
            callback(null, file.originalname);
        },
    }),
});
app.set("port", process.env.PORT || 5000);
app.set("host", process.env.HOST || "0.0.0.0");
app.use((0, body_parser_1.json)());
app.use((0, body_parser_1.urlencoded)({ extended: false }));
app.use(cors({
    origin: function (req, res) {
        console.log("접속된 주소: " + req),
            -1 == whitelist.indexOf(req || "") && req
                ? res(Error("허가되지 않은 주소입니다."))
                : res(null, !0);
    },
    credentials: !0,
    optionsSuccessStatus: 200,
}));
// 게시글 목록 보기
app.get("/view", function (req, res) {
    var sql = "select * from notice";
    conn.query(sql, function (err, result) {
        if (err)
            console.log("query is not excuted: " + err);
        else
            res.send(result);
    });
});
// 게시글 쓰기
app.post("/insert", upload.single("img"), function (req, res) {
    var body = req.body;
    var sql = "SELECT count(*)+1 as bnum FROM notice";
    conn.query(sql, function (err, result) {
        if (err)
            console.log("query is not excuted: " + err);
        else {
            var sql = "insert intonotice (bnum,id,title,content,writedate) values(?,?,?,?,NOW())";
            var params = [result[0].bnum, body.id, body.title, body.content];
            conn.query(sql, params, function (err) {
                if (err)
                    console.log("query is not excuted: " + err);
                else if (req.file != null) {
                    // 만약 업로드 된 파일이 있다면
                    var sql = "insert into file (bnum,savefile,filetype,writedate) values (?,?,?,now())";
                    var params = [
                        result[0].bnum,
                        req.file.originalname,
                        req.file.mimetype,
                    ];
                    conn.query(sql, params, function (err) {
                        if (err)
                            console.log("query is not excuted: " + err);
                        else
                            res.sendStatus(200);
                    });
                }
                else
                    res.sendStatus(200);
            });
        }
    });
});
// 게시글 보기
app.get("/read/:bnum", function (req, res) {
    var sql = "select * from notice where bnum=" + req.params.bnum;
    conn.query(sql, function (err, result) {
        if (err)
            console.log("query is not excuted: " + err);
        else
            res.send(result);
    });
});
// 게시글 수정
app.post("/update/:bnum", function (req, res) {
    var body = req.body;
    var sql = "update notice set id=?, title=?, content=? where bnum=" + req.params.bnum;
    var params = [body.id, body.title, body.content];
    conn.query(sql, params, function (err) {
        if (err)
            console.log("query is not excuted: " + err);
        else
            res.sendStatus(200);
    });
});
// 게시글 삭제
app.get("/delete/:bnum", function (req, res) {
    var sql = "delete from notice where bnum=" + req.params.bnum;
    conn.query(sql, function (err) {
        if (err) {
            console.log("query is not excuted: " + err);
        }
        else {
            res.sendStatus(200);
        }
    });
});
// 이미지 파일 불러오기
app.get("/img/:bnum", function (req, res) {
    var sql = "select * from file where bnum=" + req.params.bnum;
    conn.query(sql, function (err, result) {
        if (err)
            console.log("query is not excuted: " + err);
        else if (result.length != 0) {
            (0, fs_1.readFile)("uploads/" + result[0].savefile, function (err, data) {
                res.writeHead(200, { "Context-Type": "text/html" });
                res.end(data);
            });
        }
        else
            res.sendStatus(200);
    });
});
app.listen(app.get("port"), app.get("host"), function () {
    return console.log("Server is running on : " + app.get("host") + ":" + app.get("port"));
});
