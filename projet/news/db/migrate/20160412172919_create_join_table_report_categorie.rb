class CreateJoinTableReportCategorie < ActiveRecord::Migration
  def change
    create_join_table :reports, :categories do |t|
      # t.index [:report_id, :category_id]
      # t.index [:category_id, :report_id]
    end
  end
end
