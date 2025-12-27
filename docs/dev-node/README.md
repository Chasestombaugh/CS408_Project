# Development with npm and Node.js

This document provides instructions for working with the full-stack web
application. Docker is not required for local development and testing, although
it can be used if desired. This project has been fully tested and is supported on GitHub
[CodeSpaces](https://github.com/features/codespaces). Fork the repository and
create a new CodeSpace to get started quickly without needing to install any
software locally.

The application is located in the `app` directory. All commands should be run
from within this directory. Navigate to the `app` by running `cd app` from the
root of the repository after cloning it. You can confirm you are in the correct
directory by checking for the presence of the `package.json` file in the terminal
or by using the `pwd` command.

Install the necessary packages for the application:

```bash
npm install
```

To start the development server, run:

```bash
npm start
```

Your will use `npm` to manage dependencies and scripts for building, testing, and
running the application. The project provides the following npm scripts:

- `npm start`: Starts the application server.
- `npm test`: Runs the test suite using playwright for end-to-end testing.
- `npm run start:prod`: Starts the application in production mode. This is useful
  for testing the production build locally before deploying. Some features may behave
  differently in production mode.
- `npm run clean`: Cleans up generated files and directories such as `node_modules`
  and test reports.
- `npm run debug`: Starts the application with the Node.js inspector enabled for
  debugging. This uses VS Code's built-in debugging tools.
- `npm run test:ui`: Launches the Playwright Test UI for interactive test execution
  and debugging. **NOTE:** This requires a graphical environment and may not work in
  headless setups like CodeSpaces.
- `npm run test:debug`: Runs the Playwright tests in debug mode, allowing you to step through
  tests and inspect the application state during test execution. This also requires a
  graphical environment and may not work in headless setups like CodeSpaces.

## Local Machine (Unsupported)

**Important:** This method is unsupported the department does not provide help
or troubleshooting for local machine setups due to the wide variety of operating
systems and configurations.

If you are unable to get this working on your local machine, you will need to
use CodeSpaces or come in to a lab with pre-configured machines.

Install the following:

- Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Install [VS Code](https://code.visualstudio.com/download)
- Install [Node.js](https://nodejs.org/en/download) version 24 or higher
- Install [Docker](https://docs.docker.com/get-docker/) on your local machine.

Then just follow the same steps as outlined above.