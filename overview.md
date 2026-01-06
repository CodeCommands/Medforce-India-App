Project Goal: To build a location-based, on-demand staffing platform connecting healthcare facilities (Clinics/Hospitals) with medical professionals (Doctors/Nurses) for temporary work.
Target Market: India (Must support low-bandwidth environments and wide range of Android and iOS devices).

1. Core User Roles

• The Professional (Job Seeker): Doctors, Nurses, Technicians looking for temporary shifts.

• The Facility (Job Provider): Clinics, Hospitals, Nursing Homes needing immediate staff.

• ** The Admin (You):** Managing verifications, disputes, and platform settings.


2. Key Feature Requirements

A. Onboarding & Verification

    • Phone Login: Primary authentication via OTP (India standard). Google/Apple login as backup.

    • Identity Check:

        • Professionals upload Medical Council Registration & ID proofs.

        • Admin Panel Requirement: A workflow for the Admin to view documents and manually approve/reject a profile before they can apply for jobs.
B. The "Match" (Location & Discovery)
• Geospatial Search: Facilities post a job at a specific coordinate. Professionals only see jobs within a customizable radius (e.g., 10km, 20km).
• Smart Filters: Matching based on Qualification (e.g., "MBBS", "BDS") and Shift Time (e.g., "Night Shift").
C. Job Lifecycle
1. Post: Facility posts a shift (Date, Time, Rate, Location).
2. Apply: Professional applies.
3. Accept: Facility reviews the applicant's mini-profile and accepts.
4. Live Status: On the day of the job, tracking "Check-in" and "Check-out" (optional but preferred).
D. Payments (Marketplace Model)
• Escrow/Split Payment: The Facility pays the full amount upon booking or completion.
• Commission: The platform deducts a % fee automatically.
• Payout: The remaining amount is transferred to the Professional's bank account/UPI.
E. Operational Constraints
• Offline Tolerance: The app must load previously viewed data even if the internet cuts out.
• Notification System: Critical alerts for "New Job Near You" and "Application Accepted."
