xml.instruct!
xml.tag! "env:Envelope", "xmlns:env" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema',
                          "xmlns:xsi" => 'http://www.w3.org/2001/XMLSchema-instance',
                          "xmlns:enc" => 'http://schemas.xmlsoap.org/soap/encoding/',
                          "env:encodingStyle"=>"http://schemas.xmlsoap.org/soap/encoding/", 
                          "xmlns:tns" => @namespace do
  xml.tag! "env:Body" do
    key = "tns:#{@operation}#{controller.soap_config.camelize_wsdl ? 'Response' : '_response'}"

    xml.tag! @action_spec[:response_tag] do
      wsdl_data xml, result
    end
  end
end
