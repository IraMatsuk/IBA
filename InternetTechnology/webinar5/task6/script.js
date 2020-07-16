var country = [' Беларусь', ' Австралия', ' Африка', ' Украина',  ' Португалия', ' Нидерланды', ' Грузия', ' Италия'];
var animal = [' Слон', ' Тигр', ' Медведь', ' Воробей', ' Голубь', ' Снегирь', ' Крокодил', ' Собака'];

const wrapper = document.querySelector(".wrapper");
const result1 = wrapper.querySelector(".p1");
const result2 = wrapper.querySelector(".p2");
const result3 = wrapper.querySelector(".p3");
const result4 = wrapper.querySelector(".p4");
const result5 = wrapper.querySelector(".p5");

const continent = country.splice(1, 2);
result1.innerHTML = continent;

const bird = animal.splice(3, 3);
result2.innerHTML = bird;

const contibird = continent.concat(bird);
result3.innerHTML = contibird;

contibird.unshift(' Северная Америка');
contibird.push(' Попугай');
result4.innerHTML = contibird;

contibird.sort();
result5.innerHTML = contibird;


