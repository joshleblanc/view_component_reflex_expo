class SyntaxHighlighterComponent < ViewComponent::Base
  class << self
    def formatter
      @formatter ||= Rouge::Formatters::HTML.new(css_class: 'highlight')
    end

    def erb_lexer
      @erb_lexer ||= Rouge::Lexers::ERB.new
    end

    def ruby_lexer
      @ruby_lexer ||= Rouge::Lexers::Ruby.new
    end
  end

  def initialize(lexer: :ruby)
    @lexer = lexer
  end

  def lexer
    if @lexer == :ruby
      SyntaxHighlighterComponent.ruby_lexer
    else
      SyntaxHighlighterComponent.erb_lexer
    end
  end

  def formatted_content
    SyntaxHighlighterComponent.formatter.format(lexer.lex(content)).strip.html_safe
  end
end
