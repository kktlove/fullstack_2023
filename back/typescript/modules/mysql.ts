import { createConnection, Connection, ConnectionOptions } from "mysql2";

var db_info: ConnectionOptions = {
  host: "localhost",
  port: 3306,
  user: "root",
  password: "1234",
  database: "teaspoon",
};

function init(): Connection {
  return createConnection(db_info);
}

function connect(conn: { connect: (arg0: (err: any) => void) => void }) {
  conn.connect(function (err) {
    if (err) console.error("mysql connection error : " + err);
    else console.log("mysql is connected successfully!");
  });
}

export { init, connect };