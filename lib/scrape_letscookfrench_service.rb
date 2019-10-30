require 'nokogiri'
require 'open-uri'

class ScrapeLetsCookFrenchService
  attr_reader :list
  def initialize(keyword)
    @keyword = keyword
    # "Mousse_ our delicious mousse recipes.html"
    # "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=" + @keyword
    @url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=" + @keyword
    @doc = Nokogiri::HTML(open(@url))
    @list = call
  end

  private

  def call
    # TODO: return a list of `Recipes` built from scraping the web.
    recipe_list = []
    index = 0
    @doc.css('.m_contenu_resultat').each do |result|
      recipe_list[index] = [result.at_css('.m_titre_resultat a').text]
      descr = result.at_css('.m_texte_resultat').text
      recipe_list[index].push(descr.strip[0..(descr.strip.index("."))])
      recipe_list[index].push(result.at_css('.m_detail_time').text[-7..-1].strip) # .gsub!(/\A\p{Space}*/, '')
      recipe_list[index].push(result.at_css('.m_detail_recette').text.split("-")[2].strip)
      index += 1
      break if index > 4
    end
    return recipe_list
  end
end


# ------------ TESTING ----------------

# test = ScrapeLetsCookFrenchService.new("mousse")
# p test.list