const mongoose = require("mongoose")

const toiletSchema = new mongoose.Schema({
    title: {type: String, required: true},
    latitude: {type: Number, required: true},
    longitude: {type: Number, required: true},
    babyroom: Boolean,
    disabled: Boolean,
    gender: String,
    rating: {type: Number, min: 0, max:5},
    floor: Number,
    images: { type: String, required: true, default: '-' },
})

const reviewSchema = new mongoose.Schema({
    toiletId: {type: String, required: true},
    text: {type: String, required: true},
    rating: {type: Number, min: 0, max:5},
})

/*
const commentSchema = new mongoose.Schema({
    commentText: String,
    createdAt: {
        type: Date,
        immutable: true,
        default : () => Date.now()
    },
    toilet: toiletSchema,
    user: userSchema,
    rating: {type: Number, min: 0, max: 5}
})

const userSchema = new mongoose.Schema({
    name: {type: String, required: true}
})
*/

const Toilet = mongoose.model("toilets", toiletSchema);
const Review = mongoose.model("reviews", reviewSchema);

module.exports = {Review, Toilet}