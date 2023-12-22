import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="down-page-show"
export default class extends Controller {
  connect() {
    console.log("Hello, down page show!");
  }
  scrollDown() {
    console.log("scrolling down");

    setTimeout(() => {
      window.scrollTo(0, document.body.scrollHeight);
    }, 30);
  }
}
