class GeneralEvaluation < ActiveRecord::Base
  
  belongs_to :federation
  belongs_to :evaluator, :class_name => "User" 
  belongs_to :evaluated, :class_name => "Person"

  validates_presence_of :federation
  validates_presence_of :evaluator
  validates_presence_of :evaluated
  validates_presence_of :evaluated_on

  validates_numericality_of :general_performance_grade, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 10
  GRADES = %w(bajo medio alto excelente)
  validates_inclusion_of [:team_work_grade, :trust_grade, :participation_with_egregora_grade], :in => GRADES


  validates_presence_of [:task_on_school, :sector, :general_performance_grade, :team_work_grade, :trust_grade, :participation_with_egregora_grade]

end
