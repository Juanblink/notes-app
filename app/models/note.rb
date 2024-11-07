class Note < ApplicationRecord
  validates :title, :body, presence: true

  def self.search_by_title_and_body(keywords)
    keywords.split.reduce(self) do |acc, word|
      acc.where("(title LIKE ? ESCAPE '\\' OR body LIKE ? ESCAPE '\\')", "%#{escape_sql_pattern(word)}%", "%#{escape_sql_pattern(word)}%")
    end
  end

  private

  def self.escape_sql_pattern(pattern)
    pattern.gsub(/[%_\\]/, '\\\\\\&')
  end
end
class Note < ApplicationRecord
  validates :title, presence: true, uniqueness: { message: "ya existe una nota con este título" }
end