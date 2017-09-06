option = 0
while option != 4
  puts 'ingresa 1 para mostrar el promedio de notas'
  puts 'ingresa 2 para mostrar las inasistencias'
  puts 'ingresa 3 para mostrar los nombres de los alumnos'
  puts 'ingresa 4 para salir del sistema'

  option = gets.chomp.to_i

  puts case option
       when 1
         average('notas.csv')
       when 2
         total_absence('notas.csv')
       when 3
         approves(average)####????
       when 4
         puts 'Cerrando...'
         exit(0)
       else
         puts 'Error, debes marcar una de las opciones indicadas'
       end
end
