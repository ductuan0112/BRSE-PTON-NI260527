let a = Number(prompt('Input the number a'));
let b = Number(prompt('Input the number b'));
let cal = prompt('Input the calculation (+ , - , * , /)');
let result;

switch (cal) {
    case '+':
        result = a + b;
        break;
    case '-':
        result = a - b;
        break;
    case '*':
        result = a * b;
        break
    case '/':
        if (b === 0) {
            result = 'Cannot divide by zero!'
            break
        } else {
            result = a / b;
            break
        }
    default:
        result = 'Invalid Operator'
}

alert(`The result is: ${result}`)