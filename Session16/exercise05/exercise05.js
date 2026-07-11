let answer = prompt('Input the string');

answer = answer.toLowerCase();

function isPalindrome(answer) {
  for (let i = 0; i < answer.length / 2; i++) {
    if (answer[i] !== answer[answer.length - 1 - i]) {
      return false;
    }
  }
  return true;
}

isPalindrome(answer)
  ? alert('Your string is palindrome')
  : alert('Your string is not palindrome');