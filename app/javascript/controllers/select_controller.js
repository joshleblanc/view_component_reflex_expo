import ApplicationController from './application_controller';
import Select from 'svelte-select';

// The stimulus controller won't reconnect unless the controller detaches first
document.addEventListener('cable-ready:before-morph', () => {
  const controllers = document.querySelectorAll('[data-controller="select"]');
  controllers.forEach(element => {
    const parent = element.parentNode;
    const children = Array.from(parent.childNodes);
    const index = children.indexOf(element);
    parent.insertBefore(element, children[index]);
  })
})

export default class extends ApplicationController {
  static targets = [ "select" ];
  connect() {
    this.selectTarget.classList.add("is-hidden");
    const options = Array.from(this.selectTarget.options).map(option => {
      return {
        label: option.textContent,
        value: option.value
      }
    });

    this.select = new Select({
      target: this.element,
      props: {
        items: options,
        isVirtualList: true,
        selectedValue: this.value,
        isClearable: this.clearable
      }
    });


    this.select.$on("select", e => {
      const event = new Event('change');
      this.selectTarget.value = e.detail.value;
      this.selectTarget.dispatchEvent(event);
    });

    this.select.$on("clear", e => {
      const event = new Event('change');
      this.selectTarget.value = "";
      this.selectTarget.dispatchEvent(event);
    })
  }

  disconnect() {
    try {
      this.select.$destroy();
    } catch(e) {

    }

  }

  get value() {
    return this.data.get('value');
  }

  get clearable() {
    return this.data.get('clearable') === "true";
  }
}
