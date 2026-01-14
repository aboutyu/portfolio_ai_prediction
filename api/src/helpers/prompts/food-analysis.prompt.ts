export const FoodAnalysisPrompt = {
  getAnalysisPrompt: (foodName: string) => {
    const count = process.env.AI_RECOMMEND_COUNT || '2';
    const aiModel = process.env.AI_MODEL || 'llama3.2:1b';

    return `
    You are a professional nutritionist.
    Analyze the food keyword: "${foodName}"
    Recommend ${count} most relevant food items.

    [CRITICAL RULES]
    1. Output MUST be a valid JSON Array. Wrap the result in [ ... ].
    2. Do NOT include metadata like "$schema" or "version".
    3. **foodName** MUST NOT be null. Use "${foodName}" if unsure.
    4. **IMPORTANT**: Do NOT set nutrients to 0. **ESTIMATE** values based on general nutritional data for "${foodName}".
       (e.g., Corn usually has ~100kcal, ~3g protein per 100g).
    5. Translate all string values to Korean.
    6. "foodCode" must be "AI_GENERATED".
    7. "sourceName" must be "AI Analysis".
    8. "dataGenMethod" must be the AI model name: "${aiModel}".

    [JSON Template to Fill]
    {
      "foodCode": "AI_GENERATED",
      "foodName": "String (Required)",
      "representativeFoodName": "String",
      "categoryLarge": "String",
      "categoryMedium": "String or null",
      "categorySmall": "String or null",
      "manufacturerName": null,
      "foodManufactureNumber": null,
      "importerName": null,
      "distributorName": null,
      "originCountry": null,
      "isImported": "String (Y/N)",
      "sourceName": "AI Analysis",
      "providerName": null,
      "dataGenMethod": "model name",
      "servingStandardAmount": "100g",
      "servingAAmount": "String (e.g., 70g)",
      "foodAAmount": null,
      "energyKcal": Number (Estimate it!),
      "moistureG": Number (Estimate it!),
      "proteinG": Number (Estimate it!),
      "fatG": Number (Estimate it!),
      "ashG": Number (Estimate it!),
      "carbohydrateG": Number (Estimate it!),
      "sugarG": Number (Estimate it!),
      "dietaryFiberG": Number (Estimate it!),
      "calciumMg": Number (Estimate it!),
      "ironMg": Number (Estimate it!),
      "phosphorusMg": Number (Estimate it!),
      "potassiumMg": Number (Estimate it!),
      "sodiumMg": Number (Estimate it!),
      "vitaminAUg": Number (Estimate it!),
      "retinolUg": Number (Estimate it!),
      "betaCaroteneUg": Number (Estimate it!),
      "thiaminMg": Number (Estimate it!),
      "riboflavinMg": Number (Estimate it!),
      "niacinMg": Number (Estimate it!),
      "vitaminCMg": Number (Estimate it!),
      "vitaminDUg": Number (Estimate it!),
      "cholesterolMg": Number (Estimate it!),
      "saturatedFatG": Number (Estimate it!),
      "transFatG": Number (Estimate it!)
    }
    `;
  },
};
