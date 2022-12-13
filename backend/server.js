const dbconn = require("./dbconn")
const express = require("express");
const app = express();


app.get('/', function (req, res) {
    res.json(
      dbconn.GetToilets()
  )
  })
  
  app.listen(4000, ()=>{console.log("başladım.")})