module SimpleContractx
  class Contract < ActiveRecord::Base
    
    attr_accessor :project_name, :signed_by_name, :contract_on_file_noupdate, :paid_out_noupdate, :signed_noupdate, :void_noupdate

    belongs_to :project, :class_name => SimpleContractx.project_class.to_s
    belongs_to :signed_by, :class_name => 'Authentify::User'
    belongs_to :last_updated_by, :class_name => 'Authentify::User'

    validates :contract_total, :project_id, :presence => true,
                               :numericality => {:greater_than => 0}
    validates :fort_token, :presence => true
    validates :payment_term, :numericality => {:greater_than_or_equal_to => 0, :only_integer => true}, :if => 'payment_term.present?'
    validates :executed_contract_total, :numericality => {:greater_than_or_equal_to => 0}, :if => 'executed_contract_total.present?'
    validate :dynamic_validate 
    
    default_scope {where(fort_token: Thread.current[:fort_token])}
    
    def dynamic_validate
      wf = Authentify::AuthentifyUtility.find_config_const('dynamic_validate', fort_token, 'simple_contractx')
      eval(wf) if wf.present?
    end
  end
end
