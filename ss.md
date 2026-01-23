Here is the comprehensive breakdown of Salesforce licenses for Government Cloud, formatted as a clean, styled HTML file. You can save this code as an .html file (e.g., Salesforce_Licenses.html) to view it in any browser.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salesforce Government Cloud License Breakdown</title>
    <style>
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f6f9;
        }
        h1 {
            color: #005fb2;
            text-align: center;
            margin-bottom: 10px;
        }
        h2 {
            color: #005fb2;
            border-bottom: 2px solid #005fb2;
            padding-bottom: 10px;
            margin-top: 40px;
        }
        p {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        th {
            background-color: #0070d2;
            color: #ffffff;
            font-weight: 600;
            text-align: left;
            padding: 12px 15px;
            border: 1px solid #005fb2;
        }
        td {
            padding: 12px 15px;
            border: 1px solid #dddbda;
            vertical-align: top;
        }
        tr:nth-child(even) {
            background-color: #f3f2f2;
        }
        tr:hover {
            background-color: #eef4ff;
        }
        .highlight-red {
            color: #c23934;
            font-weight: bold;
        }
        .highlight-green {
            color: #027e46;
            font-weight: bold;
        }
        .note {
            background-color: #fffcd6;
            padding: 15px;
            border-left: 5px solid #ffcc00;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <h1>Salesforce Government Cloud License Matrix</h1>
    <p>A comprehensive guide to identifying the correct license types, inclusions, and limitations for government applications.</p>

    <h2>1. Internal User Licenses (Staff & Contractors)</h2>
    <p>These licenses are for employees who require login access to the internal Salesforce Org.</p>
    <table>
        <thead>
            <tr>
                <th style="width: 20%;">License Name</th>
                <th style="width: 25%;">Best For</th>
                <th style="width: 30%;">Key Inclusions</th>
                <th style="width: 25%;">Limitations & Dependencies</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Salesforce (Full CRM)</strong></td>
                <td>Sales reps, Case workers, Managers requiring full access.</td>
                <td>
                    &bull; <strong>Full CRM:</strong> Leads, Opportunities, Cases, Campaigns, Forecasts.<br>
                    &bull; <strong>Standard Objects:</strong> Accounts, Contacts, Reports, Dashboards.<br>
                    &bull; <strong>Custom Objects:</strong> Up to 2,000.<br>
                    &bull; <strong>Workflow:</strong> Full access.
                </td>
                <td>
                    &bull; <span class="highlight-red">Most Expensive</span> option.<br>
                    &bull; No Dependency (Base License).
                </td>
            </tr>
            <tr>
                <td><strong>Salesforce Platform (Starter)</strong></td>
                <td>General employees, HR, IT, or Ops (No Sales/Support).</td>
                <td>
                    &bull; <strong>App Access:</strong> Custom apps & processes.<br>
                    &bull; <strong>Standard Objects:</strong> Accounts, Contacts, Reports.<br>
                    &bull; <strong>Automation:</strong> Flow, Apex included.
                </td>
                <td>
                    &bull; <strong>Object Limit:</strong> <span class="highlight-red">Max 10 Custom Objects</span>.<br>
                    &bull; <strong>No CRM:</strong> No Leads, Opportunities, or Cases.
                </td>
            </tr>
            <tr>
                <td><strong>Salesforce Platform Plus</strong></td>
                <td>Users needing complex custom apps with heavy data models.</td>
                <td>
                    &bull; <strong>App Access:</strong> Complex custom apps.<br>
                    &bull; <strong>Custom Objects:</strong> <span class="highlight-green">Up to 110</span> per user.<br>
                    &bull; <strong>Standard Objects:</strong> Accounts, Contacts, Reports.
                </td>
                <td>
                    &bull; <strong>No CRM:</strong> No Leads, Opportunities, or Cases.<br>
                    &bull; Cost is ~4x Platform Starter.
                </td>
            </tr>
            <tr>
                <td><strong>Identity Only</strong></td>
                <td>Employees needing SSO to other apps only.</td>
                <td>
                    &bull; <strong>Identity:</strong> SSO access via Salesforce.<br>
                    &bull; <strong>Chatter:</strong> Internal collaboration.
                </td>
                <td>
                    &bull; <span class="highlight-red">No Data Access:</span> Cannot see any records (Standard or Custom).
                </td>
            </tr>
        </tbody>
    </table>

    <h2>2. External User Licenses (Experience Cloud)</h2>
    <p>These licenses are for citizens, vendors, or partners accessing a public or private portal.</p>
    <table>
        <thead>
            <tr>
                <th style="width: 20%;">License Name</th>
                <th style="width: 25%;">Best For</th>
                <th style="width: 30%;">Key Inclusions</th>
                <th style="width: 25%;">Limitations</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Customer Community</strong></td>
                <td>High-volume citizen portals (e.g., File complaints, View status).</td>
                <td>
                    &bull; <strong>Objects:</strong> Accounts, Contacts, Cases, Knowledge, Custom Objects.<br>
                    &bull; <strong>Access:</strong> Standard sharing.
                </td>
                <td>
                    &bull; <span class="highlight-red">No Reports</span> for users.<br>
                    &bull; No Role Hierarchy or Advanced Sharing.
                </td>
            </tr>
            <tr>
                <td><strong>Customer Community Plus</strong></td>
                <td>Complex portals requiring delegation or advanced data sharing.</td>
                <td>
                    &bull; <strong>Advanced Sharing:</strong> Role-based & Rules.<br>
                    &bull; <strong>Reports:</strong> Access to Reports/Dashboards.<br>
                    &bull; <strong>Delegation:</strong> Can manage other users.
                </td>
                <td>
                    &bull; Higher cost than standard Community.<br>
                    &bull; Lower login limits than standard Community.
                </td>
            </tr>
            <tr>
                <td><strong>Partner Community</strong></td>
                <td>Contractors/Agencies working <em>on</em> deals/cases with you.</td>
                <td>
                    &bull; <strong>CRM Objects:</strong> Leads, Opportunities, Campaigns.<br>
                    &bull; <strong>Data:</strong> Full power of Salesforce data model.
                </td>
                <td>
                    &bull; Highest tier external license.<br>
                    &bull; Requires strict security config.
                </td>
            </tr>
        </tbody>
    </table>

    <h2>3. Feature Licenses (Add-Ons)</h2>
    <p>Functionality assigned to a user <em>on top</em> of their User License.</p>
    <table>
        <thead>
            <tr>
                <th style="width: 25%;">Feature License</th>
                <th style="width: 50%;">Description</th>
                <th style="width: 25%;">Dependency</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Marketing User</strong></td>
                <td>Create/edit Campaigns and manage Campaign Members.</td>
                <td>Requires <strong>Salesforce</strong> license.</td>
            </tr>
            <tr>
                <td><strong>Service Cloud User</strong></td>
                <td>Access to Service Console (specialized UI for high-volume cases).</td>
                <td>Requires <strong>Salesforce</strong> license.</td>
            </tr>
            <tr>
                <td><strong>Knowledge User</strong></td>
                <td>Create, edit, and publish Knowledge Articles.</td>
                <td>Salesforce or Platform license.</td>
            </tr>
            <tr>
                <td><strong>Flow User</strong></td>
                <td>Run Flows (Included in most modern licenses).</td>
                <td>None (Base inclusion).</td>
            </tr>
        </tbody>
    </table>

    <div class="note">
        <strong>⚠️ Important for Government Cloud (Public Sector Solutions):</strong><br>
        Government Cloud often uses <strong>Permission Set Licenses (PSLs)</strong> for specific verticals. For example, accessing <em>Business License Applications</em> or <em>Inspections</em> objects requires the <strong>Public Sector Solutions</strong> PSL in addition to a base Platform or Salesforce license.
    </div>

    <h2>4. Quick Decision Matrix</h2>
    <table>
        <thead>
            <tr>
                <th style="width: 50%;">IF YOUR USER NEEDS...</th>
                <th style="width: 50%;">THEN BUY THIS LICENSE...</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Full Case Management, Leads, Opportunities</td>
                <td><strong>Salesforce (Full CRM)</strong></td>
            </tr>
            <tr>
                <td>Internal App access + <strong>&lt; 10 Custom Objects</strong></td>
                <td><strong>Salesforce Platform (Starter)</strong></td>
            </tr>
            <tr>
                <td>Internal App access + <strong>&gt; 10 Custom Objects</strong></td>
                <td><strong>Salesforce Platform Plus</strong></td>
            </tr>
            <tr>
                <td>Citizen Login (Simple: View status, update profile)</td>
                <td><strong>Customer Community</strong></td>
            </tr>
            <tr>
                <td>Citizen Login (Complex: Reports, Delegated Admin)</td>
                <td><strong>Customer Community Plus</strong></td>
            </tr>
        </tbody>
    </table>

</body>
</html>

