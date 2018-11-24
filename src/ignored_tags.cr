module Divclass
  # taken from https://eastmanreference.com/complete-list-of-html-tags on 2018-11-24
  IGNORE_TAGS = %w(
    html head body
    div span p br hr pre a
    hgroup h1 h2 h3 h4 h5 h6
    b i em strong del ins mark s small sub sup u
    link meta script style title
    blockquote code data datalist kbd output q samp time var
    ul ol li menu menuitem nav
    abbr address caption cite dfn meter progress template wbr
    article aside footer header main section
    canvas figure img iframe noscript
    map area
    embed object param
    audio video souce track
    base bdi bdo
    form label legend fieldset button input select optgroup option textarea
    col colgroup
    dd dt dl
    details summary
    dialog
    keygen
    rb rp rt rtc ruby
    table tr td th tbody thead tfoot
  )
end
