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
                Furosemide helps the heart by reducing excess fluid in the body. In heart failure, fluid can build up in the lungs and legs, causing breathlessness and swelling. Using furosemide helps:
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
                When you have heart failure, your heart struggles to pump effectively and fluid can build up in your lungs, legs or abdomen. Excess sodium (salt) in the diet causes your body to retain more fluid — making the heart’s job harder and increasing symptoms like swelling and shortness of breath.
                A low‑salt diet helps by:
                - Reducing fluid retention so your heart has less volume to handle.
                - Helping maintain better blood pressure and less strain on the cardiovascular system. 
                - Setting a healthier pattern early in the day, which helps your overall nutrition and symptom management. 
                """
            ),
            SectionData(
                title: "Step‑by‑Step Guide",
                fullText: """
                1. Choose a meal containing whole grains + lean protein + fruit or vegetables (e.g., oatmeal with berries, eggs with spinach, whole‑grain toast with avocado). 
                2. Use fresh or minimally processed ingredients. Avoid processed breakfast meats (like bacon, sausage) and packaged cereals with high sodium.   
                3. Read food labels — aim for lower sodium per serving (for example, breakfast cereals labelled “low sodium” or with <140 mg sodium per serving). 
                4. Season with herbs, spices, lemon juice or pepper instead of adding salt. For eggs or oats, skip table salt and focus on flavouring with vegetables or fresh herbs.
                5. Monitor how you feel (weight changes, swelling, shortness of breath) because breakfast choices contribute to your day’s total sodium and fluid load. Link your breakfast habit to your wider heart‑failure diet plan. 
                """
            ),
            SectionData(
                title: "Things to Watch Out For",
                fullText: """
                - Hidden sodium: Some breads, cereals, and breakfast bars can have unexpectedly high sodium — check the labels. :contentReference[oaicite:9]{index=9}  
                - Breakfast meals high in salt can undermine fluid control and worsen symptoms (swelling, breathlessness) even if you feel fine. 
                - Over‑restriction: Some newer evidence suggests extremely low sodium (<1 g per day) may not always benefit heart failure patients and could have risks. 
                - Ensure the breakfast fits into your overall daily sodium/fluids target — talk with your dietitian or doctor about your specific target. 
                """
            )
        ],
        links: "https://health.clevelandclinic.org/heart-failure-diet"
    )

}
