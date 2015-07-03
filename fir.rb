require"colorize"



#                                       Crear matriz principal

            def board_game (board)
              
                for i in 0..5
                    column=[]
                    board[i]=column
                        for j in 0..5
                            column[j]=" "
                         end
                end
                return board
            end

#                                        Mostrar tablero 
            def show_board(board)
                puts "            1    2    3    4    5    6".magenta
                 for i in 0..5
                    for j in 0..5
                    end
                       puts "          #{board[i]}".blue
                 end
            end

#                                Realizar jugada en la posicion indicada

         def player_option(board,player)

                  puts " Indique la columna donde desea jugar".yellow
                  option=gets.chomp.to_i
                  option=option-1
                  last=5

            if (option<0)then
                  puts "Opcion invalida, seleccione otra columna".red
            else
                  while last > -1
                           if (board[last][option]==" ") then
                                  board[last][option]= player
                                  break
                           else
                              last=last-1
                           end

                           if (last < 0) then
                           puts "Opcion invalida, seleccione otra columna".red
                           end
                     
                  end 
            end
             return (board)
         end

#                                  Determinar si hay ganador de forma horizontal

         def winner_H(board,player)    
                for i in 0..5
                        check=0
                        j=0

                        while (j < 6)
                            if (board[i][j] == player && board[i][j]!=" ")
                                check=check+1
                            else
                                check=0
                            end

                            if (check== 4) then
                                return true
                            end
                        j=j+1
                        end
                end

             return false
         end     
                 


#                                   Determinar si hay ganador de forma vertical
         def winner_V(board,player)
                
               for i in 0..5
                        check=0
                        j=0
                        while (j < 6)
                            if(board[j][i]== player && board[j][i]!=" ")
                                check=check+1
                            else
                                check=0
                            end
                            
                            if (check==4) then
                                return true
                            end
                         j=j+1
                        end
               end
          return false
         end

#                            Determinar si hay ganador de forma diagonal de abajo hacia arriba "Diagonal_up"

         def winner_Dup(board,player)
             
                for i in 0..5
                       check=0
                       for j in 0..5            
                                    if(board[i][j]== player && board[i][j]!=" ")
                                         check=check+1 
                                         j=j+1
                                         i=i-1
                                    else 
                                         check=0
                                    end

                                    if (check==4) then
                                         return true
                                    end
                       end
                end 
            return false
         end 

#                                      Determina si hay empate
         def dead_heat(board)
                for i in 0..5
                    for j in 0..5
                        if (board[i][j]==" ")
                            return true
                        end
                    end
                end
            return false
         end
            


puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-                -.-.-.-.-.-.-.-.-.-.-.-.-.-".black
puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-JUEGO 4 EN LINEA-.-.-.-.-.-.-.-.-.-.-.-.-.-".blue
puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-                -.-.-.-.-.-.-.-.-.-.-.-.-.-".black
puts "-.-.-.-.-.-.-.-.-.-.-.-.-.-                -.-.-.-.-.-.-.-.-.-.-.-.-.-".black


def main()

board=[]
player1="O"
player2="X"
win=false

board_game(board)
show_board(board)

k=0
           while (k <=1)


                player_option(board,player1)
                show_board(board)   
                                    win = winner_V(board,player1)

                                                   if (win == true) then
                                                                   puts "WINNER!!!!!".magenta,player1.magenta
                                                   break
                                                   end
                                    
                                    win = winner_H(board,player1) 

                                                   if (win == true) then
                                                                   puts "WINNER!!!!!".magenta,player1.magenta
                                                   break
                                                   end

                                    win = winner_Dup(board,player1)

                                                   if (win == true) then
                                                                   puts "WINNER!!!!!".magenta,player1.magenta
                                                   break
                                                   end

                player_option(board,player2)
                show_board(board)
                                    win = winner_V(board,player2)
                                                    if (win == true) then
                                                                   puts "WINNER!!!!".green,player2.green
                                                    break
                                                    end
                                    win = winner_H(board,player2) 

                                                    if (win == true) then
                                                                   puts "WINNER!!!!".green,player2.green
                                                    break
                                                    end
                                    win = winner_Dup(board,player2)

                                                   if (win == true) then
                                                                   puts "WINNER!!!!".green,player2.green
                                                   break
                                                   end

                                    dead_heat(board)
                                                   if (dead_heat(board) == false) then
                                                   puts  "EL JUEGO HA QUEDADO EN UN EMPATE".yellow
                                                   puts "LOS RESULTADOS SON IRREVERSIBLES...Att: Tiby".red
                                                   break
                                                   end  
           end
end

main
