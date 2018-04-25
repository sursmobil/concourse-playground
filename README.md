# concourse-self-update

This repo contains pipeline for [Concourse](https://concourse.ci) which allows
to automatically update all your pipelines from Git.

### How to install

1. Clone this repository.

        git clone https://github.com/sursmobil/concourse-self-update.git

1. Create file with variables. Ex.:

        ---
        name: self-update # name of updating pipeline

        src-repo: # configuration of repository with pipelines
            uri: https://github.com/my-org/my-repo.git
            username: me
            password: my-secret

        concourse-url: http://192.168.100.4:8080
        
        team_name: team
        
        team:
          name: team
          username: username
          password: password

    Self-update pipeline monitor your repository with CI configuration. On change it will read all pipelines from directory called 'pipelines' in your repository and set them on Concourse. If any pipeline is not used anymore you have to stop/delete it manually.

1. Create pipeline:

        fly -t target set-pipeline -p self-update -c pipelines/self-update.yml --load-vars-from <path-to-vars-file>

    Note: pipeline name has to be the same as in vars file.
