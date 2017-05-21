puts "creating administrator..."
User.create(name: "Admin", email: "admin@email.com", password: "admin", password_confirmation: "admin", group: :admin)
puts "user: admin@email.com"
puts "pswd: admin"

puts "creating functions..."
Function.create(name: 'Product Owner', description: 'O Product Owner pode acompanhar o desenvolvimento do projeto, visualizando cada etapa do desenvolvimento.')
Function.create(name: 'Scrum Master', description: 'O Scrum master irá auxiliar a equipe, removendo qualquer impedimento que implique no sucesso do projeto.')
Function.create(name: 'Programador', description: 'O programador é o membro resposável por codificar a aplicação.')
Function.create(name: 'Design', description: 'O design é quem irá trabalhar em todos os componentes visuais de um sistema.')
Function.create(name: 'Tester', description: 'O Tester é quem irá testar cada tarefa desenvolvida e se está dentro dos critérios de aceitação.')

puts "creating Languages..."
Language.create(name: 'English', description: '')
Language.create(name: 'French', description: '')
Language.create(name: 'German', description: '')
Language.create(name: 'Japanese', description: '')
Language.create(name: 'Mandarin', description: '')
Language.create(name: 'Portuguese Brazil', description: '')
Language.create(name: 'Russian', description: '')
Language.create(name: 'Spanish', description: '')

puts "done!"