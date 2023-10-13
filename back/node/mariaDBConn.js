//npm install mariadb
const mariadb = require("mariadb");
const cfg = require("./conf");

const pool = mariadb.createPool({
    host:cfg.host,    port:cfg.port,    user:cfg.user,
    password:cfg.pass,    connectionLimit:cfg.connectionLimit
});

async function GetSampleList(){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        rows = await conn.query('select * from sample');
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return rows;
    }
}

async function GetSample(no){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        row = await conn.query(`select * from sample where no=${no}`);
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return row;
    }
}

async function AddSample(sample){
    let conn, nickname, msg, sql;
    nickname = sample.name;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `insert into sample(no, name) values (default, ?)`;
        await conn.query(sql, nickname);
        msg = "등록 성공";
    } catch(err){
        msg = "등록 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function EditSample(sample){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `update sample set name=? where no=?`;
        await conn.query(sql, sample);
        msg = "수정 성공";
    } catch(err){
        msg = "수정 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function DelSample(no){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `delete from sample where no=?`;
        await conn.query(sql, no);
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
    getSampleList: GetSampleList, getSample: GetSample, addSample:AddSample,
    editSample:EditSample, delSample:DelSample 
}