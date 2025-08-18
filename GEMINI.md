# CRUSH.md: Codebase Guidelines for Garu

This document outlines essential commands and style guidelines for working with the Garu Ruby on Rails application.

## Development & Build Commands

-   **Start Development Server:** `bin/rails server`
-   **Watch Tailwind CSS:** `bin/rails tailwindcss:watch`

## Linting & Static Analysis

-   **Run Rubocop (Linting):** `bin/rubocop`
    -   *Note:* The project uses `rubocop-rails-omakase` for Ruby style enforcement.

## Testing

-   **Run All RSpec Tests:** `bundle exec rspec`
-   **Run a Single RSpec File:** `bundle exec rspec <path/to/spec_file.rb>`
    -   *Example:* `bundle exec rspec spec/models/task_spec.rb`

## Code Style Guidelines

-   **Language:** Ruby, JavaScript (via Importmap/Stimulus), HTML (ERB), CSS (Tailwind CSS).
-   **Formatting:** Enforced by Rubocop for Ruby code, adhering to `rubocop-rails-omakase` standards.
-   **Naming Conventions:** Follow standard Ruby on Rails conventions (e.g., snake_case for methods/variables, PascalCase for classes/modules).
-   **Imports/Dependencies:** Managed primarily through `Gemfile` for Ruby gems and `importmap-rails` for JavaScript dependencies.
-   **Error Handling:** Implement robust error handling following idiomatic Ruby practices, utilizing `begin...rescue...end` blocks where appropriate.
