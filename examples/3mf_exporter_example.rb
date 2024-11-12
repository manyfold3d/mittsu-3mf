$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'mittsu/3mf'

loader = Mittsu::OBJLoader.new
object = loader.load(File.expand_path('./mittsu.obj', File.dirname(__FILE__)))

exporter = Mittsu::ThreeMFExporter.new
exporter.export(object, File.expand_path('./mittsu-export.3mf', File.dirname(__FILE__)))
