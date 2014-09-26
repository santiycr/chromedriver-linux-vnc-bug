# An all in one repro case for typing issues in Chrome + VNC displays

## Setup

```bash
$ git clone https://github.com/santiycr/chromedriver-linux-vnc-bug
$ cd chromedriver-linux-vnc-bug
$ vagrant up
```

## Repro the problem

```bash
$ pip install -r requirements.txt
$ python test_chrome_type.py
F
======================================================================
FAIL: test_sauce (__main__.testChromeTypes)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_chrome_type.py", line 18, in test_sauce
    self.assertEqual(to_type, textarea.get_attribute('value'))
AssertionError: '0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z' != u'0\n1\n2\n3\n4\n    \n7\n8\n9\na\nb\nc\nd\ne\nf\ng\nh\ni\nj\nk\nl\nm\nn\no\np\nq\nr\ns\nt\nu\nv\nw\nx\ny\nz'

----------------------------------------------------------------------
Ran 1 test in 3.014s

FAILED (failures=1)
```
