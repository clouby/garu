# Garu 👻

Welcome to Garu! A web application to help you manage your video game backlog. Never lose track of your gaming list again. This application is built with Ruby on Rails and uses the [RAWG Video Games Database API](https://rawg.io/apidocs) to provide game information.

<img width="1788" height="1030" alt="Screenshot 2025-09-20 at 10 51 00 PM" src="https://github.com/user-attachments/assets/c487f69e-a550-4738-a855-340dc0be544c" />

## ✨ Features

- **User Accounts:** Sign up and manage your own personal game list.
- **Game Backlog:** Add games to your list and track their status.
- **Status Tracking:** Mark games as "To Do", "In Progress", or "Completed".
- **Discover Games:** Browse a list of recently released games to find new titles to play.
- **Game Details:** View detailed information about each game, including descriptions, ratings, and platforms.
- **Modern UI:** A clean and friendly interface built with Tailwind CSS and DaisyUI.

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails 7
- **Frontend:** Hotwire (Turbo, Stimulus), Tailwind CSS, DaisyUI
- **Database:** PostgreSQL
- **Authentication:** Devise
- **API:** [RAWG Video Games Database API](https://rawg.io/apidocs)

## 🚀 Getting Started

### Prerequisites

- Ruby `3.3.3` (see `.ruby-version` file)
- Bundler
- Node.js
- PostgreSQL

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/your-username/garu.git
    cd garu
    ```

2.  **Install dependencies:**
    ```sh
    bundle install
    ```

3.  **Set up your database:**
    ```sh
    bin/rails db:setup
    ```
    This will create the database, load the schema, and seed it with any initial data.

4.  **Configure API Keys:**
    This project requires an API key from RAWG.
    
    Edit the encrypted credentials file:
    ```sh
    bin/rails credentials:edit
    ```
    
    And add your API key like this:
    ```yml
    rawg:
      base_api_url: https://api.rawg.io/api/
      api_key: YOUR_RAWG_API_KEY
    ```

### Running the app

Start the local development server:
```sh
bin/dev
```

Then open your browser to [http://localhost:3000](http://localhost:3000).

### Running Tests

To run the automated test suite:
```sh
bin/rails test
```

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.
