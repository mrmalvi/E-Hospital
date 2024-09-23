module ApplicationHelper
  include BootstrapHelper

  def disabled_edit_delete
    if !current_doctor.receptionist?
      "disabled"
    end
  end
end
