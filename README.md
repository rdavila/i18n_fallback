# I18n Fallback

The main idea of this plugin is to allow a fallback locale when 
the lookup for the current locale fail.

## Quick explanation

To configurate the fallback locale:

    config.i18n.fallback_locale = :es #default is :en

Now if you have this translations:

    #en.yml
    en:
      hello: Hello world!

    #es.yml
    es:

Then if you have this:

    <%= t 'hello' %>

the #translate helper will use the 'en' translation when the current locale is 'es' 
because the 'hello' keyword is not found on the 'es' translation file.

That it's all!

Copyright (c) 2009 Rubén Dávila Santos, released under the MIT license
