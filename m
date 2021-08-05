Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4805B3E12BB
	for <lists+linux-leds@lfdr.de>; Thu,  5 Aug 2021 12:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240447AbhHEKgl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Aug 2021 06:36:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:20484 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240186AbhHEKgd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Aug 2021 06:36:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="214105757"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="gz'50?scan'50,208,50";a="214105757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 03:36:18 -0700
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="gz'50?scan'50,208,50";a="512639033"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.111]) ([10.255.31.111])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2021 03:36:15 -0700
Subject: [pavel-linux-leds:for-next 9/18]
 drivers/leds/blink/leds-lgm-sso.c:635:4: warning: Value stored to 'ret' is
 never read [clang-analyzer-deadcode.DeadStores]
References: <202108041809.QsYhsqqy-lkp@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
From:   kernel test robot <rong.a.chen@intel.com>
X-Forwarded-Message-Id: <202108041809.QsYhsqqy-lkp@intel.com>
Message-ID: <c303b831-54cf-2079-77e5-ae2cf79db45d@intel.com>
Date:   Thu, 5 Aug 2021 18:36:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108041809.QsYhsqqy-lkp@intel.com>
Content-Type: multipart/mixed;
 boundary="------------C6D9321F8BA1689346476EA6"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------C6D9321F8BA1689346476EA6
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


tree: 
git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
head:   64f67b5240db79eceb0bd57dae8e591fd3103ba0
commit: 9999908ca1abee7aa518a4f6a3739517c137acbf [9/18] leds: lgm-sso: 
Put fwnode in any case during ->probe()
config: x86_64-randconfig-c001-20210803 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 
4f71f59bf3d9914188a11d0c41bedbb339d36ff5)
reproduce (this is a W=1 build):
         wget 
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
-O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install x86_64 cross compiling tool for clang build
         # apt-get install binutils-x86-64-linux-gnu
         # 
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?id=9999908ca1abee7aa518a4f6a3739517c137acbf
         git remote add pavel-linux-leds 
git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
         git fetch --no-tags pavel-linux-leds for-next
         git checkout 9999908ca1abee7aa518a4f6a3739517c137acbf
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 
ARCH=x86_64 clang-analyzer
If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^
    include/linux/build_bug.h:39:37: note: expanded from macro 
'BUILD_BUG_ON_MSG'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^
    include/linux/compiler_types.h:328:2: note: expanded from macro 
'compiletime_assert'
            _compiletime_assert(condition, msg, __compiletime_assert_, 
__COUNTER__)
            ^
    include/linux/compiler_types.h:316:2: note: expanded from macro 
'_compiletime_assert'
            __compiletime_assert(condition, msg, prefix, suffix)
            ^
    include/linux/compiler_types.h:308:3: note: expanded from macro 
'__compiletime_assert'
                    if (!(condition)) 
     \
                    ^
    drivers/tty/serial/serial_core.c:734:29: note: Loop condition is 
false.  Exiting loop
            struct uart_state *state = container_of(port, struct 
uart_state, port);
                                       ^
    include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
            BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) 
&&   \
            ^
    include/linux/build_bug.h:39:37: note: expanded from macro 
'BUILD_BUG_ON_MSG'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^
    include/linux/compiler_types.h:328:2: note: expanded from macro 
'compiletime_assert'
            _compiletime_assert(condition, msg, __compiletime_assert_, 
__COUNTER__)
            ^
    include/linux/compiler_types.h:316:2: note: expanded from macro 
'_compiletime_assert'
            __compiletime_assert(condition, msg, prefix, suffix)
            ^
    include/linux/compiler_types.h:306:2: note: expanded from macro 
'__compiletime_assert'
            do { 
     \
            ^
    drivers/tty/serial/serial_core.c:744:6: note: Assuming 'uport' is null
            if (!uport)
                ^~~~~~
    drivers/tty/serial/serial_core.c:744:2: note: Taking true branch
            if (!uport)
            ^
    drivers/tty/serial/serial_core.c:745:3: note: Control jumps to line 768
                    goto out;
                    ^
    drivers/tty/serial/serial_core.c:769:2: note: Returning without 
writing to 'retinfo->iomem_reg_shift'
            return ret;
            ^
    drivers/tty/serial/serial_core.c:2729:2: note: Returning from 
'uart_get_info'
            uart_get_info(port, &tmp);
            ^~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/tty/serial/serial_core.c:2730:9: note: 3rd function call 
argument is an uninitialized value
            return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
                   ^                    ~~~~~~~~~~~~~~~~~~~
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    5 warnings generated.
    fs/nfs/direct.c:703:19: warning: Value stored to 'req' during its 
initialization is never read [clang-analyzer-deadcode.DeadStores]
            struct nfs_page *req = nfs_list_entry(hdr->pages.next);
                             ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    fs/nfs/direct.c:703:19: note: Value stored to 'req' during its 
initialization is never read
            struct nfs_page *req = nfs_list_entry(hdr->pages.next);
                             ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    3 warnings generated.
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    3 warnings generated.
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is 
never read [clang-analyzer-deadcode.DeadStores]
                            retval = copy_to_user(buffer, &udev->brightness,
                            ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                            retval = copy_to_user(buffer, &udev->brightness,
                            ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
>> drivers/leds/blink/leds-lgm-sso.c:635:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                            ret = -ENOMEM;
                            ^     ~~~~~~~
    drivers/leds/blink/leds-lgm-sso.c:635:4: note: Value stored to 'ret' 
is never read
                            ret = -ENOMEM;
                            ^     ~~~~~~~
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    3 warnings generated.
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    3 warnings generated.
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    6 warnings generated.
    drivers/rtc/interface.c:799:8: warning: Passed-by-value struct 
argument contains uninitialized data (e.g., field: 'tm_sec') 
[clang-analyzer-core.CallAndMessage]
            now = rtc_tm_to_ktime(tm);
                  ^
    drivers/rtc/interface.c:984:6: note: Assuming field 'enabled' is 0
            if (timer->enabled)
                ^~~~~~~~~~~~~~
    drivers/rtc/interface.c:984:2: note: Taking false branch
            if (timer->enabled)
            ^
    drivers/rtc/interface.c:990:8: note: Calling 'rtc_timer_enqueue'
            ret = rtc_timer_enqueue(rtc, timer);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/rtc/interface.c:794:2: note: 'tm' initialized here
            struct rtc_time tm;
            ^~~~~~~~~~~~~~~~~~
    drivers/rtc/interface.c:799:8: note: Passed-by-value struct argument 
contains uninitialized data (e.g., field: 'tm_sec')
            now = rtc_tm_to_ktime(tm);
                  ^               ~~
    drivers/rtc/interface.c:899:8: warning: Passed-by-value struct 
argument contains uninitialized data (e.g., field: 'tm_sec') 
[clang-analyzer-core.CallAndMessage]
            now = rtc_tm_to_ktime(tm);
                  ^               ~~
    drivers/rtc/interface.c:891:2: note: 'tm' initialized here
            struct rtc_time tm;
            ^~~~~~~~~~~~~~~~~~
    drivers/rtc/interface.c:894:3: note: Left side of '&&' is false
                    container_of(work, struct rtc_device, irqwork);
                    ^
    include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
            BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) 
&&   \
                                                                       ^
    drivers/rtc/interface.c:894:3: note: Taking false branch
                    container_of(work, struct rtc_device, irqwork);
                    ^
    include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
            BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) 
&&   \
            ^
    include/linux/build_bug.h:39:37: note: expanded from macro 
'BUILD_BUG_ON_MSG'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^
    include/linux/compiler_types.h:328:2: note: expanded from macro 
'compiletime_assert'
            _compiletime_assert(condition, msg, __compiletime_assert_, 
__COUNTER__)
            ^
    include/linux/compiler_types.h:316:2: note: expanded from macro 
'_compiletime_assert'
            __compiletime_assert(condition, msg, prefix, suffix)
            ^
    include/linux/compiler_types.h:308:3: note: expanded from macro 
'__compiletime_assert'
                    if (!(condition)) 
     \
                    ^
    drivers/rtc/interface.c:894:3: note: Loop condition is false. 
Exiting loop
                    container_of(work, struct rtc_device, irqwork);
                    ^
    include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
            BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) 
&&   \
            ^
    include/linux/build_bug.h:39:37: note: expanded from macro 
'BUILD_BUG_ON_MSG'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^
    include/linux/compiler_types.h:328:2: note: expanded from macro 
'compiletime_assert'
            _compiletime_assert(condition, msg, __compiletime_assert_, 
__COUNTER__)
            ^
    include/linux/compiler_types.h:316:2: note: expanded from macro 
'_compiletime_assert'
            __compiletime_assert(condition, msg, prefix, suffix)
            ^
    include/linux/compiler_types.h:306:2: note: expanded from macro 
'__compiletime_assert'
            do { 
     \
            ^
    drivers/rtc/interface.c:899:8: note: Passed-by-value struct argument 
contains uninitialized data (e.g., field: 'tm_sec')
            now = rtc_tm_to_ktime(tm);
                  ^               ~~
    Suppressed 4 warnings (4 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    3 warnings generated.
    Suppressed 3 warnings (3 in non-user code).
    Use -header-filter=.* to display errors from all non-system headers. 
Use -system-headers to display errors from system headers as well.
    4 warnings generated.
    drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result 
of the left shift is undefined because the left operand is negative 
[clang-analyzer-core.UndefinedBinaryOperatorResult]
                            val &= ~(1 << col) << 8;
                                               ^
    drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 
'samsung_keypad_scan'
                    samsung_keypad_scan(keypad, row_state);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' 
is < field 'cols'
            for (col = 0; col < keypad->cols; col++) {

vim +/ret +635 drivers/leds/blink/leds-lgm-sso.c

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  619 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  620  static int
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  621 
__sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle 
*fw_ssoled)
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  622  {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  623  	struct 
fwnode_handle *fwnode_child;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  624  	struct 
device *dev = priv->dev;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  625  	struct 
sso_led_desc *desc;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  626  	struct 
sso_led *led;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  627  	struct 
list_head *p;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  628  	const char 
*tmp;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  629  	u32 prop;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  630  	int ret;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  631 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  632 
fwnode_for_each_child_node(fw_ssoled, fwnode_child) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  633  		led = 
devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
9999908ca1abee7 Andy Shevchenko             2021-05-29  634  		if (!led) {
9999908ca1abee7 Andy Shevchenko             2021-05-29 @635  			ret = 
-ENOMEM;
9999908ca1abee7 Andy Shevchenko             2021-05-29  636  			goto 
__dt_err;
9999908ca1abee7 Andy Shevchenko             2021-05-29  637  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  638 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  639  	 
INIT_LIST_HEAD(&led->list);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  640  		led->priv 
= priv;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  641  		desc = 
&led->desc;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  642 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  643  	 
led->gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  644  							 
   fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  645  							 
   GPIOD_ASIS, NULL);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  646  		if 
(IS_ERR(led->gpiod)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  647  		 
dev_err(dev, "led: get gpio fail!\n");
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  648  			goto 
__dt_err;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  649  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  650 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  651  	 
fwnode_property_read_string(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  652  					 
"linux,default-trigger",
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  653  					 
&desc->default_trigger);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  654 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  655  		if 
(fwnode_property_present(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  656  					 
"retain-state-suspended"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  657  		 
desc->retain_state_suspended = 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  658 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  659  		if 
(fwnode_property_present(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  660  					 
"retain-state-shutdown"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  661  		 
desc->retain_state_shutdown = 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  662 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  663  		if 
(fwnode_property_present(fwnode_child, "panic-indicator"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  664  		 
desc->panic_indicator = 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  665 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  666  		ret = 
fwnode_property_read_u32(fwnode_child, "reg", &prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  667  		if (ret 
!= 0 || prop >= SSO_LED_MAX_NUM) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  668  		 
dev_err(dev, "invalid LED pin:%u\n", prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  669  			goto 
__dt_err;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  670  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  671  		desc->pin 
= prop;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  672 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  673  		if 
(fwnode_property_present(fwnode_child, "intel,sso-hw-blink"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  674  		 
desc->hw_blink = 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  675 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  676  	 
desc->hw_trig = fwnode_property_read_bool(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  677  							 
"intel,sso-hw-trigger");
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  678  		if 
(desc->hw_trig) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  679  		 
desc->default_trigger = NULL;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  680  		 
desc->retain_state_shutdown = 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  681  		 
desc->retain_state_suspended = 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  682  		 
desc->panic_indicator = 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  683  		 
desc->hw_blink = 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  684  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  685 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  686  		if 
(fwnode_property_read_u32(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  687  					 
"intel,sso-blink-rate-hz", &prop)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  688  			/* 
default first freq rate */
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  689  		 
desc->freq_idx = 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  690  		 
desc->blink_rate = priv->freq[desc->freq_idx];
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  691  		} else {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  692  		 
desc->freq_idx = sso_get_blink_rate_idx(priv, prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  693  			if 
(desc->freq_idx == -1)
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  694  			 
desc->freq_idx = MAX_FREQ_RANK - 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  695 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  696  		 
desc->blink_rate = priv->freq[desc->freq_idx];
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  697  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  698 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  699  		if 
(!fwnode_property_read_string(fwnode_child, "default-state", &tmp)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  700  			if 
(!strcmp(tmp, "on"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  701  			 
desc->brightness = LED_FULL;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  702  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  703 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  704  		if 
(sso_create_led(priv, led, fwnode_child))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  705  			goto 
__dt_err;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  706  	}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  707 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  708  	return 0;
9999908ca1abee7 Andy Shevchenko             2021-05-29  709 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  710  __dt_err:
9999908ca1abee7 Andy Shevchenko             2021-05-29  711 
fwnode_handle_put(fwnode_child);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  712  	/* 
unregister leds */
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  713 
list_for_each(p, &priv->led_list) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  714  		led = 
list_entry(p, struct sso_led, list);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  715  	 
sso_led_shutdown(led);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  716  	}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  717 
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  718  	return 
-EINVAL;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  719  }
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  720
---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


--------------C6D9321F8BA1689346476EA6
Content-Type: application/gzip;
 name=".config.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=".config.gz"

H4sICAo5CmEAAy5jb25maWcAlDxbe9s2su/9FfrSl/ahiWU73nT38wNEghIqkmAAUBe/8FNs
OeuzvuTIcjf592cGAEkABNWePqQWZgAMgLljwJ9/+nlC3o4vT7vjw+3u8fHH5Ov+eX/YHfd3
k/uHx/2/JimflFxNaMrUe0DOH57fvn/4/umqubqcfHw/vXx/9tvhdjpZ7g/P+8dJ8vJ8//D1
DQZ4eHn+6eefEl5mbN4kSbOiQjJeNopu1PW728fd89fJn/vDK+BNphfvz96fTX75+nD854cP
8O/Tw+Hwcvjw+PjnU/Pt8PI/+9vj5PL+H9P7j79/ub+4+/336eX006fddHp3dns5/bK/+/Ll
4uL3u4ur+/uPv75rZ533016fOaQw2SQ5KefXP7pG/NnhTi/O4L8WRiR2mJd1jw5NLe75xcez
87Y9T4fzQRt0z/O07547eP5cQFxCyiZn5dIhrm9spCKKJR5sAdQQWTRzrvgooOG1qmrVwxXn
uWxkXVVcqEbQXET7shKmpQNQyZtK8IzltMnKhijl9Gbic7PmwlnArGZ5qlhBG0Vm0EXClA4l
C0EJbFKZcfgHUCR2Bd75eTLXvPg4ed0f37713DQTfEnLBphJFpUzcclUQ8tVQwTsMSuYur44
h1Fa0nlRIcGKSjV5eJ08vxxx4LZ3TSrWLIASKjSKc1w8IXl7Xu/exZobUrubrxfcSJIrB39B
VrRZUlHSvJnfMIdwFzIDyHkclN8UJA7Z3Iz14GOAyzjgRipk1G7THHojexbQHPZCgt1eIXxz
cwoKxJ8GX54C40IiFKc0I3WuNK84Z9M2L7hUJSno9btfnl+e970qkWtSuSuUW7liVRKloOKS
bZric01rGiFhTVSyaDTUkSvBpWwKWnCxRXkiyaIH1pLmbOZOT2pQx5Gx9VESAeNrDKASeDRv
xQkkc/L69uX1x+tx/9SL05yWVLBECy5I9cwhywXJBV/HIaz8gyYKpcPhKZECCDTMGpSLpGXq
K4iUF4SVfptkRQypWTAqcE3b+OwFUQL2G9YJAqm4iGMhEWJFkMqm4Cn1Z8q4SGhqVRFzLYOs
iJAUkeLjpnRWzzOpD2f/fDd5uQ+2uTcxPFlKXsNEhgVS7kyjz8xF0Qz6I9Z5RXKWEkWbnEjV
JNskjxyY1rar/vwDsB6Prmip5EkgqlqSJsRVhzG0Ao6JpH/UUbyCy6aukORA5xhBSapakyuk
1v2B7TiJo7laPTyBGxFj7MVNUwEJPNUWsxMeMF4AYWlOo+KrwVHIgs0XyEiWFB/HHv6Ams4m
VFmwfApNzR/uMWsuWJNSdQqpR9FrhZ+xhSJWf9YdvbZzRE8gpC4rwVbdTDzLwr4VuAVw/NF1
+pR0pyUoLSoFe6idhl4l2vYVz+tSEbGNK06DFaG37Z9w6N5uBjDFB7V7/c/kCHs+2QFdr8fd
8XWyu719eXs+Pjx/7XcInKal5iKS6DGMjHczrxg4QT4Y+TdCCcq8Fi5voHbTZIoaNKGgywGu
vA0NYM3qIroJyN/o5cn4FkkWPY6/sRd6z0RST+SQgWAZ2wZg/VLgR0M3ID4Oe0oPQ/cJmpB2
3dUKfwQ0aKpTGmtXgiQtwN+cHtRoz7GYRbfEX2p3fkvzh6P/lx2T8cRtNs6goyBzjq4diNqC
Zer6/KznTlYq8M1JRgOc6YUn8XUprQecLMDcaA3acrO8/ff+7u1xf5jc73fHt8P+VTfbxUSg
ntKwjjx45nVBmhmBeCbxWLNXLTM0PjB7XRakalQ+a7K8lo67YX18WNP0/FMwQjdPCE3mgteV
dA8LvJlkHlM++dKiu9imxexMpJMFVyyVkV4iHfE0LTwD/XFDxfi4KV2xhEZGBsFCaT01OAhJ
dgqOqvIEuGAy7kd2pIGHEaEc/VTwTkChOJ4icoB0ZRQ0VentGDiTApri2oWlAaidi6pgGDim
ZFlxYAO0iOB2xY2pYXSMjvRi4jhbmUlYJih5cOBoGkUCU0S2I8wEh6f9JeE6mfibFDCwcZsc
Z1+kbfzVj56aICYyAYD8wAsa3HhLw3kwWBCc9AAbX7XEc442zddHIH68goNjNxT9Us1eXBQg
0D5/BmgS/ojMCXEoF9WClCD8wnG40V1QefgbVH5CK+0kayUbOmyJrJZAUU4UkuSSY2xFhIAC
nAuGTOfMNaeqQDdu4J8aVhg0Z0B/6rq5xis0bpjTqvVw+LspC+aG5s5W0zyD7RfuwIMVtv0I
RAFZ7VFVK7oJfoIIOcNX3Fscm5ckz1JfPIXboN1pt0EuQIs6Opg5AT3jTS18JZ+uGJBp908G
p6cVOJ6EdviytFmHOYgBBvj1bkAFtMyIEMw9zCXOtC3ksKXxzrBr1TuJ4qzYytl5Z9rA5qAx
6meG1ZVJcGoQoX32mLGY0TSN2hHDxzBVE4Y/uhGoaFaFjiVbw2wzm9X+cP9yeNo93+4n9M/9
MzhXBGxzgu4VePy9LxUdXCvx2BSdhf+b07QDrgozh3GJPTGQeT0zEzpKhRcVAduvw6Ze8+Zk
FtkjHCBEgxMQc9pGC3E9jmhoaXMGgakAkeXF30DEVAF4i7HDkos6y8BdqghMHQnwTQ7SEwGt
trRd8mJyP5PYIl9dztzwa6Oz2t5v16BIJWqd5oBdSHjqCoHJrjZaT6vrd/vH+6vL375/uvrt
6tLNFy7ByLUulHNeiiRL49MOYEVRB9JQoNcmSjBYzATe1+efTiGQDWZBowgtU7QDjYzjocFw
06tBIkSSJnVtZAvweNBp7OS/0Uflsa+ZnGxbk9NkaTIcBBQcmwlMg6ToGURUBoZzOM0mAgOu
gUmbag4c5Oy2nlFSZZw6ExBCiNEjlBS8mRaktQwMJTANs6jdlL2Hp7k3imboYTMqSpOZArsm
2cy1dNbrlhWFkxgBa7debwzJm0UN1jWfOSiYCdSIY758rbN+zhFkYFwpEfk2wWyZa4DSLbid
sP3VYisZnEFTmHR9K5BzE9/koJvA/lwGIYUkJTXsjvtOEyPMWstWh5fb/evry2Fy/PHNRLBe
HNTKShHLQ6PgZpSoWlDjFrvaC4Gbc1KxuJeN4KLSWb7IyHOepxlzoyNBFZh171IEhzDcBj6U
yH0A3Sg4OmSHiNeECO0Uo9ShgORNXsm4044opOjHt7FMFJdxmUG8zE746rwAbsnAde5kM2ZF
t8Dc4GuA3zmvvcsS2EiC2RQv+2PbRkMZXMJihTKdz4A5mlXLGv0io8mYJVjBYH6TSK1qTO8B
z+XK+mA9Mav4TndEBtmdWDaqRW0D+G6QPwjLFxwtvCYrOhFJRHkCXCw/xbzoSno5zAIdoPP4
AGAj43a3051VPXII+rxLsG1wFsANNovxDxcln47Dqqum5JXP/0omgaQU1SZZzANDi2nild8C
JokVdaFFKwOtk2+vry5dBM1OELUU0r1+JBfnWhk0XnyD+KtiM1ATrYKCOUAfGlkbNoN8DRsX
27l75dE2J+CVkVoMATcLwjfupceioobdRNBGIWhC0yaUs3epDmP6wyTAgIyDgxCL17XlkeiE
ge2Z0TlMO40D8WpmALJu3gDQN8B6NIn+PYVmELwXbVDf+u0QrgwbBRXgO5kI1l7r6qAY745C
RVn4Ss2YDcddfnp5fji+HLy8r+OMWz1al0HEN8AQpMpPwRNMz/rpbQdHq2K+9tVm54eO0Otu
yfRq4JRSWYFJDiWmvd6x7OLdv5kNr3L8h/o2h31axhQMSwRPvIuxrqmTil7HdCBY7qnRGo71
D6hVMi+doM8TxPbJP2KtuEet3EftVoyorpQJsBrNfIbu1oB3koqY2gmpWBLLcOGxgacD4pCI
beWZrwAEClx7rrNtLBryHCztVZiuJOLVdeBW3AI4zXFF9lIYLy3zAAMz1s0S+dmU1fRKMM/p
HKTQWnC8M6zp9dn3u/3u7sz5z9+kCmnBjkks06a3EbN+EAlwiRG4qCvLdd4wKMBoIouW9B7V
DBBjGCXcPAP8QmeRKXZDR9vtrna7dzaChvuMGQetxQaaTS+chHsPJlyCN4vaAo1dmJIwwa3P
zrIggemrCxa0GAVit8X6wLgtS7qVMUwlN/rgw9u5GEb5Fw5kh4nZ2JHzlXMnWqIZ836AANUz
v6VgG+rViyxumunZWfz29KY5/zgKuvB7ecOdOebx5nrq1Est6YZ6fpFuwPAu5swngshFk9Zu
0VAXyIB2AK/17PvUSkbn7uusgxXfPserGQBzr5jOivmI7bgQp85LGPfcG9ZIWajCvSlClA0v
8/i9aYiJt6/xG4UixcgFJTSmRoE7WLZt8lQNU7A6NM5B71V4feTR2TbGDd6JuG4QlpM0bVr1
7cKKRYVCgwkJE5Ci+HQ61TgCL//dHyZgWHdf90/756OeiSQVm7x8w1pEJ0Fno2knAWPDa3tL
5PFzH5zHDrloZE6pd5UAbShguj3eZU2WVNdzOFzotNrStWnPLB50nrjdvCGCnB9Skq7w3iDt
QC6ZWOXWrv3E4uJ9zRWsSuIdk9xJCqw/G4cINEbGEkb78oaxhASemwMb/Go5XoslbBjny7oK
eYbNF8qmtbFL5WaRdAvwuAKDZ2jTPp10EnBOvAa4eg/moVPnjVYlwhAUcwcQI6tSFa6jYmHT
gKF0q6Crhq+oECylXRpobCLQgG5ZkgsisQPTkBlR4ClsA2pmtVK+hdfNKyAjZkPMOkkZjKJI
Cp6et58mcHabdJgnKDCLlAHI1k1AjND53nEw826JfOBoJzKfg3PgZ5YN2QtwnUnodGlFZVaF
3kddzQVJw1lDWISbxlmpSpANeNSv1DvFIcIEPR7SuwC/K68xy+MHWoavZjI4A3Rr/Jakloqj
26YWPHV9c8MLczGW0QAo/DVekahZr6KOGPvt9o4u4FUAjG1BWimnnAp/GTnuF2Ta4Lwytgo3
yvydORtSYVKTV8AHgUObgBJJsZ7ORxnxn1Az+vG85bXCrVqaZIf9/77tn29/TF5vd48mYO1n
tHIwVucT6d0NzO4e907VPYzkS0Tb0sz5CuL31LvE8IAFLb3KGw+oaLw010Nqk29RpjCgNlF3
/cNfoV6GE7Fq/3VYsNe6GH9p+k3t3Ntr2zD5BURssj/evv/VSRWA1Jkg0jGh0FYU5ocThugW
zElNz5zMsL0FwSyHc/4QPJbebZr2s7cyi1ctjVBpVvDwvDv8mNCnt8dd69P0m4R5ry4TMBoL
bC7O4/MOxtaDZw+Hp//uDvtJenj401xz9resacxtyJgo1hhwGYfNy1+x1PtprvsdkcUmfOpQ
QMyFfio4sjrMyGxi2LmhWDdJNg8HcFtbZ7fvM+d8ntOOQC+ZZkCyiCkcC8QwW+emBsGARcB6
J15KDn/qPNhYIN3SgTn2WZ1leE1kx3Z17nDUFiue3DXoq8o7FH1esIWTX+j34/759eHL474/
VIZ3yve72/2vE/n27dvL4diLA+77irgXc9hCpe8cYZvARHkBlJKYw2vObznkBx0/kk0H7K8f
3UHXglQVDcloM9kYkdrSny64wZJV34nHHrhvBqLNp4gGQIiYkErWuTOMA/PfhQBheDctMMOm
mJ9zwnJzZQr5l+CKKjYfiyH0YhN23rGV056CSkE/Qqsmfb/ayev/50y9IcGRhGht0ejkU7C+
9s4v3DzrF0gJkSF6oTnZygGXqf3Xw25y39JxpxWGW8M4gtCCB6rGcxWWKy+JidcvNYTWN2Pb
ik7aavNx6rylwQvIBZk2JQvbzj9eha2qIrXsosu2fGB3uP33w3F/i/Hrb3f7b0A6GpxBiGky
DX6i2aQm/LaWjyEmcl3vZXgh+0ddYL595mYAzVMwnTrCVGHmM6eF6nzAEMorFU5h58QAOwtq
vwb3w6Z8vYvm6lInObDQL0GfephL0y+iFCubmX1I006Kt6mxwRlsE4b7kfv5weaY1rGRIkt1
h4mtV8OzujS5OQi6MLKIvXEBNK+4rC+i0iMuIC4NgOgfoP5h85rXkbcXEs5Ze1DmKUok9Mgg
PMUsjS1rHCKg4jEpkhGgzZR7ytih3DzHM8UuzXrBlC7TCcbCkgPZVQPoNxmmRxSv5KZ8JpxP
Fphzsm/owgMCRxtkuExNwYBlLd+5Mnim+Ct6dvgScLTjYt3MYK2mijWA6cSmA5aanABJl9IC
39WihCXCqXiFcWGlWYRVsPQJszq6ytfUQ+gesUEi87flZMJukZ/Z7I80pj1i0EhVXlHUDZiu
BbW5DZ0ji4KxHD+GYlnPiIqpkbc3wCExVodYzsM8YIBh+5kbxhFYymvPjPbrlDTBSqYTIFsW
5NoZCzn51E5vfg6cEgw9KHTpR/Ugo9dHbTosVzx8sDyCANLrXjBju32KM6B6zRDXco72RUP2
Qj1FN0rrsqVXZBcF4x2FHi3AG3lbEyr8U+9qjEhyZPk6jTYXYXOrhUt9+wNGCuuiIjw1iheZ
yrAywLF+M8w36iIsDQRi0KkQcS7kmdbAajtYR9peC9IEVImTvwFQjXlONKRYsoxiGtk+umEK
zZl+Sxk5CJwaYYDC12WI0pkIPUN7vRFbgldgGDoFSEPUdvm9+prFXlTal41DIwsLZubdTFcq
6YfdszpQ8LZm8eJ8xkyJRWwheIrdNvSuZdd6Uur7G6CloR7Zn3rB0QjKX10bazutwBtQ7WNm
sXau5U6Awu6GcaLdY6B+cfjy7+K8vfzyjXPn04GT4Tlp/Y0QmDS3Ojl63+5UdjuX7gFTtC7s
OGTwhQJjGe17QeugxER17GGEr1lt3Tbog7ZgOyIu+gLecFwXMCR89duX3ev+bvIfU9j97fBy
/xDm+hDNnuSpPdJo7QcX2keebWXziZm8PcGvYWB6mJXRyui/CG3aoUCXF/jQwbUWuqJfYkm7
cwdvdFaoxMxLax1cuxxjgXU5fG/aY7R+4hgcR5Ai6T7J4KceB5gsVtpngXiYAr3G8CFrCA8/
jDCKOPKtgxAt/GxBiIhcuMYnYxLNaPcErGGF5tf4inSko6P+63cfXr88PH94erkDLvmyfxcc
F1hCSgf3abPcu63BJ1dgRrRABLoVQTKReF/12a/LbN9pzeQ82hh84KB/1qXoXDAVv/husW54
OfJsrMUAk8SVyuP1nPpBos0edWkRb4j1LJ50658yQsSKF/hlNOPnoSVcqnD8DlgJFk+tm4Wg
Mspip6w3Hqt3K5KHgxsN2SrZIF1iLs93h+MDyvlE/fi2d9+yEAg2TSRlb5KvvVsaDpFPhxO/
G2KbOIaFY0FyB3fUa8HmJApQRDAP4BS+JienKmTKZWxMfJqdMrlsQySnzK0E8mU9O71GCUcv
mLSlRKcwaxhPJ8e76eIFHWlxciVyzmLrAJ9CuNvtGP26jDUviSiiu4xJv9gwW7m6+hSDOOLj
HEx7QROwl8u0xWfMbvoqQZc1mC+W8P7ls3f3AN0YNwXrKfiaOHfsxHus5XbmBudt8yz77Obc
4WfTiuLgJXL/gQ+Pqo4zZTl1zqK0YicriLLQsA2c7b7cQXHMoohifT30svSHYlI9TFA0EqKI
dQzBfK6ptHnbqkK7QdJUWxttO2LuY/vErpnRDP+HSQb/qykOrik6son6HqOvpjGXEN/3t2/H
Heaq8cNiE10Ge3R0zYyVWaHQn3L40DhXrl+PwoMZi/a7FRiuDF7q27FkIpjrVtpmfHHdXxrh
kDZz0mfXR4jVKyn2Ty+HH5Oiv3AclhidKt3s6z4LUtYkBokhQ6wN7jaNgVa2OCosMx1ghHky
/ILMfFA6Y+sqLfW2qsDTix4kpqCqHOKuSulIQBeOX8ZmsGhYMa18AdHedJBv1VG5oCgzXnYA
TIUIokZ3EoXFY0MULNDTgtCo8B2geQbCMar0U13DJN9Suo+jLEvqszCfxEnF9eXZ792DudMJ
iWgaguRrsvXulqJohXn7OxZFmDwsboWfgB+2eE/Xls7qkpwSUw3ryjiHcYNvYyX+txhs602I
phs6z5d3pbn4f3SlopZxtNPY18JGO3y6jD+fOTHD/3H2bMuN47i+n69wzcOpPVXbNbZ8ifPQ
D7RE22zrFlG2lX5RZZLsdGoySVeS3tnZrz8AqQtJgfLsPkxPDEC8EwRAAKRi+sfI9+Ff6q8n
VZmP/vNPz/9efLv/yab7mmdZ3Be5OUbDuh2a+TaLaamZJJc6ZtnbUov880///uXHg9PGLtWQ
sQ3VV8bPjWl1003sWXXbBrtrGqaMAtRte3vFhneb7b2SIQhEbXzx0MzZh5KqgCd9nFtGsY4i
V4GotlkQtRI7LLaFzAOnCOVurtJLQRE1LP8ddYznjZu4GXeigou86YKAtw/yHRp31AwUhhRG
BbkARuCQqoXVR2WctI4sHha81EdWd3z6T8iey3SmkvTx44/Xt9+eXn4dnqNwBhxsm5qGgPzM
qHMH5WtLBgPpPbQujhXM/bpnrbEnxnJbJEoIIrGYHQWmhv4yAgaLidJI5Vykdu9ErvNlYMY1
OoAz7316VeQUdXsARHlqrnH1u472Ye5UhmAVruGrDAkKVtB47LfIPQYQjdyhuMaTY0UFqSmK
ujymqa12gfgJfC87CE7Phv7wVNJhrIjdZscxXF8tXQFOS83oOFGF49IzYrppnisjhe26awJx
QTqgMsxbsF38Mcr9C1hRFOx8gQKxMC+yLDJ62WLt8OeuW21Edzqa8Lgxbawtm2/xn3+6//HL
ExxYVulJtKRNcDCzK3uZnlbNWke7Lp1LSRHpfDgY4VVHHjMi9n41NrWr0bldEZNrtyER+cqP
ddasiZKiHPQaYPWqoMZeodMIFJkaw3XL25wPvtYrbaSpyGnQhUm70Y8QqtH34yXfrer4fKk+
RbZPGB2Hr6c5j8cLgjnwm02SHBaW7zNMGYmnVcKKwygNKAbKqgmnapI7BkOTWF8W08a6fAQJ
vCcKPe0UmADNw42LiJ6i0peHlpV0GHgceGrYFCLaeZJiItOQdI61U8zSej0NZjckOuIhfE23
JA5pIZyVLKZnqQqWdFEs35CIfJ/5ql/F2TlntKVOcM6xT0s6yzCOB2EgarscUml1ohS9SGSG
SaMtoxNMFFMWVrKwLOfpSZ7FIMKqHX5CvLD2C+YN9x4HSe45A3XKN7rKvfQLQrqlIAt7KeI5
Zg1Bdu6juilKfwVp6ObAbPVObblDGq8Z3aAJYyaloJirOkMrVP9vazuF1+YmdsTWycfj+4dz
q6dacCidBKL2XioyOAKzVDj+H50IPSjeQZjisjExLClY5Ou7Z6l77jbYFgah8PGWbX0IE2Ls
zqLgsfYB7Cve7nArzQb3Dh3i5fHx4X3y8Tr55RH6iXa3B7S5TeCwUAS9RtBCUOlBrWSvfIiV
VmZEMxfbgyAjD3Dsry0pWENGQnJCJjz5G3m+B6WQZjvp1pMcXMKp4ss8jMLjlsZRp2LLVzCx
kG2XgVUOzbNSwKm9iea4RFoy5ZaJGG3DRMG83OMzAS0TaVd+9PjPp3szIqBbfOgAIiQzi8ff
RNFNbifD8O/+aLJ/2/puKJT5D3YmUSZimbRiIhuIEW9olaVwKm5IQnvo+bLI0Gb/l4j7nI1e
QtCn6fNZBZ1ISlBEzM1RFAd3VEaWrwomK4/UgYQoNLvifu3TUFpfiozm0IgDJuvHMZq1qird
a7Y2bg3DXVwWgbD715ePt9dnzH77MAxDwSK3JfzrCzxHAkzs35qCBnVEj+9Pv76c0fccqwtf
4Y8+HqLjvGNk+mLg9Rdo3dMzoh+9xYxQ6W7dPTxiehCF7ruOOcX7ssx1FLKIw0JTCaBUR72j
8OUqmHGCpA29ulhzd6NHz0o3Y/zl4fvr04vbVkw2o9xpyeqtD7ui3v94+rj/9hfWgDw3skfJ
Q2/5/tIMvl7FtcNhjIpCVngy1LJcOEdvHzvwdN/wy0n2fRC6ddS+Unse5yQfBjGpTPKtlU5S
Q0CEOKa2138asdhy+QSdWRXfBWap10laZt5FXTy/wuy/9dx8ex6EwHQgZTCNMM+1cVVXlQXr
g6t+MtT9/jvlrOztZ0/XWr2tutszbhgx0rS9s1gqJxl0+7Du9rqxQy+KqBAnj4LWEPBT4VGK
NYEKn9fFgFiPbqi0eoZkTN2oNsTKHWfEUq18ZY9l5nmLA9GnY4zZ/jYiFk3kUbsI+c6yQevf
tQjCAUya/pIdLBG9ub0BnmcDUJKYiWjbSsw3MvpKanZKLOuwZ0N0QZoPSr4wBIskq0puxcZJ
kajYq8TdqO0Xe6Fu74xPGtDISdlSIDMhjgorRLNto8E1MhDPPO7cu9Rcyvirho2AdnQz3g/B
CeaRVyhPMdD1Ytt/bWKOm2qASEorjht+qgU5jN7qfTS+3729W3IdfsSKK+XbId3STMcPj2ce
UGXbIYGBhk2qIivbGgiUDlrBW2ftjfZpZtdgFaEikpTrKmm4HNLjVQjehNBeK+2IqIE6wp9w
hqPzh07NW77dvbzroNlJfPfnYOg28QF4idMt3QlnLBWwLqjECtvSmNR08KsuDNcR0eANbSjC
AohipcTkql1RMrErUlOX5U7b1UWu0/TO7weOBa3cD1ZYwZKfiyz5eft89w4n8Len78ZJbq6o
rbDr+8IjHmpmaMFhj9YEGL5HW4qyBluOyy0yzdyr6BazwaxeeMt1Zh6vzoYw/quEO54lvCwo
p0AkQRa5YekB1Oao3Nczu7EONhjFLoYdFTMC5pQCojc1EirkHo50T7vVGCeRLKPh2IMMwobQ
YymchQXrwQFkDoBtJAguaqm1b3r415CWwO++f0fLSANUNgRFdXePWYichZbhIVLhQKKd11kp
6B+SqIU+BPbO3gSuTSS1thNJmSQxTz+TCJxPNZ2fAwqdbekq0eWZwQBzGr3j6MjoTnOHzTEz
YxRRB5eahSS6WlWDyRHhvgFapXK5CQpP/lE16If1dFGNUchwE+AVuG17NAhSXn48PrsVx4vF
dFd5S3V0Swun80ucCuAMtESoCgDtCpYfKRFcWnb6gZfH5398QsXj7unl8WECZTZSBKXQqBqT
cLmceRsUsZKNDVMS7vNgfgiWK3viEL5Yx6vF1GHrsgyWzh6Vsd6lzsIZjINZfBk5aPeEC7RQ
olXvp/ffPmUvn0IcLZ9hSfU2C3fzvnEbzPIL3L2sk8+zxRBafl7003N55LVFF3Qnu1KE6Iht
+0hMOWJIIO5FDM89F6J0tmNL0b6NRH5O8OMWFVR43O3GBh9vfpHWv7kwU49DoN0zwxCG61cY
IMPO4A4FENldaqGofO8ZaAX2s1oeEpAzaOOoS7/xJJWjGtvZx3EWVZfiHJna/+r/B6D+J5Pf
tWMKKXcoMntSbtSjpK2M0VVxueD/cYc8K9xd1ICVA+9C3UyCdOuXoFtyec7btBCePUZQYsjf
CeMThJ24xCU/ODnren0rb0QC9ZePlzpUTT5yTzOPG0fMA0B9jlXwoNyj25fpONkSbPimyY8X
TF0cerNaym+L2MVHrmqzOq6KQ37kHXOV5ZxWMCMzM3Nm5ebM8Gk9UXqemQUsejeWVow0AA/Z
5osFGISuAazx27ZgltYNv7VHUf+7uXG0YE0OD8fFzMiYl6tICjcTXgOizLqpnQMxbS5U6gSa
iwkdh/rm2+vH6/3rs+nsleZ2qr8meMcsuY3nSY9xjD/oC62GaDseE4TGUynxxBL5PKho2eGr
j922pcSgII0SRMVmvB3pBbys1qN4XwvDCMQsvIgMoxNdA0gQai3gTc94FReaWEh7+PR5ekr4
MK8QQtszdTgU+Alxa4ffaHcVDGL704Lvz4npUKpgW7aBE9YyVmg4fe4onOM7YqFYsbMNUAYY
7zokcC0yD7tBhgvFV8RouzTJwLWlPe/MUdZK0NP7/dCIBqqUhAMGuKecx6dpYMZnR8tgWdVR
buZaMYDKfGhmAzRQwOkp9nhMklvFmozPxCbBlB8eLw2W+p4tKMU2USuGqAgm+XoeyMV0ZtbE
0zDOJKb5x0d/Reix4+7zWsRkGss8ktfracDMC1Qh4+B6Op1bflYKFlCpi9vxLoFkuTRSGLeI
zX52dTW1rJoNRlV/PaUZ0j4JV/Ml7TYTydlqTaPwzIGBAMkqnzd3ffQZ7uMm0bmuUOVQbNN7
w9Re8PheWa/wuaaqltGWm6/YB/arR/o3rCJoDCvqYKbGT8upPEflcSCjajhwtGDRixU9cGkt
Dw32Jmhr8AmrVuurpXHFoeHX87BaDSq5nlfVYggGZb5eX+9zLivrWlxjOZ9NpwtyXzsdNdj6
5mo2HeyHJgXXv+7eJ+Ll/ePtx+/q7bD3b3dvoPJ8oI0Sy5k8o9D8ABzi6Tv+aeqcJdpuyLb8
F+VSbMe+hmDoIaey8ufWbXCbI52WMTtsnXg8EjuCsqIpTvoa7JR4xFjQz8439Kc83NO+NRhS
Bj0KMYGPz9KAJAVmYfdR7NmGpaxmnmv1U85Sz5WExfK1tQG9pBotd7BZVIh2klkhIgUTESas
KyhxFz8wOBh+bgU2KIh6jUDdUvYtaKrWyb//Buvjt79PPu6+P/59EkafYH0b+Tc7ccdqVrgv
NNQfgK3QtOGm+5pyNO6Q4d4wgWNPQrQhMOsBPwWPs93OUXEVXCWtVHd8gy2pRqFst8m7Mwfq
egzH3DoGELMNh5NhUwj179iM1RKz4Kni/xzAY7GB/w3q1Z/Qjp4dgfKmkB43aE1V5FT7W4OM
MyjOx3F29r30oZfefjAD0b4uIo9ncUugQt38ZdY8CQfDAWAWH5m/F84W65hbae4OPDb3mZVE
DSAgeG8yTOmDCeZslMqSYXYSgSqlLdlBdSzb06EZu+HD8cfTxzfAvnyS2+3k5e7j6Z+Pk6c2
V6T1xJqqax9Scl2HI15IVeCQn5gDuskKYb3OqQoRwMpmq4CWcXQ16GkxaIhNI0UcUFF5Cqee
zNCbELp8747F/Y/3j9ffJ+rlaGoc8gi2oO9daVX7jRx4b1qNq3xN2ySae+rG4XYjW6jIzCap
eRaCCqZRNUbncDDQAFOP8ERkVGZHMkjy32FO/htzRZPQHmIKl47gULxxIlYHkzuG9LBGhTyd
/chjPLKgTmJkvk8CpFpJPEL112cwVyvb0wKNTGhVWyOL0mNt0OgSFscoPl+vrug9pwjCJFot
xvC3yi3HT8C3jN4RCrvPy/mKDo/p8GPNQ3wV0F7MPcHcjxflOphdwo804It62GqkAaCuwMFF
r1tFkPIyHCcQ6RfmJum2COT6ajGjoyAUAex2l0k4BHkpfIxNEQDrC6bB2Ewgc/RFDysCdEOX
tyMrpYg8DtJqA3tiHTQSdHpeYKzOSPHAPFZrjz/oGP9QyDKTe7EZGaCyENuYj4yPj48o5Fmk
m4y4g8lF9un15flPl5cMGIjaplOvHqFX4vga0KtoZIBwkYzM3ld8J2nQg9a16x93z8+/3N3/
Nvl58vz46939n9QdJ5ZD+lmZFQ2V9F6hopdfYy9zFeQOvz1KKgcSBvxMZvPrxeRv26e3xzP8
93+Uy+1WFByDHOiyGyT6mDiNbnPHjFVj9I2FoMhm+FyVchqkRHxgJfqpV8fLv8mY0utIsNZ8
cWzKUEdisBu7o8/Zld+o7NsjAdE+kyaaMrnvCpOFGExG6/W5F3WqfBhcXh6/zA0r+DGiD8ud
J0AO2idd5+K+X6FO008vyiPdQIDXJzVpRSZBKfNYLHz2+TROPKcROjP64t5Y4UbktbOKmXyt
CyRs2omnUVbU8zCzU7BnRelhgeVtvs/IzFVGeSxieWm/3taAlAvNVpAGX7OAHbcXOi9n85kv
0rz9KGYhXs3bb5jJWISZ9Gyy/tOSu28h8YFFpkVp61ZJpmQxC03YV+v6wkTZ2daSaD2bzbx3
NTlOqkdwwFdIqh3pdWxWCJs6LYUVv8NuPDnIzO+KkO4ALqfMfoSqjH0RnzHt6oIIelcgxjf4
F1bBpshY5KznzYIO9dyECbIRj/0prej+hL6FUYpdltIiKBbmUYjVU2Xu5av5IbWd7Q6HzktU
m5RSCI1vmrgSy2GAkZGt1kcncbTGtdwfU/TpT/HZeDqSziQ5XSbZePy8TJrCQxOLm6MbpkH0
Ys9jqVzc+wnVoLqkl2mHpqe2Q9NrrEfb3SdaJmRotcvlQMQnKmGWtau1R2DH7+k2VTUPGY2L
6PPDqDSyObvOfBEL8orV+KqJM+wrigP6jl/CVLvhdcPy8D0kbl28bHhwse38a7gXlkODhtRp
LjFnGxw8CUbUuFxhWJJ+lIdkjvsjO5sPohkosQ6WVUWj3JeY+Yx8OJU3z6ZadFPPjcmODmEF
uGczisr3iXvI9JiFt/YLy1ep3Ji73OzOF9pPwPhKK+IW8zolvtBoefDkPZCH2+BCRVALSzNr
kSVxtag90d+AW/qVE8DK8yh6S5mwneGyl8hBrn3JzhDlcTHVKKiRtlUc5FcodXCX5Zm+wX5K
w2D9ZUWrn4CsggVgaTSM9tVifuGA14uGJ/QGS24L2x0afs+mniWw5SxOL1SXsrKprOd4GkSL
7XI9X5NeA2aZHCRIJ8WtDDwL+FTtLmwI+LPI0iyhuZHtHg5HQ6VyCv4HrG49v57aHD84XF4d
6QkOY+toUlcfkSPkDj/MDlaL8cXKC3ykyRzG051I7ce69kw9OEcO7C3HYMKtuCAC5zyVmO3f
usjOLh7NN3G2E9ZBeROzeeXxRbuJvVIllFnxtPahb8g4KLMhR7y8TizB7SZkV3BouC4+A/yR
ecTSmxBdHHwJf4rk4poqImtsitV0cWHTFBwVL0uEWM/m1550O4gqM3pHFevZ6vpSZbCQmCQ3
VIFJWQoSJVkC0ot92YLnpqvZEV9y86kjE4EZqLfwnyWtS48NBuD4pGJ4Sa+TImY2+wmvg+l8
dukra3PBz2sPJwfU7PrChMpEWmuA5yL0Bfoj7fXMY79XyMUlpiuzEIPYKtoEIkt1rljdKxPM
O3556o6pzXLy/DbhzHPDBcuDe5w6MWlN6jlWBOmDaDTiNs1yaeeQxCu+Kt4l5MvQxrcl3x9L
i+dqyIWv7C/wlWeQbzDFlvQk8SodW96wzJN9YMDPutgLz5P3iD3hMybOGwLDYs/iq5ONUUPq
89K34DqCOSmEG4Vrvzez8MYTDtljLDzZ1RoaVgk/G21o4hjmw0ezjSKPx5HIPcxdpYvZuEb+
3ti0v/VlvtECKMqP19dLzy0TCuK1Nl6b+Cbpg6QCo7okDgOs0arc45LiKJ6qwP3r+8en96eH
x8lRbjpHJaR6fHxo8g8hps3ExB7uvn88vg29qc6x+eA5/upNnIk+jChcaVkg8UnOkWfBy/3S
J03ZhSZmbkkTZZi8CGxrViBQrcrpQRVwSlicLUOPPnrRFEImS8opwiy019woJAdx0Tumpq5B
oAvWmBcoXCc4UEjT+81EmC49Jrz00H+9jUx5wUQp2ytPbTvNmQ0vqvDK6Pnx/X0CSPNi6nx2
L0GaLWN9YHDGpEKDMc0wjl9EKY+1PwErhrQL+ohStz9EVqleMJaRJzPaKRl0V7x8//Hh9WQU
aX405kD9rGMeGSHrGrbdYtZ6NzOZxuk0+Qf6/WJNkjB8WuOgw4u6PADP+NJ45zz07jQLk7NI
rgNYSDgmAztWXqwEPgoyffV5Ng0W4zS3n69Wa7dbX7JbJ8GeheYnomn8hG5Av5tD74vK1B8c
+O0mY4URTdBCgPvly2VgRJnamPXa9836mvoGX1u2cpb0qPKwoRpwU86mS6p+RFxZ2qqBCmYr
6jDvKKImoWKxWi+JsuODbsywaAy0HitYBWJjvkFOdaYM2WoxW5ElA269mNFRQh2RXsLjNHGy
ngfzsUYixXxO9Dth1dV8Sc1cEkqiP0lezIIZQZ7yc2k9UtMiMBEmWsao0gidqh/XLI62Qu6b
d1jHeifL7MzO7JZoFhSPEztEiBu5Ciqy5gz4BXXc9ROXBHWZHcM9QKg5P8eL6XxKYKrSt8pC
loMKdGGeNyHNug3uMoIHxoJJlmnDvCZRKYU9Kcw1AfZac6+xloBYQoxfkYjFwM1BAUXgMzYA
ko5V0qhkYyQ5QshWRfo4EJVfJ3PgQdREObj0s9kAErgQc3YbyGIAYS5kuWyPof3d24N+9/3n
bOK6mNuNJYI8HQr1sxbr6SKwdFwFhn890Z8aH5brILyaTYdfgtyaS8qMrtGgSADabUXBzoZX
vgI1d+oEMYAwPHDwQRE21E6LWL4Za5HmxGY1Rz1SfcIllnA3PLaF1amEM4xchh1JTN8Ddnie
HGfTA22Z74i2yXo6I0U+alV0HkiUQKUFyW93b3f3qOMMogdL873akxmqpZ1e9KM0sftW6Kls
CSgY6GWcm28SnUnqHowPOEXWEx34nMP1us5L26ihvcYUmL5DUJnTMcma++Bkk6rj7enueZgm
QGfX0k+JhNbDaBqxDpaD5d+AQbnLC64yUrWZiTzLr/3AesLBRMxWy+WU1ScGIDtGxSDaom52
oHGDQbbaacX1mO0xE7SaCF6xgsakhTIOG68/mdgCn3lOeEdCDhuvQCmKSPO1ScZkju8Wnf6f
sSvpctxG0vf5FXWcOXiai7jo4AMFUhIrSYlJUEpmXfSq3dXPflNp+7nKM+5/PwiAC5YPzD6k
XYovAGJHAIiF8vLU60WFmIQQpvdDlOcjxpqOe1q+rUsHIP9nq8GEso7+7dcfiF/USA42efsA
9A2nHIR4FeOnXoPBLS21SKN8kdh5ztA8IPyZL5xLj4YWhxmmTSNqo83+/keOnENMIK+PFIn+
zUnVkI7S80ZCxi5jZ24FkhymNc/G0XLoYsMbCQ3zRQc1ziYTKuSsNB5HUPcJeb/pp03v41Cc
5OC2izfhcOBrGI0PGW3QmYs606G4lb1Yo34MQ3FyCzY4/b06XUh23HkYsnLrGUhNW/b7bSKY
xEhU9QmdPPoOv3ZP8JGLQdRtF07y1BdS8oatzuiRgMJIl/WpZmIX6UFdXCZUNTsV72DEj3n0
i1kI+3oGpD90X8ssTLAci7skY/ez1xk29I2UkJwiXJTZZKmuA9bL3utYqFvExvN6LTl4Sz4E
PfoZrxcmj90n+GL4OJeN5k9pOfAZUotOnaKBgUF8eZw8Lgou10/XFj53kC8S+pQ9SGRoY9ML
KYUWJFl5YxjUXVsLAf1SNp7gTu1hujpX969HiuG5fFoISyrsvHEnOxNlYBMhyLYVWnlXNuvO
dwUsndQVOBQ7+DC4ctCzjVvMBxPj6XJCyFh3Z7HeGJ4nuo40daFPoZfibvQkhWPzPKJd7thF
mUhiOiI4d5X162GF0ZxJmov5GSouJ3au2JNq9LWGAxN/upt6rXt0suSrubW1TlTjWW1ixOfb
GRW714P1+n2YjqiXAwiJZbC+WJrPOn653a8DfEsmrov5fksk+S0Pu/Yxjcr6g53JfSA/+/11
RM96S4sMcfypi3Zuo87I5NvEhxqbupgTzPbbKna75tXxFj47VHcOVMsxfurv/kbBG7qbdsDX
EXJRu3jhVneyEQO34IZfBUZuuES/XMWB42TEPCWqvAAiv2Ym2fZoKWlnwVrdDR8ugoyjuRGi
PHvLc5WZU9GcrhRi9c0mdqzQa7acW8nH8lrN6V3wA2+J/vNv376/4w9eZV+HSYzt5BY8xe8f
C+4xJpR4W2aJJ9aXgkldfwt/tB5BRc4652yvgz4DOQW2nps3AZJVGL57kFNZal/5C6XUtcTu
j8PrEQuveZLs/c0u8DTGj8oTvE/x7SXBPru6Cet61/++NJt3jvLyW0x6O1/n1b++ff/y9uHv
5N978uT5n29isH3914cvb3//8g96Ff7bxPWDOL6Ri8//socdIxfi9lW/wVFWvD5dpA8S5CPP
ywtff4mpaqt7ZE44KZ+92ZSHCsxXXz5Kb4Nmkqt1ty5HCyv0g6tRtP4JKmGqTmzJssf4/qQB
8TZHAxer4q9CyhTQ39S0/jy9r3um81Bc+aMCD4TX7z+LVGs+WveZ3d02I+uaUvfk6F1zrEGJ
46dIqCl053oLafLwgxByjUQeAu0GVR7zvLq/KwstnO+w+HYkfftYShbrrpgoSpmgTF68DYHq
RQPQCeXO9JSrc8eaNiQBnJnm8tE8Lnf14oFAIy1l0GnVcoVC8k77+RsNmtXThfZQuR4fyM2K
PLzi0wXBo/LGotRDUe0EKLawQ2Fp7gnyZCjjSTSHZ3m+FSWo9Dy/jZahtlYXccaHBHXL96aA
KTCDF7+M3YNOtD6FTuLxPFISpM7EB7MCRFS1MrJRlzQPDp9viOEqZnR9eTUz68YiMm5gFpq8
fTTopGBpqnoQlbMwFxtMENkFUtdJ3mq3Y+0r6Sj1Yt9MfrWaebP79Hp5brvH6XmrqS1PD+uQ
/vPr919+//rlL6RsJAsrlQYW/tmV5jQXvpnM4k/JcHrvXK/doaCTiViKTGhoqjQaA6f5Givm
lT7sbE+lUxQRLQM60da8jtMM3WCeuda34ocho6pXLl5bBvEr+esv5JFMC0NGDpyE5KqXoOuA
B9KhE4l/++l/YGCloXuESZ4/mO0hVm1fMkbdh0kLjrRAvNFDv/8mkn35IDYpscP9QwaUENue
/PC3/zY025zyzDUS+dCli3aVMYWCmYCHDGqobd2C3uqKJRq/oD+ON5HMfKihnMS/8CcUoB2s
aYeZvg26cy5VweMsioxumJGxiwKkXL0wtKVZNiKWxT5Io3WkzPSWdVHMg9w8BjmosfbaqItw
0Xnm1dCCjGESINFnYRja4wi+VYxZluoKMTNyZVWj+95cUsz6bA8+Xbg5hTkUr0NfeDzlzEzs
XPX9672usFucma15FTuEHZ7L4nEM0JYua0pyKvzk8Q05F1cc2PFdwVLW4nK5Xigj9BVWlQWF
1sO6B8tIqS73qt/+TtU8nelVQ33IBsU+OvDDrT+5naVsJ3G6WnQkAU6ij/RA1eNERD3WVVOi
CjfVSy0Lsllhfrv0Na/e67yhPk2FmMTw/suvX759/vbh919+/en7H1+Rwq2PxWmy55vYEw+9
sv6dVxExag2RYSJIX93ky3dy5p2ES7yL69G6XFbxKQzH0HMudf9sigBqaQLpmaHrtpAe99Ci
zs75TapUbgqWXbdV3t7fPv/+uzgSSpHJOXHIdNlOiC5TsKz1/b5bdBnw+77E27JDXamKvlhm
69TypegORkQpotLrrC+f40D/C0ydDb0Ztg+oirP3HnYlfm5esAsRiUr7pzvW2VEtf8hT7vFE
JBl40RZJGYlxeD3gWwnF5pf/FP7KmceVhsTvY57gSw0Jb8iDc3c+jp5oBhujSQkqQhb4YUJJ
n2NjvB2zUL1Ym1+vhzzzjQHOznEYakK3pE4uimwqD1O2y3/Uo2RtFW65WZHUL3/9LiQlt9Cz
NuibRb10Fukkjj/mKqlNTiRYrnA0ohkdjZP7fDPDjhX7BF5urHAWWIXr2DFPstGZf0NXsyi3
PS1px3GrbdQCcyz/jTaLAnuV7OtP10thUQ9lFiRR7lLDPEyc8kp6lPsqfyhF3cP25W5Vn4Sz
JHKasuni/Q4plE5onsX20CNikiYW1RWeNHJik4eOC2KeInIU2kNNkvPUHiKSvA/tRp7IkZ2J
ras5U8lo0aK+tHkc2p8jYhI4/SHI+z12EQ1GyRI21Rk9znrkvZ1W/TzkHiVS1e5C1rniK+hp
NtQPcrPxCPEN+cxUKa7Iow5HXH3JYp9TPrWCXcviXjee12zQGMvJeXOKib07THfueIvDvdN3
agmyZYmWxXGe253f1fzKe2emjH0RigHkXcXWGJjzM71bAVmx+y9/fP9THDE3tonidOqrU2Fc
AU9fYU+3Tl/fYW5zmpdwlojCH/7vl+kKdb2FWCr4Ek5XeVIJ/YpW1pWl5NEuN46NOha+wKjz
C4cp+610fqr1xgPl1evBv37+X139UeQz3d2Kk1RrlU0hHL+pLzhVK0iMommAtiRZgIxNSZc1
nqRhDIsjE6fvFSjyJs6D5L3EceD9MlQFMDmMOAoW9GA9uo0zuTxNJo7mGMjywAeEuG3zKtjh
JHkVZvosMYeNdj6TQeP7ikNL9yWkfDdFHgX0rcjuZaFYkTZEMeb7KFG40dJy63nQgLohc6cJ
n9NpVFIBtXOTwY19ZaBLuBM9BwtZJUi1Nj4Ug5iSrw/2EgWhttHPdOqTNHD57U406KFeLgPB
z5kzCz8gRdy57AJF+R6eo8zy0mB/WchDcQDLJCWl7aRhAqop+jTMgp0fiTxIFBpi6Vw3IbGK
fol9DqsUkxxIcFuaOUheizLtBWmiT0+QIEfyKrI1YJohTpMQpW0GtgvTCN06zixlNcjHTVn1
XZqkbslcodFE9jEut2iJPTpHzRxiVOzCZHQ/KIE9+B4BUZJhIIsTmFXi+0aSmy5YdGifowOS
zpHqLy/L+G8P8S5Dw/hU3E4VdUi036HVfuGb1O7csdkPSRDHbk36Yb9LErcsN8bDIIhQ34hT
yX6fYCGyvyRDGubeZUrFj3ozfj7udWmTpudZdd+kVLiVF33wYL1E8jnUw+10g7GhHB7Nqm7B
yiwOd5C+89JzGFOobMMgQh1lciQoUwJSH7D3AHGIgTDLPAXcR9C9y8oxZGMYoFwH0UweYOcH
YAEFkEa4gALKPJ5HDB58T7TwnIdws5o8zlCRORPnX1TkkUIfXkinVMjWDSr6U07eIzdL9RQG
7/IcizZMzt6JtIavIkvdlqE6kEcJRCfrDUAfxg7UmIn/FHX/oKDgqLoz3nF8ITjzSdfK79a6
5OlmgC8KuhWFqBxl1TRiBcWXpwuTFAfEyPH46pnY6uRJHNqxx42lf7JQiO3YZZ/Ok0dHTzyH
hSmJswQbKCmOEwfd27IwzvKY6uKCR87ObYma6dQkYe4xBVk4ooC3bqYnIScWME8xVzarOKlD
oReimeVcn9MwhhHa6iTx2OIsI1AOLLfEdBXrUj+yHVxzxFTrwyjaXnSa+lIV0P3bwiF36QR9
QUGZ13DW5sM6xgbXHsxwBUQQEDITnD4ERZ5ABwZPhC05NY4d2NYkkMLuVdDWZknCZYg2EAIi
0MNET4MUlEMiIdhFJZDmGNjDTVReT2XR9tBXTPHW+KXQd3CzkUC893w7TXdbXSE5EjA6JLDH
rSaKuoed1LIutiQah2dgKfQ3s+Adj+I8RRWtLscoPLTMlg8Xhj4TixKU2dg4wlHVerSNVwao
HqPB4HOCiid2m6GzigaDkdW0OZq84vQPqWhWtWh9a1q4KLRwRWj38Gv7JIp3uKYCgmcQkwOU
tmN5FuM1gKBdlG122GVg6kawtiNB2YxsEDMZVIuALAMlE0CWB6B5Lh1rMzzA5BPUHjVE1yo7
JDsBJpOUHqUegT/Cw+1QNY/uuLUJHbri0fM0gK195N0jRpYcy755aB/seOxAccuO76OgOLhI
feHdrX/UHe84+mrdx0m0eSgSHGmApTsB5UG6tbrUfccTFZrWRniT5kJYQuM8SgLU9nIHzeDZ
boIeFLCjKbZHouCN89CzDSUxKuy0dYHjptqhPGmiIIvxWi+QBKcRiz1aVAjZ7XZ4GyjGPM3R
e+XC0UV5jrbRTrQaHMxd3e7iCLtwWOdOmqW7Yautu7ESOztog+dkxz+GQV6A+c2HriwZXpPE
drULdpvijmBJ4jSDO/SNlftgU24ljgid0Mayq8IIFPdTk8IjXffSkngN6ncYeI1Kx8W5GL05
aDiSSAQ5/suT3+6vzS4UHGxbfgDGLPbi01ZClgITuRKnoR2SDwQQhR4gpRtxWJmWs13Wbi1V
M8seniQUeojhBeY69gYOp6Y4xKZIdhWyThjlZR6C6VWUPMsjH5ChmwzRALlnsb0UWGNUZ8C7
okDi6F05MdsUE88tQ3Lr0HYh2qMlHfSwpIMWEXS4TRAdjXlBT0KQPzk7Zd1tOnk6tRRwmqcw
DOTMMYRRCDvgPuQRfNWbGV7yOMviE0pLUB5io/aVYx/C2wEJRe8mBq0h6WDQKjqtTpNWNfpm
IzYi6CvM5El102UNSqPsfPQhlYTcr8qnt61PzhoizgiXIa/D4KGfV5Dxm3sZScai717oDU9B
qO9jUuYtjKabSOT8kQz14WybefhQDDV5EEPtOzNVbdWfqgt58aHiXY9Huk8rXh8t/zGwma+a
5vpMe+lr6YWMgvV1HJV1Mtl+nK4UX7rqHi++eKQoxZGuGPm5gGGqUALyIUW+JnXFzZnPzBAV
1ltIwEdGSo/JUgnARkHWt5TuNnOB7MvqfuyrZ63rnf66KfdPLiQVYJfBM2tyLVlpU0Gp+KNi
TA4pv3/5SqYUf7x9/goNBeVMkAOGNUWLHriFtLgU7G6ZQRLWPdGzdtuh4qns+ZU9yoF7Synn
nGCNd8H4TmGJBeWzKBZs5uXUm51xZgbXwMja+9o4IQEX/2CokTUNgmJg5/KKIqpzfhCNz3l9
MLxL8YPxgzyc6JaRMhWrZVBxmHpGTaIKjEiYdDOkpVxXOYfNU+iJyVQeOrC2AAUi8jqaJZMq
OkXFhtwLbryjLgCHkSskvhbeSToXmbzPsxZrLhuMPi1txWRrmSg1VLJE++efv/5EVkuuU+55
Qh9Lxxkj0Qo25Ptd4vEATgw8zkIkU8ygfuDo2pppaq9mRsUQ5Vng2M7qLORzQlo/WmHfVvDc
sBL1BHGIRkr2gf5CLqmuMqzMjsybtCf6lTaZKBkfb8m9AxLKZI2lHoluTDQTTWVbymh6ScI3
9BoDKINE0DFnBs0n0YWK9EImMEwCswVOxVDJoL3y8ciA6OFoHEdIlHZbbwgwzL0k0EVptDdp
5zoVIrRsthUQ575HV/CaaVIj0USOloI5ZaGWzedb0T8tlvRwTDedyMLjmIEwy2mDs6nIvmXn
oSTbWLPOisl0OmfSZxMZUHQJ+wyHV7auRUpqEndc3BL1Y3H5JJaeqy+oFvE8iZ3UEyaa4Dzv
2twTYmDF8RPQgqcBVg5Wk2sMdwm8CZ9gpVX+L5dq6mKv9BxpVa6wfhJZqPkudj6R74PMYSWl
PcC5zxAxd5aSIY09QbVmGJ7/JTg/eKxfqj6R3bXu7kgu9S7pMoyVNRf7ariZtZvVzbS1bKLI
B2Nd/3Gme2ea/IKrF66jw06cpqwyKYUjq1d7lgxJjl9mJP6UB+h6UWJKt8juB16xrb2I17ss
tf0QSqBN9GuAhWQJJpL+9JqLke1sAnxoO+93pY2Tmc9AduhxnAgxlDPj4Z5QZb5hpiB9P913
+5RL097slu2Kpi3gGa/jaRgkxoqiTDagZoyCMmt/0Gw8jK8q+t4/DSYrEN9EoLoouxSnipNl
ilsMw6ZkoRomJQvVsCjRqE5XznT7bR6xGMbNEyIWVn0GTAYqUFSbseKGQ6NOZiyWKzJK+dKE
URbDTJs2TjzapfKbLE7yvX/pHp7bMcfWIwT7DfLkt6/sfClO0PRRimO2pZRGRALSDPn8OciF
ke+yJkL3iLKh2iQMnD4mKhzzCpxWfisJLf3eUgh4B+/4J9AwPFppqNIT4hcopwspJ7skcIUz
ZcdkLcjXc6sMzmzJekZMwzUzTZTDNEIkH9vb0VpGBxKu7LXVtNNXJwEWpY7sroioiWSIOynD
oC2il4YhHVjpjSs73ZJg88i15Ds/9OnFWYjuYc7hONYjeUu+NkNxqnAm5KnyppyY8lsL7wdX
ZrpRkhdKCzvOVMhrpzxFe/bKQ8fGXK6yIIOiTGLP4NeY5NFx+yNTP7/B9PKs9s5H5hPh5mdW
I0sM6UPYgkZP4ZYz5zsfXqcByETKcO9U0GunYLKYJ0MDCz2vLgZTBJc/iyXEo+FYXJI4gQdX
iynPA1xMj7+jlUEdINcFwUbuif7K7aBpANGaN/s4SHCZSDsgykJ0J7Ayid01jT1jhMS2DF2s
WCwRKpq05/BmTILROxkLISlB7eWITyaUw7nQKDHBB6VZiiCpzJD7IMuQ2MYSH5anuz0qvYRS
b6pcPxKakHEEtKAItpSEEthxEspibypTZdAG4f5ltYy3IuKEG6Xww9NdjSk4mniWx3h6Eyja
YbtgrAtFj0WeHLpk57FA1pnyPNn/G0zvbFxt95zt9bsEDRIn7xAuIhKBGwS5GdglMDvzBK7T
lyM2qEJ3zEcoGeost08UKR5mfheLaOqH8sDzWQJhmFeN56VF+UrpyvYmZsE3fnjcLXeHDmdf
8O5APpDIw9kaeUiIAdIJHcx9Ottv5ytETtR3dPugn+RNJIYjYbmdAEga4oYXCOk1wnbvh/YO
DRdWluUSAXyUNyeKewpXNUea1iCRY5AWHiiPdiOqh4SyC4JIoSlMY4+UMd8kbFaTmKIYL9Dq
tiCCq+Zy7+BNZ94+WGgYby9d2s2BLwvRXO9nQdcMvhIalw0OBjt+uTlA2OTkApb47vEHt3JM
x0+Qsa3aYCB0bgSInP5NcagPhtej3n/3RsFDH6xi0rbait5EZHbOYo/yvExVMXwdSWtQd2t4
lROfl6Uv6gs/F+X1xcumijgVz3mPO/3x+feff/npG/JYWJzQa/f9VDyKXnt/nQgySsSpu/Ef
w3TNg0D+Ug/kL84TFr3sXQ+8haCtEaPWt2uN/B9r8kdXXMTZ99rX1WWQGgOP51vdP/HZrPL4
x+e3Lx/+/uc//0neXO1IVMfDg7UUg1GTJwTtch3q46tO0jv3WPetdKIsmhepElGm4u9YN01f
scHImQB27V5F8sIB6lYcoA9NbSbhr3zN680ClrxsYM1LG81UKjGa69PlUV3E2EAGS/MXr7p2
9JGiRBzFnicO+vrlsaCfK3Y7mN8nfwANhYYzqO21rCan7oYCjYCGupFlHSw1ArcHf579KwMV
CGrFuu9tZ8Ur2rV4OlLCV7GjR1ifVcAUXsZsx4LXDUXM8mVYt3zwgmJqeARJAv+fsSdpbtxm
9q+4cniVHPIiUfshB4iEJMbcTIBa5sJyHGVGFduasj1VmX//dQNcALChyWU86m6sbACNRi9c
UJc1wPBNbLPp1Davw6+xpV/IAdVlvPQRiHGk5GsfXsdr92HLeO/FxYsprUEHXMKXo9mC1sIg
1wxivFiNsoh7Aq3hN5KnscfwWmO9M+FJZAwYtne84yxs7J1cX6x5nFeew2KNPdnW1/X9qaS3
T8BNoo13cvZ5HuU5rTVBtFzOA+9AZRlH3M/ezBM0U60yb6Uh7OJ0QGycPPu9Ctlmndbbo4R7
y8ji+y4KwHdnipWS0ctJHDgpy1Pv18PogAGpg1OfNi0S+5QQAtbLaOGsQJEuxs420xxh5FGk
NrD149M/z5fPXz7u/u8uCSNvgmrA1WHChGhy9pgTgLhkuhmNgmkgR/QnUDSpCJaT7YYMyaMI
5B6kpwcrUwfCYb9bBQE1PS12YhvTIFhGeTClvHERud9ug+kkYIYiH8FGjgADylIxma8225Gh
iGnGA3xzvzFNpBG+O4IQuLDryGUKItnMOHm7o8qe15ch/l5Gwcx67+1xBRlHqsc3djdErY3x
DYFp1TYESvnEUwglxB4SHtHd1NdFkjN6IsF2zBNLtCfyWhcbnXQTdluo5XLuRy1IVKePIMem
NJgj6uB0aFZU3UmxnM3ID+QqE43+YG6dklEo4ypMdNWjJTba3MPELZKCLr6O4JJKvTcbs1iG
xzDLqK41r0jkULmVzuIHm5KWvK6v79dnkMYu71+fH783Utlw48K7QOgmCo2qND39AAx/kyrN
xO/LEY0v84P4PZgZW3DJUr6uNiCt3kxM94Oud9tGvjXkXfyFLvLVEcTZzArEa6AG4t2QJEwq
GahUUl2HBvextpjIq8yyIxPZMNb/Dq4ig2nfxXaCtTjqI1XJkmdbSduXAWHJDsQIKqLGJrrv
oEfi6/kJU/9hzwZmnliQTSUPd251LCzJlFAKV1hnsAJVcPux7KrVKHlyH1O3G0TqAOaGsZ6C
xfDrZNcd5tXWDv2P0JSFLEko91JVRl26ncpPBYjdwq4cZnibq0Db5gz00HpDx97AsjwVDtpE
Jjw0LaIV7JOVE15/tnQdl8OvufHEZ1bIBC7aueeChQR7uAQkEfXCj1jog9KX2h25P3F7ug4s
kXnhdgwDzos884jJqnenUmkAvAQxhrr29A2T2lq9+IOtS+c7ykOc7ZQbolXtPc8wvj8dIR4J
klDHurMqw932uw3I8n3uEOXbWC0Sp8kWjj8K+u21IyEZBbFlla4TXrAoABprj4u3q+loADzs
OE+EBdbrAe4uKXAFH66UBEVu7/dI2WkDUpd3D6pLrteDvwbMaSDyDWVrqvA5JrXkJ5eZML97
rHjRUzCTsT3KvLQyYCMIBAB0kIA1YclbBti/SAsuGWZIcDtWYGrXkNIqKSxmwilxETibCSBO
QjoeMwZQfzS7pTIGEdM7s4IB99x7+iFAGK/s1EUKzNNbhTAsE7pzDYpJTibQbHDAc3C+cDEo
VmVFQj7VKNZJ48HWhq80TMSUkKgqxJyxf+QnrLWfRRNKTKOM95Qwp1B5IaxIVAq4g63C2Z0x
TfKhLsTE2QfjOM3lYFUd4yyl9QGI/cTL/Ma0fDpFcMBaIerUh0PfvHpXrUl4WAmJb2fql9sd
lhR0djDq/O9zM1Liisr6qEQA2/i8hef0idij622eR/GR7I7bqtto86hsuIbFsDPZ/eybVBZX
mP93F0d0c2QVWsOdRndioxGC0L2nMPEbf81k8RZJjRBfC/JdGGPCZgkis1b99iyIeOINA8FV
gonKPAc+EsB/M9+FBvFwE4GRMFHvwsip3FNCuyepCUEilcm+Fx87ePHl+/vlCdgrefxO5/nL
8kJVeAx5vPcOQOdj8A1Rst0+dzvbTfaNfjiNsGjLaV2aPBW3HnnwiqMfUegXntT38pOiSyy1
FWf8gLKHscPhL63+sO4zHbQeHNJDEnWgtqnLTfS6xLtlBuIvZiYOMY+xEnzUlwIK6supgiyb
jILZitZEaIqCioSpURj6wFQIqa6E6XwSWC+kPXxGvc3rASoDCbuqsByNxtOxGTVTwXmCqe4n
I1NhqRDKfHnkUCtgMKScT4PBl0DwKqDPa0Wg80xQj8QKbRv96yrRHn86bAnApKleg52Njkei
0GymLHPS1COuNWSoTbmJX86pN5iG1fgew+PHiTORauxmHFsTSg0dUfOJW6A1UQaZqXLXh2ud
rICuP10HtFU/DTgcB1MxWtJ25rpbpB5RoXorXYepo2A5GrbW+IGJaeBxiNLTLSezFeV2pxdR
p8GzSzVmVr5iMmRo6OD0UybhbDU2LbN1XQMjuRbcmJi562X2rzPdvauRTRyLyXiTTMarIbM2
KEfX7+xId39f3+7+fL68/vPz+Be11ZfbtcJDmW+YIoGScO5+7oW8XwzFvfpUKPymTjddNxo9
pia57AAKXOAA0Vh6MEC4ICyWa1JVr9rEQ/1kS5b6IynPG2IVW0S9v431cbZdKtXN8+P7F5XI
UF7fnr4423w3z/Lt8vkztfVLODO2vKRkWBaGHL2iY5BlrFsdG49PcNgwTN1B6f1aldTjP9++
YvZHpft7/3o+P30xU1xyhikrXhwAfCW400HjmRTMiy3yJLFDyNr4KiroCE8W2ToTvhYiHsrk
3t8C4PmRugrbZImuhMThXdqLK+7zyouVx6KUN/qGWlvfPYH6KKawvYmzeM0y6lrMYV+tYV9E
b1cRlpVhnaJQhGCLcKKmUoZ2RloEYNyl+XK8HGIGAhMCd6HMYUV7ageMBEHcrqcBti9PP719
PI1+MgmcVMYIyvZG4mIA3F3gtvH296Nl24KEcAxssIXNoKcKU5RktIAOr/PcDcthsrsq5ipM
h6d8VO51Qtjv/aUPezrQBLfEbL2efeJiYo9UY3j+aUXBj0szP0cHH6QKbTGRwAfbGz1GgsV0
WCWGZV6QVe5O6XLmCcXZ0gylHocAQ5auLEPZHuGYdZsIy6jbRKyWPsSCRChHZGp0pZiFMJk3
RxeLZBzQHksWBf1JGhz1XNKSHIFgNpwCFaAyIPhFIUbziafIZO4r4y2yJBDpdCwdK2ULUx8i
aituiVp3tEG964dJcD/s4CAjWIforTYHPWmtNm+t0d5Ac/j1QzRapgKltRQCLjCrERuOYpNO
xpYrS1slLNkxOWuAmS09Lj5G4YAWn1sSnsKt8dYKL/dAQEw7wicBBV8uRwTDiAh2Eqyny/91
c3dDnlh5uGg19e5VpM2vSUCsC4RPiR4rOLGVIHxFMzJuS+RLZjc7q4Vlmd59qOnMzqFjbShT
j8+dtRveGjosymBMLf00LKwobaWOw1GD7NB4NXefC8XTHx5KkZgEE89RghgdH+2HPSV2XcWH
q5DkOMQ0kdfIhTJ3vHx1nr7nxw+4srzcHlCY5sLDbQEZi8IgmI3JXQIxs9sHIB6fSwySl8bk
w6lBt5gGFOsG09GUgDvWMyac2syFvB8vJFtSw0inS+nxEDdJJqR/oEEwIySVVKTzYEry0fph
urzJ62UxC0fkxCOf3NraXf9sEz4jFzyVxMkh+XTKHtJiWGkbtUPx4vX117CoHE4ctNYkHr7R
2EbC/zznhet0OtgJdBQg6ljD7Io3irYxSTq7CnGGm8nb7YU1zEwUYSwmlOkNVVIPc8V6A7Nv
UaoDgBjarQOw5tnWsltHWOdnvWNZxhO7ZSfvNULMUIc6iTTw6jYyY5JFB5UUBmCGhmUjErhG
mWTNiwjA5tZx1sBzJnEg1OoqkmPtw+lMyA3T1VHho1OGbztsvU63Ka1p72mIbw+jjFTwMyf0
RAMnK2zLOMGQGuxOVIg2HhLhvqWnzJmcxOlS99nD58v59cP47Azu0iHctJuK+56kDO9aVCXr
anN3/Yr+/3bITqxoE7u2UX19UK5O8z1vfCFukfmTCjYEO848b4ROBw11TnWMYoEv2NQzkZ0C
vcIk5jH10o6YQq1OnmFu5hcTEcEdukU4tTHfkwwmiOVlmHsMxKsmWS1hEmXRZFxSyjlVvKyE
dUIjMN3MPUlt9xvy6Q33gSZWn3Xz36/z47ZyWKWd8vaprgQ89F5iUAeoB9vnaV6eGuWbVV+L
z+jkSPuooBfsXgUrdMvpOIGXp7fr+/Xvj7vd96/nt1/3d5+/nd8/qGfY3ang5Z7krB/V0o56
W/LTurIGBfsEJ22YhGSw5W7t0yhJYjqRUinFzLkXdzhtJz4jo6frRrTzVnsIsNe/3q6XvyyH
qAbkllvnzLbq2op6U2zZOs/pfbHKYnESoiDD26AnwMb1IQJIzbaY1mF6X28oDVBDtI7mc7hz
GAqVBoHG2dPROiMqVqgFHeXNIJlNPK5XHcEiGjSLRupjUzA04BPTVtmCz2j41EM/HZPw6dL1
1ekxXl8gJCnCaDmb0su/ISnZcrmgBNMGL+bRKGDDfgF8PA4IOC+Ad4fjFju4ecyJYaArRLCk
NAUGgXVbteC+KidkkHCTYEZNqpCLxWTmZ2dFsFztiaLowe3YXw1IErEMRlRkpoagCsfz8XBS
AbwYEeAiAvLFaLhIDspUN5eGyj3FXRP2pyLPeCatc0KhMjI1sEJFcRo4FWEIohdnI6xxn8CI
ukbVLap1fCSaaEm0fbADdHwBO3C+JWjzvLATVLeYQb7gFuGYKg/w+3hdehKZdIMu42gL512x
Ow0btt+PW6gTv6nrJfmE22Kt8KMtsGKl4fFZxE46a5CBUQLH6d9QZ/0m5kmE9Tja+l2KRhTY
gvCa8DwkZKo3I9apGzBBRbVuHHSaNwvquaNI9auMMW/NBQkGWNihwnfAbryrlO5oypOEZfmx
IyOpRFVuMG4UWVc7LegAESamLWcDAdmLwyloXKn0Q2hDbcoHDZTwg9HiyfP16R/zHRm9l8vz
3+e38ytG4Dq/Xz7b8ngcCvp0xlZEsRyPSCnnPzbUjidJ70fTpa3QMkZDhST10MGhRZ03BpGI
Z9ZR6KBmY2qaETWeeroHOM8xaBORec8MkjAK+cJ0I3NwlteViRPoIFyHhvYDwU04Q0+n8e4M
f+FGcLtTGLSEanQf0p0hwnoZWB2SDUPle5kq2aZ1uKUsqJpL9z6srO3kAJtXluS2UZnB7uL6
7Y2K6C3jlJd2UgUFKcp8za2p5Hs4k5boZddB1U8MwHhvUa6TyKUEqChDnR6gD7iH9uGYZRl2
HTmfajd+a+04ve4KsjiBu5JlTK33vHRnTUsR0te8VpuyzqmbXlN9+0LaDhY+YGW8WOswDefX
89vl6U4h74rHz+ePxz+fz5blaOtB9ANSY7tRLamL+4becNEKVdfjfu3y/HL9OH99uz6Ryj2O
Nsvuw3LXRaKwrvTry/tnQrtWpMK+byFAZeqmFHgKadpPaIjS/Gwb03MPBgHDhvT9lh6J1ePu
Foa+Woe4NyUG/nr963B5OxtKPI2AGfpZfH//OL/c5a934ZfL11/Q9uHp8jd8wsg2l2Evz9fP
ABZXW6Pa3gUJtHYsfrs+/vV0ffEVJPE6Hfmx+G3zdj6/Pz0CBz1c3+IHXyU/IlW0l/9Pj74K
BjiF5K+KeZPLx1lj198uz2h21U3SgF2SWHLTLgl/qmDoAMB01gkvTQ/H/96C6tDDt8dnmCvv
ZJL4njFUHPaGK46X58vrv76KKGxnLfOf2KYXw9pcK506Wf+8216B8PVqzl6blUUlh1Hu7nWe
RTxltvehSVbwEjdF5qjxaVqU3wXIWpT61aDrwn8aqmqzGiZEvOfueCKXF/qh13wPlyXDLugo
wz6pEf/34+n62qxOo5reXEiRqziepBFHg98IBkKRoRNo4Or24AIbrTimYlnNB1jMUDiZzSh4
GzfP7V0bGN7fv4FJZQMvZDYbz4b9LiXG/2MDuEhnMzNNWQNubemJvgEKeB/+nZDPVVq5aHJY
7BFbMklr2vZwfaCDtlmh4DCLYGsLZYCchxgE6RQeMrRCQSnaA2UvpdITiqTeSKe1Rr+/dcGY
AcG0mkBgFx3davBmtoWegLgUGTRORH0EKQNoMzsmAkGSHQAaP0Vtw1U+3D3BhkN47pQPKGVZ
BpkwH64KvPWNcevpqoFlf1/rNLJdRUqhWUuYhMCTbrKMobG4yEPJjAGUXHBp7vzfbYz+ONuD
C0/DXYEJrcrjzEXJuLfX1Y/uuxNIV3++q/24n45G/++oE3ogyKVFXEca3StiYQmhVI6VEh8S
ioUsq2XJMoEuLbYyZB2m9T0GFYdagptVqEfXWuZlae2KJlL17IXCiJiXJaNLCZaY/quIwlUR
p8dl+oD9snEp3FESYybMpQbo4sjqYJml9U7E5KIzaXDQbgUpK4pdnvE6jdL5nGQdJMtDnuSo
8iwj28cQkd0CxsvVmt6VbDo+cMlpmN5mla4HKruYGYAzjuDcjbM/dOSw/iSVBa3zSMP1QEQv
zm9oCvKIOoCX6+vl4/pmPZ+0XbpB1jE+Ew6PTgfNma8T7erPojL3ObC1LxcddRKvs30Up9QG
FrGjJQjYgNYS1vw5NHhtwEUK6zcifU3b4OqcF1r5aZUssZFGXtgd7j7eHp8ur5+pFykhqdqb
XGmWG3cL8zwfd2j1aE+V8wVv6AhSQT/K9S3Lmy23B2PvXDgcuqEdL3yhxwR9eklOqh7RkQxE
z6Pa3vrEYV+fz/9afn4d/bFm0XaxCqwX8QYsxlM63Up1dAQzhDSpBe3w+U7DhniZF9aBp9/R
4Moo8tKnbxWxJ5aZSOKUFmHwc5Tw/8wKJRjCPVOaIQUUWVkVcOJl9nudTDHdVBRxMu9HpyAB
aQd28kJWJR+y2wOnbG3wEcF9m0AltDGFjlit3UMuaOWv9kHz9hGycMfrA7rNdw/NrYDHkjhi
kgMvgfxfCvMwB1Ccp+YOCmJnUJtSXgOoj0xK69BsEUUuYuCXkHrKbGkED6tSO530mInbzsSq
zmlrYtZDNzV1K5y6FToosltTV6j9Yx1ZLoX425vZAWpN1+prWAoRHsO8A86jMPrDjzoOUK1I
tBHqSxn8locaRlCvpW6+H1YLoSaow8E4QKhEPt6WjtNQR1NWcLFhGaCVSs7fujOvGgg3Um67
mPQV800NkppjQdMeLnEynIBN4J9I7AAjA9R5eAQVifZR2MLqNSpVYQ+jxoqGQUrp6lg7oCoA
X9JOFoWvqyAUlqfCG5EFKHBmyJWwEV0I1l4CGloidXuUwrS+cG0dbBDGtYE0+wtqL9JYwJ6c
WVP0UOXSY2aGmDYrsd5y8b2J6JKiDKXxMVgl842w17eG1fYX2lQY/If6LDnMFyYt3hgazh6G
0VJiDBJbw5++DYqAJQemYrwmSX4gSeMsMjVpBuYIs606TmJTDsPOi1N7doePT19Mw0WYO9y0
OhW3DZZMGrOzEYNNqAFpSpJvNH4XC5lvS5YOanNXcAvO1yhxgyQq7EDOiERmp+3XmuHpoUa/
guj4W7SP1AnXH3D9WSryFdxE6I9bRZt2J2grpyvUaq9c/LZh8jd+xH8z6TTZMby0+C0VUM5h
t70moiYTEG3K6TCPeIHpfaaThbmZeAtn0tmrFaAXKU1oeSAn9+YY9T3n/fztr+vd39TY8QnC
6oAC3LsGngq6Tz1BvhUWr/zmSlZAnAwMLxQ7iZMUEgSqJCrJJz9dGIOcoLmd62quSxcV6hua
fPIN5p6XmTkaR5El08L+rApACzYOjZKKbuBhvUd8Tj+87qotbIZrkgPgzoR5zEoOgpux5bVW
htt4yzIZ65k0BVv8o3mn1zFu4j0rneVBfHzjpIqFtm9F90pOGgLAnoMZZE0qg1td7sXTKnB+
W9o6DfEIkQppvWsjRBw8eZM0ee3xhspziRTeks2W5sXj+ZLwLQtPcKaSM9MQIc+B8B9lzkRE
sWBrOP+rqKD8a4GEss2D7RhNM+DIz03PdpAh3J84VVaD+mXbYP4qK4vQ/V1vhfX0F2LmTIDV
9+XaSo7UkLfDiDMlRGNgnBDDsXiubk0hr7FzyIsdvReGscnM+EsfYAY/KSDD47jvjv5G1mmE
VAfO0FwAFxGtAFBUVYFRCv34wao3kYNtuod6Ehp0eHT0LjDSHz2LmvA/9E8csh/S3GJ0OLCY
T4xmfgl7VXiOM9OXAn60B+PvP13er5jx59fxTya6PS9rOC/tgh1mMbGyMdo40prTIlmabzYO
JvBiZp7OLGcLX5m5t5352IsJfO3MJ95BLz2HjENEO4A6RJQrm0Oy8nRxNZl7u7giTbad4r6x
r6a+JpeLqdskyIrIVjWlvbLKjgMvI/yvsmdZbltHdn+/wpXV3KqcU7Zje5yFFxBJSRhRJE2Q
ku0Ny3E0jirxo2y5Jrlff7sbIIVHg/YsznGEbuKNRnejHwA6clsUKpHSxe4b8jD74mMe+wuP
fcIXn/LFZ3zdwbHoAXxaLWcQ3AOog3ASGf2pW74o5XlXM2WtW4b+P8CkiyIsTjIMicWVg9zY
1s5L6QCrS9HweTkGlOta5jlX8UxkujyoFiMfsrHADFxCX/GVP6hSFq2bQcQZs9fRAKlp64Vk
I4chRttMHUfMNOdU520hcT97ilYs6gq0PMjljY5wqbJ86jtB9XJX2a0vbUW2o4HU1jibu7eX
7e6P5Ss1MN7XFunHX8CcX6IPTdeLpz3zntUKxEdYXkSrZTFzOfK6VehT49+NPY+rtSUGwWmx
S+eYvUNHt/VApNGQiQ/q1YLo5aRmg0tPiBCWTLlqDLPsSDpIYhrNQakyD0Lv+lVUorEj/+KD
y1zUaVbAkFvyqqquiQVKTDLaAdNDsjsR1jCFKtCAnBNogVFF9Y8q29pNnkBhUhOqBNPU6Cw1
PBvYD0ctvUZClKZcltf8o+GAI6pKQJtsXKAeJy9FWknHGdyHwfaB0bGqqAH1WjjuiMNAxBQf
t93A3lb9wJCXwIzlijueezygH66ZJqtxHQo7JWeFwNcG7sDaHZXo1JkJhSxxldSdTK8ujg6t
KgEOwhvaQPCsICIUMxbHwlByj+I23utABuin7cPtX6/b+08cFrLlnZoLJ/wBh3B8yhtac7in
R5yLuI958en1xy3woU5Va5htmLgSrgbeixORQEhP38OBnVoLqWLz1y+RUNdLTLUCx8klZIgE
dLMFOUvU+TU5mvQoTkNG/MGYDZglzpBN33/NngMjyM2JGln675Vj0gk/MUcj6hHals3cRRhp
qoUj23naTPKeqgpL+oSTcfHp1+3jdzQo/oz/+/70n8fPf24fbuHX7ffn7ePn19t/b6Ch7ffP
GKrpHq+az9+e//1J3z6Lzcvj5hclt9o84vPq/hbSL6Cbh6eXPwfbx+1ue/tr+3+3CN1fUUlC
GhVUynaoJ5GFxPQU6D1kCc0sFoYLds+nRPcoNMMpSjZTj4UBlNZqhqsDMbCJWD1oV4cUf5jh
MqwJbeuAf7FQWG1hZI56cHyKB8tKnwXoe3qFKbCRtlk7gu7qctByv/x53j0d3D29bA6eXg5+
bH49b16s9SFkGOlM2A74TvFxWA5nki0MUdUikdXcfvzwAOEnRC+4whC1LmZcGYs4yMVBx6M9
EbHOL6oqxF5UVVgDesSFqMChAosS1mvKnQdRA0IGgFOKOB8O9IaeCoPqZ9Oj4/Nla1miGUDR
5nmAjYVh1+kPs/ptMwc+MSgnNwK/OSWXg+Ve9fbt1/bur5+bPwd3tFfvMdnIn2CL1koEladz
ZqKyJI0onwa44t/QBoT6HQy15O68foLaepUdn54efQ3nbgChs1o/A+Jt92PzuNve3e423w+y
R5oGOOYH/9nufhyI19enuy2B0tvdbTAvSbIM5nfGlCVzEAnE8SFcpdeuv+twfmcSQ+0wB1sD
4B+qkJ1S2XG4otmlXLGLMRdAKh1HeG3+Ty4uD0/f7Se4vquTcB8l00lY1tThMBsVlGXJhOla
XnNpZAywnE6Cairsl194xbQHnMO6FiExKObD5MdBen5H4GJ1Fc6/wLjpTRsuO4YkXQ0GYhj8
NDLnThCVnuguRbgSV9w0rPTn+gFwe7953YUt1MkX1zHVAWhznrFTR3jvIsAy5Xzsx77/V+wF
M8nFIjsON5kuD2mpKaeD/MB1pTk6TNnQH/0hpW4Emyy2Q4b1RzfXs5Pw6ki5srCepYQjSdat
CdPvepkesVGu+3OupYewELatyr5wIBAm4kCQHgwwoCj0ZeQbrpipf8lU2wDDNilnzNjX1amf
HpFZsY62VweEMNiwmuHaPv9wzAAHKhruISjrGobtytRQP3NegOFbT2XshcXFMbtl5LYS6L9s
p4XyALH9NsD1rQBUqcdkTkOAe/yBjul4AsuyYGtUDa9ttxGsXo03dMYMH0rdUXm8RxYSfij7
0mVpFp+JKf0d6Yy5paPXd2w5gDustNF8wKxoCN0r705Gj2wNPNKSvYrMyQsnrFmXJjMqWx68
pHrgSEsuuPuyFtdRHGdQJkngw/PL5vVVy6z+zIHAENHK9CzETcms8fnJKBXJb0bmH4Dz8Mq9
Uc3AL9cgzT89HBRvD982L9qvtpe5/ZZEoWSXVHXBmVL2Y6wnMwp2FDLXCGE5AA0RiuO+CZbw
77d7jKDKf0mU1TN0iHG1qJb004EsOvK07CH28uWHkOuIqaCPhzJufGR0Pchi6gvfv7bfXm5f
/hy8PL3tto8M85XLCXs/UHmdhGfJmKqsMkLpWRQfy4L1Lj5sE7Hv3VY0BWIr0KDRNszX7zQR
F51c8HhT+1q4GeEIN5YPDFat5E12cXQ02tUon+ZUNdZNq4aARAwTtpfXRmgGYEe4pfk6PLwZ
OqpqhXh4fw0w2o8hbbMxoM2RUw6I2ldRh/LhKtLwLOGs/wM0HOHhiYhUlSS8uZKFcok2g/Pz
r6e/I3ERPNwkmnDeRzyLJL/x8E4+WF/fyRWfU4zr5gdRoaOrEYkE8fDJ5SrJQhWRnmVgnmOL
ucREjEk3u+JkL1f1Tqml9jvTAlbtJDc4qp24aFenh1+7JKvNq2IW+FtUi0SdY/bAFUKxDg7j
n3DdKYUvhANUE+vNyw491W93m1cKWIMBam53by+bg7sfm7uf28d7Kx0HWeXZD6e1tHWRIVxd
fLKePww8u2pqYY+Jf8cqi1TU1++2BnQcEyar5gMYdFeRSfGnTx5Sna1K/Wrb2xxH4ftx9YbB
H5jEvrqJLHBUsF5FM+1XIY/elbWQ6VlXXe7705d0k6xIgFOprSe+XBaZqAGlmNkXK3rxOhMz
kSAQYixKa6P17rAgKxYJvtvW5dKz4LdR8qyIQIus6dpG2gZaPWgqixSjlsFSQBcsKl3WqW1B
gbkws65olxOMl7k3IaT5F3lYMQb59LyOepBXTBcaGlMmy+oqmWsLxzqbehj4MjNFYcz4v0l7
pEMdcISB3yzKxn/uT+oE6IZsHC1wcnTmXntJN6IugZ43beco7pMvno4cNT+cnYWPAtQlm1zz
oS8dlEg4J40i6nVMMEC4XlH7o4jMlTgCTWJnlZKTQWG2R7CUs4Maa299i1nfl5F5MDg3yCwA
i+o+Jd9ovsgrBemGAvq5CaKxNM24cpBcWPwTFh9lGgadijn8qxss9n8bPbpbRp7LVYgrhS1A
mkJRL7myZg5HLgCg731Y7yT5V1DmvnvsB9TNbqR1Bi1AfmObFliAq5sIfsmWG2HRO/uM9cok
sdSP8INyU+HrbC1se3PyJVqJvEPNmTVOUdfiWhMF+ypXZSKBBgCbTAh7ENIRoEC2T7QuQiPt
zqFMWO4EqC4yuPaUDgyeU3J4D0bhtUVF1jK+ST/FF0/TumtA8neI7Z6+oYEKIbbFYO1kXXxr
WTa5tR0QMynnJLHCdisdNR21h6EDxoJPU2+He4u79me5XjSr1Uub3uflxP01nHtrbnLjV9qT
kPwG7aLs3sr6EkURjmlbVtLJLQU/pqlVe0l5sGfAI9TWOreJOsZ70blmSW7q9+IqVWW4Q2dZ
g9HXymkqmNAU+A1FZ+vsy2VaomLLd9mi0vPfR2deEdoXKMxBb/M0s379/D1RoXu98yo+gFrj
pTfNWzX3TO0GJDL5WiYehIwP1sIO8khFaVaVjVemmTRgCODGPT4cQLCF9WmxbMRwtiP3n+HM
AsbKNe/o+VsqfX7ZPu5+Uh6S7w+b1/vQ9JCYtgUtiMVc6UK0jLd5BBpLQy4Wk1ZieDz7+Vjn
w8OIqznwYfnwSv/PKMZlK7Pm4mTYpYabD2oYMMicx3QuzXJ7e6XXhcD8bH7KA7s4iLwPvM4E
DZK6rK4Bj48ahR/Cf8BaTkqlPzcrEZ3dQSW5/bX5a7d9MDzzK6He6fKXcC10W0bvFJSha2Wb
ZF6crAGqgKHjGAULJV2Leto1cEroMdeyo+AqJGyeefKxOJ1GJea42HiAqGvdpHESm8/SCSbT
kxXvZAlXV9ZB3QUcmJPz/7HORwV3E8bfWLr55jKRksGEYG0I5wAGvhsdXxphm0jooYBoRmLQ
UqqlaBLrUvIh1KeuLHLb55c6W5V0wfpH38QVkK7VkW5W31ba2Sar0SmPPfEf3klOMEdDEdLN
t7f7e7RGko+vu5e3Bzfdw1KgrA8CYW3JY1bhYBKVFWT4dvj7iMPSAZL4GkzwJIUWzQWmH/zk
Tr7rVNiXGU8lwV5oAxKayRDeEoNVjNQTsTSj64zo+QI2pP09/ub0H8PVMVHCOPTLm6xzNhXB
7Mo0MpBOLsSFMZrTOBMM7mhLXTZQc2o+Cv/h+1+ouZw2YS9TuQrs6TwU48iM6tURLKDWvBmA
BmcgC4+A4djMiiWwZZzB/sjc471pFuCBWeVE2WnpCUBlJMFI57rzcM1KND0yzqk2ap1kcJAz
bQXrbCGq2Fwc7FA1RixIhoaGzKAu1xau5lh6MJhaDO2ezIkoqYuzExfe0u0JHKRaXJwfsrAh
2IvFsfTdRbgWUlHB7rWtFkCiqfGLk8PDwxjQqcCbkH2gGUJl7eU0Zp2R0FFibDC40eBO+BK0
aXCIb2mLRYGW5mUtZ7Lwu24wgWS3mckj75F6jQfCUavDiUObtOzK5IdlxjIrcHNoMO/h/yGK
7ZI+7TbrX2Pokdzr34yt6lCZxfIhk5VdNVmh2FsJ4SSwsLc6Tsm6cAPDUSlsNVUWsVgd+6ox
XskISl3CbSm6iNpjIL8aeX3lT4FdMmjSGnQYtdhb+h1wg6aYiVjstKCJH3NnGcC49spFRaPj
9xrSoayVP9Ae6rvMuNA6aYn3+UBfgAPBqAAm6tO7vdKEZ+AhjyyuOm8nPTLvvEUYsfgaRJPN
LgfJLQfuKBxfD4l2UzNfrXIc/xXQktSAMqDeFLaHkfh0FatlV808c/8eEpaQ5ZwrQQ6gehKO
gGqf5mIW32lcB/w+6mRsQZt8scmxhCbvvjSrRW8FEysq1B9jaE3iTj0JtZ/+EGucuxLhvbsH
4Ny5GhJz2Wpo+PhqQ9Ua7rFZyDLhwUBhuij3jEKa1l52KapjvOtT4lrtb6Z+TkHfQ2BPdb1d
OdeZwLR5JSIdlE/Pr58P8qe7n2/Pmq2f3z7e2xI69D5BD4WyrJwHEKtYX1kXRy6QtDBtczHc
h/gu0CKFa+AI2xpETMkeBaLUTbpEG41a+AiO3zX0pvOaohDP9uYYMHRcLRwHHNplxeJYHR5W
aN8dC5G6wyx1HNn0/XC/iNhUN2/R1Qt5J+t8GRepHjRM/sn5IduvAfED3XJx/V6tLzWblNq5
bogN1mNxY+WN7TntpgoS5vc3FCtt3mFPu4mGxlhWDXVVGFTWx13au8IwzfhkBudwkWWVx1To
90U0O9+zSv94fd4+oik6DOzhbbf5vYF/bHZ3f//99/9awdvR3IHqpjxmgcKxqjEdIROVTANq
sdZVFDC7krXG0gYVMFif9qJqvG2yqyy4yfucFwG15tHXaw2BW7Rcuw6vpqW1cuLM6FJtC+JS
WXK8zKqgAN+91MXRqV9MaiNloGc+VN+rRj9IKF/HUEgnqvFOgoYkMC65qI0zn8Y69reHwY7e
n5rnhnnKMuYOM6usbcwMy8bdxTRxQF/Qj9R7DdovRS+j2RFgkqnzGf8MqVLdwFrIhnto6JW+
/8VuH0gATTNcOMRlWKTBKe+KpWQ0gAbKHfFBC7yvkpRi6IjXFirLUiABWrpjOAfNP47wowYD
xARg8Fy52bo2f2pZ6fvt7vYAhaQ7NE1wIqGZVZasHGHEET8UmzmQ3MHWIO0K72W81JxuR3IL
CBUouAYBCR36G+m834+khqksGilyFcwCnA9WttN0Kml9moaCgGsEwm9pxFPA13Hl3hd73WvS
UhDK/Xfs8lIVtYikcUBodqlGHtuoaxRiwInzxM6zOz0eAb00TGtNKtdw/XXYSpCQ0R6K2z34
vF4k101pkU4yLbVeSML4g2Wlh+/EHYClmbaF1jGPQ2HM1ZzH6V85pt6xZIDdWjZzfOxTH0Az
oRzxHegj6KIOajXgJUmV0CxaxXgoGPoOSQdhGn2VVwmaE197hUAl8CXDVO0BE9OUD9Szh3kq
Om+qdD8T9x6mx7hJO53aM06ZPgjfeRiFPw1uGQVTkYTrZFVlNNIYmc0+pVm2BLpRX/ITEbTX
Kzf8hgwi85jqjRj5S3qHDaqObsh39mJsG76/Az+++YYuAFmbyvB5MugUzCiIJNOgXHOqwXFa
w9kOSktVlFJl+/KBYJBuZv8JS7cw5Hec7pkhm1PAXbhm06pCVGpehru5B/RvSN7OmsBVDBvS
zBc9hHicLZUbmy+MgkAfRELUTfIFWYnKcoSWLyjvmj4pbBxSG271tJoGZf3O8Mu9Gvb9gzpM
8xgytpYpp2AbJ0suFI3iDLEJT5lj7aKuC9i3fk8xTizgy9nMYxt0K5qc6GQMscUnYsAZR9pU
xQYHbYic7FSi2djNkPVM4J+2VtGgymbHNgLYgWrkvrc6F0NmUIdA7ESc0ixvhGLppHnDcNgU
awmQQgasirMYI7wGMk2wdbpynsijL19PyNIH9WYcQywwj5Ud0YgKrPzyAchaesc43wFrQwde
garxzEpoShntmalOW3GFjTEcuYdAx8myWe3L66wZQH6t8zXQkUwsaOuO1I0JZ4OaTQa+XGZF
EwD1rynbqEy9RL0u3Aog5H9ayXTKeQT1U4h0PljG1klFbApXU8xWjzRymaLN8SQYgUlcgnbT
KYa7Z7qzYh8gDDDU9tgALTOzGmNKNCLNk7hrSWIYa40TSBu/z884acOTJAOWI5Q0Qxz9jGmM
ejCBzwBBDz/zeErMSlvxX0XqSiezyAeUBekqtYMTZFOJuvbOfSgyWqh8QvZhHo85XOtcfFrs
O5pypkj7xt6DZGno2OHV+eF7GBm3Qwd425tEhZ/61g++wEN2VWQuymspKjFmBEl1EI8+AqfF
j9sz6wkjkw1XJKtaDNCDqpyRLrTFms5SB3Idx2/0YN9SZ5AX3Q1uW9Q1m9cdqlxQS5pgQsPb
+42tZli03q0wQHpdAVqXlbW54vkAdgNX66FaPAmpl1mAzFUuJm6Jfmnt1X37q9utZYhox3UJ
a1mKRdaHIvQakOWg4nYaANAUdWI86+C13xvpjL30LpJyFTzuKGBRy1V/UXrP7uWKYzGAlyNp
R6tue1fZ4bN8kTa8PQqp0peywIdU3jmNMBSQAI6BQ1gqV64XublT7YQgPLu91yfA2RnhtSZo
1D0CJ7vrMi8xe3OcGNkW4nE081Ice6InrevZiW244s7UPLtCOjsyldoMVodI5ElSj6eSiqc6
hLAAjIbNjkxg47H04BSCHFbYiaQz7dnjvYNqM6PWTz9mQ7VhfRyO8skULuI4Ro06cnoAjuNE
/agJCpx0HJgvOFPJfsD42vjgfWHeaWNfkQ6Mwmf6H4JYFu8HObORtSiwHzzdQCeriWx4Q3u3
tqmsl2vBxnzU69unWvDWkm7Ksb1G4TujUcf1flv6+kiHCthv8yOkJlsmAjZndAAN+b7J8GDB
l76M4s0Nnmu8GkbGMK24hO0EIvWYjmy6Z0IfHIqN0jJ0wz/3pojV1Y5etEFsPW3f/v9CnCCY
B94BAA==
--------------C6D9321F8BA1689346476EA6
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message Part"

_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org


--------------C6D9321F8BA1689346476EA6--
