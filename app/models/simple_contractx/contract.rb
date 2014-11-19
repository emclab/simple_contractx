module SimpleContractx
  class Contract < ActiveRecord::Base
    
    attr_accessor :project_name, :signed_by_name, :contract_on_file_noupdate, :paid_out_noupdate, :signed_noupdate, :void_noupdate
                    
    attr_accessible :contract_on_file, :contract_total, :last_updated_by_id, :note, :paid_out, :payment_agreement, :project_id, :sign_date, 
                    :signed, :signed_by_id, :payment_term, :contract_num, :void, :other_charge, :executed_contract_total,         
                    :project_name, 
                    :as => :role_new

    attr_accessible :contract_on_file, :contract_total, :last_updated_by_id, :note, :paid_out, :payment_agreement, :project_id, :sign_date, 
                    :signed, :signed_by_id, :payment_term, :contract_num, :void,  :other_charge, :executed_contract_total,         
                    :project_name, :signed_by_name, :contract_on_file_noupdate, :paid_out_noupdate, :signed_noupdate, :void_noupdate,
                    :as => :role_update

    attr_accessor :project_id_s, :zone_id_s, :paid_out_s, :payment_term_s, :payment_agreement_s,
                  :signed_s, :signed_by_id_s, :sign_date_s, :contract_on_file_s, :search_option_s, :time_frame_s

    attr_accessible :project_id_s, :zone_id_s, :paid_out_s, :payment_term_s, :payment_agreement_s,
                  :signed_s, :signed_by_id_s, :sign_date_s, :contract_on_file_s, :time_frame_s, :search_option_s,
                  :as => :role_search_stats

    belongs_to :project, :class_name => SimpleContractx.project_class.to_s
    belongs_to :signed_by, :class_name => 'Authentify::User'
    belongs_to :last_updated_by, :class_name => 'Authentify::User'

    validates :contract_total, :project_id, :presence => true,
                               :numericality => {:greater_than => 0}
    validates :payment_term, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true, :if => 'payment_term.present?'}
  end
end
