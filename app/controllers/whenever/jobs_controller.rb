module Whenever
  class JobsController < Web.config.parent_controller
    def index
      @crontab = CommandLine.new.send(:read_crontab)
    end

    def run
      runner = JobRunner.new(params[:id])
      runner.run
      redirect_to jobs_path(success: true)
    end
  end
end
