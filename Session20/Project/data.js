let users = [
  {
    id: 1,
    first_name: 'Nguyen Van',
    last_name: 'Nam',
    gender: 0, // 1 = male
    dob: '20/02/2003',
    address: 'Thanh Xuân, Hà Nội',
    avatar: 'https://sea.ign.com/avatar-generations',
    email: 'nvnam@gmail.com',
    password: '123456',
    phone_number: '0988787671',
    created_at: '2002-01-01T00:00:00Z'
  }
];

if (!localStorage.getItem('users')) {
  localStorage.setItem('users', JSON.stringify(users));
} else {
  users = JSON.parse(localStorage.getItem('users'));
}

let categories = [
  {
    id: 1,
    category_code: 'DM001',
    category_name: 'Hoa quả',
    image: 'https://vnexpress.net/cac-loai-hoa-qua-khong-nen-an-cung-nhau-4487290.html',
    status: 'ACTIVE',
    created_at: '2002-01-01T00:00:00Z'
  },
  {
    id: 2,
    category_code: 'DM002',
    category_name: 'Rau củ',
    image: 'https://www.knorr.com/vn/bai-viet/cach-bao-quan/bao-quan-rau-cu-ngay-tet.html',
    status: 'INACTIVE',
    created_at: '2002-01-01T00:00:00Z'
  }
]

if (!localStorage.getItem('categories')) {
  localStorage.setItem('categories', JSON.stringify(categories));
} else {
  categories = JSON.parse(localStorage.getItem('categories'));
}

let products = [
  {
    id: 1,
    product_code: 'SP001',
    product_name: 'Táo',
    category_id: 1,
    stock: 100,
    price: 20000,
    discount: 0,
    image: 'https://www.knorr.com/vn/bai-viet/cach-bao-quan/bao-quan-rau-cu-ngay-tet.html',
    description: 'Táo nhập khẩu từ Mỹ',
    status: 'ACTIVE',
    created_at: '2002-01-01T00:00:00Z'
  },
  {
    id: 2,
    product_code: 'SP002',
    product_name: 'Cà chua',
    category_id: 2,
    stock: 100,
    price: 20000,
    discount: 0,
    image: 'https://snaped.fns.usda.gov/resources/nutrition-education-materials/seasonal-produce-guide/tomatoes',
    description: 'Cà chua nhập khẩu từ Hà Lan',
    status: 'INACTIVE',
    created_at: '2002-01-01T00:00:00Z'
  }
]

if (!localStorage.getItem('products')) {
  localStorage.setItem('products', JSON.stringify(products));
} else {
  products = JSON.parse(localStorage.getItem('products'));
}

