module Jekyll
  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag.html')
      self.data['tag'] = tag
      self.data['title'] = "Posts tagged with \"#{tag}\""
    end
  end

  class TagGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'tag'
        dir = 'tags'
        site.tags.each_key do |tag|
          tag_downcase = tag.downcase
          write_tag_page(site, File.join(dir, tag_downcase), tag_downcase)
        end
      end
    end

    def write_tag_page(site, dir, tag)
      # Ensure the directory exists
      FileUtils.mkdir_p(File.join(site.dest, dir))
      
      index = TagPage.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end
