require "importer"
require "json"

describe PlainTextImporter do
  describe "#as_json" do
    it "converts to a JSON-compatible object" do
      importer = PlainTextImporter.new(plain_text_dump)

      output = importer.as_json

      expected_json_object[:organizations].each_with_index do |expected, index|
        org = output[:organizations][index]

        expected.each do |key, expected_value|
          expect(org[key]).to eq(expected_value)
        end
      end
    end
  end
end

def expected_json_object
  JSON.parse(File.read(expected_json_file), symbolize_names: true)
end

def plain_text_dump
  File.read(plaintext_dump_file)
end

def plaintext_dump_file
  "spec/fixtures/getting_out_staying_out.dump.txt"
end

def expected_json_file
  "spec/fixtures/getting_out_staying_out.expected.json"
end
