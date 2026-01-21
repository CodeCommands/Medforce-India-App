This is a high-risk migration because of the dependency on Smartcards (likely PIV/CAC cards given your government context) where you do not control the certificate update timeline.
If you update the Salesforce Federation ID to the new email before the physical Smartcard is updated, users will be locked out immediately.
Here is the impact analysis and the exact execution order to manage the "Desynchronized" state (where Salesforce Email is new, but Smartcard is old).
Part 1: Impact Analysis
| Area | Impact & Risk | Mitigation |
|---|---|---|
| SSO & Login (Critical) | High Risk. If Salesforce FederationIdentifier does not match the value passed by the Smartcard (IdP), login fails. Since Smartcard updates are unconfirmed, you typically cannot update the FederationIdentifier at the same time as the Email field. | Decoupling: You must treat the Email field and FederationIdentifier field as separate entities during the transition. |
| Email Deliverability | Medium Risk. Sending emails from @organization.com without proper DKIM/SPF setup in Salesforce will cause emails to land in spam or be blocked by government firewalls. | Setup DKIM keys for the new domain in Salesforce immediately. |
| Usernames | Medium Risk. Often Username matches Email. Changing Email does not automatically change Username. Having them mismatched (User: jane@new.com, Username: jane@old.com) causes user confusion but does not break system function. | Decide if you are updating Usernames now or later. We recommend updating them with the email to maintain consistency, provided your IDP supports the mismatch during login. |
| Hardcoded Automations | Low/Medium Risk. Any Apex classes, Flows, or Workflow Rules that check for CONTAINS("businessunit", User.Email) will break. | Scan your metadata (you can use your IDE or tools like HappySoup) for hardcoded email domain references. |
Part 2: Execution Steps (Exact Order)
Phase 0: Prerequisites (Do this NOW)
 * Open Salesforce Support Case:
   * Action: Request to "Disable Email Change Verification".
   * Reason: Without this, every user will receive a verification link to the old email and must click it to activate the new email. You cannot automate the migration without this feature enabled.
 * Audit SSO Configuration:
   * Go to Setup > Single Sign-On Settings.
   * Ensure "SAML Identity Type" is set to "Assertion contains the Federation ID from the User object".
   * Critical Check: If this is currently set to "Assertion contains the User's Salesforce username" or "User's Email address", STOP. You must migrate your configuration to use FederationIdentifier before proceeding, or the email change will instantly break login.
 * Setup DKIM for New Domain:
   * Go to Setup > DKIM Keys.
   * Create a new key for organization.com.
   * Publish the CNAME records in your DNS (work with your Network team).
   * Activate the key in Salesforce.
Phase 1: The Email Update (The "Soft" Migration)
Goal: Update the contact email so users receive notifications at the new address, but KEEP the old Federation ID so their current Smartcards still work.
 * Prepare the Data (CSV):
   * Export active users.
   * Create a mapping file with: Id, Email (New Value), FederationIdentifier (OLD Value - leave unchanged), Username (New Value - optional but recommended).
 * Freeze Automation (Optional but Recommended):
   * If you have Process Builders or Flows that trigger on User updates (e.g., assigning permission sets based on email domain), deactivate them temporarily or ensure they handle the new domain.
 * Update Users (Data Loader / Bulk API):
   * Update the Email field to name@organization.com.
   * CRITICAL: Do NOT update the FederationIdentifier field yet. It must remain name@businessunit.organization.com because the user's Smartcard still holds the old certificate.
 * Verification:
   * Ask a user to log in. They should succeed because Salesforce checks the FederationIdentifier (which matches the old card) and ignores the Email field for auth.
   * Check their User Record: It should show the new email address.
Phase 2: The Smartcard Synchronization (Ad-Hoc Phase)
Goal: Update the Federation ID only when the user confirms they have received their updated Smartcard credentials.
Since you stated the Smartcard update date is "not confirmed" and "done in phases," you cannot bulk update this. You must handle this via a "Just-in-Time" approach or batched updates based on IT schedules.
 * Identify the Batch:
   * Receive the list of users who have successfully updated their Smartcard certificates to the new name@organization.com format.
 * Update Federation ID:
   * For only those users, update the FederationIdentifier field in Salesforce to name@organization.com.
 * Update Username (If not done in Phase 1):
   * If you delayed the Username update, do it now to match the new Federation ID.
Summary of the "Split-State" Strategy
To survive the uncertain timeline, your User records will exist in a hybrid state for a while:
 * Email Field: name@organization.com (Updated immediately for communication)
 * FederationIdentifier: name@businessunit.organization.com (Kept old to match the old Smartcard)
 * Smartcard: name@businessunit.organization.com (Physical card)
Only when the Smartcard changes do you update the FederationIdentifier.
One Final Check: Org-Wide Addresses
Don't forget to check Setup > Organization-Wide Email Addresses. If you have generic addresses (e.g., support@businessunit.organization.com) that are used in Auto-Response rules or Apex, those need to be re-verified manually. You cannot bypass verification for Org-Wide Addresses via the Support ticket mentioned in Phase 0.
