module Admin
  class AttendeesController < Admin::BaseController

    crudify :attendee,
            :title_attribute => 'first_name', :xhr_paging => true

  end
end
