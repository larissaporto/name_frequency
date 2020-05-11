require_relative 'states'
class NameFrequency
  def main
    begin
      i = self.menu
      case i
      when 1
        States.new.ranking_state
      when 2
        States.new.ranking_city
      when 3
        puts 3
      end
      exit if i.zero?
    end
  end

  def menu
    print "Aplicativo sobre nomes populares \n"
    puts
    puts 'Menu: '
    puts
    puts '1) Ranking dos nomes por UF'
    puts '2) Ranking dos nomes por cidade'
    #puts '3) Frenquência ao longo dos anos'
    puts
    puts 'A escolha do número 0 termina o programa'
    print 'Escolha o número de sua opção: '
    i = gets.chomp.to_i
    return i
  end
end

NameFrequency.new.main
