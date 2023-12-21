
```command
npm install -g express-generator

express --view=ejs node

cd node

npm install

npm install express-session

npm install router

npm install axios

npm install memorystore

npm install tailwindcss postcss autoprefixer postcss-cli

npx tailwindcss init -p
```

<br>


./bin/www 파일 일부 내용 편집

```javascript
....
var port = normalizePort(process.env.PORT || '3000');
....
```

tailwind.config.js 파일 편집

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./views/*.ejs'],
  theme: {
    extend: {},
  },
  plugins: [{
    tailwindcss: {},
    autoprefixer: {},
    },
  ],
}
```

public/stylesheets/tailwind.css 파일 작성

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

package.json 내용 추가

```javascript
{
  "name": "node",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www",
    "tailwind:css": "postcss public/stylesheets/tailwind.css -o public/stylesheets/style.css"
  },
  "dependencies": {
    "autoprefixer": "^10.4.16",
    "axios": "^1.6.2",
    "cookie-parser": "~1.4.4",
    "debug": "~2.6.9",
    "ejs": "~2.6.1",
    "express": "~4.16.1",
    "http-errors": "~1.6.3",
    "memorystore": "^1.6.7",
    "morgan": "~1.9.1",
    "postcss": "^8.4.32",
    "postcss-cli": "^11.0.0",
    "router": "^1.3.8",
    "tailwindcss": "^3.4.0"
  }
}
```

app.js board.js를 router에 추가

```javascript
....
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/board', require('./routes/board'));
....
```

/routes/board.js 작성

```html
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
        res.render('board/list', {rows: rows?rows:{}});
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
        res.render('board/read', {row: rows.data[0]});
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
        res.render('board/modify', {row: rows.data[0]});
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
    res.render('board/form');
});

router.post('/save', function(req,res,next){
    axios.post('http://localhost:4000/board/addBoardPro', req).then(data => {
       res.redirect('/board/list');  
    }).catch(error => {
        console.log(error);
    }).finally(act => {
        console.log("Board Insert Complete");
    });
});

router.get('/delete', function(req,res,next){
    var seq = req.seq;
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
```
