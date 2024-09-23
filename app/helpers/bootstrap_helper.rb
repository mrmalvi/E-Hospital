module BootstrapHelper
  def stats_box(count, text, icon)
    content_tag(:div, class: "card shadow-sm border-0 justify-content-between d-flex flex-column") do
      content_tag(:div, class: "d-flex justify-content-between p-4") do
        content_tag(:div, class: "d-flex flex-column justify-content-center align-items-start") do
          content_tag(:div, count, class: "totel-count fs-4 text-start fw-bold purple-text") +
          content_tag(:div, text, class: "text-uppercase text-start fs-6")
        end +
        content_tag(
          :div,
          content_tag(:i, nil, class: "fa-sharp fa-solid fa-#{icon} card-icon ms-3", style: "font-size: 36px;"),
          class: "d-flex align-items-start justify-content-center red-text"
        )
      end
    end
  end

  def profile_image(user)
    if user.image.attached?
      user.image.url
    else
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
    end
  end

  def appointment_status(appointment)
    if appointment && appointment.upcoming?
      content_tag(:p, class: "text-success text-center") do
        "Upcoming"
      end
    else
      content_tag(:p, class: "text-danger text-center") do
        "Completed"
      end
    end
  end
end
