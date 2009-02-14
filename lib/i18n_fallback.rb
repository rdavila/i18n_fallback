module I18n
  mattr_accessor :fallback_locale
  @@fallback_locale = :en
end

module ActionView
  module Helpers
    module TranslationHelper
      def translate(key, options = {})
        begin
          options[:raise] = true
          I18n.translate(key, options)
        rescue I18n::MissingTranslationData => e
          begin
            I18n.translate(key, options.merge(:locale => I18n.fallback_locale))
          rescue I18n::MissingTranslationData => e
            keys = I18n.send(:normalize_translation_keys, e.locale, e.key, e.options[:scope])
            content_tag('span', keys.join(', '), :class => 'translation_missing')
          end
        end
      end
      alias :t :translate
    end
  end
end
