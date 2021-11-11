const express = require("express")
const morgan = require("morgan")

//initializes express
const app = express()

// app.use allows for different middleware to be brought into Express
// Morgan: a logger for express so that we have a record for debugging.
app.use(morgan("dev"))
app.use(express.json())

const indexRoute = express.Router()

const indexHandler1 = (request, response, next) => {
    console.log("I happened first")
   next()
}


const indexHandler2 = (request, response, next) => {
    console.log("I happened second")
    return response.json({status: 200, data: "is this thing on?"})
}
// Example express configuration for our /apis/ route.
indexRoute.route("/hello-world").get(indexHandler1, indexHandler2)

app.use("/apis", indexRoute)

app.listen(4200, ()=> {
    console.log("Express server is live")
})
