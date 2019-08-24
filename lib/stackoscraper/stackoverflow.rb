require 'pry'

class Stackoscraper::Stackoverflow

	attr_accessor :questions, :votes, :answers, :views

	def self.today
		self.scrape_stackNew
	end

	def self.scrape_stackNew
		stack = Hash.new
		stack['questions'] = []
		stack['views'] = []
		stack['votes'] = []
		stack['answers'] = []
		newQ = self.newQuestion
		newQ.questions.each{|a| stack['questions'] << a.text.strip}
		newQ.views.each{|a| stack['views'] << a.text.strip}
		newQ.votes.each{|a| stack['votes'] << a.text.strip}
		newQ.answers.each{|a| stack['answers'] << a.text.strip}
		stack
		#binding.pry

	end

	# nokojiri magic
	# get the list of question with votes, answers, views.
	
	def self.newQuestion
		doc = Nokogiri::HTML(open("https://stackoverflow.com/questions"))
		question = self.new
		question.questions = doc.search('.question-summary .summary').css("h3")
		question.views = doc.search('.question-summary .statscontainer .views').css("div")
		question.votes = doc.search(".question-summary .statscontainer .stats .votes").css("span")
		question.answers = doc.search(".question-summary .statscontainer .stats").css("div>strong")
		#binding.pry
		question		
	end 
	

end































