class SubscriptionService

  def self.create_sub(plan_id, user_id)
    new(plan_id, user_id).create_sub
  end

  def self.expire_paid_subs
    new.expire_paid_subs
  end

  def self.active_sub(user_id)
    new(nil, user_id).active_sub
  end

  def self.has_active_paid_subs?(user_id)
    new(nil, user_id).has_active_paid_subs?
  end

  private
  attr_reader :user_id
  attr_reader :plan_id

  def initialize(plan_id = nil, user_id = nil)
    @plan_id = plan_id
    @user_id = user_id
  end

  def user
    User.find(user_id)
  end

  def plan
    Plan.find(plan_id)
  end

  def has_no_subs?
    user.subscriptions.count.zero?
  end

  def has_active_free_subs?
    user.subscriptions
        .where(subscription_status: SubscriptionStatus.active, plan: Plan.free)
        .count > 0
  end

  def all_active_paid_subs
    Subscription
      .where(subscription_status: SubscriptionStatus.active, plan: [Plan.goldmonthly.id, Plan.goldyearly.id])
  end

  def active_paid_subs
    all_active_paid_subs.where(user_id: user_id)
  end

  def determine_sub_status
    return SubscriptionStatus.active if has_no_subs? || has_active_free_subs?

    SubscriptionStatus.upcoming if has_active_paid_subs?
  end

  def determine_end_date
    return Time.now.gmtime + plan.duration.send(plan.duration_unit) if has_no_subs? || has_active_free_subs?

    active_paid_subs.last.end_date + plan.duration.send(plan.duration_unit) if has_active_paid_subs?
  end

  public

  def has_active_paid_subs?
    active_paid_subs.count > 0
  end

  def active_sub
    user.subscriptions
        .where(subscription_status: SubscriptionStatus.active)
        .last
  end

  def expire_paid_subs
    all_active_paid_subs.each do |sub|
      if sub.end_date >= Time.now.gmtime
        sub.update(subscription_status: SubscriptionStatus.expired)
      end
    end
  end

  def create_sub
    Subscription.create!({
             start_date: Time.now.gmtime,
             end_date: determine_end_date,
             plan: plan,
             user_id: user_id,
             subscription_status: determine_sub_status
           })
  end
end