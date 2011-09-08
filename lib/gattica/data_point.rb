require 'csv'

module Gattica

  # Represents a single "row" of data containing any number of dimensions, metrics

  class DataPoint

    include Convertible

    attr_reader :id, :updated, :title, :dimensions, :metrics, :xml

    # Parses the XML <entry> element
    def initialize(xml)
      @xml = xml.to_s
      @id = xml.at('id').inner_html
      @updated = DateTime.parse(xml.at('updated').inner_html)
      @title = xml.at('title').inner_html
      @dimensions = xml.search('dxp:dimension').inject({}) do |h,dimension|
        h[dimension.attributes['name'].split(':').last.to_sym] = dimension.attributes['value'].split(':').last;h
      end
      @metrics = xml.search('dxp:metric').inject({}) do |h,metric|
        h[metric.attributes['name'].split(':').last.to_sym] = metric.attributes['value'].split(':').last.to_f.to_i;h
      end
    end

    # Outputs in Comma Seperated Values format
    def to_csv(format = :long)
      output = ''
      columns = []

      # only output
      case format
      when :long
        [@id, @updated, @title].each { |c| columns << c }
      end

      # output all dimensions
      @dimensions.values.each { |c| columns << c }

      # output all metrics
      @metrics.values.each { |c| columns << c }

      output = CSV.generate_line(columns)
      return output
    end


    def to_yaml
      { 'id' => @id,
        'updated' => @updated,
        'title' => @title,
        'dimensions' => @dimensions,
        'metrics' => @metrics }.to_yaml
    end

  end

end