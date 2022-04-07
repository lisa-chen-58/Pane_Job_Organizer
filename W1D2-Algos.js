// Remove Blanks
// Create a function that, given a string, returns all of that string’s contents, but without blanks. No built-in functions!

// If given the string " Ha  ppy S t. Patrick 's D a y! ", return "HappySt.Patrick'sDay!".
// "HappySt.Patrick'sDay!".

// String

// Stringishere
// String is here
// if else for
// value of index is empty, skip over it, push the value into the array


function noSpace(string) {

    // declare a new string
    newString = "";

    for (let i = 0; i < string.length; i++){
    
        // if else for spaces
        if (string[i] != " ") {
            newString += string[i]; //returns first letter 
        }
    }
    console.log(newString);
    return newString;
}

testString = noSpace(" Ha  ppy S t. Patrick 's D a y! ");
console.log(testString);




    }
}
