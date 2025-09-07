# Requirements Document

## Overview
This project consists of two independent programs that communicate via a shared log file:

1. **Writer Program** – Writes the current date and time to a file every 10 seconds.  
2. **Reader Program** – Reads the most recent entry from the same file every 7 seconds and prints it to the console.  

Both programs run independently but must coordinate through proper file handling to prevent corruption or inconsistent reads.

---

## Functional Requirements

### Writer Program
- **FR-1.1**: Create or open a log file named `datetime.log` in append mode.  
- **FR-1.2**: Every 10 seconds, write the current system date and time in ISO 8601 format (`YYYY-MM-DD HH:MM:SS`).  
- **FR-1.3**: Ensure each entry is written on a new line.  
- **FR-1.4**: Flush or close the file after each write to guarantee persistence.  
- **FR-1.5**: If the file cannot be opened, log an error to the console and retry at the next interval.  

### Reader Program
- **FR-2.1**: Open the log file `datetime.log` in read mode.  
- **FR-2.2**: Every 7 seconds, read the **last line** from the file.  
- **FR-2.3**: Print the last line in a readable format to the console (e.g., `Latest log entry: 2025-09-07 16:32:10`).  
- **FR-2.4**: If the file does not exist or is empty, display a warning and retry at the next interval.  
- **FR-2.5**: Handle concurrent file access safely (only process complete lines).  

---

## Non-Functional Requirements
- **NFR-1**: Both programs shall be written in a language with built-in file I/O and timer support (e.g., Python, C#, Java).  
- **NFR-2**: Programs must use proper resource handling (open/close files, error catching).  
- **NFR-3**: Must be cross-platform (Linux, Windows).  
- **NFR-4**: Programs shall run continuously until terminated manually.  
- **NFR-5**: Console output must be human-readable.  

---

## Constraints
- File locking must be minimal to prevent conflicts between writer and reader.  
- Programs must not rely on external databases or services — file I/O only.  
- No cleanup of old entries is required, but the design should allow future log rotation.  

---

## Example Execution Flow

1. **Writer Program**
   - At `16:30:00` → Writes `2025-09-07 16:30:00` to `datetime.log`.  
   - At `16:30:10` → Writes `2025-09-07 16:30:10`.  

2. **Reader Program**
   - At `16:30:07` → Reads last entry → Prints `Latest log entry: 2025-09-07 16:30:00`.  
   - At `16:30:14` → Reads last entry → Prints `Latest log entry: 2025-09-07 16:30:10`.  
