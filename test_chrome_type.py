#!/usr/bin/env python

import unittest
from selenium import webdriver


class testChromeTypes(unittest.TestCase):
    port = None

    def setUp(self):
        if not self.port:
            raise unittest.SkipTest('this is just the base class')
        desired_capabilities = webdriver.DesiredCapabilities.CHROME

        self.driver = webdriver.Remote(
            desired_capabilities=desired_capabilities,
            command_executor="http://localhost:%s/wd/hub" % self.port)

    def test_chrome_type(self):
        to_type = "0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z"
        self.driver.get("http://codepad.org/")
        textarea = self.driver.find_element_by_id("textarea")
        textarea.send_keys(to_type)
        self.assertEqual(to_type, textarea.get_attribute('value'))

    def tearDown(self):
        self.driver.quit()


class testChromeTypesOnVnc(testChromeTypes):
    port = 4444  # selenium running on xvfb


class testChromeTypesOnXvfb(testChromeTypes):
    port = 4445  # selenium running on xvfb

if __name__ == '__main__':
    unittest.main()
