class CreateJoinTableReportSource < ActiveRecord::Migration
  def change
    create_join_table :reports, :sources do |t|
      # t.index [:report_id, :source_id]
      # t.index [:source_id, :report_id]
    end
  end
end
