#/bin/bash!

# Configurar DEVISE antes de executar este script

rails g controller static index

rails g scaffold language name description:text

rails g scaffold local name country state city zip_code

rails g scaffold ability name description:text scope:integer

rails g scaffold function name description:text

rails g scaffold project name size:integer start_date:date end_date:date local:references

rails g scaffold theme name description:text project:references

rails g scaffold release version deliver_date:date project:references

rails g scaffold sprint start_date:date end_date:date planning_start_date:date planning_end_date:date execution_start_date:date execution_end_date:date review_meeting_date:date retrospective_meeting_date:date project:references release:references

rails g scaffold user_story description:text business_value:integer story_points:integer status:integer theme:references sprint:references

rails g scaffold user_story_acceptance_criterion description:text status:integer user_story:references

rails g scaffold task description:text end_date:date start_date:date status:integer user_story:references

rails g scaffold task_requirement level:integer task:references ability:references

rails g devise user name schedule:string group:integer local:references 

rails g scaffold user_language proficiency:integer user:references language:references

# Criar migração User_Task com atributos user:references task:references

rails g model function_user_project project:references user:references function:references

rails g scaffold user_ability points:integer user:references ability:references

rails g controller dashboard index