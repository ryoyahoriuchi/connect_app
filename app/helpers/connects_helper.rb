module ConnectsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_connects_path
    elsif action_name == 'edit'
      connect_path
    end
  end
end
