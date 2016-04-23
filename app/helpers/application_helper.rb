module ApplicationHelper

  def timing_list
    (0..24).map { |timing| timing }
  end

  def set_available_or_book_option_for(space)
    if controller_name == 'home'
      link_to "Available", shared_office_space_detail_path(space_id: space.id)
    else
      render 'shared_office_space/book', space: space
    end
  end

end
