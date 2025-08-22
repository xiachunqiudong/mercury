import sys
from elftools.elf.elffile import ELFFile

def print_text_section_as_hex(elf_path, line_byte_num=16):
    with open(elf_path, 'rb') as f:
        elf = ELFFile(f)
        text_section = None
        for section in elf.iter_sections():
            if section.name == '.text':
                text_section = section
                break
        
        if not text_section:
            print("Error! can not find text section in this elf.")
            return

        byte_cnt = 0

        hex_line_data = ""

        section_byte_array = text_section.data()
        for index, section_byte in enumerate(section_byte_array):
          hex_line_data = f"{section_byte:02x}" + hex_line_data
          byte_cnt += 1
          if index == len(section_byte_array) - 1 or byte_cnt == line_byte_num:
            hex_line_data = hex_line_data.rjust(line_byte_num<<1, '0')
            print(hex_line_data)
            byte_cnt = 0
            hex_line_data = ""

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Example: {sys.argv[0]} <ELF file path>")
        sys.exit(1)

    print_text_section_as_hex(sys.argv[1])
