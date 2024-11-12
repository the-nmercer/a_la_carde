class RichTextAreaInput < Formtastic::Inputs::TextInput
  def to_html
    input_wrapping do
      builder.rich_text_area(method, input_html_options)
    end
  end
end
