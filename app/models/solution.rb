require 'ideone'

class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  has_one :solution_detail

  validates :user, :presence => true
  validates :problem, :presence => true
  validates :source_code, :presence => true
  validates :programming_language, :presence => true

  def programming_language
    ProgrammingLanguage.find_by_ideone_id(read_attribute(:programming_language)).name
  end

  def get_ideone_data
    i = Ideone.new(APP_CONFIG['ideone_user'],
                   APP_CONFIG['ideone_pass'])

    puts 'Creating submission...'
    # Send the source code
    link = i.create_submission(self.source_code, self.programming_language)

    puts 'Waiting until compilation and execution have finished...'
    finished = false
    while !finished
      submission = i.submission_status(link)
      if submission[:status] == 0
        finished = true
      else
        puts 'Sleeping for 3 secs...'
        sleep 3
      end
    end

    puts 'Getting submission details...'
    submission = i.submission_details(link)
    
    puts 'Saving submission details'
    # Now save submission details
    detail = SolutionDetail.find_or_create_by_solution_id(self.id)
    detail.lang_id = submission["langId"]
    detail.lang_name = submission["langName"]
    detail.lang_version = submission["langVersion"]
    detail.exec_time = submission["time"]
    detail.date = submission["date"]
    detail.result = submission["result"]
    detail.status = submission["status"]
    detail.memory = submission["memory"]
    detail.public = submission["public"]
    detail.input = submission["input"]
    detail.output = submission["output"]
    detail.traceback = submission["stderr"]
    detail.save!
    puts 'Done!'
  end
  handle_asynchronously :get_ideone_data
  
end
