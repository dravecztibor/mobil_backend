const express = require('express')
const mysql = require('mysql')
var cors = require('cors')
const multer = require('multer');
const bodyParser = require('body-parser');

const app = express()
const port = 3000

app.use(cors())
app.use(express.json())
app.use(bodyParser.json());
app.use(express.static('etelkepek'))


var connection
function kapcsolat(){
    connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'receptekadatb'
    })
    connection.connect()
}


/*app.get('/', (req, res) => {
  res.send('Hello World!')
})*/


app.get('/etelek', (req, res) => {
  kapcsolat()

  connection.query('SELECT * FROM etelek', (err, rows, fields) => {
  if (err) throw err

  console.log(rows)
  res.send(rows)
})

connection.end()
})


app.get('/eteltipusok', (req, res) => {
    kapcsolat()
  
    connection.query('SELECT * FROM eteltipusok', (err, rows, fields) => {
    if (err) throw err
  
    console.log(rows)
    res.send(rows)
})
  
  connection.end()
})


//INSERT INTO etelek VALUES (NULL, 'alma', 4, '1.jpg');
/*app.post('/felviteletel', (req, res) => {
  kapcsolat()
  
  connection.query(`INSERT INTO etelek VALUES (NULL, 'alma', 4, '1.jpg')`, (err, rows, fields) => {
  if (err){
    console.log("Hiba")
    res.send("Hiba")
  }
  else{
    console.log("Sikeres felvitel")
    res.send("Sikeres felvitel")
  }
  
  
  
  
  })
  connection.end() 
  })*/

  
//képfelöltés----------------------------
const storage = multer.diskStorage({
  destination(req, file, callback) {
    callback(null, './etelkepek');
  },
  filename(req, file, callback) {
    callback(null, `${file.fieldname}_${Date.now()}_${file.originalname}`);
  },
});

const upload = multer({ storage });

app.post('/api/upload', upload.array('photo', 3), (req, res) => {
  console.log('file', req.files);
  console.log('body', req.body);
//adatb-be való felvitel-----------------
kapcsolat()
  
  connection.query(`INSERT INTO etelek VALUES (NULL, '${req.body.bevitel1}', ${req.body.bevitel2}, '${req.files[0].filename}', '${req.body.bevitel3}', '${req.body.bevitel4}', '${req.body.bevitel5}')`, (err, rows, fields) => {
  if (err){
    console.log("Hiba")
    res.send("Hiba")
  }
  else{
    console.log("Sikeres felvitel")
    res.send("Sikeres felvitel")
  }
  
  
  
  
  })
  connection.end() 
//adatb felvitel vége
  
});


//képfeltöltés vége----------------------


app.post('/keresetelszoveg', (req, res) => {
  kapcsolat()

  connection.query(`SELECT * FROM etelek WHERE etelek_nev like "%${req.body.bevitel1}%"`, (err, rows, fields) => {
    if (err) throw err

    console.log(rows)
    res.send(rows)
  })
connection.end() 
})










app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})