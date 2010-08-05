require "calendar_date_select/calendar_date_select.rb"
require "calendar_date_select/form_helpers.rb"
require "calendar_date_select/includes_helper.rb"

require 'rails'
require 'active_support'

module CalendarDateSelect

  Files = [
    '/public',
    '/public/javascripts/calendar_date_select',
    '/public/stylesheets/calendar_date_select', 
    '/public/images/calendar_date_select',
    '/public/javascripts/calendar_date_select/locale'
  ]

  class Railtie < ::Rails::Railtie

    initializer 'calendardateselect.initialize', :after => :action_view do
      ActionView::Helpers::FormHelper.send(:include, CalendarDateSelect::FormHelpers)
      ActionView::Base.send(:include, CalendarDateSelect::FormHelpers)
      ActionView::Base.send(:include, CalendarDateSelect::IncludesHelper)
  
      ActionView::Helpers::InstanceTag.class_eval do
        class << self; alias new_with_backwards_compatibility new; end #TODO: singleton_class.class_eval
      end
    end

    rake_tasks do
      namespace :calendar do
        desc "Install assets required by calendar_date_select gem"
        task :install do
          cds_files = Dir.glob(RAILS_ROOT + '/public/javascripts/calendar_date_select/calendar_date_select.*js')
          if cds_files.any?
            CalendarDateSelect.lib = cds_files.first[/calendar_date_select\.([^\/]*)\.js/, 1]
          else
            jquery = Dir[File.join(RAILS_ROOT, %w[vendor plugins jrails])].first.try(:any?) || Dir.glob(RAILS_ROOT + '/public/javascripts/jquery*.js').first
            CalendarDateSelect.lib = 'jquery' if jquery

            Files.each do |f|
              source = File.join(File.dirname(__FILE__) + "..", f)
              dest = File.join(Rails.root, f)
              FileUtils.mkdir_p(dest, :verbose => true)
              files = Dir.glob(source+'/*.*')
              if f == '/public/javascripts/calendar_date_select'
                files = files.reject{|ff| ff =~ /calendar_date_select[^\/]*js/} # all but calendar_date_select<sthg>js
                p cds_file = File.join(source, "calendar_date_select.#{CalendarDateSelect.lib}.js")
                files << cds_file
              end 
              FileUtils.cp(files, dest, :verbose => true)
            end
          end
        end # task
      end #namespace
    end # rake_tasks
  end # Railtie
end # module
