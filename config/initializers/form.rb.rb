Rails.application.config.action_view.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe # disable field error
end
