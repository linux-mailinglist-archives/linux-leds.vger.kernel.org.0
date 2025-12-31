Return-Path: <linux-leds+bounces-6511-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A6CEB15A
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 03:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5E41300766E
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 02:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC9D26FD9B;
	Wed, 31 Dec 2025 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu0o3N9o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E523EAB7;
	Wed, 31 Dec 2025 02:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148289; cv=none; b=iYkTbBPE/ol/4xpdu/AcrxVWQn8RGLh2482tqBF5iHSP7I0NudPjVfKqm311iJ1HyjmzRDfWvnODd7i8vHuOBXOc4lyv3HmcRFRcxdHM/3WXwi1jLt8QNxfkE7MPfVikcM/IL7GDOeBvnDGZx9n3qt5m1o5/CrqTzoaJJPyB6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148289; c=relaxed/simple;
	bh=90iFVHvJmRZTW/UbaFCBeZm/hMW9oiflZyLDZUAYbds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOaKIJa8Nk/cFzcmLK9LGUV887zePducSEhgLtriXjQgXNcoIzIJsHXtnCrS5s4gqSKr2wVMidIsul5Cx5XEA0yxBRDX618UjOqqYgs8Z2OYkVQllR6i8o+wXNHwjQRZpIGafPvojlXVyWLH+rNA+YFGl2DXUJM3FNVSthAisdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu0o3N9o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767148285; x=1798684285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=90iFVHvJmRZTW/UbaFCBeZm/hMW9oiflZyLDZUAYbds=;
  b=Yu0o3N9oY3Z5ydoTVaEAUF7pCrws+JK5JSOyNNVs6BSOC0tlFrh/XJ8t
   ZJRUczc4a8IfTdF1dk+HPuASm9DWrufq+D411yNuuMMhUOlFotwWwRyXn
   +UcuuLwbeFpoPRCbPlvecwYR5pMf8zwqphpc0HQneKM+8eRoZQo9ofX2N
   vkku3iUT+veFdE4sRi279a/qFsQ1SM7AGWlyAFOMhFBrRnmvNXowJ9Cr1
   F+d7+Svo5FQYURWNVq6J4+0M3a9VPwNgPLWNrDNuG7tvohEJf6iVAVzV+
   F8FmeWjyCJvD7xq6obSFEpTXNYT2he1sIRCvoF1LzqKgLmfne6c4BedRL
   A==;
X-CSE-ConnectionGUID: p7qyLhaDTGOzjuuxnxmxqA==
X-CSE-MsgGUID: BSb7HsHnToSrFMuqceudGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="86305644"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="86305644"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:31:23 -0800
X-CSE-ConnectionGUID: ZCNQ9QDXQ/KgeDYPJMcoSw==
X-CSE-MsgGUID: 8MHtxf2jQEK8TVuGwc31fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="201339211"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Dec 2025 18:31:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1valzZ-0000000084y-1zbH;
	Wed, 31 Dec 2025 02:31:17 +0000
Date: Wed, 31 Dec 2025 03:30:32 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 6/7] leds: Add fwnode_led_get() for firmware-agnostic
 LED resolution
Message-ID: <202512310334.sARvVxJm-lkp@intel.com>
References: <20251230082336.3308403-7-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230082336.3308403-7-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-add-function-virtual_status-to-led-common-properties/20251230-162857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251230082336.3308403-7-professorjonny98%40gmail.com
patch subject: [PATCH v5 6/7] leds: Add fwnode_led_get() for firmware-agnostic LED resolution
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251231/202512310334.sARvVxJm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310334.sARvVxJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310334.sARvVxJm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/led-core.c: In function 'led_timer_function':
   drivers/leds/led-core.c:73:17: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_set_brightness_sync
   drivers/leds/led-core.c:84:22: error: implicit declaration of function 'led_get_brightness'; did you mean 'led_set_brightness'? [-Wimplicit-function-declaration]
      84 |         brightness = led_get_brightness(led_cdev);
         |                      ^~~~~~~~~~~~~~~~~~
         |                      led_set_brightness
   drivers/leds/led-core.c: In function 'set_brightness_delayed':
   drivers/leds/led-core.c:152:17: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c: At top level:
>> drivers/leds/led-core.c:237:6: warning: no previous prototype for 'led_init_core' [-Wmissing-prototypes]
     237 | void led_init_core(struct led_classdev *led_cdev)
         |      ^~~~~~~~~~~~~
>> drivers/leds/led-core.c:296:6: warning: no previous prototype for 'led_stop_software_blink' [-Wmissing-prototypes]
     296 | void led_stop_software_blink(struct led_classdev *led_cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:296:6: warning: conflicting types for 'led_stop_software_blink'; have 'void(struct led_classdev *)'
   drivers/leds/led-core.c:152:17: note: previous implicit declaration of 'led_stop_software_blink' with type 'void(struct led_classdev *)'
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:332:6: warning: no previous prototype for 'led_set_brightness_nopm' [-Wmissing-prototypes]
     332 | void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:362:6: warning: no previous prototype for 'led_set_brightness_nosleep' [-Wmissing-prototypes]
     362 | void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:362:6: warning: conflicting types for 'led_set_brightness_nosleep'; have 'void(struct led_classdev *, unsigned int)'
   drivers/leds/led-core.c:73:17: note: previous implicit declaration of 'led_set_brightness_nosleep' with type 'void(struct led_classdev *, unsigned int)'
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/leds/led-class.c:10:
   drivers/leds/led-class.c:87:32: error: 'led_trigger_read' undeclared here (not in a function); did you mean 'led_trigger_set'?
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:341:17: note: in definition of macro '__BIN_ATTR'
     341 |         .read = _read,                                                  \
         |                 ^~~~~
   drivers/leds/led-class.c:87:8: note: in expansion of macro 'BIN_ATTR'
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |        ^~~~~~~~
   drivers/leds/led-class.c:87:50: error: 'led_trigger_write' undeclared here (not in a function); did you mean 'led_trigger_set'?
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                                  ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:342:18: note: in definition of macro '__BIN_ATTR'
     342 |         .write = _write,                                                \
         |                  ^~~~~~
   drivers/leds/led-class.c:87:8: note: in expansion of macro 'BIN_ATTR'
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |        ^~~~~~~~
   drivers/leds/led-class.c:93:22: error: initialization of 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
      93 |         .bin_attrs = led_trigger_bin_attrs,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-class.c:93:22: note: (near initialization for 'led_trigger_group.bin_attrs')
   drivers/leds/led-class.c: In function 'led_classdev_suspend':
   drivers/leds/led-class.c:183:9: error: implicit declaration of function 'led_set_brightness_nopm'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
     183 |         led_set_brightness_nopm(led_cdev, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         led_set_brightness_sync
   drivers/leds/led-class.c: At top level:
>> drivers/leds/led-class.c:258:22: warning: no previous prototype for 'of_led_get' [-Wmissing-prototypes]
     258 | struct led_classdev *of_led_get(struct device_node *np, int index)
         |                      ^~~~~~~~~~
>> drivers/leds/led-class.c:303:22: warning: no previous prototype for 'fwnode_led_get' [-Wmissing-prototypes]
     303 | struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
         |                      ^~~~~~~~~~~~~~
   drivers/leds/led-class.c: In function 'fwnode_led_get':
   drivers/leds/led-class.c:348:19: error: implicit declaration of function 'fwnode_get_next_parent_dev'; did you mean 'fwnode_get_next_parent'? [-Wimplicit-function-declaration]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   fwnode_get_next_parent
   drivers/leds/led-class.c:348:17: error: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                 ^
   drivers/leds/led-class.c: In function 'led_classdev_register_ext':
   drivers/leds/led-class.c:647:21: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'leds_lookup_lock'?
     647 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
   drivers/leds/led-class.c:647:21: note: each undeclared identifier is reported only once for each function it appears in
   drivers/leds/led-class.c:648:41: error: 'leds_list' undeclared (first use in this function); did you mean 'leds_class'?
     648 |         list_add_tail(&led_cdev->node, &leds_list);
         |                                         ^~~~~~~~~
         |                                         leds_class
   drivers/leds/led-class.c:656:9: error: implicit declaration of function 'led_init_core' [-Wimplicit-function-declaration]
     656 |         led_init_core(led_cdev);
         |         ^~~~~~~~~~~~~
   drivers/leds/led-class.c: In function 'led_classdev_unregister':
   drivers/leds/led-class.c:692:9: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     692 |         led_stop_software_blink(led_cdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-class.c:704:21: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'leds_lookup_lock'?
     704 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
--
>> drivers/leds/led-triggers.c:36:9: warning: no previous prototype for 'led_trigger_write' [-Wmissing-prototypes]
      36 | ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/leds/led-triggers.c:133:9: warning: no previous prototype for 'led_trigger_read' [-Wmissing-prototypes]
     133 | ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c: In function 'led_trigger_set':
   drivers/leds/led-triggers.c:189:17: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     189 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c: In function 'led_trigger_register':
   drivers/leds/led-triggers.c:341:20: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'tasklist_lock'?
     341 |         down_read(&leds_list_lock);
         |                    ^~~~~~~~~~~~~~
         |                    tasklist_lock
   drivers/leds/led-triggers.c:341:20: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/kernel.h:22,
                    from drivers/leds/led-triggers.c:11:
   drivers/leds/led-triggers.c:342:40: error: 'leds_list' undeclared (first use in this function); did you mean 'pgd_list'?
     342 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |                                        ^~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c:342:9: note: in expansion of macro 'list_for_each_entry'
     342 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   include/linux/compiler_types.h:565:27: error: expression in static assertion is not an integer
     565 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c:342:9: note: in expansion of macro 'list_for_each_entry'
     342 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c: In function 'led_trigger_unregister':
   drivers/leds/led-triggers.c:367:20: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'tasklist_lock'?
     367 |         down_read(&leds_list_lock);
         |                    ^~~~~~~~~~~~~~
         |                    tasklist_lock
   drivers/leds/led-triggers.c:368:40: error: 'leds_list' undeclared (first use in this function); did you mean 'pgd_list'?
     368 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |                                        ^~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c:368:9: note: in expansion of macro 'list_for_each_entry'
     368 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:565:27: error: expression in static assertion is not an integer
     565 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c:368:9: note: in expansion of macro 'list_for_each_entry'
     368 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |         ^~~~~~~~~~~~~~~~~~~


vim +/led_init_core +237 drivers/leds/led-core.c

5bb629c504394f Fabio Baltieri   2012-05-27  236  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28 @237  void led_init_core(struct led_classdev *led_cdev)
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  238  {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  239  	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  240  
49404665b93544 Kees Cook        2017-10-25  241  	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  242  }
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  243  EXPORT_SYMBOL_GPL(led_init_core);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  244  
5bb629c504394f Fabio Baltieri   2012-05-27  245  void led_blink_set(struct led_classdev *led_cdev,
5bb629c504394f Fabio Baltieri   2012-05-27  246  		   unsigned long *delay_on,
5bb629c504394f Fabio Baltieri   2012-05-27  247  		   unsigned long *delay_off)
5bb629c504394f Fabio Baltieri   2012-05-27  248  {
8fa7292fee5c52 Thomas Gleixner  2025-04-05  249  	timer_delete_sync(&led_cdev->blink_timer);
5bb629c504394f Fabio Baltieri   2012-05-27  250  
7b6af2c53192f1 Jacek Anaszewski 2018-01-03  251  	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
a9c6ce57ec2f13 Hans de Goede    2016-11-08  252  	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
a9c6ce57ec2f13 Hans de Goede    2016-11-08  253  	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
5bb629c504394f Fabio Baltieri   2012-05-27  254  
5bb629c504394f Fabio Baltieri   2012-05-27  255  	led_blink_setup(led_cdev, delay_on, delay_off);
5bb629c504394f Fabio Baltieri   2012-05-27  256  }
2806e2ff489975 Jacek Anaszewski 2015-09-28  257  EXPORT_SYMBOL_GPL(led_blink_set);
a403d930c58eb8 Bryan Wu         2012-03-23  258  
5bb629c504394f Fabio Baltieri   2012-05-27  259  void led_blink_set_oneshot(struct led_classdev *led_cdev,
5bb629c504394f Fabio Baltieri   2012-05-27  260  			   unsigned long *delay_on,
5bb629c504394f Fabio Baltieri   2012-05-27  261  			   unsigned long *delay_off,
5bb629c504394f Fabio Baltieri   2012-05-27  262  			   int invert)
5bb629c504394f Fabio Baltieri   2012-05-27  263  {
a9c6ce57ec2f13 Hans de Goede    2016-11-08  264  	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
9067359faf890b Jiri Kosina      2014-09-02  265  	     timer_pending(&led_cdev->blink_timer))
5bb629c504394f Fabio Baltieri   2012-05-27  266  		return;
5bb629c504394f Fabio Baltieri   2012-05-27  267  
a9c6ce57ec2f13 Hans de Goede    2016-11-08  268  	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
a9c6ce57ec2f13 Hans de Goede    2016-11-08  269  	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
5bb629c504394f Fabio Baltieri   2012-05-27  270  
5bb629c504394f Fabio Baltieri   2012-05-27  271  	if (invert)
a9c6ce57ec2f13 Hans de Goede    2016-11-08  272  		set_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
5bb629c504394f Fabio Baltieri   2012-05-27  273  	else
a9c6ce57ec2f13 Hans de Goede    2016-11-08  274  		clear_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
5bb629c504394f Fabio Baltieri   2012-05-27  275  
5bb629c504394f Fabio Baltieri   2012-05-27  276  	led_blink_setup(led_cdev, delay_on, delay_off);
5bb629c504394f Fabio Baltieri   2012-05-27  277  }
2806e2ff489975 Jacek Anaszewski 2015-09-28  278  EXPORT_SYMBOL_GPL(led_blink_set_oneshot);
5bb629c504394f Fabio Baltieri   2012-05-27  279  
22720a87d0a966 Hans de Goede    2023-05-10  280  void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on,
22720a87d0a966 Hans de Goede    2023-05-10  281  			   unsigned long delay_off)
22720a87d0a966 Hans de Goede    2023-05-10  282  {
22720a87d0a966 Hans de Goede    2023-05-10  283  	/* If necessary delegate to a work queue task. */
22720a87d0a966 Hans de Goede    2023-05-10  284  	if (led_cdev->blink_set && led_cdev->brightness_set_blocking) {
22720a87d0a966 Hans de Goede    2023-05-10  285  		led_cdev->delayed_delay_on = delay_on;
22720a87d0a966 Hans de Goede    2023-05-10  286  		led_cdev->delayed_delay_off = delay_off;
22720a87d0a966 Hans de Goede    2023-05-10  287  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
32360bf6a5d401 Dmitry Rokosov   2024-09-04  288  		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
22720a87d0a966 Hans de Goede    2023-05-10  289  		return;
22720a87d0a966 Hans de Goede    2023-05-10  290  	}
22720a87d0a966 Hans de Goede    2023-05-10  291  
22720a87d0a966 Hans de Goede    2023-05-10  292  	led_blink_set(led_cdev, &delay_on, &delay_off);
22720a87d0a966 Hans de Goede    2023-05-10  293  }
22720a87d0a966 Hans de Goede    2023-05-10  294  EXPORT_SYMBOL_GPL(led_blink_set_nosleep);
22720a87d0a966 Hans de Goede    2023-05-10  295  
d23a22a74fded2 Fabio Baltieri   2012-08-15 @296  void led_stop_software_blink(struct led_classdev *led_cdev)
a403d930c58eb8 Bryan Wu         2012-03-23  297  {
8fa7292fee5c52 Thomas Gleixner  2025-04-05  298  	timer_delete_sync(&led_cdev->blink_timer);
437864828d82b9 Fabio Baltieri   2012-06-07  299  	led_cdev->blink_delay_on = 0;
437864828d82b9 Fabio Baltieri   2012-06-07  300  	led_cdev->blink_delay_off = 0;
a9c6ce57ec2f13 Hans de Goede    2016-11-08  301  	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
d23a22a74fded2 Fabio Baltieri   2012-08-15  302  }
d23a22a74fded2 Fabio Baltieri   2012-08-15  303  EXPORT_SYMBOL_GPL(led_stop_software_blink);
d23a22a74fded2 Fabio Baltieri   2012-08-15  304  
af0bfab907a011 Abanoub Sameh    2020-12-11  305  void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
d23a22a74fded2 Fabio Baltieri   2012-08-15  306  {
f1e80c07416ada Jacek Anaszewski 2015-10-07  307  	/*
7cfe749fad5158 Tony Makkiel     2016-05-18  308  	 * If software blink is active, delay brightness setting
f1e80c07416ada Jacek Anaszewski 2015-10-07  309  	 * until the next timer tick.
f1e80c07416ada Jacek Anaszewski 2015-10-07  310  	 */
a9c6ce57ec2f13 Hans de Goede    2016-11-08  311  	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
f1e80c07416ada Jacek Anaszewski 2015-10-07  312  		/*
f1e80c07416ada Jacek Anaszewski 2015-10-07  313  		 * If we need to disable soft blinking delegate this to the
f1e80c07416ada Jacek Anaszewski 2015-10-07  314  		 * work queue task to avoid problems in case we are called
f1e80c07416ada Jacek Anaszewski 2015-10-07  315  		 * from hard irq context.
f1e80c07416ada Jacek Anaszewski 2015-10-07  316  		 */
af0bfab907a011 Abanoub Sameh    2020-12-11  317  		if (!brightness) {
a9c6ce57ec2f13 Hans de Goede    2016-11-08  318  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
32360bf6a5d401 Dmitry Rokosov   2024-09-04  319  			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
f1e80c07416ada Jacek Anaszewski 2015-10-07  320  		} else {
a9c6ce57ec2f13 Hans de Goede    2016-11-08  321  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
a9c6ce57ec2f13 Hans de Goede    2016-11-08  322  				&led_cdev->work_flags);
eb1610b4c27337 Hans de Goede    2016-10-23  323  			led_cdev->new_blink_brightness = brightness;
f1e80c07416ada Jacek Anaszewski 2015-10-07  324  		}
d23a22a74fded2 Fabio Baltieri   2012-08-15  325  		return;
d23a22a74fded2 Fabio Baltieri   2012-08-15  326  	}
437864828d82b9 Fabio Baltieri   2012-06-07  327  
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  328  	led_set_brightness_nosleep(led_cdev, brightness);
a403d930c58eb8 Bryan Wu         2012-03-23  329  }
2806e2ff489975 Jacek Anaszewski 2015-09-28  330  EXPORT_SYMBOL_GPL(led_set_brightness);
3ef7de5304edf6 Jacek Anaszewski 2014-08-20  331  
af0bfab907a011 Abanoub Sameh    2020-12-11 @332  void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  333  {
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  334  	/* Use brightness_set op if available, it is guaranteed not to sleep */
d4887af9c2b6ab Heiner Kallweit  2016-02-16  335  	if (!__led_set_brightness(led_cdev, value))
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  336  		return;
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  337  
fa15d8c69238b3 Hans de Goede    2023-05-10  338  	/*
fa15d8c69238b3 Hans de Goede    2023-05-10  339  	 * Brightness setting can sleep, delegate it to a work queue task.
fa15d8c69238b3 Hans de Goede    2023-05-10  340  	 * value 0 / LED_OFF is special, since it also disables hw-blinking
fa15d8c69238b3 Hans de Goede    2023-05-10  341  	 * (sw-blink disable is handled in led_set_brightness()).
fa15d8c69238b3 Hans de Goede    2023-05-10  342  	 * To avoid a hw-blink-disable getting lost when a second brightness
fa15d8c69238b3 Hans de Goede    2023-05-10  343  	 * change is done immediately afterwards (before the work runs),
fa15d8c69238b3 Hans de Goede    2023-05-10  344  	 * it uses a separate work_flag.
fa15d8c69238b3 Hans de Goede    2023-05-10  345  	 */
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  346  	led_cdev->delayed_set_value = value;
2c70953b6f535f Remi Pommarel    2025-02-20  347  	/* Ensure delayed_set_value is seen before work_flags modification */
2c70953b6f535f Remi Pommarel    2025-02-20  348  	smp_mb__before_atomic();
2c70953b6f535f Remi Pommarel    2025-02-20  349  
2c70953b6f535f Remi Pommarel    2025-02-20  350  	if (value)
fa15d8c69238b3 Hans de Goede    2023-05-10  351  		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
2c70953b6f535f Remi Pommarel    2025-02-20  352  	else {
fa15d8c69238b3 Hans de Goede    2023-05-10  353  		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
22720a87d0a966 Hans de Goede    2023-05-10  354  		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
fa15d8c69238b3 Hans de Goede    2023-05-10  355  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
fa15d8c69238b3 Hans de Goede    2023-05-10  356  	}
fa15d8c69238b3 Hans de Goede    2023-05-10  357  
32360bf6a5d401 Dmitry Rokosov   2024-09-04  358  	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  359  }
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  360  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  361  
af0bfab907a011 Abanoub Sameh    2020-12-11 @362  void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  363  {
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  364  	led_cdev->brightness = min(value, led_cdev->max_brightness);
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  365  
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  366  	if (led_cdev->flags & LED_SUSPENDED)
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  367  		return;
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  368  
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  369  	led_set_brightness_nopm(led_cdev, led_cdev->brightness);
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  370  }
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  371  EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

