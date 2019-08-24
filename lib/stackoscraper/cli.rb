class Stackoscraper::CLI

	def call
		list_of_questions
		menu
		goodbye
	end



	def list_of_questions
		@stack = Stackoscraper::Stackoverflow.today
	end



	def menu
		input = nil
		while input != "exit"
			puts "Welcome, to your stack"
			puts '===================================================================='
			puts 'you can choose to display the questions of day and their attributes'
			puts ' - press 1 to display all the questions'
			puts ' - press 2 to display the answered questions'
			puts ' - press 3 to display the viewed questions'
			puts ' - press 4 to display the voted questions'
			puts ' - enter exit to leave'
			puts "-----------------------------------------------------------------------"
			input = gets.strip.downcase
			
			if input.to_i == 1
				@stack['questions'].each{|q| puts q}
				puts '------------------------------------------------------------------------'
				puts ' BAck to the Menu'
				puts '------------------------------------------------------------------------'
			end

			if input.to_i == 2
				@stack['answers'].each.with_index do |ans, anindex|
					if  ans.to_i > 0
						@stack["questions"].each.with_index do |q,index|
							index == anindex
							puts "#{q}, number of answer: #{ans}"
						end
					end
				end
				puts '------------------------------------------------------------------------'
                                puts ' BAck to the Menu'
                                puts '------------------------------------------------------------------------'
			end
			
			 if input.to_i == 3
                                @stack['views'].each.with_index do |view, vindex|
                                        if  view.to_i > 0
                                                @stack["questions"].each.with_index do |q,index|
                                                        index == vindex
                                                        puts "#{q}, number of answer: #{view}"
                                                end
                                        end
                                end
                                puts '------------------------------------------------------------------------'
                                puts ' BAck to the Menu'
                                puts '------------------------------------------------------------------------'
                        end

			 if input.to_i == 4
                                @stack['votes'].each.with_index do |vote, vtindex|
                                        if  vote.to_i > 0 || vote.to_i < 0
                                                @stack["questions"].each.with_index do |q,index|
                                                        index == vtindex
                                                        puts "#{q}, number of answer: #{vote}"
                                                end
                                        end
                                end
                                puts '------------------------------------------------------------------------'
                                puts ' BAck to the Menu'
                                puts '------------------------------------------------------------------------'
                        end
				
		end
	end



	def goodbye
		puts "See you tomorrow for more  of stackoverflow!!"
	end


end

