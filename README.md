# Client Demo Project
The Client Demo Project is a Ruby-based command-line tool that fetches client data and provides functionality to search clients by name and detect duplicate email addresses, using simple filtering and grouping logic on a remote dataset.

# Setup and Usage Instructions
## Prerequisites
- Ruby (version specified in `.ruby-version`)
- Bundler (`gem install bundler` if not installed)
## 1. Clone the project
- ```git clone git@github.com:sudippaudel793/client_demo.git```
- ```cd client_demo```

## 2. Installation
- Install ruby 3.4.5 using rbenv or rvm (The ruby version is specified in .ruby-version).<br /> ```rbenv install 3.4.5```
- Install bundler<br /> ```gem install bundler```
- ```bundle install```

## 3. Usage
- To search through all clients and return those with names partially matching a given search query.
  - Run: ```ruby app/search_client.rb```
  - Follow up the instruction that says "Enter the name of the client you want to search for:". Enter the name that you would like to search for.
- Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.
  - Run: ```ruby app/find_duplicate.rb```

# Assumption and decision made
- The app is designed to run on command-line Ruby environments without a web interface.
- The project assumes a flat JSON structure for client data fetched from an API.
- No database is used. All operations are done in memory.
- No authentication and authorization is required.
- Assumes that the user will run the project via terminal.
- Case-insensitive search for client name.
- Assuming that client data always have the key id, full_name and email.
- Code structure uses a modular pattern (app/client, app/search_client.rb, app/find_duplicate.rb, etc.) for better separation of concerns.
- The project uses HTTParty to fetch the client data. Assuming the internet access is available.

# Known limitations and areas for future improvement
- There is no web interface to display the result.
- No pagination functionality to handle large set of data.
- Automated testing via GitHub Actions or another CI tool can improve maintainability.
- The functionalities for searching by name and detecting duplicates are currently in separate files. These can be combined into a single file and controlled through terminal commands to specify which operation to perform.

# Enhancing or refactor the architecture
- Grouping related functionalities into separate service classes or modules.
  - Client::Searcher – Handles search logic
  - Client::DuplicateChecker – Handles duplicate detection
- Centralize error handling and use a logger instead of puts.

# Features or improvements for prioritise next
- Display results in a user-friendly format (eg: table).
- Pagination to handle large set of data.
- Using ```simplecov``` gem to for test coverage.
- One file to run either search or duplicate detection, controlled by CLI arguments.
- Move hardcoded API URLs to a YAML or .env configuration file.
