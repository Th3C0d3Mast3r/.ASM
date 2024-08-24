# Assembly Language Codes Repository

Welcome to my repository of Assembly language codes. This repository contains various Assembly-level programs primarily targeting the 8086 microprocessor. All the codes are written in MASM (Microsoft Macro Assembler) and can be executed on DOSBox for ease of use.

## Tools Required

To run the Assembly language programs, you will need the following tools:

- **DOSBox and MASM** :- https://drive.google.com/file/d/1JBnw-bOOCe3rQN0o3aQ4C4bxqN23QB-2/view

## Steps to Execute `.asm` Files

1. **Mount the location where your 8086 assembly file is stored**:
    ```bash
    mount c <location_where_8086_file_is_stored>
    ```

2. Switch to the mounted directory:
    ```bash
    c:
    ```

3. Edit the assembly file using the `edit` command:
    ```bash
    edit <file_name>.asm
    ```

4. Once the file is edited and saved, assemble it using MASM:
    ```bash
    masm <file_name>.asm
    ```

5. Link the object file created by MASM:
    ```bash
    link <file_name>.obj
    ```

6. Run the `.exe` file using the debugger:
    ```bash
    debug <file_name>.exe
    ```

7. After the debugger is opened, a hyphen (`-`) will appear. Now, to see where the data is stored, type:
    ```bash
    d 076A:0000
    ```

8. Finally, to execute the code, type:
    ```bash
    g
    ```

## Running the Program

Once these steps are followed, your program will run, and you can see the output. Debugging commands like `d` and `g` help you visualize memory locations and control program execution.

---

Feel free to contribute or reach out for improvements or suggestions!
