console.log("NODDERS");

import { newTask, completeTaskById, addTask } from '../output/main';

let lastTaskId = 0;
const specTask = newTask("compile algorithms")(lastTaskId++);

console.table(specTask);

let tasks = [specTask];

const TaskView = ({title,_id,complete})=>(
    `<div class="list-item ${complete ? "complete" : ""}">
        <span>${title}</span>
        <button class="btn btn-secondary" onClick="handleCompleteTask(${_id}, ${!complete})">DONE</button>
    </div>`
)

function render(){
    let template = tasks.map(TaskView).join("");
    console.log(template);
    document.getElementById("Main").innerHTML = template;
}

window.handleCompleteTask = (_id, complete) => {
    tasks = completeTaskById(tasks)(_id)(complete);
    render();
};

window.handleAddTask = () => {
    const textbox = document.getElementById("TodoText");
    const { value } = textbox;
    const task = newTask(value)(lastTaskId++);
    tasks = addTask(tasks)(task);
    textbox.value = "";
    render();
    return false;
}

render();