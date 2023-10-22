import xml.etree.ElementTree as ET
import csv

# Parse the XML file
tree = ET.parse('../resources/IBaatukaay/ibaatukaay_wol_axi.xml')
root = tree.getroot()

"""
Lexicon to csv file
"""

# Create a CSV file
# with open('../generated_csv/ibaatukay_lexicon.csv', mode='w', newline='') as csv_file:
#     fieldnames = ['mot_vedette', 'prononciation', 'catégorie_grammaticale', 'ex_wol', 'ex_fra']
#     writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
#
#     writer.writeheader()
#
#     # Extract and store values in the CSV
#     for article in root.findall('article'):
#         mot_vedette_element = article.find('bloc_forme/mot_vedette')
#         prononciation_element = article.find('bloc_forme/prononciation')
#         catégorie_grammaticale_element = article.find('catégorie_grammaticale')
#         ex_wol_element = article.find('bloc_sens/exemples/exemple/exemple-wol')
#         ex_fra_element = article.find('bloc_sens/exemples/exemple/exemple-fra')
#
#         # Check if elements exist before accessing their text attribute
#         mot_vedette = mot_vedette_element.text if mot_vedette_element is not None else ""
#         prononciation = prononciation_element.text if prononciation_element is not None else ""
#         catégorie_grammaticale = catégorie_grammaticale_element.text if catégorie_grammaticale_element is not None else ""
#         ex_wol = ex_wol_element.text if ex_wol_element is not None else ""
#         ex_fra = ex_fra_element.text if ex_fra_element is not None else ""
#
#         row = {
#             'mot_vedette': mot_vedette,
#             'prononciation': prononciation,
#             'catégorie_grammaticale': catégorie_grammaticale,
#             'ex_wol': ex_wol,
#             'ex_fra': ex_fra
#         }
#         writer.writerow(row)
# print("CSV file has been generated.")


"""
Lexicon to txt file
"""

with open('../generated_txt/ibaatukaay_lexicon.txt', 'w', encoding='utf-8') as text_file:
    # Extract and write the values to the text file
    for article in root.findall('.//mot_vedette'):
        mot_vedette_value = article.text
        if mot_vedette_value:
            text_file.write(mot_vedette_value + '\n')

print("Txt file has been generated.")

