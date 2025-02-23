import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ["template", "container"]

  add(event) {
    event.preventDefault();
  
    const newIndex = Date.now().toString(); // Unique index for each new passenger
    const template = this.templateTarget.innerHTML.replace(/NEW_INDEX/g, newIndex);
  
    this.containerTarget.insertAdjacentHTML("beforeend", template);
    this.updatePassengerCount();
  }
  
  remove(event) {
    event.preventDefault();
  
    const passengerFields = this.containerTarget.querySelectorAll(".passenger-fields");

    if (passengerFields.length > 1) {
      event.target.closest(".passenger-fields").remove();
      this.updatePassengerCount();
    }
  }
  
  updatePassengerCount() {
    const passengerFields = this.containerTarget.querySelectorAll(".passenger-fields");
    const numPassengersField = document.getElementById("booking_num_passengers");

    numPassengersField.value = passengerFields.length; // Update hidden field
  }
}