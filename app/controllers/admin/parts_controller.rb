module Admin
  class PartsController < Admin::BaseController

    crudify :part, :xhr_paging => true

  end
end
