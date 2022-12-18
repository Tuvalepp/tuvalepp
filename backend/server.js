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
    res.status(500).json({message: e.message})
  }  
})

app.get('/top-rated', async (req, res) => {
  try {
    const data = await dbconn.GetToiletsTopRated()
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})

app.post('/closest', async (req, res) => {
  try {
    const data = await dbconn.GetToiletsClosest(req.body.lat, req.body.lon)
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})

app.get('/toilets/:id', async (req, res) => {
  try {
    const data = await dbconn.GetToiletWithId(req.params.id);
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})

app.get('/reviews', async (req, res) => {
  try {
    const data = await dbconn.GetReviews()
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})

app.get('/toilets/:toiletid/reviews', async (req, res) => {
  try {
    const data = await dbconn.GetReviewsWithToiletId(req.params.toiletid)
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})

app.post('/add-toilet', async (req, res) => {
  try {
    const data = await dbconn.AddReview(req.body.toiletId, req.body.text, req.body.rating)
    res.send(data)
  } catch (e) {
    res.status(500).json({message: e.message})
  }  
})
  
app.listen(4000, ()=>{console.log("başladım.")})