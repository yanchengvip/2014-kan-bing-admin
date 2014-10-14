class UsReport < ActiveRecord::Base
  belongs_to :patient,:foreign_key => :patient_id
  attr_accessible :patient_id,
                  :patient_name,
                  :patient_code,
                  :patient_ids,
                  :apply_department_id,
                  :apply_department_name,
                  :apply_doctor_id,
                  :apply_doctor_name,
                  :consulting_room_id,
                  :consulting_room_name,
                  :appointment_time,
                  :apply_source,
                  :source_code,
                  :bed_no,
                  :examined_part_id,
                  :examined_part_name,
                  :examined_item_id,
                  :examined_item_name,
                  :charge_type_id,
                  :charge,
                  :examine_doctor_id,
                  :examine_doctor_name,
                  :examine_doctor_code,
                  :is_emergency,
                  :created_by,
                  :created_by_name,
                  :modality,
                  :positive_grade,
                  :initial_diagnosis,
                  :equipment,
                  :approval_status,
                  :check_start_time,
                  :check_end_time,
                  :report_document_id,
                  :controller_by,
                  :controller_by_name,
                  :follow_up_result,
                  :print_total,
                  :notification_id,
                  :technician_id,
                  :technician_name,
                  :id,
                  :is_public,
                  :report_type,
                  :hospital_id,
                  :hospital_name,
                  :created_at,
                  :updated_at

end
