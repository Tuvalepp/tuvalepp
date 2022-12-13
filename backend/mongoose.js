const mongoose = require('mongoose');
const Toilet = require("./Toilet")
mongoose.set('strictQuery', true);

mongoose.connect('mongodb://127.0.0.1:27017/tuvalepp', () => {
    console.log("connected!")
}, e => console.error(e));

run()

async function run() {
    try {
        const toilet = await Toilet.create({
            title: "Capacity",
            latitude: 40.977507,
            longitude: 28.871428,
            babyroom: false,
            disabled: true,
            gender: 'M',
            rating: 3.5,
            floor: 1,
        })
        console.log(toilet)
    } catch (e) {
        console.log(e.message)
    }
}   
    /*
    const toilet = new Toilet({
        title: "Capacity",
        latitude: 40.977507,
        longitude: 28.871428,
        babyroom: false,
        disabled: true,
        gender: 'M',
        rating: 3.5,
        floor: 1,
    })
    await toilet.save()
    */