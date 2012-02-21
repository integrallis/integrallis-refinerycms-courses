module Admin
  class VenuesController < Admin::BaseController

    crudify :venue,
            :title_attribute => 'name', :xhr_paging => true

  end
end
