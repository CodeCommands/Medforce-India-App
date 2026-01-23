Salesforce Government Cloud generally utilizes the same license types (SKUs) as the commercial cloud, but they are hosted in a FedRAMP High compliant environment.
Below is the complete breakdown of the license types available, organized by their function (Internal Staff, External Users, and Add-on Features).
1. Internal User Licenses (Staff & Contractors)
These are the primary licenses for your employees who need login access to your Salesforce Org.
| License Name | Best For | Key Inclusions | Limitations |
|---|---|---|---|
| Salesforce (Full CRM) | Sales reps, Case workers, Managers requiring full access. | • Full CRM Access: Leads, Opportunities, Cases, Campaigns, Solutions, Forecasts.
• Standard Objects: Accounts, Contacts, Reports, Dashboards.
• Custom Objects: Up to 2,000.
• Workflow/Approval: Full access. | • Cost: Most expensive license type.
• Dependency: None (Base license). |
| Salesforce Platform (formerly Platform Starter) | General employees, HR, IT, or Operations who do not work sales/support cases. | • App Access: Access to custom apps and processes.
• Standard Objects: Accounts, Contacts, Reports, Dashboards, Documents.
• Custom Objects: Up to 10 per user.
• Automation: Flow, Apex access included. | • No CRM Objects: Cannot access Leads, Opportunities, Campaigns, or Cases.
• Strict Object Limit: Hard limit of 10 custom objects. |
| Salesforce Platform Plus (formerly Lightning Platform Plus) | Application-heavy users who need complex custom apps but no Sales/Service tools. | • App Access: Same as Platform but for complex apps.
• Custom Objects: Up to 110 per user.
• Standard Objects: Accounts, Contacts, Reports, Dashboards. | • No CRM Objects: Cannot access Leads, Opportunities, Campaigns, or Cases.
• Cost: ~4x the cost of Platform Starter. |
| Identity Only | Employees who only need Single Sign-On (SSO) to other apps. | • Identity: SSO access to external apps via Salesforce.
• Chatter: Access to Chatter for internal collaboration. | • No Data Access: Cannot access any standard or custom record data (Accounts, Custom Objects, etc.). |
| Knowledge Only User | Staff who only need to search and view Knowledge articles. | • Knowledge: Read access to Knowledge Base.
• Custom Objects: Access to custom objects (limited). | • Limited Functionality: No CRM or Standard object access beyond Knowledge/Custom objects. |
2. External User Licenses (Experience Cloud)
These are for citizens, vendors, or partners accessing a public or private portal (Experience Cloud).
| License Name | Best For | Key Inclusions | Limitations |
|---|---|---|---|
| Customer Community | High-volume citizen portals (e.g., File a complaint, View status). | • Objects: Accounts, Contacts, Cases, Knowledge, Custom Objects.
• Access: Standard sharing (less complex). | • No Advanced Sharing: Cannot use advanced sharing rules or role hierarchies.
• No Reports: Cannot create reports. |
| Customer Community Plus | Complex citizen portals requiring delegation or advanced data sharing. | • Advanced Sharing: Role-based sharing and advanced sharing rules.
• Reports: Access to Reports and Dashboards.
• Objects: Same as Customer Community. | • Cost: Significantly higher than standard Community.
• Lower Limits: Lower monthly login limits compared to standard Community. |
| Partner Community | Contractors, Agencies, or Partners working on deals/cases with you. | • CRM Objects: Access to Leads, Opportunities, and Campaigns.
• Delegated Admin: Can manage other external users. | • Cost: Highest tier external license.
• Complexity: Requires more strict security configuration. |
| External Identity | Mass-scale consumer/citizen login (Identity provider only). | • Identity: Login/SSO management for external apps/portals. | • No CRM/Data: No access to Salesforce data records. |
3. Feature Licenses (Add-Ons)
These are "checkbox" permissions you assign to a user on top of their User License to unlock specific functionality.
| Feature License | Description | Dependency |
|---|---|---|
| Marketing User | Allows a user to create/edit Campaigns and manage Campaign Members. | Requires Salesforce (Full CRM) license. |
| Service Cloud User | Grants access to the Service Console (specialized UI for high-volume case handling). | Requires Salesforce license. |
| Knowledge User | Allows a user to create, edit, and publish Knowledge Articles. | Can be added to Salesforce or Platform licenses. |
| Flow User | Allows a user to run Flows (usually included in modern licenses, but older orgs may require this). | None (Base inclusion). |
| Live Agent User | Allows a user to chat with customers in real-time (Chat). | Requires Service Cloud feature/license. |
| CRM Content User | Allows access to Salesforce CRM Content (libraries, advanced file management). | Available on most standard licenses. |
4. Permission Set Licenses (PSLs) - Important for Gov
In Government Cloud, you will often encounter "Public Sector Solutions" (PSS). These are not just simple feature checkboxes but are Permission Set Licenses.
 * Public Sector Solutions (PSS): Grants access to specific gov-tech objects like Business License Application, Individual Application, Inspection, and Violation Enforcement.
 * CRM Analytics (Tableau CRM): Grants access to advanced analytics dashboards inside Salesforce.
5. Quick Decision Matrix
| IF YOUR USER NEEDS... | THEN BUY THIS LICENSE... |
|---|---|
| Full Case Management, Leads, Opportunities | Salesforce (Full CRM) |
| Internal App access (HR, Travel, Inventory) + < 10 Custom Objects | Salesforce Platform (Starter) |
| Internal App access (Complex Data Models) + > 10 Custom Objects | Salesforce Platform Plus |
| Citizen Login (Simple: View status, update profile) | Customer Community |
| Citizen Login (Complex: Reports, Delegated Admin) | Customer Community Plus |
| Contractor / Partner (Needs to work on Leads/Cases) | Partner Community |
