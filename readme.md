#### Installation
```
git clone git@github.com:stasgeller-ddi/task-area-back.git
cd task-area-back
make init
```

#### Make commands
`make init` - Set up project. Only for first run. \
`make php` - Jump into php container \
`make db-force` - Force update schema (test and local env) \
`make fixtures` - Load fixtures \
`make up` - Alias docker-compose up \
`make down` - Alias docker-compose down

### Setup tests environment in PhpStorm
- add cli interpreter (if not installed yet)
    - Preferences | Languages & Frameworks | PHP
    - from "docker, vagrant..." as docker-compose tab
    - select config to "./docker-compose.yml"
    - select "php"
- go to Preferences | Languages & Frameworks | PHP | Test Frameworks 
- in "Test Runner" section set up
    - default bootstrap file to "tests/bootstrap.php"
    - default config file to "./phpunit.xml.dist"
    
#### XDebug

File | Settings | Languages & Frameworks | PHP | Debug:

+ Ignore external connection +
+ Break at first line -
+ Debug port: 9000
+ Can accept external connections +

File | Settings | Languages & Frameworks | PHP | Servers:

Create server with name `task-area.api.local`

##### NOTICE!!!!!
If you use Mac OS set the value of `remote_host` as `host.docker.internal` in:
- docker-composer.yaml (XDEBUG_CONFIG)
- File | Settings | Languages & Frameworks | PHP | Servers -> Host
