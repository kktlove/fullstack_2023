//npm install mariadb
const mariadb = require("mariadb");
const cfg = require("../conf.js");

const pool = mariadb.createPool({
    host:cfg.host,    port:cfg.port,    user:cfg.user,
    password:cfg.pass,    connectionLimit:cfg.connectionLimit
});

async function GetMemberList(){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        rows = await conn.query('select * from member');
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return rows;
    }
}

async function GetMember(id){
    let conn, rows;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        row = await conn.query(`select * from member where id=${id}`);
    } catch(err){
        throw err;
    } finally {
        if(conn) conn.end();
        return row;
    }
}

async function AddMember(member){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `insert into member(id, pw, name, email, tel, addr1, addr2, postcode, regdate, birth, pt, visited) values(?, ?, ?, ?, ?, ?, ?, ?, default, ?, default, default);`;
        await conn.query(sql, member);
        msg = "등록 성공";
    } catch(err){
        msg = "등록 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function EditMember(member){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `update member set pw=?, name=?, tel=?, addr1=?, addr2=?, postcode=? where id=?`;
        await conn.query(sql, member);
        msg = "수정 성공";
    } catch(err){
        msg = "수정 실패";
        throw err;
    } finally {
        if(conn) conn.end();
        return msg;
    }
}

async function DelMember(id){
    let conn, msg, sql;
    try {
        conn = await pool.getConnection();
        conn.query('USE teaspoon');
        sql = `delete from member where id=?`;
        await conn.query(sql, id);
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
    getMemberList: GetMemberList, getMember: GetMember, addMember:AddMember,
    editMember:EditMember, delMember:DelMember 
}