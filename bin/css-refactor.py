#!/usr/bin/env python
#
# Read template.css and user.css and then chunk out *all* duplicate css definitions
#

import cssutils

BASEDIR = './public_html/templates/protostar/css/'
TEMPLATECSS = BASEDIR + 'template.css'
USERCSS = BASEDIR + 'user.css'

def main():
    print('Working on finding duplicate CSS between:')
    print('Template: ' + TEMPLATECSS)
    print('User: ' + USERCSS)

    template_parsed = cssutils.parseFile(TEMPLATECSS)
    user_parsed = cssutils.parseFile(USERCSS)

    for rule in template_parsed:
        print(rule.cssText)


if __name__ == "__main__":
    main()
