const book = {
    tittle: 'JavaScript Basics',
    author: 'John Smith',
    page: 200,
}

delete book.page;

for (info in book) {
    console.log(info, book[info]);
}