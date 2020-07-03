import ApplicationController from './application_controller';
import Select from 'svelte-select';

// The stimulus controller won't reconnect unless the controller detaches first
document.addEventListener('cable-ready:before-morph', () => {
  document
    .querySelectorAll('[data-controller="select"]')
    .forEach(element => {
      element.parentNode.removeChild(element);
    })
})

export default class extends ApplicationController {
  static targets = [ "select" ];
  connect() {
    console.log("Connecting");
    this.selectTarget.classList.add("is-hidden");
    const options = Array.from(this.selectTarget.options).map(option => {
      return {
        label: option.textContent,
        value: option.value
      }
    });

    console.log(this.clearable);

    const select = new Select({
      target: this.element,
      props: {
        items: options,
        isVirtualList: true,
        selectedValue: this.value,
        isClearable: this.clearable
      }
    });

    select.$on("select", e => {
      const event = new Event('change');
      this.selectTarget.value = e.detail.value;
      this.selectTarget.dispatchEvent(event);
    });

    select.$on("clear", e => {
      const event = new Event('change');
      this.selectTarget.value = "";
      this.selectTarget.dispatchEvent(event);
    })
  }

  get value() {
    console.log(this.data);
    return this.data.get('value');
  }

  get clearable() {
    return this.data.get('clearable') === "true";
  }
}
