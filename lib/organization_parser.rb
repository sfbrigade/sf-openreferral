class OrganizationParser
  EMAIL_REGEX = /\A\s*([^@\\s]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i
  URL_REGEX = /(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/

  def initialize(organization_text)
    @source = organization_text
  end

  def as_json
    attributes.map { |attribute| [attribute, send(attribute)] }.to_h
  end

  private

  attr_reader :source

  def attributes
    [
      :accessibility,
      :address,
      :contact_name,
      :description,
      :eligible_population,
      :email,
      :faith_based,
      :fax,
      :fees,
      :languages,
      :miscellaneous,
      :name,
      :phone,
      :services,
      :url,
      :what_to_bring,
    ]
  end

  def accessibility
    labeled_field(:accessibility)
  end

  def address
    labeled_field(:address) || line_ending_in_zip_code
  end

  def line_ending_in_zip_code
    match = source.match(/.+[^\d]\d{5}$/)
    match && match.to_s
  end

  def contact_name
    labeled_field(:contact_name)
  end

  def description
    lines[1].strip.sub(URL_REGEX, "").strip
  end

  def eligible_population
    labeled_field(:eligible_population)
  end

  def email
    labeled_field(:email) || scan_for_email
  end

  def scan_for_email
    match = source.match(EMAIL_REGEX)
    match && match.to_s
  end

  def faith_based
    labeled_field(:faith_based)
  end

  def fees
    labeled_field(:fees)
  end

  def languages
    parse_english_list(labeled_field(:languages))
  end

  def miscellaneous
    lines[2..-1].reject do |line|
      recognized_lines.any? { |known_line| line =~ known_line }
    end.join("\n")
  end

  def recognized_lines
    labeled_field_lines + ignorable_lines
  end

  def labeled_field_lines
    field_labels.values.flatten.map { |label| /^#{label}: / }
  end

  def field_labels
    {
      accessibility: "Accessibility",
      fees: "Client fees, if any",
      contact_name: ["Contact Persons", "Contact Person"],
      services: "Direct Services",
      eligible_population: "Eligible Population",
      email: "Email",
      faith_based: "Faith Based",
      fax: "Fax",
      languages: "Languages Spoken",
      address: "Location",
      what_to_bring: "What to Bring",
      phone: "Phone",
    }
  end

  def ignorable_lines
    [
      /^Things To Know$/,
      /^To Get Connected$/,
    ]
  end

  def name
    lines.first
  end

  def phone
    labeled_field(:phone)
  end

  def fax
    labeled_field(:fax)
  end

  def services
    parse_semicolon_list(labeled_field(:services))
  end

  def url
    source.match(URL_REGEX).to_s
  end

  def what_to_bring
    labeled_field(:what_to_bring)
  end

  def lines
    source.split(/\n+/).map(&:rstrip)
  end

  def labeled_field(attribute)
    potential_labels = Array(field_labels[attribute])

    matches = potential_labels.map do |label|
      source.match(/(?<=^#{label}: ).+/)
    end

    result = matches.compact.first
    result && result.to_s.strip
  end

  def parse_english_list(text)
    text.to_s.split(/(\,|\band\b|\.)/).map(&:strip) - [",", "and", "."]
  end

  def parse_semicolon_list(text)
    text.to_s.split(/(?<=[a-zA-Z\)]{2})[;\.] */)
  end
end
