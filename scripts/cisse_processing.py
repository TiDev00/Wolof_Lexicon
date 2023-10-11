import xml.etree.ElementTree as ET
import csv

# Parse the XML file
tree = ET.parse("../resources/Cisse_fra-wol/cisse_prep.xml")
root = tree.getroot()

# Create a CSV file for writing
with open("../Cisse_fra.csv", "w", newline='') as csvfile:
    csvwriter = csv.writer(csvfile)

    # Write the header row in the CSV file
    csvwriter.writerow(["ID", "Mot_Vedette", "Prononciation", "Catégorie_Grammaticale", "Classe_Nominale", "Sens_ID", "Définition", "Traduction_Française", "Catégorie_Grammaticale_Traduction_Française_Mot_Vedette", "Phrase_Illustration", "Traduction_Française_Phrase_Illustration"])

    # Iterate through each <article> element in the XML
    for article in root.findall("article"):
        article_id = article.get("id")
        mot_vedette_element = article.find("bloc_forme/mot_vedette")
        prononciation_element = article.find("bloc_forme/prononciation")
        catégorie_grammaticale_element = article.find("catégorie_grammaticale")
        classe_nominale_element = article.find("classe_nominale")

        for sens in article.findall("sens"):
            sens_id = sens.get("id")
            définition_element = sens.find("définition")
            traduction_française_element = sens.find("bloc_traduction/traduction_française")
            catégorie_grammaticale_traduction_française_element = sens.find("bloc_traduction/catégorie_grammaticale_traduction_française_mot_vedette")
            phrase_illustration_element = sens.find("exemple/phrase_illustration")
            traduction_française_phrase_illustration_element = sens.find("exemple/traduction_française_phrase_illustration")

            # Check if elements exist before accessing their text
            mot_vedette = mot_vedette_element.text if mot_vedette_element is not None else ""
            prononciation = prononciation_element.text if prononciation_element is not None else ""
            catégorie_grammaticale = catégorie_grammaticale_element.text if catégorie_grammaticale_element is not None else ""
            classe_nominale = classe_nominale_element.text if classe_nominale_element is not None else ""
            définition = définition_element.text if définition_element is not None else ""
            traduction_française = traduction_française_element.text if traduction_française_element is not None else ""
            catégorie_grammaticale_traduction_française = catégorie_grammaticale_traduction_française_element.text if catégorie_grammaticale_traduction_française_element is not None else ""
            phrase_illustration = phrase_illustration_element.text if phrase_illustration_element is not None else ""
            traduction_française_phrase_illustration = traduction_française_phrase_illustration_element.text if traduction_française_phrase_illustration_element is not None else ""

            # Write the data to the CSV file
            csvwriter.writerow([article_id, mot_vedette, prononciation, catégorie_grammaticale, classe_nominale, sens_id, définition, traduction_française, catégorie_grammaticale_traduction_française, phrase_illustration, traduction_française_phrase_illustration])

print("CSV file has been generated.")

