# Habbit_Tracker

App that helps you build positive habits, measure progress and achieve your goals

### To Do:

- Streaks
- Splash Screen
- Push Notifications
- Landing Page


User Input:

                ┌────────────┐
                │ User Input │
                └─────┬──────┘
                      │
      ┌───────────┬───┴────────┬─────────┐
      │           │            │         │
┌─────▼────┐    ┌─▼──┐     ┌───▼──┐    ┌─▼─┐
│ CheckBox │    │Edit│     │Delete│    │Add│
└─────┬────┘    └─┬──┘     └───┬──┘    └─┬─┘
      │           │            │         │
      └───────────┴────┬───────┴─────────┘
                       │
                       │
              ┌────────▼─────────┐
              │Update Database ()│
              └──────────────────┘

Data flow:

                    ┌────────────┐
                    │ Init State │
                    └─────┬──────┘
                          │
                    ┌─────▼─────┐
                    │ 1st time? │
                    └─────┬─────┘
                          │
           ┌──────Yes─────┴───────No─────┐
           │                             │
           │                             │
┌──────────▼────────────┐           ┌──────▼──────┐
│ Create Default Data() │           │ Load Data() │
└───────────────────────┘           └─────────────┘

