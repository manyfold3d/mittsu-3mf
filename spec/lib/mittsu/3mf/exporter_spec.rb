require 'rexml/document'
require 'rexml/xpath'

RSpec.describe Mittsu::ThreeMFExporter do
  let(:box) {
    box = Mittsu::Mesh.new(
      Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
    )
    box.name = "box"
    box
  }
  let (:exporter) { described_class.new }

  it "sanitizes model names for use as filenames" do
    box.name = "<box>"
    expect(exporter.send(:filesystem_safe_name, box)).to eq "box"
  end

  it "can create a valid 3MF model file" do
    file = exporter.send(:model_file, box)
    xml = REXML::Document.new file
    expect(REXML::XPath.first(xml, "/model/@unit").value).to eq "millimeter"
    expect(REXML::XPath.first(xml, "/model/resources/object/@type").value).to eq "model"
    expect(REXML::XPath.match(xml, "/model/resources/object/mesh/vertices/vertex").count).to eq 8
    expect(REXML::XPath.match(xml, "/model/resources/object/mesh/triangles/triangle").count).to eq 12
  end

  it "exports grouped meshes" do
    group = Mittsu::Group.new
    group.add(box)
    group.add(Mittsu::Mesh.new(Mittsu::SphereGeometry.new()))
    file = exporter.send(:model_file, group)
    xml = REXML::Document.new file
    expect(REXML::XPath.match(xml, "/model/resources/object/mesh").count).to eq 2
    expect(REXML::XPath.match(xml, "/model/resources/object[1]/mesh/vertices/vertex").count).to eq 8
    expect(REXML::XPath.match(xml, "/model/resources/object[1]/mesh/triangles/triangle").count).to eq 12
    expect(REXML::XPath.match(xml, "/model/resources/object[2]/mesh/vertices/vertex").count).to eq 63
    expect(REXML::XPath.match(xml, "/model/resources/object[2]/mesh/triangles/triangle").count).to eq 88
    expect(REXML::XPath.match(xml, "/model/build/item").count).to eq 2
  end

  it "creates a valid content_types file" do
    file = exporter.send(:content_types_file)
    xml = REXML::Document.new file
    expect(REXML::XPath.first(xml, "/Types/Default[@Extension='rels']/@ContentType").value).to eq "application/vnd.openxmlformats-package.relationships+xml"
  end

  it "creates a valid rels file" do
    file = exporter.send(:rels_file, ["box"])
    xml = REXML::Document.new file
    expect(REXML::XPath.first(xml, "/Relationships/Relationship/@Target").value).to eq "/3D/box.model"
  end

  it "provides a #parse alias for export, because of API-compatibility with THREE.js" do
    Dir.mktmpdir do |dir|
      filename = File.join(dir, "test.3mf")
      exporter.parse(box, filename)
      expect(File.exist?(filename)).to be true
    end
  end

end
