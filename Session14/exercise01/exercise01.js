let person = {
    name: "John Doe",
    age: 25,
    job: "developer"
}

for (info in person) {
    console.log(info, person[info]);
}