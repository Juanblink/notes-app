require 'faker'

# Seeds existentes
Note.create([
  { title: "Old", body: "MyOldTest", created_at: 2.days.from_now, updated_at: 2.days.from_now },
  { title: "New", body: "MyNewText", created_at: 3.days.from_now, updated_at: 3.days.from_now },
  { title: "Older", body: "MyOlderText", created_at: 1.day.from_now, updated_at: 1.day.from_now },
  { title: 'Hello world!', body: 'This is my first note', created_at: Time.now, updated_at: Time.now },
  { title: 'hello_world', body: 'The same, but underscored', created_at: 1.day.ago, updated_at: 1.day.ago },
  { title: 'hello\\ world', body: 'The same, but with backslash-escaped space', created_at: 2.day.ago, updated_at: 2.day.ago },
  { title: 'Hola mundo!', body: 'The same, but in Spanish', created_at: 3.day.ago, updated_at: 3.day.ago },
  { title: "Today's humidity: 70%", body: 'A little hotter than usual', created_at: 4.day.ago, updated_at: 4.day.ago },
  { title: 'This one is a little older', body: 'By half a year', created_at: 6.months.ago, updated_at: 6.months.ago },
  { title: 'world_hello', body: "I've run out of ideas\n\nBut I do have\n\na lot of linebreaks.", created_at: 5.day.ago, updated_at: 5.day.ago },
])

# Generar 200 notas adicionales con títulos y cuerpos únicos
200.times do |i|
  Note.create(
    title: "Nota #{i + 11}: #{Faker::Lorem.sentence(word_count: 3)}", # "i + 11" para evitar duplicado de título
    body: Faker::Lorem.paragraph(sentence_count: 5), # Genera un cuerpo aleatorio
    created_at: Faker::Time.backward(days: 365), # Fecha de creación en el último año
    updated_at: Faker::Time.backward(days: 365) # Fecha de actualización similar a la de creación
  )
end

puts "Se han creado las notas de prueba exitosamente."