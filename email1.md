Here is the comprehensive Master Impact Analysis & Execution Plan for our Salesforce email domain migration. This version incorporates our Email Relay infrastructure, the PIV/SSO constraints, and ensures all impact areas (including Usernames and Automations) are fully detailed.
Part 1: Comprehensive Impact Analysis
| Area | Risk Level | Impact & Mitigation Strategy |
|---|---|---|
| Email Relay (CRITICAL) | High | Impact: Our external Email Relay (Exchange/O365) is likely configured to reject traffic from unknown domains. If we switch to @organization.com without whitelisting it first, emails will be blocked at our network boundary. 
 Mitigation: We must ensure our Network Security team adds @organization.com to the allowed sender list on the relay server before any Salesforce configuration changes. |
| SSO & PIV Cards | High | Impact: Login relies on the FederationIdentifier matching the certificate on the user's PIV card. If we update the FederationIdentifier before the user possesses their new PIV card, they will be locked out immediately. 
 Mitigation: We will decouple the Email field from the FederationIdentifier. We update the Email field first for communication, but keep the FederationIdentifier on the old value until the PIV card is physically updated. |
| Org-Wide Emails (OWEA) | Medium | Impact: Editing an existing OWEA puts it into a "Verification Pending" state, which can cause live automations to fail or revert to the running user's email. 
 Mitigation: We will use a "Parallel Creation" strategy: Create New OWEA > Verify > Swap dependencies > Delete Old OWEA. |
| Hardcoded Automations | Medium | Impact: Apex classes, Flows, or Workflow Rules that contain logic like IF(CONTAINS(User.Email, 'businessunit')) or query OWEAs by specific email strings will break or stop triggering. 
 Mitigation: We must scan our metadata (using IDE search or Metadata API) for the string @businessunit.organization.com and refactor logic to be domain-agnostic or update it to the new domain. |
| Usernames | Low/Med | Impact: Salesforce Usernames are unique identifiers and often match the Email. If we change the Email but not the Username, we create a confusing mismatch (e.g., User: jane@new.com, Username: jane@old.com). 
 Mitigation: We should plan to update Usernames. However, we must confirm our IdP (Identity Provider) supports authentication where the Username differs from the PIV attribute, or plan to update Usernames during the Phase 3 PIV sync. |
| Email Deliverability | Medium | Impact: Even with a Relay, external receivers may check SPF/DKIM. Sending from a new domain without these records can flag our emails as spam. 
 Mitigation: We must generate new DKIM keys and update SPF records for @organization.com. |
Part 2: Execution Steps (Chronological Order)
Phase 0: Infrastructure & Prerequisites (The "No Impact" Phase)
We perform these steps immediately to prepare the environment.
 * Network Relay Update (CRITICAL):
   * We contact our Network/IT Security team.
   * Action: Whitelist @organization.com on our Email Relay server to allow Salesforce to route traffic for this domain.
 * Salesforce Support Ticket:
   * We open a case with Salesforce Support.
   * Action: Request to "Disable Email Change Verification" for User records.
   * Note: This allows us to update User emails via API without triggering a confirmation link to the user.
 * DNS & Deliverability:
   * DKIM: We generate a new DKIM key for organization.com in Salesforce Setup and publish the CNAME records.
   * SPF: We ensure our DNS for organization.com includes our Email Relay IP and Salesforce in the SPF record.
Phase 1: Org-Wide Address Migration (The "Parallel" Swap)
We do this first so system emails (reset passwords, alerts) come from the correct new domain.
 * Create New OWEAs:
   * We navigate to Setup > Organization-Wide Addresses.
   * We create new entries (e.g., support@organization.com) instead of editing the old ones.
   * We access the inboxes and click the verification links.
 * Update Metadata (The Swap):
   * Email Alerts: We update any alerts sending from the "Old" OWEA to select the "New" OWEA.
   * Apex/Flows: We search our codebase for references to the old email addresses and update them to the new OWEA.
 * Test Relay:
   * We trigger a test email from the new OWEA.
   * Verification: We confirm receipt AND check headers to ensure the email successfully passed through our Relay without being dropped.
 * Deprecate Old:
   * Once confirmed, we delete the old @businessunit... OWEA records.
Phase 2: User Email Update (The "Soft" Migration)
Goal: Users receive emails at the new address, but PIV Login continues working via the old certificate.
 * Scan for Hardcoded Automation:
   * We run a metadata search for the string businessunit.organization.com.
   * We update any Logic/Formulas found to accept the new domain.
 * Prepare the Data (CSV):
   * We export active users.
   * Column A (ID): User ID.
   * Column B (Email): Map to the New value (name@organization.com).
   * Column C (FederationIdentifier): Map to the OLD value (leave unchanged).
 * Update Users:
   * We use Data Loader or Bulk API to update the User records.
   * Result: Users now have the correct email for notifications, but their PIV login works because FederationIdentifier still matches their current card.
Phase 3: The PIV Synchronization (Ad-Hoc / Phased)
Goal: Update the Federation ID and Username only when the user confirms they have their new PIV card.
 * Identify the Batch:
   * We wait for confirmation from IT that a specific batch of users has received new PIV cards.
 * Update Identity Fields:
   * For this specific batch, we update:
     * FederationIdentifier -> name@organization.com
     * Username -> name@organization.com (to maintain consistency).
 * Verification:
   * The user inserts their new PIV card and attempts login. Salesforce matches the new certificate value to the updated FederationIdentifier.
