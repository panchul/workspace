[Home](Readme.md)
# Selenium

See Also:

  - [ScalaTest](ScalaTest.md)
  - [Jest](Jest.md)
  - [ScalaTest](ScalaTest.md)
  - [Selenium](Selenium.md)
  - [Javascript](Javascript.md)
  - [NodeJs](NodeJs.md)
  - [NextJs](NextJs.md)
  - [TypeScript](TypeScript.md)
  - [PlotlyDash](PlotlyDash.md)
 
selenium-python.readthedocs.io/api.html - webdriver api

---

**Contents**

- [Installing](Selenium.md#installing)
- [Web Driver](Selenium.md#web-driver)
  - [Chromedriver](Selenium.md#chromedriver)
- [Miscellaneous](Selenium.md#miscellaneous)

---

## Installing

---

https://www.selenium.dev/

---

## Web Driver

https://www.selenium.dev/documentation/webdriver/

---

### Chromedriver

---

```bash
brew install chromedriver
```

- you will need to [remove the quarantine attribute](Selenium.md#remove-the-quarantine-attribute-from-chromedriver)
- you need Google Chrome installed.
- chromedriver version should match Chrome browser version.

For a specific version:

```bash
brew install --cask chromedriver
```

For Python projects, you can use the webdriver-manager package to manage chromedriver automatically:

```bash
pip install webdriver-manager
```

Then the test code:

```Python
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(ChromeDriverManager().install())
```

### Remove the quarantine attribute from Chromedriver

Fine where you driver is:

```bash
which chromedriver
```

```bash
ls /opt/homebrew/bin/chromedriver
```

Remove quarantine attribute:

```bash
xattr -d com.apple.quarantine /opt/homebrew/bin/chromedriver
```

Check that it is functional:

```bash
$ chromedriver -v
ChromeDriver 138.0...
```

If you still get a security prompt, you can also:

- Open `System Preferences > Security & Privacy > General`.
- You should see a message about chromedriver being blocked. Click "Allow Anyway".

## Miscellaneous

---

selenium-python.readthedocs.io/api.html - webdriver api

---
