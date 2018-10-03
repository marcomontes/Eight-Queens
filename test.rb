#require 'byebug'

class Test

  def self.queens
    mat = []

    loop do
      mat = [[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
             [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']]


      continue_value = true
      contador = 0

      mat.each_with_index do |ele, index|

        contador = 0
        value = rand(0..7)

        loop do
          continue_value = true
          diagonals = []

          temp = index
          temp2 = value
          temp3 = value
          while temp > 0 && temp3 < 7
            if temp != index
              temp2 = (temp2) + 1
            end
            diagonals << mat[temp-1][temp2+1]
            temp -= 1
            temp3 += 1
          end

          temp = index
          temp2 = value
          temp3 = value
          while temp > 0 && temp3 > 0
            if temp != index
              temp2 = (temp2) - 1
            end
            diagonals << mat[temp-1][temp2-1]
            temp -= 1
            temp3 -= 1
          end

          temp = index
          temp2 = value
          temp3 = value
          while temp < 7 && temp3 < 7
            if temp != index
              temp2 = (temp2) + 1
            end
            diagonals << mat[temp+1][temp2+1]
            temp += 1
            temp3 += 1
          end

          temp = index
          temp2 = value
          temp3 = value
          while temp < 7 && temp3 > 0
            if temp != index
              temp2 = (temp2) - 1
            end
            diagonals << mat[temp+1][temp2-1]
            temp += 1
            temp3 -= 1
          end

          column = mat.map{|a| a[value]}
          if column.include?('R') || mat[index].include?('R') || diagonals.include?('R')
            continue_value = false
          end

          contador += 1
          value = rand(0..7) unless continue_value
          break if continue_value || contador > 30
        end

        if continue_value
          ele[value] = 'R'
        end
      end


      finish = true

      mat.each_with_index do |e, ja|
        unless e.include?('R')
          finish = false
        end
      end

      break if finish
    end

    mat.to_a.each {|r| puts r.inspect}
  end

end

Test.queens
