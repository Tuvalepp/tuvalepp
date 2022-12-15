const mongoose = require('mongoose');
const Toilet = require("./Schemas")
mongoose.set('strictQuery', true);

mongoose.connect('mongodb://127.0.0.1:27017/tuvalepp', () => {
    console.log("connected!")
}, e => console.error(e));

async function GetToilets() {
    try {
        const toilets = await Toilet.find()
        console.log(toilets)
        return toilets
    } catch (e) {
        console.log(e.message)
    }
}

async function GetToiletsTopRated() {
    try {
        const toilets = await Toilet.find().sort({"rating": -1});
        console.log(toilets)
        return toilets
    } catch (e) {
        console.log(e.message)
    }
}

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

module.exports = {GetToilets, GetToiletsTopRated}