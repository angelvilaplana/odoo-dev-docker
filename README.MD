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
ODOO_DIR=odoo-18

git clone git@github.com:angelvilaplana/odoo-dev-docker.git --depth 1 --branch 18.0 ${ODOO_DIR}
cd ${ODOO_DIR}

rm -rf .git
bin/build
bin/fixperms

# Wait a few minutes, then you can access Odoo at https://localhost:8069.
```

## Commands

To be most easy, you can execute the follow commands inside the project:

- bin/build: Build the images of docker.
- bin/clidb: Run any CLI command in the database.
- bin/cliodoo: Run any CLI command in the odoo container.
- bin/docker-compose: Run the composer binary.
- bin/fixperms: This will fix filesystem permissions within the container.
- bin/odoosh: Access to the odoo terminal to execute code in Odoo.
- bin/psql: Access to the database to execute queries in Postgres.
- bin/restart: Restart the containers.
- bin/start: Start the containers.
- bin/stop: Stop the containers
- bin/test: Run tests specifyng the module and database
- bin/updateaddon: Update addon 

