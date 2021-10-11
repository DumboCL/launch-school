let rlSync = require('readline-sync');

let first_name = rlSync.question('What is your first name? ');
let last_name = rlSync.question('What is your last name? ');
console.log(`Hello, ${first_name} ${last_name}!`);