class FixEndTimeInWorkTimes < ActiveRecord::Migration
  def up
    rename_column :work_times, :endtime, :end_time
  end

  def down
  end
end
