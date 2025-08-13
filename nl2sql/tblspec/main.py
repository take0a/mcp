import openpyxl

def main():
    filepath = "tests/sampledb.xlsx"
    sheetname = "テーブル仕様書"
    wb = openpyxl.load_workbook(filepath)
    ws = wb[sheetname]

    for row in ws.iter_rows():       
        for cell in row:
            print(cell.value, end=", ")
        print()


if __name__ == "__main__":
    main()
