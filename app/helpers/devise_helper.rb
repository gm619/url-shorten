module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="container">
      <div class="row justify-content-around">
        <div class="flash-messages-for-ajax">
          <div class="col-md-12 flash-messages">
            <div class="alert-danger alert%>">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h6>#{sentence}</h6>
              <ul>#{messages}</ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end