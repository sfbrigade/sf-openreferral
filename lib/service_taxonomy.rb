class ServiceTaxonomy
  def initialize(filename)
    @filename = filename
  end

  def all
    @all ||= begin
               taxonomy = YAML.load_file(filename)
               hash_to_nested_strings(taxonomy)
             end
  end

  private

  attr_reader :filename

  def hash_to_nested_strings(hash, prefix: "")
    separator = " > "
    results = []

    hash.keys.each do |key|
      key_string = prefix + key
      values = hash[key]

      if values.nil?
        results << key_string
      else
        new_prefix = key_string + separator
        sub_results = hash_to_nested_strings(values, prefix: new_prefix)
        results += sub_results
      end
    end

    results
  end
end
