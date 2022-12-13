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

async function AddToilet() {
    try {
        const toilet = await Toilet.create({
            title: "İstanbul Üniversitesi Cerrahpaşa Avcılar Kampüsü",
            latitude: 40.988449,  
            longitude: 28.726835,
            babyroom: false,
            disabled: false,
            gender: 'M',
            rating: 2.3,
            floor: 1,
        })
        console.log(toilet)
    } catch (e) {
        console.log(e.message)
    }
}

module.exports = {GetToilets}