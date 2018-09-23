module PlaysTheGame
  def start_game
    tic_tac_toe_cmd = File.expand_path(File.dirname(__FILE__) + '/../../bin/tic-tac-toe')
    @input_output = IO.popen("#{tic_tac_toe_cmd}", File::RDWR)
  end
end

World PlaysTheGame