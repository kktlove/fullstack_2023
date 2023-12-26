"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.connect = exports.init = void 0;
var mysql2_1 = require("mysql2");
var db_info = {
    host: "localhost",
    port: 3306,
    user: "root",
    password: "1234",
    database: "teaspoon",
};
function init() {
    return (0, mysql2_1.createConnection)(db_info);
}
exports.init = init;
function connect(conn) {
    conn.connect(function (err) {
        if (err)
            console.error("mysql connection error : " + err);
        else
            console.log("mysql is connected successfully!");
    });
}
exports.connect = connect;
