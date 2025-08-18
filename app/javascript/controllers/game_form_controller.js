import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static outlets = ["modal-form"];
  static targets = [
    "gameId",
    "gameIdContent",
    "gameName",
    "gameField",
    "searchButton",
    "removeButton",
    "gameIndicator",
  ];

  connect() {
    console.log("game form connected");
  }

  openSearchModal() {
    if (this.hasModalFormOutlet) {
      setTimeout(() => {
        this.modalFormOutlet.openModal();
      });
    }
  }

  handleSelectGame({ gameId, gameName }) {
    console.log({ gameId });
    this.gameIdTarget.value = gameId;
    this.gameIdContentTarget.textContent = gameId;
    this.gameNameTarget.textContent = gameName;
    this.gameNameTarget.classList.remove("hidden");
    this.searchButtonTarget.textContent = "Change Game";
    this.removeButtonTarget.classList.remove("hidden");
    this.gameIndicatorTarget.classList.remove("hidden");
    this.searchButtonTarget.classList.add("hidden");
  }

  removeGame() {
    this.gameIdTarget.value = "";
    this.gameNameTarget.textContent = "";
    this.gameNameTarget.classList.add("hidden");
    this.searchButtonTarget.textContent = "+ Add Game";
    this.removeButtonTarget.classList.add("hidden");
  }
}
