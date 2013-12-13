# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_error(msg, type)
    return if msg.blank?
    <<-END
       <div id="flash#{type}Explanation" class="feedback">
        <h2 style="#{type}">#{msg}</h2>
      </div>
    END
  end
end
