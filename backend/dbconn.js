const mongoose = require('mongoose');
var { Toilet } = require("./Schemas");
var { Review } = require("./Schemas");
mongoose.set('strictQuery', true);
const express = require("express");
const app = express();
const bodyParser = require("body-parser")

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

mongoose.connect('', () => {
    console.log("connected!")
}, e => console.error(e));

async function GetToilets() {
    try {
        let toilets = await Toilet.find()
        const reviews = await Review.find()
        let toiletsWithRating = []
        toilets.map((toilet)=>{
            let sum = 0.0;
            let reviewCount = 0.0;
            reviews.forEach(review => {
                if(toilet._id.toString() === review.toiletId.toString()){
                    sum += review.rating
                    reviewCount++
                }
            });
            toilet.rating = reviewCount === 0 ? 0.0 : (sum/reviewCount)
            toiletsWithRating.push(toilet)
        });
        return toiletsWithRating
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletWithId(id) {
    try {
        const toilet = await Toilet.findById(id)
        const reviews = await Review.find()
            let sum = 0.0;
            let reviewCount = 0.0;
            reviews.forEach(review => {
                if(toilet._id.toString() === review.toiletId.toString()){
                    sum += review.rating
                    reviewCount++
                }
            });
            toilet.rating = reviewCount === 0 ? 0.0 : (sum/reviewCount)
        return toilet
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletsTopRated() {
    try {
        const toilets = await Toilet.find()
        const reviews = await Review.find()
        let toiletsWithRating = []
        toilets.map((toilet)=>{
            let sum = 0.0;
            let reviewCount = 0.0;
            reviews.forEach(review => {
                if(toilet._id.toString() === review.toiletId.toString()){
                    sum += review.rating
                    reviewCount++
                }
            });
            toilet.rating = reviewCount === 0 ? 0.0 : (sum/reviewCount)
            toiletsWithRating.push(toilet)
        });
        toiletsWithRating.sort(sortByRating);
        return toiletsWithRating
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletsClosest(lat, lon) {
    try {
        const toilets = await Toilet.find();
        const reviews = await Review.find()
        let toiletsWithRating = []
        toilets.map((toilet)=>{
            let sum = 0.0;
            let reviewCount = 0.0;
            reviews.forEach(review => {
                if(toilet._id.toString() === review.toiletId.toString()){
                    sum += review.rating
                    reviewCount++
                }
            });
            toilet.rating = reviewCount === 0 ? 0.0 : (sum/reviewCount)
            toiletsWithRating.push(toilet)
        });
        toiletsWithRating.sort((a, b) => {
            if (distance(lat,lon, Number(a.latitude), Number(a.longitude)) > distance(lat,lon, Number(b.latitude), Number(b.longitude)))
                return 1;
            if (distance(lat,lon, Number(b.latitude), Number(b.longitude)) > distance(lat,lon, Number(a.latitude), Number(a.longitude)))
                return -1;
            return 0;
        })
        return toiletsWithRating;
    } catch (e) {
        console.log(e.message)
    }
}

function distance(lat1, lon1, lat2, lon2) {
    var radlat1 = Math.PI * lat1/180
    var radlat2 = Math.PI * lat2/180
    var theta = lon1-lon2
    var radtheta = Math.PI * theta/180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
    if (dist > 1) {
        dist = 1;
    }
    dist = Math.acos(dist)
    dist = dist * 180/Math.PI
    dist = dist * 60 * 1.1515
    return dist
}

async function GetReviews() {
    try {
        const reviews = await Review.find();
        return reviews
    } catch (e) {
        console.log(e.message)
    }
}

async function GetReviewsWithToiletId(id){
    try {
        const reviews = await Review.find({toiletId: id});
        return reviews
    } catch (e) {
        console.log(e.message)
    }
}

async function AddReview(toiletId, text, rating) {
    try {
        const review = await Review.create({
            toiletId: toiletId,
            text: text,
            rating: Number(rating),
        })
    } catch (e) {
        console.log(e.message)
    }
}

function sortByRating( a, b ) {
    if ( a.rating < b.rating ){
      return 1;
    }
    if ( a.rating > b.rating ){
      return -1;
    }
    return 0;
  }



async function editImages(){
    try {
        await Toilet.findOneAndUpdate({_id: "639afcfa7347c9323ac26c13"}, { $set: { images: "6" } });
    } catch (e) {
        console.log(e.message)
    }
}

editImages()

/*
async function AddToilet() {
    try {
        const toilet = await Toilet.create({
            title: "Doğan Hastanesi",
            latitude: 40.986726,
            longitude: 28.783610,
            babyroom: true,
            disabled: true,
            gender: '0',
            rating: 4.1,
            floor: 1,
        })
        console.log(toilet)
    } catch (e) {
        console.log(e.message)
    }
}
*/



module.exports = {GetToilets,
    GetToiletsTopRated,
    GetToiletsClosest,
    GetToiletWithId,
    GetReviews,
    GetReviewsWithToiletId,
    AddReview
}