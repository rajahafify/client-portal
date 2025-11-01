# Repository Guidelines

## Project Structure & Module Organization
- Rails domain logic lives in `app/`: controllers drive role-aware flows, models wrap Active Record, views follow the Tailwind patterns outlined in `DESIGN.md`.
- Environment, routing, and initializer settings sit in `config/`; update `config/routes.rb` whenever you expose new endpoints.
- Database changes belong in `db/migrate` with seed data in `db/seeds.rb`; keep schema changes paired with clear migration names.
- Tests mirror the app under `spec/models`, `spec/requests`, and `spec/controllers`; place any shared helpers in `spec/support` (create as needed).
- Front-end Stimulus work resides in `app/javascript/controllers`, loaded via importmap references in `app/javascript/application.js`.

## Build, Test, and Development Commands
- `docker compose up` — build and run the application inside the provided container stack.
- `docker compose run --rm web bin/rails db:setup` — provision SQLite databases and seed default users.
- `bundle install` — install gems locally when targeting the native Ruby 3.3.1 toolchain (Bundler 2.7.2).
- `bin/rails server` — start the development server on `http://localhost:3000`.
- `bundle exec rspec` — execute the full RSpec suite; add `--format documentation` when debugging failures.

## Coding Style & Naming Conventions
- Use idiomatic Rails style: 2-space indentation, snake_case filenames and methods, CamelCase classes/modules, and the `# frozen_string_literal: true` header on Ruby files.
- Prefer double quotes for user-facing copy and translation keys; interpolate with `#{}` rather than concatenation.
- Store reusable view fragments as `_partial.html.erb` files and keep Stimulus controllers in kebab-case (e.g., `client-status_controller.js`).
- Run `bin/rails routes` after routing changes and keep Tailwind utility usage consistent with the baseline defined in `DESIGN.md`.

## Testing Guidelines
- RSpec specs live beside the relevant layer (`spec/models`, `spec/requests`, `spec/controllers`) and should mirror new behaviors added under `app/`.
- Cover authentication, authorization, and role transitions for superadmin/admin/client paths whenever they change.
- Use explicit record creation (`create!`) in specs; reset data through the transactional fixtures already enabled in `rails_helper`.
- Run `bundle exec rspec` locally before pushing and capture failures plus fixes in the PR description.

## Commit & Pull Request Guidelines
- Favor concise, present-tense commit subjects (e.g., `Add client impersonation guard`) and keep each commit focused on a single concern.
- Mention linked issues or tickets in commit bodies, and call out migrations or configuration changes explicitly.
- Pull requests should explain intent, list testing performed (`bundle exec rspec`, `docker compose up` smoke checks), and include screenshots or GIFs when updating UI established in `DESIGN.md`.
