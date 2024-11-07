# Esta migración agrega un índice único en la columna 'title' de la tabla 'notes'
# para asegurar que no se puedan crear notas con títulos duplicados en la base de datos.

class AddUniqueIndexToNotesTitle < ActiveRecord::Migration[6.1]
  def change
    # Agrega un índice único a la columna 'title' en la tabla 'notes'
    # Esto garantiza la unicidad a nivel de base de datos, evitando títulos duplicados.
    add_index :notes, :title, unique: true
  end
end