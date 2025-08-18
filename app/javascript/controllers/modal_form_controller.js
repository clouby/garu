import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = ["game-form"];
  static targets = ["searchInput"];

  connect() {
    this.element.addEventListener(
      "transitionend",
      this.handleFocusModal.bind(this),
    );
  }

  handleFocusModal(event) {
    if (
      event.propertyName &&
      event.propertyName === "translate" &&
      this.element.open
    ) {
      setTimeout(() => {
        this.searchInputTarget.focus();
      });
    }
  }

  openModal() {
    this.element.showModal();
  }

  selectGame(event) {
    const game = event.target.dataset;
    this.gameFormOutlet.handleSelectGame(game);
    this.element.close();
  }
}
