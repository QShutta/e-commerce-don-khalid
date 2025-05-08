The purpose of the localization folder is to use it in multi language.So the app can use the
 arabic and the english language.


 # 🗺️ Localization

📁 **The purpose of the `localization` folder** is to support multi-language in the app, so it can work with both **Arabic** and **English** languages.

---

## ❓ Why did we put `LocaleController` inside the `localization` folder and not in the `controller` folder?

✳️ Because the job of `LocaleController` is only to manage the app language (like switching between Arabic and English). It is part of the localization feature, not general app logic.

📦 The `core` folder (which includes `localization`) is like our custom mini-framework — something we can copy and reuse in other projects with only small changes.

🛑 If we put `LocaleController` inside the main `controller` folder, we would be mixing reusable logic with project-specific logic, which goes against the idea of the `core` folder.

✅ That’s why we keep `LocaleController` inside `core/localization` — to keep the code clean, organized, and reusable.
