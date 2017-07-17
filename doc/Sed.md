
## UNDER CONSTRUCTION

# sed

---

### To add/remove carriage return, the dos2unix file convertion

To remove ( '-i' means edit files in place):

    sed -i 's/\r//' CRLF.txt

To add:

    sed -i 's/$/\r/' LF.txt

---

