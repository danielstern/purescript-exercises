import delay from "delay";
const { field, nextField } = require("../output/Main");
const { toIndexedArray } = require('../output/Matrix');


(async function(){

    let a = field(64)(64)(5)(5);
    const target = document.getElementById("Main");
    console.log(a);

    target.innerHTML = toIndexedArray(a).map(({x,y})=>(
        `<div id="NX${x}Y${y}" style="position:absolute; top:${y * 10}; left:${x * 10}; width: 10; height: 10"></div>`
    )).join("")

    while (true) {

        a = nextField(a);
        for (let {x, y, value} of toIndexedArray(a)) {
            let el = document.getElementById(`NX${x}Y${y}`);
            el.style.backgroundColor = value ? "lightgray" : "steelblue";
        }

        await delay (100);
    }
})()