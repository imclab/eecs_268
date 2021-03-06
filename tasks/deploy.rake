
require 'rake/contrib/sshpublisher'

namespace :deploy do
  
  desc 'Sets the correct base for deployment'
  task :set_base do
    SITE.base = "/~jvalland"
  end

  desc 'Deploy to the server using rsync'
  task :rsync do
    cmd = "rsync #{SITE.rsync_args.join(' ')} "
    cmd << "#{SITE.output_dir}/ #{SITE.user}@#{SITE.host}:#{SITE.remote_dir}"
    sh cmd
  end

  desc 'Deploy to the server using ssh'
  task :ssh do
    Rake::SshDirPublisher.new(
        "#{SITE.user}@#{SITE.host}", SITE.remote_dir, SITE.output_dir
    ).upload
  end

end  # deploy

# EOF
