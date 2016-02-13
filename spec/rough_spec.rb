require 'nano_template'
require 'ostruct'

describe NanoTemplate do
  let(:nano_template) { NanoTemplate.new }
  let(:template_proc) { nano_template.template(template) }
  subject { template_proc.call(stash) }
  let(:stash) { OpenStruct.new }

  context "can run template" do

    context "<%= %>" do
      let(:template) { 'before<%= 1 + 1 %>after' }
      it { is_expected.to be == "before2after" }
    end

    context "<% %>" do
      let(:template) { 'before<% a = 2 %>middle<%= a %>after' }
      it { is_expected.to be == "beforemiddle2after" }
    end

    context "%=" do
      let(:template) { "before\n%= 1 + 1\nafter" }
      it { is_expected.to be == "before\n2\nafter" }
    end

    context "%" do
      let(:template) { "before\n% a = 1 + 1\n<%= a %>after" }
      it { is_expected.to be == "before\n2after" }
    end
  end

  context "can use stash value" do
    let(:stash) { OpenStruct.new({foo: 42, bar: "baz"}) }
    let(:template) { 'hoge<%= foo %>huga<%= bar %>piyo' }

    it { is_expected.to be == "hoge42hugabazpiyo" }
  end
end
