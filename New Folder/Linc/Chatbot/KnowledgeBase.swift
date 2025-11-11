//
//
//import Foundation
//
//struct KnowledgeBase: Identifiable {
//    let id: Int
//    let title: String
//    let tags: [String]
//    let answer: String
//}
//
//let knowledgeBase: [KnowledgeBase] = [
//
//    // 1. Morning water pill – Medicine A
//    KnowledgeBase(
//        id: 1,
//        title: "Medicine A – morning water pill",
//        tags: [
//            "medicine a", "water pill", "tablet", "morning medicine",
//            "tired", "fatigue", "short of breath", "breathless",
//            "swelling", "ankle swelling", "urination",
//            "missed dose", "skip dose"
//        ],
//        answer: """
//        Medicine A is a water pill that supports the heart by preventing fluid building up in the lungs and legs. Skipping doses may cause fatigue or shortness of breath.
//
//        PRIMARY GOAL
//        • Help the heart work more efficiently
//        • Reduce shortness of breath
//        • Help prevent the condition from getting worse
//
//        WHY IS THIS IMPORTANT?
//        1) Prevents fluid buildup  
//           – Stops fluid accumulating in lungs and legs  
//        2) Controls blood pressure  
//           – Reduces workload on the heart  
//        3) Prevents dangerous complications  
//           – Skipping doses can lead to hospital readmission
//
//        STEP-BY-STEP GUIDE
//
//        When to give  
//        • 8:00 AM every morning  
//        • With a small glass of water  
//
//        What to expect  
//        • More urination within 1–2 hours (this is normal)  
//        • Less ankle swelling within days  
//        • Breathing should feel easier  
//
//        If a dose is missed  
//        • Missed within 4 hours of the usual time: give the dose now  
//        • More than 4 hours late: skip it and resume tomorrow at the normal time  
//        • Call the doctor to let them know it was missed
//
//        THINGS TO WATCH OUT FOR
//
//        Good signs (it’s working)  
//        • Less swelling in ankles  
//        • Breathing easier  
//        • More energy  
//
//        Call the doctor if you notice  
//        • Very little or no urination after the dose  
//        • Extreme dizziness  
//        • Confusion or unusual tiredness
//        """
//    ),
//
//    // 2. Low-salt breakfast
//    KnowledgeBase(
//        id: 2,
//        title: "Low-salt breakfast",
//        tags: [
//            "salt", "low salt", "breakfast", "porridge", "sausages",
//            "bacon", "cheese", "cereal", "diet", "food", "sodium"
//        ],
//        answer: """
//        A low-salt breakfast helps prevent fluid retention that strains the heart.
//
//        PRIMARY GOAL
//        • Prevent fluid buildup that causes swelling and breathing difficulties  
//        • Reduce strain on the heart  
//
//        WHY IS THIS IMPORTANT?
//        1) Prevents fluid retention  
//           – Less salt = less water held in the body  
//        2) Reduces hospital readmission  
//           – High salt is the number one preventable cause  
//        3) Helps medicine work better  
//           – Lets the water pill do its job
//
//        STEP-BY-STEP GUIDE
//
//        Daily salt limit  
//        • Maximum 2000 mg (2 g) total per day
//
//        Good breakfast choices  
//        • Porridge with banana  
//        • Scrambled eggs with tomato  
//        • Greek yogurt with berries  
//
//        Avoid  
//        • Bacon, sausages, cheese  
//        • Packaged bread  
//        • Processed cereals  
//
//        Cooking tip  
//        • Use herbs, lemon and garlic instead of salt
//
//        THINGS TO WATCH OUT FOR
//
//        Hidden salt in  
//        • Bread (choose low- or no-salt versions)  
//        • Butter (use unsalted)  
//        • Breakfast cereals (check labels)
//
//        Reading labels  
//        • “Low sodium” = under 140 mg per serving (good)  
//        • “High sodium” = over 400 mg per serving (avoid)
//        """
//    ),
//
//    // 3. Tracking fluids
//    KnowledgeBase(
//        id: 3,
//        title: "Tracking daily fluids",
//        tags: [
//            "fluid", "fluids", "drinks", "water", "1.5 litres", "1500ml",
//            "thirst", "too much fluid", "jug"
//        ],
//        answer: """
//        Too much fluid puts extra pressure on the heart.
//
//        PRIMARY GOAL
//        • Keep total fluid intake under 1.5 litres per day  
//        • Prevent the heart from being overloaded
//
//        WHY IS THIS IMPORTANT?
//        1) Avoids extra heart pressure  
//           – Every extra cup means more work for the heart  
//        2) Prevents lung fluid  
//           – Too much fluid can accumulate in the lungs  
//        3) Helps medicine work better  
//           – The water pill removes fluid; don’t fight it by drinking too much
//
//        STEP-BY-STEP GUIDE
//
//        Daily limit  
//        • 1.5 litres (1500 ml) total per day
//
//        What counts as fluid  
//        • All drinks: water, tea, coffee, juice  
//        • Soup and ice cream  
//        • Ice cubes
//
//        How to track  
//        • Use a 1.5 L jug  
//        • Fill it in the morning and pour all drinks from it  
//        • When the jug is empty, you’ve reached your limit
//
//        Suggested spread across the day  
//        • Morning: 500 ml  
//        • Afternoon: 500 ml  
//        • Evening: 500 ml
//
//        THINGS TO WATCH OUT FOR
//
//        Signs of too much fluid  
//        • Weight gain of more than 0.5 kg in one day  
//        • Increased ankle swelling  
//        • More breathless than usual
//
//        Managing thirst  
//        • Suck on ice cubes (remember to count them in the limit)  
//        • Rinse your mouth without swallowing  
//        • Use smaller cups
//        """
//    ),
//
//    // 4. Daily weighing
//    KnowledgeBase(
//        id: 4,
//        title: "Daily weighing",
//        tags: [
//            "daily weight", "weighing", "scale", "2kg", "2 kg",
//            "weight gain", "fluid build up"
//        ],
//        answer: """
//        Daily weighing shows fluid buildup before breathing becomes badly affected.
//
//        PRIMARY GOAL
//        • Catch early warning signs of fluid buildup  
//        • Treat problems at home before hospital is needed
//
//        WHY IS THIS IMPORTANT?
//        1) Early detection  
//           – A small weight gain today can become a serious problem in 2–3 days  
//        2) Prevents hospital readmission  
//           – Daily weighing can reduce readmissions  
//        3) Builds your confidence  
//           – You learn what is normal for you
//
//        STEP-BY-STEP GUIDE
//
//        When to weigh  
//        • Same time each morning  
//        • After going to the bathroom, before eating  
//        • Use the same scale, in similar clothing
//
//        How to record  
//        • Log weight in the app immediately after weighing
//
//        What is normal  
//        • Daily variation of about ±0.5 kg is okay
//
//        THINGS TO WATCH OUT FOR
//
//        Call the doctor if  
//        • Weight gain of 2 kg in 3 days  
//          Example: Monday 78 kg → Thursday 80 kg
//
//        What this means  
//        • Fluid is building up faster than the water pill can remove it  
//        • Medication may need adjustment
//
//        Don’t wait  
//        • Early call = simple fix  
//        • Late call = higher chance of hospital admission
//        """
//    ),
//
//    // 5. Evening medications
//    KnowledgeBase(
//        id: 5,
//        title: "Evening heart medications",
//        tags: [
//            "evening medicine", "night medicine", "atorvastatin",
//            "metoprolol", "cholesterol", "beta blocker",
//            "8pm", "night time"
//        ],
//        answer: """
//        Evening medicines protect the heart and blood vessels overnight.
//
//        PRIMARY GOAL
//        • Support heart function while sleeping  
//        • Prevent complications over the long term
//
//        WHY IS THIS IMPORTANT?
//        1) Cholesterol control  
//           – Protects blood vessels from damage  
//        2) Heart rate control  
//           – Helps the heart beat efficiently  
//        3) Night protection  
//           – The body repairs itself during sleep and needs support
//
//        STEP-BY-STEP GUIDE
//
//        When to give  
//        • Around 8:00 PM, with or after dinner
//
//        What may be included  
//        • Atorvastatin (for cholesterol)  
//        • Metoprolol (beta blocker)
//
//        What to expect  
//        • These work quietly in the background  
//        • You won’t notice an immediate effect, but they are protecting the heart
//
//        If a dose is missed  
//        • If within 2 hours of usual time: give the dose  
//        • After 2 hours: skip it and resume tomorrow at the normal time  
//        • Call the doctor to inform them
//
//        THINGS TO WATCH OUT FOR
//
//        • These are gentler than the morning water pill, but still important.  
//
//        Call the doctor if  
//        • Doses are frequently missed  
//        • You have questions about side effects  
//        • You are running low on medication
//        """
//    )
//]
//
//
//
//

import Foundation

struct KnowledgeBase: Identifiable {
    let id: Int
    let title: String
    let tags: [String]
    let answer: String
}

let knowledgeBase: [KnowledgeBase] = [

    // ——————————————————————————
    // 1) MEDICINE A (Morning water pill)
    // ——————————————————————————

    KnowledgeBase(
        id: 1,
        title: "Medicine A — What it does",
        tags: ["medicine a", "water pill", "diuretic", "heart failure", "fluid buildup", "swollen ankles", "breathless"],
        answer: "Medicine A is a water pill. It helps your heart by removing extra fluid from lungs and legs so breathing and ankle swelling improve."
    ),
    KnowledgeBase(
        id: 2,
        title: "Medicine A — When to take",
        tags: ["medicine a time", "when to take", "morning dose", "8am", "with water"],
        answer: "Take at 8:00 AM with a small glass of water. Morning dosing reduces night-time bathroom trips."
    ),
    KnowledgeBase(
        id: 3,
        title: "Medicine A — What to expect",
        tags: ["medicine a effects", "urination", "ankle swelling", "breathing"],
        answer: "You’ll pee more within 1–2 hours (normal). Swelling should reduce within days and breathing should feel easier."
    ),
    KnowledgeBase(
        id: 4,
        title: "Medicine A — Missed dose",
        tags: ["missed dose", "skip dose", "medicine a late", "what if i forgot"],
        answer: "Less than 4 hours late? Take it now. More than 4 hours? Skip and go back to normal time tomorrow. Let your doctor know."
    ),
    KnowledgeBase(
        id: 5,
        title: "Medicine A — Good signs",
        tags: ["medicine a working", "progress", "less swelling", "more energy"],
        answer: "Good signs: less ankle swelling, easier breathing, more energy."
    ),
    KnowledgeBase(
        id: 6,
        title: "Medicine A — Call the doctor if…",
        tags: ["medicine a danger", "red flags", "no urination", "dizzy", "confusion"],
        answer: "Call the doctor if there’s very little/no urination after a dose, extreme dizziness, confusion, or unusual tiredness."
    ),

    // ——————————————————————————
    // 2) LOW-SALT BREAKFAST
    // ——————————————————————————

    KnowledgeBase(
        id: 7,
        title: "Low-salt breakfast — Why it matters",
        tags: ["low salt", "breakfast", "sodium", "fluid retention", "heart strain"],
        answer: "Less salt means less fluid retention, which lowers strain on your heart and helps your water pill work better."
    ),
    KnowledgeBase(
        id: 8,
        title: "Daily salt limit",
        tags: ["salt limit", "sodium limit", "2000 mg", "diet target"],
        answer: "Aim for ≤ 2000 mg (2 g) of sodium per day across all meals and snacks."
    ),
    KnowledgeBase(
        id: 9,
        title: "Breakfast — Good choices",
        tags: ["breakfast ideas", "porridge", "eggs", "yogurt", "berries", "low salt options"],
        answer: "Try porridge with banana, scrambled eggs with tomato, or Greek yogurt with berries."
    ),
    KnowledgeBase(
        id: 10,
        title: "Breakfast — Avoid these",
        tags: ["avoid foods", "bacon", "sausages", "cheese", "processed cereal", "high salt"],
        answer: "Avoid bacon, sausages, cheese, processed cereals, and salty packaged bread."
    ),
    KnowledgeBase(
        id: 11,
        title: "Cooking tip — Flavor without salt",
        tags: ["cooking tip", "herbs", "lemon", "garlic", "no added salt"],
        answer: "Use herbs, lemon, garlic, pepper, and vinegar instead of salt to boost flavor."
    ),
    KnowledgeBase(
        id: 12,
        title: "Spot hidden salt",
        tags: ["hidden salt", "food labels", "bread", "butter", "cereal"],
        answer: "Check labels on bread, butter, and breakfast cereals. Choose low- or no-salt versions when possible."
    ),
    KnowledgeBase(
        id: 13,
        title: "Label guide — Sodium per serve",
        tags: ["label reading", "low sodium", "high sodium", "nutrition label"],
        answer: "“Low sodium” is <140 mg per serve (good). “High sodium” is >400 mg per serve (avoid)."
    ),

    // ——————————————————————————
    // 3) TRACKING DAILY FLUIDS
    // ——————————————————————————

    KnowledgeBase(
        id: 14,
        title: "Fluids — Daily limit",
        tags: ["fluid limit", "1.5 litres", "1500 ml", "drink limit", "daily fluids"],
        answer: "Keep total fluids ≤ 1.5 L (1500 ml) per day to avoid stressing the heart."
    ),
    KnowledgeBase(
        id: 15,
        title: "What counts as fluid",
        tags: ["what counts", "tea", "coffee", "juice", "soup", "ice cream", "ice cubes"],
        answer: "All drinks count (water, tea, coffee, juice), plus soup, ice cream, and even ice cubes."
    ),
    KnowledgeBase(
        id: 16,
        title: "How to track fluids",
        tags: ["tracking fluids", "jug method", "1.5l jug", "measure drinks"],
        answer: "Fill a 1.5 L jug each morning and pour all drinks from it. When it’s empty, you’ve hit your limit."
    ),
    KnowledgeBase(
        id: 17,
        title: "Fluid spread across the day",
        tags: ["fluid plan", "schedule drinks", "morning afternoon evening"],
        answer: "Try 500 ml morning, 500 ml afternoon, 500 ml evening."
    ),
    KnowledgeBase(
        id: 18,
        title: "Too much fluid — Warning signs",
        tags: ["fluid overload", "weight gain", "ankle swelling", "breathless"],
        answer: "Watch for >0.5 kg weight gain in a day, more ankle swelling, or worsening breathlessness."
    ),
    KnowledgeBase(
        id: 19,
        title: "Managing thirst",
        tags: ["thirst tips", "ice cubes", "mouth rinse", "small cups"],
        answer: "Suck ice cubes (count them), rinse mouth without swallowing, and use smaller cups."
    ),

    // ——————————————————————————
    // 4) DAILY WEIGHING
    // ——————————————————————————

    KnowledgeBase(
        id: 20,
        title: "Daily weighing — Why do it",
        tags: ["daily weight", "scale", "early warning", "fluid build up"],
        answer: "Daily weight catches fluid build-up early so you can act before breathing worsens."
    ),
    KnowledgeBase(
        id: 21,
        title: "How to weigh correctly",
        tags: ["how to weigh", "morning routine", "same scale", "before breakfast"],
        answer: "Weigh every morning after the bathroom, before eating, same scale, similar clothing. Log it straight away."
    ),
    KnowledgeBase(
        id: 22,
        title: "Normal daily changes",
        tags: ["weight variation", "normal range", "0.5 kg"],
        answer: "A day-to-day change of about ±0.5 kg is normal."
    ),
    KnowledgeBase(
        id: 23,
        title: "When to call the doctor (weight)",
        tags: ["weight gain alert", "2 kg in 3 days", "call doctor"],
        answer: "Call if you gain 2 kg in 3 days. This often means fluid is building faster than your water pill can remove."
    ),
    KnowledgeBase(
        id: 24,
        title: "Act early",
        tags: ["early action", "prevent hospital", "medication adjustment"],
        answer: "Early calls are easier fixes. Waiting increases the chance of needing hospital care."
    ),

    // ——————————————————————————
    // 5) EVENING HEART MEDICATIONS
    // ——————————————————————————

    KnowledgeBase(
        id: 25,
        title: "Evening meds — Purpose",
        tags: ["evening medicine", "night medicine", "heart protection", "long-term"],
        answer: "Night medicines protect your heart and vessels over time while your body rests."
    ),
    KnowledgeBase(
        id: 26,
        title: "Evening meds — Examples",
        tags: ["atorvastatin", "metoprolol", "cholesterol", "beta blocker"],
        answer: "Often includes atorvastatin (cholesterol control) and metoprolol (steady heart rate/efficiency)."
    ),
    KnowledgeBase(
        id: 27,
        title: "Evening meds — When to take",
        tags: ["when to take night meds", "8pm", "with dinner"],
        answer: "Take around 8:00 PM, with or after dinner."
    ),
    KnowledgeBase(
        id: 28,
        title: "Evening meds — What to expect",
        tags: ["night meds effects", "not immediate", "background protection"],
        answer: "You won’t feel an immediate effect. They work quietly in the background to protect your heart."
    ),
    KnowledgeBase(
        id: 29,
        title: "Evening meds — Missed dose",
        tags: ["missed night dose", "late dose", "skip night dose"],
        answer: "Within 2 hours of usual time? Take it. After 2 hours? Skip and resume tomorrow. Inform your doctor."
    ),
    KnowledgeBase(
        id: 30,
        title: "Evening meds — When to seek help",
        tags: ["night meds issues", "side effects", "frequent misses", "running low"],
        answer: "Contact your doctor if doses are often missed, you’re worried about side effects, or you’re running low."
    )
]
