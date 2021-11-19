let string: any = "I am a string"
string = 1


let exampleArray: Array<string|number> = [1,2,3,5,8,13,21, "Fibonacci"]
exampleArray.push(1)


function multiplyNumbers(number1: number, number2: number): number {
	return number1 * number2
}

console.log(multiplyNumbers(3,5))

interface Tweet {
	tweetId: string,
	tweetCount: number
	tweetDate: Date
}

const tweet: Tweet = {tweetId: "uuid", tweetCount: 42, tweetDate: new Date()}

function getTweetCount(tweet: Tweet): any {
	return tweet.tweetId
}


console.log(getTweetCount(tweet))

