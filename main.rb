require "tty-table"
require "tty-prompt"

displ_arr = [
  ["", "1", "2", "3"],
  ["A", "", "", ""],
  ["B", "", "", ""],
  ["C", "", "", ""]
]

table = TTY::Table.new(displ_arr) #playfield displ_arr

puts table.render(:unicode, width: 20, resize: true, alignment: [:center]) { |renderer|
  renderer.border.separator = :each_row}


playing = true

def player_win?(displ_arr)#Player win conditions
  displ_arr[1][1] == "X" && displ_arr[1][2] == "X" && displ_arr[1][3] == "X" ||
  displ_arr[2][1] == "X" && displ_arr[2][2] == "X" && displ_arr[2][3] == "X" ||
  displ_arr[3][1] == "X" && displ_arr[3][2] == "X" && displ_arr[3][3] == "X" ||  #horizontal win

  displ_arr[1][1] == "X" && displ_arr[2][1] == "X" && displ_arr[3][1] == "X" ||
  displ_arr[1][2] == "X" && displ_arr[2][2] == "X" && displ_arr[3][2] == "X" ||
  displ_arr[1][3] == "X" && displ_arr[2][3] == "X" && displ_arr[3][3] == "X" ||  #vertikal win

  displ_arr[1][1] == "X" && displ_arr[2][2] == "X" && displ_arr[3][3] == "X" ||
  displ_arr[3][1] == "X" && displ_arr[2][2] == "X" && displ_arr[1][3] == "X"     #diagonal win
end

def ki_win?(displ_arr)#Ki win conditions
  displ_arr[1][1] == "O" && displ_arr[1][2] == "O" && displ_arr[1][3] == "O" ||
  displ_arr[2][1] == "O" && displ_arr[2][2] == "O" && displ_arr[2][3] == "O" ||
  displ_arr[3][1] == "O" && displ_arr[3][2] == "O" && displ_arr[3][3] == "O" || #horizontal win

  displ_arr[1][1] == "O" && displ_arr[2][1] == "O" && displ_arr[3][1] == "O" ||
  displ_arr[1][2] == "O" && displ_arr[2][2] == "O" && displ_arr[3][2] == "O" ||
  displ_arr[1][3] == "O" && displ_arr[2][3] == "O" && displ_arr[3][3] == "O" || #vertikal win

  displ_arr[1][1] == "O" && displ_arr[2][2] == "O" && displ_arr[3][3] == "O" ||
  displ_arr[3][1] == "O" && displ_arr[2][2] == "O" && displ_arr[1][3] == "O"    #diagonal win
end

while playing do

    def ki_logic(displ_arr2)
      c_no_1 = rand(1..3)
      c_no_2 = rand(1..3)

        if displ_arr2[1][1] == "X" && displ_arr2[1][2] == "X" && displ_arr2[1][3] == ""
            displ_arr2[1][3] = "O"
            return displ_arr2
        elsif displ_arr2[2][1] == "X" && displ_arr2[2][2] == "X" && displ_arr2[2][3] == ""
            displ_arr2[2][3] = "O"
            return displ_arr2
        elsif displ_arr2[3][1] == "X" && displ_arr2[3][2] == "X" && displ_arr2[3][3] == ""#horizontal stop
            displ_arr2[3][3] = "O"
            return displ_arr2                       
  
        elsif displ_arr2[1][1] == "X" && displ_arr2[2][1] == "X" && displ_arr2[3][1] == ""
            displ_arr2[3][1] = "O"
            return displ_arr2
        elsif displ_arr2[1][2] == "X" && displ_arr2[2][2] == "X" && displ_arr2[3][2] == ""
            displ_arr2[3][2] = "O"
            return displ_arr2
        elsif displ_arr2[1][3] == "X" && displ_arr2[2][3] == "X" && displ_arr2[3][3] == "" #vertikal stop
            displ_arr2[3][3] = "O"
            return displ_arr2                       
  
        elsif displ_arr2[1][1] == "X" && displ_arr2[2][2] == "X" && displ_arr2[3][3] == ""
            displ_arr2[3][3] = "O"
            return displ_arr2
        elsif displ_arr2[1][3] == "X" && displ_arr2[2][2] == "X" && displ_arr2[3][1] == "" #diagonal stop
            displ_arr2[3][1] = "O"                      
            puts "GOT YOU"
            return displ_arr2
        else
          while displ_arr2[c_no_1][c_no_2] != ""
          c_no_1 = rand(1..3)
          c_no_2 = rand(1..3)
          end
          displ_arr2[c_no_1][c_no_2] = "O"
          return displ_arr2
        end
    end
  

  
  def player_turn(displ_arr)
    prompt = TTY::Prompt.new
    letters = ["A1", "B1", "C1","A2", "B2", "C2", "A3", "B3", "C3"]
    input = prompt.select("Your Turn! ↑/↓ ←/→", letters, per_page: 3)
      case input
        when "A1"
          displ_arr[1][1] = "X"
        when "A2"
          displ_arr[1][2] = "X"
        when "A3"
          displ_arr[1][3] = "X"
        when "B1"
          displ_arr[2][1] = "X"      
        when "B2"
          displ_arr[2][2] = "X"
        when "B3"
          displ_arr[2][3] = "X"
        when "C1"
          displ_arr[3][1] = "X"
        when "C2"
          displ_arr[3][2] = "X"
        when "C3"
          displ_arr[3][3] = "X"
      end
    return displ_arr
  end

  displ_arr2 = player_turn(displ_arr) #player turn
  
  table2 = TTY::Table.new(displ_arr2)    #displ_arr updated result player
  puts table2.render(:unicode, width: 20, resize: true, alignment: [:center]) { |renderer|
    renderer.border.separator = :each_row}


  if player_win?(displ_arr2)
    puts "You win!"
    break
  end

  displ_arr2 = ki_logic(displ_arr2) #Ki turn
  
  table2 = TTY::Table.new(displ_arr2 )#displ_arr updated result
  puts table2.render(:unicode, width: 20, resize: true, alignment: [:center]) { |renderer|
    renderer.border.separator = :each_row}
  

  if ki_win?(displ_arr2)
    puts "You lose!"
    break
  end

end
