const dbconn = require("./dbconn")
const express = require("express");
const app = express();


app.get('/', async (req, res) => {
  try {
    const data = await dbconn.GetToilets()
    res.json(
      data
  )
  } catch (e) {
    res.status(500).json({message: e.meesage})
  }  
})
  
  app.listen(4000, ()=>{console.log("başladım.")})