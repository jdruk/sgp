# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Function.create(name: 'Product Owner', description: 'O Product Owner pode acompanhar o desenvolvimento do projeto, visualizando cada etapa do desenvolvimento.')
Function.create(name: 'Tester', description: 'O Tester é quem irá testar cada tarefa desenvolvida e se está dentro dos critérios de aceitação.')

Language.create(name: 'English', description: '')
Language.create(name: 'French', description: '')
Language.create(name: 'German', description: '')
Language.create(name: 'Japanese', description: '')
Language.create(name: 'Mandarin', description: '')
Language.create(name: 'Portuguese Brazil', description: '')
Language.create(name: 'Russian', description: '')
Language.create(name: 'Spanish', description: '')