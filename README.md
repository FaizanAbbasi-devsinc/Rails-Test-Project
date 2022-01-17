# README

# Recurring Payemnt and Billing App
Recurring Payemnt and Billing App is a ecommerce service platform where customers can subscribe to plans. Each plan contains multiple features. Automatic bills are generated after 30 days against each user subscription. Extra Bill is added if user has over-used a feature units.

## Languages
* Ruby
* Rails
* Postgress
* Html, Css

### Models:
* User
* Transaction
* Subscription
* Feature
* Plan
* Usage

### Gems:
* devise
* devise_invitable
* table_print
* bootstrap
* sidekiq
* pundit
* stripe

### Setting Up:
Run the following command in terminal after downloading project:
```bash
  bundle install
```
or
```bash
  bundle
```
Make a new file '/config/application.yml'
Add following credentails:
```yml
secret: Stripe Secret Key
public: Stripe Public Key
test_mail: Testing Mail
admin_mail: Admin Mail
admin_mail_password: Admin Mail Password
```
Run the following command in terminal:
```bash
  rake db:setup
  rake db:seed
```
Now run following to start the server:
```bash
  rails server
```
# Features
* There are two roles in application, Admin and Buyer.
* Admin is responsible for creating plans and features.
* Admin can update feature usage for a customer subscription.
* Admin can send invites to buyer on their email. No user can signup directly without invitation.
* Admin can see all current subscriptions and transactions.
* Buyer can Subscribe to Plan and can use its feature.
* Buyer can see his active subscriptions.
* Bill is generated automatically at the end of the month.
* Extra Bill is charged on overuse of Features.
* Buyer can Unsubscibe to a plan.
* Buyer can edit his profile.
