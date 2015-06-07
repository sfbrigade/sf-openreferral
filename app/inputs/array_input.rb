class ArrayInput < SimpleForm::Inputs::StringInput
  include ActionView::Helpers::TagHelper
  include ActionView::Context
  include ActiveSupport::Inflector

  TEXT_FIELD_CLASSES = "text optional array-element"
  INPUT_CLASSES = "array-input"

  def input(_wrapper_options)
    input_html_options[:type] ||= input_type

    content_tag(:div, class: INPUT_CLASSES) do
      Array(attributes).map do |element|
        text_field_for(element)
      end.join.html_safe + add_field_html
    end
  end

  def input_type
    :text
  end

  private

  def attributes
    object.public_send(attribute_name)
  end

  def text_field_for(element)
    @builder.text_field(
      nil,
      input_html_options.merge(
        value: element,
        name: "#{object_name}[#{attribute_name}][]",
        class: TEXT_FIELD_CLASSES
      )
    )
  end

  def add_field_html
    <<-HTML.html_safe
<a href="#" onclick="#{add_element_function}()" class="add">#{add_text}</a>
<script>
  function #{add_element_function}(e)
  {
    var form = $(".input.#{model_name}_#{attribute_name} .#{INPUT_CLASSES}")[0],
    input = document.createElement("input");
    input.setAttribute("class", "#{TEXT_FIELD_CLASSES}");
    input.setAttribute("id", "#{model_name}_");
    input.setAttribute("name", "#{model_name}[#{attribute_name}][]");
    input.setAttribute("type", "text");
    add_link = $(".input.#{model_name}_#{attribute_name} .add")[0];
    form.insertBefore(input, add_link);
    input.focus();
  };
</script>
    HTML
  end

  def add_text
    singularize(
      humanize(
        "Add #{attribute_name}"
      )
    )
  end

  def model_name
    @model_name ||= object.class.to_s.downcase
  end

  def add_element_function
    "add_#{model_name}_#{attribute_name}"
  end
end