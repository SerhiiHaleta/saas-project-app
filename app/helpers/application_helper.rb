module ApplicationHelper
  def tenant_name(tenant_id)
    Tenant.find(tenant_id).name
  end

  def s3_link(tenant_id, artifact_key)
    link_to artifact_key, "#{artifact_key}", class: 'main-link', target: 'new'
  end
end
