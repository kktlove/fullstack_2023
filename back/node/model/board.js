//npm install mariadb
const mariadb = require("mariadb");
const cfg = require("../conf.js");

const pool = mariadb.createPool({
    host:cfg.host,    port:cfg.port,    user:cfg.user,
    password:cfg.pass,    connectionLimit:cfg.connectionLimit
});

async function GetBoardList(){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        rows = await conn.query('select * from board');
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return rows;
    }
}

async function GetBoardCount(){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        rows = await conn.query('select count(*) from board');
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return rows;
    }
}

async function GetBoard(seq){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        row = await conn.query(`select * from board where seq=${seq}`);
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return row;
    }
}

async function AddBoard(data){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        console.log("board : "+data);
        conn.query('USE teaspoon');
        sql = `insert into board(title, content, nickname) values (?, ?, ?)`;
        await conn.query(sql, data);
    } catch(err){
        msg = "등록 실패 : "+err;
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function EditBoard(board){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `update board set title=?, content=? where seq=?`;
        await conn.query(sql, board);
        msg = "수정 성공";
    } catch(err){
        msg = "수정 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function DelBoard(seq){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `delete from board where seq=?`;
        await conn.query(sql, seq);
        msg = "삭제 성공";
    } catch(err){
        msg = "삭제 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

module.exports = { 
    getBoardList: GetBoardList, getBoard: GetBoard, addBoard:AddBoard,
    editBoard:EditBoard, delBoard:DelBoard, getBoardCount: GetBoardCount 
}