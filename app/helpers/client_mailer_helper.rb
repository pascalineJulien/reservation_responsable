module ClientMailerHelper
  CUSTOM_STYLE = "max-width:512px;"
  CUSTOM_WIDTH="164"

  def ambassador_img_icon(ambassador)
    image_tag("ambassadors/#{ambassador.source_id}.png", class: "mcnImage", style: CUSTOM_STYLE, width: CUSTOM_WIDTH, id: ambassador.source_id, alt: ambassador.display_name)
  end

end
