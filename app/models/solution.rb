require 'ideone'

class Solution < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user
  has_one :solution_detail

  validates :user, :presence => true
  validates :problem, :presence => true
  validates :source_code, :presence => true
  validates :programming_language, :presence => true

  def programming_languages
    {I18n.t(:choose_programming_language) => nil,
     #"AWK (gawk) (gawk-3.1.6)"=>"104",
     #"AWK (mawk) (mawk-1.3.3)"=>"105",
     #"Ada (gnat-4.3.2)"=>"7",
     #"Assembler (gcc-4.3.4)"=>"45",
     #"Assembler (nasm-2.07)"=>"13",
     #"Bash (bash 4.0.35)"=>"28",
     #"Brainf**k (bff-1.0.3.1)"=>"12",
     "C (gcc-4.3.4)"=>"11",
     #"C# (mono-2.8)"=>"27",
     "C++ (gcc-4.3.4)"=>"1",
     "C++0x (gcc-4.5.1)"=>"44",
     "C99 strict (gcc-4.3.4)"=>"34",
     #"CLIPS (clips 6.24)"=>"14",
     #"COBOL (open-cobol-1.0)"=>"118",
     #"COBOL 85 (tinycobol-0.65.9)"=>"106",
     #"Clojure (clojure 1.1.0)"=>"111",
     #"Common Lisp (clisp) (clisp 2.47)"=>"32",
     #"D (dmd) (dmd-2.042)"=>"102",
     #"Erlang (erl-5.7.3)"=>"36",
     #"F# (fsharp-2.0.0)"=>"124",
     #"Factor (factor-0.93)"=>"123",
     #"Falcon (falcon-0.9.6.6)"=>"125",
     #"Forth (gforth-0.7.0)"=>"107",
     #"Fortran (gfortran-4.3.4)"=>"5",
     #"Go (gc-2010-07-14)"=>"114",
     #"Groovy (groovy-1.7)"=>"121",
     #"Haskell (ghc-6.8.2)"=>"21",
     #"Icon (iconc 9.4.3)"=>"16",
     #"Intercal (c-intercal 28.0-r1)"=>"9",
     "Java (sun-jdk-1.6.0.17)"=>"10",
     #"JavaScript (rhino) (rhino-1.6.5)"=>"35",
     #"JavaScript (spidermonkey) (spidermonkey-1.7)"=>"112",
     #"Lua (luac 5.1.4)"=>"26",
     #"Nemerle (ncc 0.9.3)"=>"30",
     #"Nice (nicec 0.9.6)"=>"25",
     #"Nimrod (nimrod-0.8.8)"=>"122",
     #"Objective-C (gcc-4.5.1)"=>"43",
     #"Ocaml (ocamlopt 3.10.2)"=>"8",
     #"Oz (mozart-1.4.0)"=>"119",
     "PHP (php 5.2.11)"=>"29",
     "Pascal (fpc) (fpc 2.2.0)"=>"22",
     "Pascal (gpc) (gpc 20070904)"=>"2",
     #"Perl (perl 5.12.1)"=>"3",
     #"Perl 6 (rakudo-2010.08)"=>"54",
     #"Pike (pike 7.6.86)"=>"19",
     #"Prolog (gnu) (gprolog-1.3.1)"=>"108",
     #"Prolog (swi) (swipl 5.6.64)"=>"15",
     "Python (python 2.6.4)"=>"4",
     "Python 3 (python-3.1.2)"=>"116",
     #"R (R-2.11.1)"=>"117",
     "Ruby (ruby-1.9.2)"=>"17",
     #"SQL (sqlite3-3.7.3)"=>"40",
     #"Scala (scala-2.8.0.final)"=>"39",
     #"Scheme (guile) (guile 1.8.5)"=>"33",
     #"Smalltalk (gst 3.1)"=>"23",
     #"Tcl (tclsh 8.5.7)"=>"38",
     #"Text (text 6.10)"=>"62",
     #"Unlambda (unlambda-2.0.0)"=>"115",
     #"Visual Basic .NET (mono-2.4.2.3)"=>"101",
     #"Whitespace (wspace 0.3)"=>"6",
     #"bc (bc-1.06.95)"=>"110"
    }
  end

  def get_ideone_data
    i = Ideone.new(APP_CONFIG['ideone_user'], APP_CONFIG['ideone_pass'])

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
