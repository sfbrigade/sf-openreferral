require "organization_parser"

class PlainTextImporter
  def initialize(source)
    @source = source
  end

  def as_json
    @json ||= {
      organizations: organizations
    }
  end

  private

  attr_reader :source

  def organizations
    text_grouped_by_org.map do |org|
      OrganizationParser.new(org).as_json
    end
  end

  def text_grouped_by_org
    source.scan(/\w[\w\W\n]+?#{last_line}/)
  end

  def last_line
    /^Direct Services:.+$/
  end

  def lines
    source.split("\n")
  end
end
