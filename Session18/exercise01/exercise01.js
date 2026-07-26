let student = {
  id: 1,
  name: 'Nguyen Van A',
  gender: 'Nam',
  age: 20,
  mark: 8
};

let newStudent = {
  id: 2,
  name: 'Le Thi B',
  gender: 'Nữ',
  age: 20,
  mark: 9
}

let students = [student, newStudent];

// console.log(students);

// console.log(students[1].id);
// console.log(students[1].name);
// console.log(students[1].gender);
// console.log(students[1].age);
// console.log(students[1].mark);

let highestMark = -Infinity;
let highestIndex;
for (let i = 0; i < students.length; i++) {
  if (students[i].mark > highestMark) {
    highestMark = students[i].mark;
    highestIndex = i;

  }
}

console.log(students[highestIndex]);