//
//  SectionData.swift
//  Linc
//
//  Created by Suenn Wern Tan on 12/11/2025.
//


//
//  ContentData.swift
//  Linc
//
//  Created by Suenn Wern Tan on 12/11/2025.
//

import Foundation

/// Represents a single expandable section (e.g., “Why is this important?”)
struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let fullText: String
}

/// Represents a complete content set for MedicineView-style screens
struct ContentData {
    let mainTitle: String
    let subtitle: String
    let goalContent: String
    let sections: [SectionData]
    let links: String
}

/// Predefined content examples
struct ContentSamples {
    
    // MARK: - Medicine Example
    static let medicineA = ContentData(
        mainTitle: "How Furosemide Supports the Heart",
        subtitle: "Skipping doses may worsen fluid retention and breathlessness",
        goalContent: "The primary goal is to remove excess fluid from the body, relieve symptoms like swelling and breathlessness, and prevent complications from fluid overload.",
        sections: [
            SectionData(
                title: "Why is this important?",
                fullText: """
                - Reduce symptoms like fatigue, swelling, and shortness of breath
                - Improve daily activity and comfort
                - Prevent complications from fluid overload
                """
            ),
            SectionData(
                title: "Step-by-Step Guide",
                fullText: """
                1. Take the prescribed dose as directed by your doctor.
                2. Monitor weight and swelling to track fluid changes.
                3. Adjust dose only under medical supervision.
                4. Maintain regular check-ups for kidney function and electrolytes.
                5. Combine with other heart failure medications if recommended.
                """
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: """
                - Dehydration (dizziness, dry mouth)
                - Low blood pressure
                - Electrolyte imbalance (especially low potassium)
                - Frequent urination
                - Signs of worsening heart failure (increased swelling, breathlessness)
                """
            )
        ],
        links: "https://medlineplus.gov/druginfo/meds/a682858.html"
    )

    // MARK: - Low-Salt Breakfast
    static let lowSaltDiet = ContentData(
        mainTitle: "Low‑Salt Diet: Supporting Your Heart",
        subtitle: "Start your day with flavour and purpose — help reduce fluid retention and ease heart burden",
        goalContent: "The goal is to provide a nourishing, low‑sodium diet that supports fluid control, reduces strain on the heart, and improves daily comfort in heart failure.",
        sections: [
            SectionData(
                title: "Why is this important?",
                fullText: """
                - Less salt means less fluid retention → easier breathing and less swelling.
                - Helps control blood pressure and reduces strain on the heart.
                - Sets a healthy pattern for the rest of the day.
                """
            ),
            SectionData(
                title: "Step‑by‑Step Guide",
                fullText: """
                1. Choose breakfast: whole grains + lean protein + fruit/vegetables.
                2. Prefer fresh or minimally processed foods; avoid bacon, sausage, and salty boxed cereals.
                3. Read labels: look for “low sodium” (<140 mg per serving).
                4. Season with herbs, lemon, or pepper; limit table salt.
                5. Track how you feel through the day (weight, swelling, breathlessness).
                """
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: """
                - Hidden sodium in breads/cereals/energy bars — always check labels.
                - Salty breakfasts can undermine fluid control and worsen swelling/breathlessness.
                - Set daily sodium and fluid targets with your clinician/dietitian.
                """
            )
        ],
        links: "https://health.clevelandclinic.org/heart-failure-diet"
    )

    // MARK: - Track Fluids
    static let trackFluids = ContentData(
        mainTitle: "Track Fluids: Stay in Your Safe Zone",
        subtitle: "Avoid extra strain on the heart by keeping daily fluids within target",
        goalContent: "Help prevent fluid build‑up by tracking everything you drink (and some foods) so your daily intake stays within the target set by your clinician.",
        sections: [
            SectionData(
                title: "Why is this important?",
                fullText: """
                - Too much fluid makes the heart work harder and can worsen swelling and breathlessness.
                - Staying within your daily fluid target helps prevent sudden weight gain and hospital visits.
                - Builds awareness of hidden fluids throughout the day.
                """
            ),
            SectionData(
                title: "Step‑by‑Step Guide",
                fullText: """
                1. Know your target (e.g., 1.5–2.0 L/day) — ask your clinician for your exact goal.
                2. Measure all drinks (water, tea/coffee, juice, milk, soups).
                3. Use a bottle or measuring cup; log amounts after each drink.
                4. Be mindful of high‑water foods (soups, ice cream, jelly).
                5. Spread fluids across the day; sip instead of large volumes at once.
                """
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: """
                - Rapid weight gain (e.g., >2 kg in 2 days) — call your care team.
                - Increased swelling in legs/ankles or more breathlessness than usual.
                - Feeling very thirsty may signal medication or diet issues — discuss with your clinician.
                """
            )
        ],
        links: "https://www.heart.org/en/health-topics/heart-failure/life-with-heart-failure/managing-fluid-intake"
    )

    // MARK: - Daily Monitoring
    static let dailyMonitoring = ContentData(
        mainTitle: "Daily Monitoring: Catch Signs Early",
        subtitle: "A few minutes each day can prevent serious flare‑ups",
        goalContent: "Create a simple daily routine to spot changes early: weight, symptoms, and vitals where advised. Early action keeps you safer.",
        sections: [
            SectionData(
                title: "Why is this important?",
                fullText: """
                - Small daily changes can signal fluid build‑up or worsening heart failure.
                - Early detection lets you adjust with your care team before it becomes serious.
                - Reduces ER visits and helps you feel more in control.
                """
            ),
            SectionData(
                title: "Step‑by‑Step Guide",
                fullText: """
                1. Weigh at the same time daily (ideally morning, after using the bathroom).
                2. Log symptoms: swelling, breathlessness, fatigue, dizziness.
                3. Check blood pressure/heart rate if advised; record readings.
                4. Compare to your baseline; note any sudden changes.
                5. Report concerning changes to your clinician promptly.
                """
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: """
                - Sudden weight gain, worsening breathlessness, or new/worse swelling.
                - Very high or very low blood pressure readings (per your clinician’s thresholds).
                - Chest pain, fainting, or severe dizziness — seek urgent care.
                """
            )
        ],
        links: "https://www.nhlbi.nih.gov/health/heart-failure/self-care"
    )
}
