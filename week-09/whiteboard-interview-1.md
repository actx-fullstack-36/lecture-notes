# Snap Challenge: Sample Interview Questions #1 Solutions

1 .

        function countNumbers (numbersArray) {
           countsArray = [];
           foreach (numbersArray as element) {
                countsArray[element] = countsArray[element] + 1;
           } 
           return countsArray;
        }

2 .

    function fizzbuzz (number1, number2) {
    
        // Check to see which number is lesser and which is greater.
        var lesserNumber;
        var greaterNumber;
        if (number1 < number2) {
            greaterNumber = number2;
            lesserNumber = number1;
        } else {
            greaterNumber = number1;
            lesserNumber = number2;
        }
    
        // Output fizz, buzz, or baz as appropriate
        for (i=lesserNumber, i <= greater number, i++) {
            if (i % 2 == 0 && i % 3 == 0 ) {
                output baz;
            } else {
                    if (i % 2 == 0) {
                        output fizz;
                    }
                    if (i % 3 == 0) {
                        output buzz;
                    }
            }
        }
    }
    
    
    // Alternate for loop structure.  Replace the for loop above with this one and it will get same result
    for (let i = lesserNumber; i <= greaterNumber; i++) {
        let output = ""

        if (i is divisible by 2) {
                output = "fizz"
        }

        if (i is divisible by 3) {
                output = output + "buzz"
        }

        if (output = "fizzbuzz")
                output = "baz"
        }

        print output
     } 

3 .

![Box Model](box-model.png)
