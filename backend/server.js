const dbconn = require("./dbconn")
const express = require("express");
const app = express();
const bodyParser = require("body-parser")


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
  
app.listen(4000, ()=>{console.log("başladım.")})