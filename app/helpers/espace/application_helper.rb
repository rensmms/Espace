module Espace
  module ApplicationHelper


    def btable_parameters
      'data-locale="fr-FR"
        data-toggle="table"
        data-search="true"
        data-trim-on-search="false"
        data-show-toggle="true"

        data-state-save="true"
        class="display compact"
        data-no-transition-cache'.html_safe
    end


  end
end
