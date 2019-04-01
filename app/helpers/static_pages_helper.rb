module StaticPagesHelper
  def status_bg status
    case status
    when Settings.statuses.cancelled
      Settings.warning
    when Settings.statuses.rejected
      Settings.danger
    when Settings.statuses.approved
      Settings.success
    else
      Settings.light
    end
  end
end
