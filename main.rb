require "tty-table"
require "tty-prompt"

rows = [
  ["", "1", "2", "3"],
  ["A", "", "", ""],
  ["B", "", "", ""],
  ["C", "", "", ""]
]

table = TTY::Table.new(rows)


puts table.render(:unicode, width: 20, resize: true, alignment: [:center]) { |renderer|
  renderer.border.separator = :each_row
}

playing = true

while playing do
  
  def mark(rows)
    prompt = TTY::Prompt.new
    letters = ["A1", "B1", "C1","A2", "B2", "C2", "A3", "B3", "C3"]
    input = prompt.select("Your Turn! ↑/↓ ←/→", letters, per_page: 3)
      case input
        when "A1"
          rows[1][1] = "X"
        when "A2"
          rows[1][2] = "X"
        when "A3"
          rows[1][3] = "X"
        when "B1"
          rows[2][1] = "X"      
        when "B2"
          rows[2][2] = "X"
        when "B3"
          rows[2][3] = "X"
        when "C1"
          rows[3][1] = "X"
        when "C2"
          rows[3][2] = "X"
        when "C3"
          rows[3][3] = "X"
      end
    return rows
  end


  table2 = TTY::Table.new(mark(rows))
  puts table2.render(:unicode, width: 20, resize: true, alignment: [:center]) { |renderer|
    renderer.border.separator = :each_row
  }

  case "X" #Playerwin
    when rows[1][1] && rows[1][2] && rows[1][3] # Vertical rows win
      p "Win!"
      playing = false
    when rows[2][1] && rows[2][2] && rows[2][3] # Vertical rows win
      p "Win!"
      playing = false
    when rows[3][1] && rows[3][2] && rows[3][3] # Vertical rows win
      p "Win!"
      playing = false
    when rows[1][1] && rows[2][1] && rows[3][1] # Horizontal rows win
      p "Win!"
      playing = false
    when rows[1][2] && rows[2][2] && rows[3][2] # Horizontal rows win
      p "Win!"
      playing = false
    when rows[1][3] && rows[2][3] && rows[3][3] # Horizontal rows win
      p "Win!"
      playing = false
    when rows[1][1] && rows[2][2] && rows[3][3] # Diagonal rows win
      p "Win!"
      playing = false
    when rows[3][1] && rows[2][2] && rows[1][3] # Diagonal rows win
      p "Win!"
      playing = false
  end

  case "O" # KI Win
    when rows[1][1] && rows[1][2] && rows[1][3] # Vertical rows win
      p "You loose"
      playing = false
    when rows[2][1] && rows[2][2] && rows[2][3] # Vertical rows win
      p "You loose"
      playing = false
    when rows[3][1] && rows[3][2] && rows[3][3] # Vertical rows win
      p "You loose"
      playing = false
    when rows[1][1] && rows[2][1] && rows[3][1] # Horizontal rows win
      p "You loose"
      playing = false
    when rows[1][2] && rows[2][2] && rows[3][2] # Horizontal rows win
      p "You loose"
      playing = false
    when rows[1][3] && rows[2][3] && rows[3][3] # Horizontal rows win
      p "You loose"
      playing = false
    when rows[1][1] && rows[2][2] && rows[3][3] # Diagonal rows win
      p "You loose"
      playing = false
    when rows[3][1] && rows[2][2] && rows[1][3] # Diagonal rows win
      p "You loose"
      playing = false
  end

end
