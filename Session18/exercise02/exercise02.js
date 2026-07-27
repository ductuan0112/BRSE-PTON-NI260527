let products = [
  { id: 1, name: 'Milk', count: 100 },
  { id: 2, name: 'Orange', count: 100 },
  { id: 3, name: 'Butter', count: 100 },
];

let newProduct = { id: 4, name: 'Apple', count: 100 };

products.push(newProduct);

for (let i = 0; i < products.length; i++) {
  if (products[i].id === 2) {
    products.splice(i, 1);
  }
}

for (let i = 0; i < products.length; i++) {
  if (products[i].id === 3) {
    products[i].count = 0;
    break;
  }
}

let haveButter = false;
for (let i = 0; i < products.length; i++) {
  if (products[i].name === 'Butter') {
    haveButter = true;
    break;
  }
}

if (haveButter) {
  console.log(products)
} else {
  console.log('Không có dữ liệu bạn tìm kiếm');
}
