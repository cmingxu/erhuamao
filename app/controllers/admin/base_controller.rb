# -*- encoding : utf-8 -*-
class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :require_admin	#, :only=> [:index], :except=> [:index]

  def index
  end

  def handle
  	render :text => "is handle , becarfe!"
  end

  def init_colors
    @colors = ["ffffff","cccccc","999999","000000","663300","996633","cc6633","ff6600","ff9900","ffcc33","ffff00","cccc33","999900","666600","336600","669900","77cc33","66cccc","0099cc","0066cc","333399","663399","993399","ea4c88","cc3333","cc0000","990000","660000"]
    @colors.each do |color|
      Color.create(:name => color, :hex => color)
    end
    render :text => "init_colors done"
  	# do something here
  end

  # 查找还没有s3版本的图片，手动启动copy过程
  def copy_all_to_s3
    @pages = Page.find_by_s3_status(false)
    @pages.each do |p|
      if Rails.env.production? # 产品环境下不开delayed
        p.delay(:queue => 'cloundinary_to_s3').cloundinary_to_s3
      else
        p.cloundinary_to_s3
        p.s3_status = true
        p.save
      end
    end
    render :text => "done"
  end

  def test_send_email_nodelay
    @user = User.find_by_email("insub@126.com")
    @msg = "这是一封直接发送的测试邮件"
    UserMailer.test_mailer(@user,@msg).deliver
    render :text => "邮件已发送"
  end

  def test_send_email_delay
    @user = User.find_by_email("insub@126.com")
    @msg = "这是一封经过后台Delayed_job队列处理后发送的测试邮件"
    UserMailer.delay(:queue => 'test_send_email').test_mailer(@user,@msg) # UserMailer类不需要加上deliver方法
    render :text => "邮件已发送"
  end

  def handle
    @page = Page.last
    #current_user.tag(@page, :with => "paris, normandy", :on => :tags)
    @pages = Page.tagged_with("paris", :on => :tags)
    render :text => @page.tags
  end

  def require_admin
    redirect_to "/login" unless current_user && Setting.admin_emails.include?(current_user.email)
  end
end
