require 'pandoc-ruby'
module ApiHelper
  def export_organizations_as_docx organizations
    markdown = export_organizations_as_markdown( organizations )
    converter = PandocRuby.new(markdown, :from => :markdown, :to => :docx)
    result = converter.convert
    return result
  end

  def export_organizations_as_markdown organizations
    template = File.read(File.join(Rails.root,'templates/organizations_template.markdown.erb'))
    e = ErbContainer.new
    e.organizations = organizations
    ERB.new(template).result(e.get_binding()) 
  end

  class ErbContainer
    attr_accessor :organizations
    def get_binding()
      binding()
    end
  end
end

