import csv
import xml.etree.ElementTree as ET

"""
Lexicon to csv file
"""

# Load the XML file
tree = ET.parse('../resources/DiLAF/dilaf_wol_fra.xml')
root = tree.getroot()

# # Create a CSV file for writing
# with open('../generated_csv/dilaf_lexicon.csv', 'w', newline='') as csvfile:
#     csvwriter = csv.writer(csvfile)
#
#     # Write the header row
#     csvwriter.writerow(["mbirmi", "tëggin", "xeet", "nettalin_fr", "nettalin_wo"])
#
#     # Iterate through the 'dog' elements
#     for dog in root.findall(".//dog"):
#         mbirmi = dog.find("mbirmi").text if dog.find("mbirmi") is not None else ""
#         tëggin = dog.find("tëggin").text if dog.find("tëggin") is not None else ""
#         xeet = dog.find("xeet").text if dog.find("xeet") is not None else ""
#         nettalin_fr = dog.find(".//nettalin[@làkk='fr']").text if dog.find(
#             ".//nettalin[@làkk='fr']") is not None else ""
#         nettalin_wo = dog.find(".//nettalin[@làkk='wo']").text if dog.find(
#             ".//nettalin[@làkk='wo']") is not None else ""
#
#         # Write the data to the CSV file
#         csvwriter.writerow([mbirmi, tëggin, xeet, nettalin_fr, nettalin_wo])
#
# print("CSV file 'output.csv' has been generated.")


"""
Lexicon to txt file
"""

# Create a text file for writing
with open('../generated_txt/dilaf_lexicon.txt', 'w', encoding='utf-8') as txtfile:
    # Iterate through the 'mbirmi' elements
    for mbirmi_element in root.findall(".//mbirmi"):
        mbirmi_value = mbirmi_element.text
        if mbirmi_value:
            txtfile.write(mbirmi_value + '\n')

print("Txt file has been generated.")
