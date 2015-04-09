# PARSE TYPE DEFINITIONS


require 'nokogiri'
require 'open-uri'

url = "https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/Accounts+TypeDefinitions"

doc = Nokogiri::HTML(open(url))

dir = "#{Dir.pwd}/parsers"

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

ENUMS_LIST = ["MarketProjection", "PriceData", "MatchProjection", "OrderProjection", "MarketStatus", "RunnerStatus", "TimeGranularity", "Side", "OrderStatus", "OrderBy", "SortDir", "OrderType", "MarketSort", "MarketBettingType", "ExecutionReportStatus", "ExecutionReportErrorCode", "PersistenceType", "InstructionReportStatus", "InstructionReportErrorCode", "RollupModel", "GroupBy", " BetStatus", "IncludeItem", "ItemClass", "Status", "SubscriptionStatus", "Wallet"]

def normalize_type(type, dict)
  type = "String" if type.downcase == "string"
  type = "Fixnum" if type.downcase == "int"
  type = "Float" if type.downcase == "double"
  type = "\"BetfairNg::API::DataTypes::Boolean\"" if type.downcase == "boolean"
  type = "Date" if type.downcase == "date"
  type = "Fixnum" if type.downcase == "long"
  type = "\"BetfairNg::API::DataTypes::#{type}\"" if dict.include?(type)
  type = "\"BetfairNg::API::DataTypes::Enums::#{type}\"" if ENUMS_LIST.include?(type)
  type
end

class_list = doc.css('.wiki-content .panel .panelHeader').map(&:text)

doc.css('.wiki-content .panel').each do |el|
  title = el.css('.panelHeader').text.strip
  title.gsub(/[ ]+/, '')
  filename = title.underscore
  filename.gsub!(/[ ]+/, '_')

  file = File.new("#{dir}/#{filename}.rb", "w")

  file.write("module BetfairNg\n")
  file.write("\n")
  file.write("\t#  Declares the module for API interactions\n")
  file.write("\t#\n")
  file.write("\tmodule API\n")
  file.write("\n")
  file.write("\t\t#  Declares the module for Data types\n")
  file.write("\t\t#\n")
  file.write("\t\tmodule DataTypes\n")
  file.write("\n")
  file.write("\t\t\t#  Declares #{title}\n")
  file.write("\t\t\t#\n")
  file.write("\t\t\t#  #{el.css('.panelContent > p').text.strip}\n")
  file.write("\t\t\t#\n")
  file.write("\t\t\t# == Fields\n")
  el.css('.panelContent table tbody tr').each do |row|
    arr = row.css('td')
    if !arr.first.nil?
      file.write("\t\t\t#  - #{arr.first.text.underscore}\n")
    end
  end
  file.write("\t\t\t#\n")
  file.write("\t\t\tclass #{title} < Base\n")
  file.write("\n")

  el.css('.panelContent table tbody tr').each do |row|
    arr = row.css('td')
    if !arr.first.nil?
      type = "Object"
      if arr[1]
        type = arr[1].css('a').nil? ? (arr[1].text.scan('<').empty? ? ":#{arr[1].text.underscore}" : "\"#{arr[1].text}\"") : "\"#{arr[1].text}\""
        type = normalize_type(arr[1].text, class_list)
        if !arr[1].text.scan('Set<').empty?
          nested_type = normalize_type(arr[1].text.split('<').last.gsub('>', '').strip, class_list)
          type = "\"BetfairNg::API::DataTypes::Set\", of: #{ nested_type }"
        end
        if !arr[1].text.scan('List<').empty?
          nested_type = normalize_type(arr[1].text.split('<').last.gsub('>', '').strip, class_list)
          type = "\"BetfairNg::API::DataTypes::List\", of: #{ nested_type }"
        end
      end
      if !arr[3].nil?
        file.write("\t\t\t\t#  #{arr[3].nil? ? "" : arr[3].text}\n")
        file.write("\t\t\t\t# @!attribute [w]\n")
        file.write("\t\t\t\t#\n")
      end
      file.write("\t\t\t\tfield :#{arr.first.text.underscore}, type: #{type}, required: #{arr[2].nil? ? "false" : (arr[2].css('img').empty? ? "false" : "true")}\n")
      file.write("\n")
    end
  end
  file.write("\n")
  file.write("\t\t\tend\n")
  file.write("\t\tend\n")
  file.write("\tend\n")
  file.write("end\n")
  file.close
end

