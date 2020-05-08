# frozen_string_literal: true

begin
  print "Aplicativo sobre nomes populares \n"
  puts
  puts 'Menu: '
  puts
  puts '1) Ranking dos nomes por UF'
  puts '2) Ranking dos nomes por cidade'
  puts '3) Frenquência ao longo dos anos'
  puts
  puts 'A escolha do número 0 termina o programa'
  print 'Escolha o número de sua opção: '
  i = gets.chomp.to_i

  exit if i.zero?
end
