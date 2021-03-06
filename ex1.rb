def average(filename)

  notas = File.open(filename, 'r').readlines

  notas.map do |nota|
    a = nota.split(', ').map(&:chomp)
    b = a[1..5].delete_if { |a| a == "A" }
    grades = b.map(&:to_f)
    suma = grades.inject(0) { |sum, g| sum + g }
    avg = suma / grades.length

    file = File.open('promedios.txt', 'a')
    file.puts "#{a[0]},  promedio #{avg}"
  end
end

def total_absence(filename)
  file = File.open(filename, 'r')
  notas = file.readlines
  file.close

  notas.each do |nota|
  abs = nota.split(", ").map(&:chomp)
  print abs[0] + "\t", abs.count('A').to_s + "\n" if abs.include?('A')
  end
end

def aprobados(filename, nota = 5)

   students_info = File.open(filename, 'r').readlines

   students_info.map do |info|
     a = info.split(', ').map(&:chomp)
     b = a[1..5].delete_if { |a| a == "A" }
     grades = b.map(&:to_f)
     suma = grades.inject(0) { |sum, g| sum + g }
     avg = suma / grades.length
     puts "#{a[0]}, #{avg}" if avg >= nota

end
end

puts 'Registro de notas'
option = 0
while option != 4
  puts 'ingresa 1 para mostrar el promedio de notas'
  puts 'ingresa 2 para mostrar las inasistencias'
  puts 'ingresa 3 para mostrar los nombres de los alumnos'
  puts 'ingresa 4 para salir del sistema'

  option = gets.chomp.to_i

 case option
       when 1
         average('notas.csv')
       when 2
         total_absence('notas.csv')
       when 3
         puts "Ingrese una nota como numero"
         nota = gets.chomp.to_f
         aprobados('notas.csv')
       when 4
         puts 'Cerrando...'
         exit(0)
       else
         puts 'Error, debes marcar una de las opciones indicadas'
       end
end
