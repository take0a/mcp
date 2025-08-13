import io
import sys

import openpyxl


def main():
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")

    filepath = "tests/sampledb.xlsx"
    sheetname = "テーブル仕様書"
    wb = openpyxl.load_workbook(filepath)
    ws = wb[sheetname]

    table = {}
    for row in ws.iter_rows(min_row=2):
        cells = list(row)
        if cells[0].value is not None and not str(cells[0].value).startswith("#"):
            create_table(table)
            table["alias"] = str(cells[0].value)
            table["name"] = str(cells[1].value)
            table["columns"] = []
            table["keys"] = {}
        elif cells[0].value is None and cells[2].value is not None:
            column = {}
            column["alias"] = str(cells[2].value)
            column["name"] = str(cells[3].value)
            column["type"] = str(cells[4].value)
            if cells[5].value is not None:
                table["keys"][str(cells[5].value)] = column["name"]
            table["columns"].append(column)

    create_table(table)


def create_table(table: dict):
    if len(table) > 0:
        print(f"CREATE TABLE {table['name']} (")
        for column in table["columns"]:
            print(f"\t{column['name']}\t{column['type']},")
        if len(table["keys"]) > 0:
            values = " ".join(table["keys"].values())
            print(f"\tPRIMARY KEY ({values})")
        print(");", end="\n\n")

        print(f"COMMENT ON TABLE {table['name']} IS '{table['alias']}';")
        for column in table["columns"]:
            print(
                f"COMMENT ON COLUMN {table['name']}.{column['name']} IS '{column['alias']}';"
            )
        print()


if __name__ == "__main__":
    main()
