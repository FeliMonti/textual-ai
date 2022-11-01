# End-to-end testing with Robot Framework

This branch will contain the work of test interns Felicia & Zheng.

## Requirements

### 1. Install `chromedriver`

**On macOS**

```
brew install chromedriver
```

If you get this message:

> “chromedriver” cannot be opened because the developer cannot be verified.
> macOS cannot verify that this app is free from malware.

1. Open a Finder window
2. Go to `/usr/local/bin`
3. Right-click `chromedriver`, choose "Open"

### 2. Install Robot, Selenium, and other Python dependencies

```
pip3 install -r requirements.txt
```

## Running

```
robot <file>.robot
```

or

```
python3 -m robot ...
```

### Headless mode

```
robot --variable HEADLESS:True ...
```

