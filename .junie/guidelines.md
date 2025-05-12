# Development Guidelines for the Project

## Build/Configuration Instructions

### Local Development Setup

1. **Ruby Version**: This project uses Ruby 3.1.3. Make sure you have this version installed.

2. **Dependencies Installation**:
   ```bash
   bundle install
   ```

3. **Database Setup**:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

4. **Running the Application**:
   ```bash
   bin/rails server
   ```
   The application will be available at http://localhost:3000

### Docker Setup

This project includes a Dockerfile for production deployment:

1. **Build the Docker Image**:
   ```bash
   docker build -t my-app .
   ```

2. **Run the Docker Container**:
   ```bash
   docker run -d -p 3000:3000 --name my-app -e RAILS_MASTER_KEY=<value from config/master.key> my-app
   ```

## Testing Information

### Running Tests

1. **Run All Tests**:
   ```bash
   bin/rails test
   ```

2. **Run Specific Test Files**:
   ```bash
   bin/rails test test/models/user_test.rb
   ```

3. **Run System Tests**:
   ```bash
   bin/rails test:system
   ```

### Adding New Tests

1. **Model Tests**:
   - Create test files in `test/models/`
   - Inherit from `ActiveSupport::TestCase`
   - Example:
     ```ruby
     require "test_helper"

     class UserTest < ActiveSupport::TestCase
       test "should create user with valid attributes" do
         user = User.new(name: "John Doe", email: "john@example.com")
         assert user.valid?
       end

       test "should not create user without name" do
         user = User.new(email: "john@example.com")
         assert_not user.valid?
       end
     end
     ```

2. **Controller Tests**:
   - Create test files in `test/controllers/`
   - Inherit from `ActionDispatch::IntegrationTest`

3. **System Tests**:
   - Create test files in `test/system/`
   - Inherit from `ApplicationSystemTestCase`
   - System tests use Selenium with headless Chrome

4. **Fixtures**:
   - Define test data in YAML files in `test/fixtures/`
   - Fixtures are automatically loaded for all tests

### Test Configuration

- Tests run in parallel with a number of workers equal to the number of processors
- System tests use Selenium with headless Chrome as the driver
- The screen size for system tests is set to 1400x1400 pixels

## Additional Development Information

### Code Style

- This project follows the Rails Omakase style guide, enforced by RuboCop
- Run RuboCop to check code style:
  ```bash
  bundle exec rubocop
  ```

### Security Scanning

- Brakeman is included for security vulnerability scanning:
  ```bash
  bundle exec brakeman
  ```

### Database

- The project uses SQLite for development and testing
- For production, consider using a more robust database like PostgreSQL

### Asset Pipeline

- The project uses Sprockets for asset compilation
- Assets are precompiled during the Docker build process

### Parallel Testing

- Tests run in parallel by default
- Configure the number of workers in `test/test_helper.rb`