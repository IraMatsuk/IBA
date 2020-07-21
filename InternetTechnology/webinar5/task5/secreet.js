const var1 = 7;
const var2 = 10;
const var3 = 8;
const var4 = 25;
const var5 = 30;

const wrapper = document.querySelector(".secret_word");
let word = '';

if (var1 == 25) {
    word += 'А';
}

if (var1 > 15) {
    word += 'Ж';
}

if (var1 < 33) {
    word += 'К';
}

if (var2 == 10) {
    word += 'А';
}

if (var1 + var2 == 30) {
    word += 'Д';
}

if (var2 - var1 == 7) {
    word += 'Ш';
}

if (var3 < 6) {
    word += 'М';
}

if (var3 == 8 && var1 + var2 == 17) {
    word += 'З';
}

if (var3 - var2 == var1 + var2) {
    word += 'Н';
}

if (var4 == (var1 + var2 + var3)) {
    word += 'А';
}

if (var4 > (var2 -  var3) * 4) {
    word += 'Н';
}
if (var5 == var1 * 4){
    word += 'Б';
}

if (var5 == var2 * 3) {
    word += 'Ь';
}

if (((var1 + var2 + var3 + var4 + var5) / 3) > 60) {
    word += 'К';
}

wrapper.innerHTML = word;


