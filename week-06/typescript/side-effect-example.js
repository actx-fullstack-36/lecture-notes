const originalArray = [{
    "id": 1,
    "name": "Leanne Graham",
    "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
    }
}, {
    "id": 2,
    "name": "Ervin Howell",
    "company": {
        "name": "Deckow-Crist",
        "catchPhrase": "Proactive didactic contingency",
        "bs": "synergize scalable supply-chains"
    }
}, {
    "id": 3,
    "name": "Clementine Bauch",
    "company": {
        "name": "Romaguera-Jacobson",
        "catchPhrase": "Face to face bifurcated interface",
        "bs": "e-enable strategic applications"
    }
}]


function removeCompany(argument) {
    return  argument.map(index => {
        return{id: index.id, name: index.name}
    });
}


console.table(removeCompany(originalArray))
console.table(originalArray)


let string = "I am a string"

string = 1


