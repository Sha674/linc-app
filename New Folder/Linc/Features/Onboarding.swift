//
//  Onboarding.swift
//  Linc
//
//  Created by Thanh Ngoc Le on 7/11/2025.
//

import SwiftUI

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}


struct LoginView: View {
    //@EnvironmentObject var app: AppState
    var body: some View {
        VStack(spacing: 16) {
            Text("Login").font(.title)
              
        }
        }
    }


struct CodeVerifyView: View {
    @EnvironmentObject var app: AppState
    let sessionId: String
    let who: String
    var body: some View {
        VStack(spacing: 16) {
            Text("Code sent to \(who)")
            Button("Verify (demo)") { app.auth = .loggedIn }
        }.padding()
    }
}



struct OnboardingView: View {
    @EnvironmentObject var app: AppState
    @State private var currentPage = 0

    var body: some View {
//        if app.onboardingCompleted{
//            MainTabView()
//                .environmentObject(app)
//        }
        TabView(selection: $currentPage) {
            LoginPage(currentPage: $currentPage)
                .tag(0)
            MomsHerePage(currentPage: $currentPage)
                .tag(1)
            YouCanDoThisPage(currentPage: $currentPage)
                .tag(2)
            JustThreeThingsPage(currentPage: $currentPage)
                .tag(3)
            WhyThisWorksPage(currentPage: $currentPage)
                .tag(4)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(Color(red: 0.25, green: 0.27, blue: 0.78))
            .foregroundColor(.white)
            .cornerRadius(16)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct LoginPage: View {
    @Binding var currentPage: Int
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack{
            Spacer().frame(height:40)
            VStack(spacing: 12) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                Text("Log in")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(.top, 60)
            .padding(.bottom, 20)
            
            VStack(spacing: 20){
                TextField("Email", text: $email)
                    .padding()
                    .frame(height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                
                Button(action: {
                    hideKeyboard()
                    if (email.lowercased() == "afp@gmail.com") && password == "sebastian" {
                        currentPage = 1
                    } else {
                        alertMessage = "Invalid email or password. Please try again."
                        showAlert = true
                    }
                }) {
                    Text("Log In")
                }
                .buttonStyle(GradientButtonStyle())
                .disabled(email.isEmpty || password.isEmpty)
                .opacity((email.isEmpty || password.isEmpty) ? 0.6 : 1.0)
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            Spacer()
            
        }
        .padding()
    }
}


struct MomsHerePage: View {
    @Binding var currentPage: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("🏠")
                .font(.system(size: 100))
            Text("Mom's Home")
                .font(.largeTitle)
                .bold()
            Text("We'll help you care for Margaret. You've got this.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                currentPage = 2
            }) {
                Text("Get Started")
            }
            .buttonStyle(GradientButtonStyle())
            .padding(.horizontal)
            .padding(.vertical)
        }
        .padding()
        
    }
}

struct YouCanDoThisPage: View {
    @Binding var currentPage: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("✅")
                .font(.system(size: 100))
            Text("You Can Do This")
                .font(.largeTitle)
                .bold()
            Text("Caring for Margaret doesn't mean doing everything yourself. It means making sure things happen.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("We'll show you exactly what to do.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                currentPage = 3
            }) {
                Text("Continue")
            }
            .buttonStyle(GradientButtonStyle())
            .padding(.horizontal)
            .padding(.vertical)
        }
        .padding()
    }
}

struct JustThreeThingsPage: View {
    @Binding var currentPage: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("💡")
                .font(.system(size: 100))
            Text("Why This Works")
                .font(.largeTitle)
                .bold()
            Text("These 3 things catch problems early—before they become serious.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("You're preventing hospital readmission.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Button(action: {
                currentPage = 4
            }) {
                Text("Continue")
            }
            .buttonStyle(GradientButtonStyle())
            .padding(.horizontal)
            .padding(.vertical)
        }
        .padding()
    }
}

struct WhyThisWorksPage: View {
    @Binding var currentPage: Int
    @EnvironmentObject var app: AppState

    var body: some View {
        VStack(spacing: 16) {
            Text("3️⃣")
                .font(.system(size: 100))
            Text("Just 3 Things Daily")
                .font(.largeTitle)
                .bold()
            Text("That's all it takes to keep Margaret safe:")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("⚖️")
                        Text("Check her weight")
                            .padding(.horizontal, 50)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)

            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("💊")
                        Text("Ensure pills taken")
                            .padding(.horizontal, 50)
                    }
                }
            }
            .frame(maxWidth: .infinity)

            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("💬")
                        Text("Quick check-in")
                            .padding(.horizontal, 60)
                    }
                }
            }
            .frame(maxWidth: .infinity)

            Button(action: {
                app.onboardingCompleted = true
            }) {
                Text("I'm ready!")
            }
            .buttonStyle(GradientButtonStyle())
            .padding(.horizontal)
            .padding(.vertical)
        }
        .padding()
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .environmentObject(AppState())
    }
}
