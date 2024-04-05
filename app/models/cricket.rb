class Cricket < ApplicationRecord
	serialize :phone_numbers, Array
	has_many :addresses, dependent: :destroy
	accepts_nested_attributes_for :addresses, allow_destroy: true
	enum :role, ["bowler","batter","wicketkeeper", "allrounder"]
	validates :name, :country, :role, :best_bowling, presence: true
	validates :age, comparison: {greater_than: 15}
	validates :runs_scored, comparison: {greater_than_or_equal_to: :highest_score}
	validates :matches_played, :highest_score, comparison: {greater_than_or_equal_to: 0}
	 validate :check_wickets_taken

 

	def check_wickets_taken 
		# wickets_taken = -1 if wickets_taken.nil?
		if saved_change_to_wickets_taken?
		if wickets_taken < best_bowling.to_i 
			then
			errors.add :wickets_taken, :invalid, message: "Wickets Taken must be greater than or equal to best bowling"
		end
	end
	end



























#Anwer 20
	def highest_average
		hashh = Hash.new
		for i in (0...Cricket.group(:country).count.count)
			cc = Cricket.group(:country).sum(:runs_scored).values[i] / Cricket.group(:country).count.values[i]
			# h.store(Cricket.group(:country).sum(:runs_scored).keys[i],c)
			hashh[:"#{Cricket.group(:country).sum(:runs_scored).keys[i]}"] = cc
		end
		hashh.sort_by{|_key, value| value}.last
 	end

#Answer 26
	def  difference_score
		 hashh = []
		for num in (0...Cricket.group(:country).count.count)
			cric =Cricket.group(:country).sum(:runs_scored).values[num] - Cricket.group(:country).sum(:wickets_taken).values[num]
			hashh << {Cricket.group(:country).sum(:runs_scored).keys[num] => cric}
		end
		hashh.sort_by { |k| k.values}.reverse.first(5)
 	end

#Answer 30 
 	def higher_average_per_match
 		arr = []
 		for i in (0...Cricket.all.size)
    	c = Cricket.all.pluck(:runs_scored)[i] / Cricket.all.pluck(:matches_played)[i]
   		arr << {Cricket.all.pluck(:name)[i] => c}
 		end
 		arr.sort_by { |k| k.values}.reverse.first(5)
 	end

#answer 33
	def player_with_experience
		arr = []
 		for i in (0...Cricket.all.size)
    	c = Cricket.all.pluck(:runs_scored)[i] / Cricket.all.pluck(:matches_played)[i]
   		if(c >= 30)
   		arr << Cricket.where("matches_played > ?", 50).pluck(:name)[i]
   		end
 		end
 		arr
 	end

 	#Answer 34
 	def calculate_percentage
 		hashh = {}

 		Cricket.where(retired:true).group_by{|cricket| cricket.country}.each{ |key, val| hashh.store(key,(val.count * 100 )/ Cricket.where(country: key).count)}
 		hashh
 		# 	j = 0
 		# 	num = 0
 		# while(j < Cricket.group(:country).count.count)
 		# 	if(Cricket.group(:country).where(retired:true).count.keys[num] == Cricket.group(:country).count.keys[j])
 		# 		per = (Cricket.group(:country).where(retired:true).count.values[num] * 100)/ Cricket.group(:country).count.values[j]
 		# 		hashh.store(Cricket.group(:country).where(retired:true).count.keys[num],per)
 		#   else
 		#   	per = 0
 		# 		hashh.store(Cricket.group(:country).count.keys[j],0)
 		# 		num -= 1
 		#   end
 		#   num += 1
 		#   j += 1
 		# end
 		# hashh
 	end
end
