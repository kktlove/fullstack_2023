var express = require('express');
var router = express.Router();
var axios = require('axios');

router.get('/', function(req, res, next) {
    res.redirect('/board/list');
});

router.get('/list', function(req,res,next){
    axios.get('http://localhost:4000/board/list').then(rows => {
        let rec = rows.data;
        console.log(rec)
        res.render('board/list.html', {rows: rows?rows:{}});
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board List Complete");
    });
});

router.get('/read', function(req,res,next){
    let seq = req.query.seq;
    axios.get('http://localhost:4000/board/get/'+seq).then(rows => {
        console.log(rows.data)
        res.render('board/read.html', {row: rows.data[0]});
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board Read Complete");
    });
});    

router.get('/modify', function(req,res,next){
    let seq = req.query.seq;
    axios.get('http://localhost:4000/board/get/'+seq).then(rows => {
        console.log(rows.data)
        res.render('board/modify.html', {row: rows.data[0]});
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board Editable Data Loading");
    });
});

router.post('/edit', function(req,res,next){
    axios.post('http://localhost:4000/board/boardUpdatePro', req).then(data => {
       res.redirect('/board/list');  
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board Insert Complete");
    });
});

router.get('/form', function(req,res,next){
    res.render('board/form.html');
});

router.post('/save', function(req,res,next){
    let data = {title:req.body.title, content:req.body.content, nickname:req.body.nickname}
    console.log("Insert Request : " + data);
    axios.post('http://localhost:4000/board/addBoardPro', data).then(data => {
       res.redirect('/board/list');  
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board Insert Complete");
    });
});

router.get('/delete', function(req,res,next){
    var seq = req.query.seq;
    axios.get('http://localhost:4000/board/boardDelete/'+seq).then(res => {
        console.log(res);
        res.redirect('/board/list');
    }).catch(err => {
        console.log(err);
    }).finally(act => {
        console.log("Board Delete Complete");
    });
});

module.exports = router;