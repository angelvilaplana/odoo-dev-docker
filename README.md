# Odoo development environment with Docker

A basic Docker environment for Odoo development

## Requirements

To set up and run the environment, you need:  

- **Docker**: Required to run containers.
- **Git**: Needed to clone the repository.
- **A UNIX-based system**: Required to execute custom scripts in the `bin` folder.  

## Setup

To set up the environment, execute the following commands in the terminal:  

```bash
ODOO_DIR=odoo-14

git clone git@github.com:angelvilaplana/odoo-dev-docker.git --depth 1 --branch 14.0 ${ODOO_DIR}
cd ${ODOO_DIR}

rm -rf .git
bin/build
bin/fixperms

# Wait a few minutes, then you can access Odoo at https://localhost:8069.
```

## Commands  

For simplicity, you can run the following commands inside the project:  

- **`bin/build`**: Builds the Docker images.  
- **`bin/clidb`**: Runs any CLI command in the database container.  
- **`bin/cliodoo`**: Runs any CLI command in the Odoo container.  
- **`bin/docker-compose`**: Runs the `docker-compose` binary.  
- **`bin/fixperms`**: Fixes filesystem permissions within the container.  
- **`bin/odoosh`**: Opens an Odoo shell to execute code in Odoo.  
- **`bin/psql`**: Opens a PostgreSQL shell to execute queries in the database.  
- **`bin/restart`**: Restarts the containers.  
- **`bin/start`**: Starts the containers.  
- **`bin/stop`**: Stops the containers.  
- **`bin/test`**: Runs tests, specifying the module and database.  
- **`bin/install-addon`**: Install an addon.
- **`bin/update-addon`**: Updates an addon.
- **`bin/uninstall-addon`**: Uninstall an addon.
