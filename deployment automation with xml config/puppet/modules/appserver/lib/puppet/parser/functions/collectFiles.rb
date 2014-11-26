require 'rexml/document'
include REXML
module Puppet::Parser::Functions
    newfunction(:collectFiles, :type => :rvalue ) do |args|
        fileList= []
        doc = REXML::Document.new args[0]
        doc.elements.each("node/configurations/config") {
         |config|
                fileName= config.elements["@fileName"].value
                fileList.push(fileName)
        }
        return fileList
    end
end
