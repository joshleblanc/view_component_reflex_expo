import ApplicationController from './application_controller'

export default class extends ApplicationController {
  add(e) {
    e.preventDefault();
    Array.from(e.target.elements).forEach(e => e.value = "");
    this.stimulate("CreateTodoComponent#add", e.target, "test");
  }
}
