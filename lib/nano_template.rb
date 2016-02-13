# text template like erb
class NanoTemplate

  # build template
  # @param [String] value template string
  # @return [Proc] compiled template Proc
  # @example NanoTemplate.new.template("<%= foo %>bar").call(OpenStruct.new(\{ foo: 42 })) # 42bar
  def template(value)
    begin
      sub = build_template(value)
      Proc.new do |stash|
        stash.instance_eval &sub
      end
    rescue => error
      raise "template compile error:\n#{error}\n--\n#{value}"
    end
  end

  # raised if template compile is failed
  class TemplateCompileError < RuntimeError
  end

  private

  def build_template(value)
    eval build_template_str(value)
  rescue => error
    raise TemplateCompileError.new("template compile error:\n#{error}\n-- in --\n#{value}")
  end

  # build template
  def build_template_str(value)
    "Proc.new do\nbegin\nresult = ''\n" +
    "result += '" +
    escape(value)
    .gsub(/^\s*%=(.*)$/) { "' + (#{unescape($1)}).to_s + '" }
    .gsub(/^\s*%(.*)$[\r\n]*/) { "'\n#{unescape($1)}\nresult += '" }
    .gsub(/<%=(.*?)%>/) { "' + (#{unescape($1)}).to_s + '" }
    .gsub(/<%(.*?)%>/) { "'\n#{unescape($1)}\nresult += '" } +
    "'\n" + "result\n" +
    "\nrescue => error\nraise 'template runtime error: ' + error.to_s + %Q{\\n-- in --\\n} + '#{escape(value)}'\nend\nend\n"
  end

  def escape(str)
    str.gsub(/'/) {"\\'"} # \' is regexp special char
  end

  def unescape(str)
    str.gsub(/\\'/, "'")
  end

end
