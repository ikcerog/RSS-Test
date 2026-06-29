<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="atom dc">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="/rss/channel/title"/> — RSS Feed</title>
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
          body { font-family: Georgia, serif; background: #fafaf8; color: #1a1a1a; line-height: 1.7; }
          .feed-header { background: #1a1a1a; color: #fff; padding: 2rem 1.5rem; }
          .feed-header h1 { font-size: 1.8rem; }
          .feed-header p { color: #aaa; margin-top: 0.4rem; font-size: 0.95rem; }
          .feed-header .rss-badge { display: inline-block; margin-top: 0.75rem; background: #f26522; color: #fff; padding: 0.3rem 0.75rem; border-radius: 4px; font-family: system-ui, sans-serif; font-size: 0.8rem; font-weight: 700; letter-spacing: 0.05em; }
          .notice { background: #fffbf5; border: 1px solid #f0d9b5; padding: 1rem 1.5rem; font-family: system-ui, sans-serif; font-size: 0.88rem; color: #7a5c2e; }
          main { max-width: 780px; margin: 2rem auto; padding: 0 1.5rem; }
          .item { border-bottom: 1px solid #ddd; padding: 1.75rem 0; }
          .item:last-child { border-bottom: none; }
          .item-meta { font-family: system-ui, sans-serif; font-size: 0.78rem; color: #888; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 0.4rem; }
          .item h2 { font-size: 1.5rem; margin-bottom: 0.5rem; }
          .item h2 a { color: #1a1a1a; text-decoration: none; }
          .item h2 a:hover { text-decoration: underline; }
          .item-desc { color: #444; font-style: italic; margin-bottom: 0.5rem; }
          .item-author { font-family: system-ui, sans-serif; font-size: 0.85rem; color: #666; }
          footer { text-align: center; padding: 2rem; font-family: system-ui, sans-serif; font-size: 0.8rem; color: #aaa; }
        </style>
      </head>
      <body>
        <div class="feed-header">
          <h1><xsl:value-of select="/rss/channel/title"/></h1>
          <p><xsl:value-of select="/rss/channel/description"/></p>
          <span class="rss-badge">RSS 2.0 Feed</span>
        </div>
        <div class="notice">
          This is an RSS feed. Subscribe by copying the URL into your RSS reader. You are seeing this page because your browser renders XML.
        </div>
        <main>
          <xsl:for-each select="/rss/channel/item">
            <div class="item">
              <div class="item-meta">
                <xsl:value-of select="category"/> &#8212; <xsl:value-of select="pubDate"/>
              </div>
              <h2><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h2>
              <p class="item-desc"><xsl:value-of select="description"/></p>
              <p class="item-author">By <xsl:value-of select="dc:creator"/></p>
            </div>
          </xsl:for-each>
        </main>
        <footer>
          <a><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute>Visit <xsl:value-of select="/rss/channel/title"/></a>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>