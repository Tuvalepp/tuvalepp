const mongoose = require('mongoose');
const Toilet = require("./Schemas")
mongoose.set('strictQuery', true);

mongoose.connect('mongodb://127.0.0.1:27017/tuvalepp', () => {
    console.log("connected!")
}, e => console.error(e));

async function GetToilets() {
    try {
        const toilets = await Toilet.find()
        return toilets
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletWithId(id) {
    try {
        const toilet = await Toilet.findById(id)
        return toilet
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletsTopRated() {
    try {
        const toilets = await Toilet.find().sort({"rating": -1});
        return toilets
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletsClosest(lat, lon) {
    try {
        const toilets = await Toilet.find();
        toilets.sort((a, b) => {
            if (distance(lat,lon, Number(a.latitude), Number(a.longitude)) > distance(lat,lon, Number(b.latitude), Number(b.longitude)))
                return 1;
            if (distance(lat,lon, Number(b.latitude), Number(b.longitude)) > distance(lat,lon, Number(a.latitude), Number(a.longitude)))
                return -1;
            return 0;
        })
        console.log(toilets)
        return toilets;
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

module.exports = {GetToilets, GetToiletsTopRated, GetToiletsClosest, GetToiletWithId}