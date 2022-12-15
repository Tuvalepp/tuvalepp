const dbconn = require("./dbconn")
const express = require("express");
const app = express();
const bodyParser = require("body-parser")


app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())


app.get('/', async (req, res) => {
  try {
    const data = await dbconn.GetToilets()
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.meesage})
  }  
})

app.get('/top-rated', async (req, res) => {
  try {
    const data = await dbconn.GetToiletsTopRated()
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.meesage})
  }  
})

app.post('/closest', async (req, res) => {
  try {
    const data = await dbconn.GetToiletsClosest(req.body.lat, req.body.lon)
    res.send(data)
    console.log(data)
  } catch (e) {
    res.status(500).json({message: e.meesage})
  }  
})
  
app.listen(4000, ()=>{console.log("başladım.")})