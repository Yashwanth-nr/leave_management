class Leave < ActiveRecord::Base
	belongs_to :user
	has_many :leave_dates
	accepts_nested_attributes_for :leave_dates, :allow_destroy => true
	validate :leave_availability
	after_create :reduce_cl

	def leave_availability
		if self.new_record?
			cl = self.user.cl
			#binding.pry
			leave = ( self.start_date..self.end_date).to_a
			#binding.pry
			if cl < leave.length
				errors.add(:base ,"Your leaves are over")
			end

		 	new_leaves = (self.start_date..self.end_date).to_a.reject{|day| day.wday == 0}
			dates = []
			# binding.pry
			leaves = Leave.where(user_id: self.user.id)
			# binding.pry
			leaves.each do |leave|
				# binding.pry
				leave.leave_dates.each do |l|
					dates.push(l.leave_date)
					# binding.pry
				end
			end
			# binding.pry
			if (!((dates - new_leaves).length == dates.length) && ((dates - new_leaves).length != 0))
				errors.add(:base ,"This date is already approved for leave")
			end
		end
	end


def reduce_cl
	leave_count = 0


self.leave_dates.each do |leave|
	if leave.leave_type == "full"
		leave_count += 1
	else
		leave_count += 0.5
	end
end

	self.user.update_attributes(cl: self.user.cl - leave_count)

end

end
