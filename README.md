# OneStep - Minesweeper Board Generator

## Introduction
We are building a simple rails application that allows users to generate minesweeper boards as well as to view previously generated minesweeper boards.

The app is ready to Heroku as well, make you have registered an account on Heroku, and installed the Heroku CLI

### Table of Contents

* [System requirements](#system-requirements)
* [Installation](#installation)
* [Deploy on Heroku](#deploy-on-heroku)

------------------------------------------------------------------------

## System requirements

- rbenv `latest`
- ruby `>= 3.1.0`
- postgres `latest`

------------------------------------------------------------------------

## Installation

1. Clone the repo
   ```git
   git clone https://github.com/pandabamboo90/onestep_minesweeper
   ```
2. Run setup to prepare database
   ```shell
   cd onestep_minesweeper
   bin/setup
   ```
3. Start the server
   ```shell
   bin/dev
   ```

------------------------------------------------------------------------

## Deploy on Heroku

1. Push the change on heroku, this will trigger the deployment
   ```git
   git push heroku main
   ```
2. Run the DB migration if needed
   ```shell
   heroku run rake db:migrate
   ```
3. Start the server
   ```shell
   heroku ps:scale web=1
   ```
4. Access the app on your browser
   ```shell
   heroku open
   ```