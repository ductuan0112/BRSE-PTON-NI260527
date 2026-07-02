const original = {
    name: 'Bob',
    age: 30,
    address: {
        city: 'Hanoi',
    }
}

const copy = structuredClone(original);

original.address.city = 'Haiphong';

copy.name = 'Charlie';

console.log(original);
console.log(copy);
