# README

## CONFIGURATION INSTRUCTIONS

1. Set course repo name and admin github login in `config/initializers/course_config.rb`
2. To enable login with github, register an application here before deploying: https://github.com/settings/applications/new

    * Insert app_root_url as 'Homepage URL'
    * Insert app_root_url//auth/github/callback as 'Authorization callback URL'
3. You will obtain Client ID and Client Secret from Github - save them as environment variables as `GITHUB_KEY` and `GITHUB_SECRET` respectively (these variables names can be changed in `config/initializers/omniauth.rb`)