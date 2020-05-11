require_relative 'api'
require 'terminal-table'

class States
  def list_state(json)
    json.each do |list|
      puts "#{list[:id]}: #{list[:nome]}"
    end
  end

  def table(heading, rows)
    Terminal::Table.new :title => heading, :headings => ['Posição', 'Geral'], :rows => rows
  end

  def uf_rankings(rankings, heading)
    rows = []

    rankings.first[:res].each do |list|
      rows << [list[:ranking], list[:nome]]
    end
    puts table(heading, rows)
  end

  def call_final_listing(rankings, masculine, feminine)
    uf_rankings(rankings, 'Geral')
    uf_rankings(masculine, 'Masculino')
    uf_rankings(feminine, 'Feminino')
  end

  def ranking_state
    json = Api.new.list_states
    list_state(json)
    print 'Escolha o estado pela ID: '
    choice = gets.chomp.to_i
    rankings = Api.new.list_uf_rankings(choice)
    masculine = Api.new.list_uf_masculine(choice)
    feminine = Api.new.list_uf_feminine(choice)
    call_final_listing(rankings, masculine, feminine)
    gets
    NameFrequency.new.main
  end

  def ranking_city
    print 'Escreva o nome de uma cidade: '
    choice = gets.chomp.gsub(' ', '-')
    rankings = Api.new.list_city_rankings(choice)
    masculine = Api.new.list_city_masculine(choice)
    feminine = Api.new.list_city_feminine(choice)
    call_final_listing(rankings, masculine, feminine)
    gets
    NameFrequency.new.main
  end
end
