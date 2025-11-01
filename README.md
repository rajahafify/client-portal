# Client Portal

A Rails 8.1.1 application that supports three user roles (superadmin, admin, client). Superadmins and admins can manage client records while clients can view the page for their assigned organization.

## Running locally

### With Docker (recommended if Ruby is not installed)

1. Ensure Docker and Docker Compose are available.
2. Build the image and install gems:
   ```sh
   docker compose run --rm web bundle install
   ```
3. Prepare the database and seed default data (runs inside the container):
   ```sh
   docker compose run --rm web bin/rails db:setup
   ```
4. Start the server:
   ```sh
   docker compose up
   ```
5. Visit `http://localhost:3000`.

### Native setup

1. Install Ruby 3.3.1 (matching `.ruby-version`) and Bundler 2.7.2 (`gem install bundler -v 2.7.2`).
2. Install dependencies:
   ```sh
   bundle install
   ```
3. Set up the database and seed default users:
   ```sh
   bin/rails db:setup
   ```
4. Start the development server:
   ```sh
   bin/rails server
   ```

### Styling

The UI is styled with Tailwind CSS loaded from the official CDN (`https://cdn.tailwindcss.com`). Update `app/views/layouts/application.html.erb` if you want to extend the Tailwind configuration or swap in a compiled build.

### Running tests

Execute the RSpec suite locally with:

```sh
bundle exec rspec
```

### Default credentials

| Role       | Email                   | Password |
|------------|-------------------------|----------|
| Superadmin | superadmin@example.com  | password |
| Admin      | admin@example.com       | password |
| Client     | client@example.com      | password |

Superadmins and admins are redirected to the client management dashboard. Clients are redirected to their dedicated client page.
# client-portal
