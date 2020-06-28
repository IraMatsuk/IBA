function function1() {
    for (let i = 1; i <=10; i++) {
        document.write(`Число: <b>${i}</b>`);
        document.write('<br>');  
    }
}

function function2() {
    for (let i = 100; i >= 0; i-=10) {
        document.write(`Число: <b>${i}</b>`);
        document.write('<br>');
    }
}

function function3() {
    for (let i = 45; i >=0; i-=5) {
        if (i == 25) {
            continue;
        }
        document.write(`Число: <b>${i}</b>`);
        document.write('<br>');
    }
}
