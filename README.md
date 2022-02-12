# API Museu da Computação da UFRJ  | MCU-CORE

This project was generated with [Rails](https://guides.rubyonrails.org/v6.1/). Our main go is the create ond REST API to control the museum data.


We use:
 - Rails: 6.1.4.4
 - Ruby: 2.7.5

Table of contents
=================

  * [Install](#install)
  * [Usage](#usage)
  * [Rails Console](#rails-console)
  * [Tests](#tests)
  * [Linter](#linter)
  * [Troubleshooting](#troubleshooting)
  * [Git Guideline](#git-guideline)

## Install

+ Clone the repo and cd into it

``` bash
$ docker-compose up
```

> You need to add one `.env` use the `.env.example` as reference 
## Usage

```bash
$ docker-compose up
```

The application will become available at the URL:

```
http://localhost:3001/
```

1 - To install new gems add on Gemfile and then tun `docker-compose build`

## Rails Console

To access rails console run.

```bash
docker-compose run --rm app sh
```

```bash 
pry
``` 

More indo on [Rails Guide Command line](https://guides.rubyonrails.org/command_line.html) and [pry doc](http://pry.github.io)


## Tests

It's never too early to begin running unit tests. Tests are run using [RSpec](https://github.com/rspec/rspec-rails) testing framework and lives in the /spec folder. To run the tests:

```
docker-compose run --rm app rake
```
or into sh 

```
rake
```

## Linter

This project uses the [rubocop gem](https://guides.rubyonrails.org/testing.html) for linter, that config you can find on `.rubocop.yml`. Access the docker console and run by:

```bash
bundle exec rubocop 
```

> Use `-a` to autofix safe mode  and `-A` hardmode 

## Troubleshooting 

#### Access Forbidden  for edit files create by rails c

On ubuntu: 

inside de project folder run: 

```bash 
sudo chown your-user:your-user -R ./
```

#### rails server error `initialize': getaddrinfo: Name or service not known (SocketError)

On Ubuntu: 

On `/etc/host` add `127.0.0.1  localhost`

## Git Guideline
Create your branch's and commits using english language and fallowing this guideline.

#### Branches
- Feature:  `feat/branch-name`
- Hotfix: `hotfix/branch-name`
- POC: `poc/branch-name`

#### Commits prefix
- Chore: `chore(context): message`
- Feat: `feat(context): message`
- Fix: `fix(context): message`
- Refactor: `refactor(context): message`
- Tests: `tests(context): message`
- Docs: `docs(context): message`

#### Open MR's

When open your mr on github use the MR template.
