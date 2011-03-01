class CreateGeneralEvaluations < ActiveRecord::Migration
  def self.up
    create_table :general_evaluations do |t|
      t.references :federation
      t.references :evaluator
      t.references :evaluated
      t.date :evaluated_on

      t.string :task_on_school
      t.string :sector
      t.integer :general_performance_grade
      t.string :team_work_grade
      t.string :trust_grade
      t.boolean :fulfills_monitory
      t.boolean :fulfills_supervision
      t.integer :participation_with_egregora_grade

      t.text :sanctions
      t.text :congratulations
      t.text :observations

      t.timestamps
    end
  end

  def self.down
    drop_table :general_evaluations
  end
end
