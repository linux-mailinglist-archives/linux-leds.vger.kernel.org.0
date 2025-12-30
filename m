Return-Path: <linux-leds+bounces-6506-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCCCEA22A
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 17:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 318AD3024111
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 16:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B90031A041;
	Tue, 30 Dec 2025 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SN0hf+6x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74C31ED87;
	Tue, 30 Dec 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767110901; cv=none; b=ZC6C1TFwQQe3nVdWIlyfkxrW9NCwaG48cd+EI/4QgmDBU30gzffLnS/gnFLNcCQpAqXv8SPkH3zk6ln3de5d+9iQS4aJs94XkTb0la6yC4x+P53YGFV+O7OFA9EDS7Twkw88f1pIdVcGOAKOdYV3TIfUhthrt6cZxmQ2UJBCiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767110901; c=relaxed/simple;
	bh=M0h9A3evoy2Ae+QSa63S28LpLDzWsYWGUw/ljyISe0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI1H/WInxijaw7XU4Ef/x527TX9AcBUty1l/OIseAXz3YDTDU+FE7H9MoxbEawkRlvBNYPTVRvYB9IOpPbkAhwkNpj8WTeL5UaWumaQFSV/aTtmqZ+f6MoIyikxcJDik9sT8acmq335OaDuFKkUanZ80lUI2kajb/1r2l1gSRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SN0hf+6x; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767110898; x=1798646898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M0h9A3evoy2Ae+QSa63S28LpLDzWsYWGUw/ljyISe0Y=;
  b=SN0hf+6x+dII+NYO1JXE4b+MmQcQGqOBQKeJQfgaUNlSf2CdOOWl4TE1
   sSGw1j3iNlVjgQ0e62U/DPhvq7IDWGjhjvib9PsgewmtYlec3y613bFIE
   Swdy8VV+cDp+yH1/dz7w9IxtzHA9wkYmLHbCEqOyvEYtyTEBJoCtSkF1g
   C9VUrVQx1PJhTFnNFOFCPOg6eUz7EgbmkWv3MFKUaUi/ajiWQ4eujNLz7
   x2qccha5n/kaEjBG2nn1VVnIzLGQUbj1OY9zM1A1/XnzulKyAXM338dNw
   dlQXOisGpkNNbdA4AvnJmOB/cQM8JCtN94zzpNPxp4MuHKatmYhWxMK+I
   Q==;
X-CSE-ConnectionGUID: Ndxmvg9YRoqNpu02We2sgw==
X-CSE-MsgGUID: a9wj46iXQi2IbPOUwgu+mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79817847"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79817847"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 08:08:18 -0800
X-CSE-ConnectionGUID: 0b4wnrlpRZikFRgrxhkLhg==
X-CSE-MsgGUID: JjQEXwCBRsWIuJW/6haqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="201245546"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Dec 2025 08:08:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vacGa-000000007ya-2kmg;
	Tue, 30 Dec 2025 16:08:12 +0000
Date: Tue, 30 Dec 2025 17:07:31 +0100
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
Subject: Re: [PATCH v4 6/7] leds: Add fwnode_led_get() for firmware-agnostic
 LED resolution
Message-ID: <202512301725.EodRm4Af-lkp@intel.com>
References: <20251230003250.1197744-7-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230003250.1197744-7-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next next-20251219]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-add-function-virtual_status-to-led-common-properties/20251230-083649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251230003250.1197744-7-professorjonny98%40gmail.com
patch subject: [PATCH v4 6/7] leds: Add fwnode_led_get() for firmware-agnostic LED resolution
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251230/202512301725.EodRm4Af-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301725.EodRm4Af-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301725.EodRm4Af-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/leds/led-core.c: In function 'led_timer_function':
>> drivers/leds/led-core.c:73:17: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_set_brightness_sync
>> drivers/leds/led-core.c:84:22: error: implicit declaration of function 'led_get_brightness'; did you mean 'led_set_brightness'? [-Wimplicit-function-declaration]
      84 |         brightness = led_get_brightness(led_cdev);
         |                      ^~~~~~~~~~~~~~~~~~
         |                      led_set_brightness
   drivers/leds/led-core.c: In function 'set_brightness_delayed':
>> drivers/leds/led-core.c:152:17: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c: At top level:
   drivers/leds/led-core.c:237:6: warning: no previous prototype for 'led_init_core' [-Wmissing-prototypes]
     237 | void led_init_core(struct led_classdev *led_cdev)
         |      ^~~~~~~~~~~~~
   drivers/leds/led-core.c:296:6: warning: no previous prototype for 'led_stop_software_blink' [-Wmissing-prototypes]
     296 | void led_stop_software_blink(struct led_classdev *led_cdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:296:6: warning: conflicting types for 'led_stop_software_blink'; have 'void(struct led_classdev *)'
   drivers/leds/led-core.c:152:17: note: previous implicit declaration of 'led_stop_software_blink' with type 'void(struct led_classdev *)'
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:332:6: warning: no previous prototype for 'led_set_brightness_nopm' [-Wmissing-prototypes]
     332 | void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:362:6: warning: no previous prototype for 'led_set_brightness_nosleep' [-Wmissing-prototypes]
     362 | void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:362:6: warning: conflicting types for 'led_set_brightness_nosleep'; have 'void(struct led_classdev *, unsigned int)'
   drivers/leds/led-core.c:73:17: note: previous implicit declaration of 'led_set_brightness_nosleep' with type 'void(struct led_classdev *, unsigned int)'
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/leds/led-class.c:10:
>> drivers/leds/led-class.c:87:32: error: 'led_trigger_read' undeclared here (not in a function); did you mean 'led_trigger_set'?
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:341:17: note: in definition of macro '__BIN_ATTR'
     341 |         .read = _read,                                                  \
         |                 ^~~~~
   drivers/leds/led-class.c:87:8: note: in expansion of macro 'BIN_ATTR'
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |        ^~~~~~~~
>> drivers/leds/led-class.c:87:50: error: 'led_trigger_write' undeclared here (not in a function); did you mean 'led_trigger_set'?
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                                  ^~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:342:18: note: in definition of macro '__BIN_ATTR'
     342 |         .write = _write,                                                \
         |                  ^~~~~~
   drivers/leds/led-class.c:87:8: note: in expansion of macro 'BIN_ATTR'
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |        ^~~~~~~~
>> drivers/leds/led-class.c:93:22: error: initialization of 'const struct bin_attribute * const*' from incompatible pointer type 'struct bin_attribute **' [-Wincompatible-pointer-types]
      93 |         .bin_attrs = led_trigger_bin_attrs,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-class.c:93:22: note: (near initialization for 'led_trigger_group.bin_attrs')
   drivers/leds/led-class.c: In function 'led_classdev_suspend':
>> drivers/leds/led-class.c:183:9: error: implicit declaration of function 'led_set_brightness_nopm'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
     183 |         led_set_brightness_nopm(led_cdev, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         led_set_brightness_sync
   drivers/leds/led-class.c: At top level:
   drivers/leds/led-class.c:258:22: warning: no previous prototype for 'of_led_get' [-Wmissing-prototypes]
     258 | struct led_classdev *of_led_get(struct device_node *np, int index)
         |                      ^~~~~~~~~~
   drivers/leds/led-class.c:303:22: warning: no previous prototype for 'fwnode_led_get' [-Wmissing-prototypes]
     303 | struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
         |                      ^~~~~~~~~~~~~~
   drivers/leds/led-class.c: In function 'fwnode_led_get':
>> drivers/leds/led-class.c:348:19: error: implicit declaration of function 'fwnode_get_next_parent_dev'; did you mean 'fwnode_get_next_parent'? [-Wimplicit-function-declaration]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   fwnode_get_next_parent
>> drivers/leds/led-class.c:348:17: error: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                 ^
   drivers/leds/led-class.c: In function 'led_classdev_register_ext':
>> drivers/leds/led-class.c:647:21: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'leds_lookup_lock'?
     647 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
   drivers/leds/led-class.c:647:21: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/leds/led-class.c:648:41: error: 'leds_list' undeclared (first use in this function); did you mean 'leds_class'?
     648 |         list_add_tail(&led_cdev->node, &leds_list);
         |                                         ^~~~~~~~~
         |                                         leds_class
>> drivers/leds/led-class.c:656:9: error: implicit declaration of function 'led_init_core' [-Wimplicit-function-declaration]
     656 |         led_init_core(led_cdev);
         |         ^~~~~~~~~~~~~
   drivers/leds/led-class.c: In function 'led_classdev_unregister':
>> drivers/leds/led-class.c:692:9: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     692 |         led_stop_software_blink(led_cdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-class.c:704:21: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'leds_lookup_lock'?
     704 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
--
   drivers/leds/led-triggers.c:36:9: warning: no previous prototype for 'led_trigger_write' [-Wmissing-prototypes]
      36 | ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c:133:9: warning: no previous prototype for 'led_trigger_read' [-Wmissing-prototypes]
     133 | ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c: In function 'led_trigger_set':
>> drivers/leds/led-triggers.c:189:17: error: implicit declaration of function 'led_stop_software_blink' [-Wimplicit-function-declaration]
     189 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-triggers.c: In function 'led_trigger_register':
>> drivers/leds/led-triggers.c:341:20: error: 'leds_list_lock' undeclared (first use in this function); did you mean 'tasklist_lock'?
     341 |         down_read(&leds_list_lock);
         |                    ^~~~~~~~~~~~~~
         |                    tasklist_lock
   drivers/leds/led-triggers.c:341:20: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/kernel.h:22,
                    from drivers/leds/led-triggers.c:11:
>> drivers/leds/led-triggers.c:342:40: error: 'leds_list' undeclared (first use in this function); did you mean 'pgd_list'?
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
--
   drivers/leds/trigger/ledtrig-oneshot.c: In function 'led_invert_store':
>> drivers/leds/trigger/ledtrig-oneshot.c:61:17: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      61 |                 led_set_brightness_nosleep(led_cdev, LED_FULL);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_set_brightness_sync
--
   drivers/leds/trigger/ledtrig-heartbeat.c: In function 'led_heartbeat_function':
>> drivers/leds/trigger/ledtrig-heartbeat.c:44:17: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      44 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_set_brightness_sync
--
   drivers/leds/trigger/ledtrig-backlight.c: In function 'ledtrig_backlight_notify_blank':
>> drivers/leds/trigger/ledtrig-backlight.c:40:17: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      40 |                 led_set_brightness_nosleep(led, LED_OFF);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 led_set_brightness_sync
--
   drivers/leds/trigger/ledtrig-gpio.c: In function 'gpio_trig_irq':
>> drivers/leds/trigger/ledtrig-gpio.c:33:25: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      33 |                         led_set_brightness_nosleep(gpio_data->led,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         led_set_brightness_sync
--
   drivers/leds/trigger/ledtrig-default-on.c: In function 'defon_trig_activate':
>> drivers/leds/trigger/ledtrig-default-on.c:18:9: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      18 |         led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         led_set_brightness_sync
--
   drivers/leds/trigger/ledtrig-transient.c: In function 'transient_timer_function':
>> drivers/leds/trigger/ledtrig-transient.c:39:9: error: implicit declaration of function 'led_set_brightness_nosleep'; did you mean 'led_set_brightness_sync'? [-Wimplicit-function-declaration]
      39 |         led_set_brightness_nosleep(led_cdev, transient_data->restore_state);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         led_set_brightness_sync


vim +73 drivers/leds/led-core.c

d4887af9c2b6ab Heiner Kallweit  2016-02-16   64  
49404665b93544 Kees Cook        2017-10-25   65  static void led_timer_function(struct timer_list *t)
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   66  {
41cb08555c4164 Ingo Molnar      2025-05-09   67  	struct led_classdev *led_cdev = timer_container_of(led_cdev, t,
41cb08555c4164 Ingo Molnar      2025-05-09   68  							   blink_timer);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   69  	unsigned long brightness;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   70  	unsigned long delay;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   71  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   72  	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  @73  		led_set_brightness_nosleep(led_cdev, LED_OFF);
a9c6ce57ec2f13 Hans de Goede    2016-11-08   74  		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   75  		return;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   76  	}
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   77  
a9c6ce57ec2f13 Hans de Goede    2016-11-08   78  	if (test_and_clear_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f13 Hans de Goede    2016-11-08   79  			       &led_cdev->work_flags)) {
a9c6ce57ec2f13 Hans de Goede    2016-11-08   80  		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   81  		return;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   82  	}
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   83  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  @84  	brightness = led_get_brightness(led_cdev);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   85  	if (!brightness) {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   86  		/* Time to switch the LED on. */
eb1610b4c27337 Hans de Goede    2016-10-23   87  		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
eb1610b4c27337 Hans de Goede    2016-10-23   88  					&led_cdev->work_flags))
eb1610b4c27337 Hans de Goede    2016-10-23   89  			brightness = led_cdev->new_blink_brightness;
eb1610b4c27337 Hans de Goede    2016-10-23   90  		else
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   91  			brightness = led_cdev->blink_brightness;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   92  		delay = led_cdev->blink_delay_on;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   93  	} else {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   94  		/* Store the current brightness value to be able
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   95  		 * to restore it when the delay_off period is over.
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   96  		 */
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   97  		led_cdev->blink_brightness = brightness;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   98  		brightness = LED_OFF;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28   99  		delay = led_cdev->blink_delay_off;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  100  	}
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  101  
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  102  	led_set_brightness_nosleep(led_cdev, brightness);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  103  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  104  	/* Return in next iteration if led is in one-shot mode and we are in
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  105  	 * the final blink state so that the led is toggled each delay_on +
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  106  	 * delay_off milliseconds in worst case.
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  107  	 */
a9c6ce57ec2f13 Hans de Goede    2016-11-08  108  	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags)) {
a9c6ce57ec2f13 Hans de Goede    2016-11-08  109  		if (test_bit(LED_BLINK_INVERT, &led_cdev->work_flags)) {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  110  			if (brightness)
a9c6ce57ec2f13 Hans de Goede    2016-11-08  111  				set_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f13 Hans de Goede    2016-11-08  112  					&led_cdev->work_flags);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  113  		} else {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  114  			if (!brightness)
a9c6ce57ec2f13 Hans de Goede    2016-11-08  115  				set_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f13 Hans de Goede    2016-11-08  116  					&led_cdev->work_flags);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  117  		}
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  118  	}
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  119  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  120  	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  121  }
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  122  
fa15d8c69238b3 Hans de Goede    2023-05-10  123  static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
fa15d8c69238b3 Hans de Goede    2023-05-10  124  						  unsigned int value)
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  125  {
d33d1214a1ddf9 Lee Jones        2024-06-12  126  	int ret;
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  127  
fa15d8c69238b3 Hans de Goede    2023-05-10  128  	ret = __led_set_brightness(led_cdev, value);
d33d1214a1ddf9 Lee Jones        2024-06-12  129  	if (ret == -ENOTSUPP) {
fa15d8c69238b3 Hans de Goede    2023-05-10  130  		ret = __led_set_brightness_blocking(led_cdev, value);
d33d1214a1ddf9 Lee Jones        2024-06-12  131  		if (ret == -ENOTSUPP)
d33d1214a1ddf9 Lee Jones        2024-06-12  132  			/* No back-end support to set a fixed brightness value */
d33d1214a1ddf9 Lee Jones        2024-06-12  133  			return;
d33d1214a1ddf9 Lee Jones        2024-06-12  134  	}
d33d1214a1ddf9 Lee Jones        2024-06-12  135  
d84d80f38f0ff4 Heiner Kallweit  2016-01-22  136  	/* LED HW might have been unplugged, therefore don't warn */
d33d1214a1ddf9 Lee Jones        2024-06-12  137  	if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
d33d1214a1ddf9 Lee Jones        2024-06-12  138  	    led_cdev->flags & LED_HW_PLUGGABLE)
d33d1214a1ddf9 Lee Jones        2024-06-12  139  		return;
d33d1214a1ddf9 Lee Jones        2024-06-12  140  
d33d1214a1ddf9 Lee Jones        2024-06-12  141  	if (ret < 0)
1afcadfcd184c3 Jacek Anaszewski 2015-10-19  142  		dev_err(led_cdev->dev,
1afcadfcd184c3 Jacek Anaszewski 2015-10-19  143  			"Setting an LED's brightness failed (%d)\n", ret);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  144  }
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  145  
fa15d8c69238b3 Hans de Goede    2023-05-10  146  static void set_brightness_delayed(struct work_struct *ws)
fa15d8c69238b3 Hans de Goede    2023-05-10  147  {
fa15d8c69238b3 Hans de Goede    2023-05-10  148  	struct led_classdev *led_cdev =
fa15d8c69238b3 Hans de Goede    2023-05-10  149  		container_of(ws, struct led_classdev, set_brightness_work);
fa15d8c69238b3 Hans de Goede    2023-05-10  150  
fa15d8c69238b3 Hans de Goede    2023-05-10  151  	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
fa15d8c69238b3 Hans de Goede    2023-05-10 @152  		led_stop_software_blink(led_cdev);
fa15d8c69238b3 Hans de Goede    2023-05-10  153  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
fa15d8c69238b3 Hans de Goede    2023-05-10  154  	}
fa15d8c69238b3 Hans de Goede    2023-05-10  155  
fa15d8c69238b3 Hans de Goede    2023-05-10  156  	/*
fa15d8c69238b3 Hans de Goede    2023-05-10  157  	 * Triggers may call led_set_brightness(LED_OFF),
fa15d8c69238b3 Hans de Goede    2023-05-10  158  	 * led_set_brightness(LED_FULL) in quick succession to disable blinking
fa15d8c69238b3 Hans de Goede    2023-05-10  159  	 * and turn the LED on. Both actions may have been scheduled to run
fa15d8c69238b3 Hans de Goede    2023-05-10  160  	 * before this work item runs once. To make sure this works properly
fa15d8c69238b3 Hans de Goede    2023-05-10  161  	 * handle LED_SET_BRIGHTNESS_OFF first.
fa15d8c69238b3 Hans de Goede    2023-05-10  162  	 */
2c70953b6f535f Remi Pommarel    2025-02-20  163  	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags)) {
fa15d8c69238b3 Hans de Goede    2023-05-10  164  		set_brightness_delayed_set_brightness(led_cdev, LED_OFF);
2c70953b6f535f Remi Pommarel    2025-02-20  165  		/*
2c70953b6f535f Remi Pommarel    2025-02-20  166  		 * The consecutives led_set_brightness(LED_OFF),
2c70953b6f535f Remi Pommarel    2025-02-20  167  		 * led_set_brightness(LED_FULL) could have been executed out of
2c70953b6f535f Remi Pommarel    2025-02-20  168  		 * order (LED_FULL first), if the work_flags has been set
2c70953b6f535f Remi Pommarel    2025-02-20  169  		 * between LED_SET_BRIGHTNESS_OFF and LED_SET_BRIGHTNESS of this
2c70953b6f535f Remi Pommarel    2025-02-20  170  		 * work. To avoid ending with the LED turned off, turn the LED
2c70953b6f535f Remi Pommarel    2025-02-20  171  		 * on again.
2c70953b6f535f Remi Pommarel    2025-02-20  172  		 */
2c70953b6f535f Remi Pommarel    2025-02-20  173  		if (led_cdev->delayed_set_value != LED_OFF)
2c70953b6f535f Remi Pommarel    2025-02-20  174  			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
2c70953b6f535f Remi Pommarel    2025-02-20  175  	}
fa15d8c69238b3 Hans de Goede    2023-05-10  176  
fa15d8c69238b3 Hans de Goede    2023-05-10  177  	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
fa15d8c69238b3 Hans de Goede    2023-05-10  178  		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
22720a87d0a966 Hans de Goede    2023-05-10  179  
22720a87d0a966 Hans de Goede    2023-05-10  180  	if (test_and_clear_bit(LED_SET_BLINK, &led_cdev->work_flags)) {
22720a87d0a966 Hans de Goede    2023-05-10  181  		unsigned long delay_on = led_cdev->delayed_delay_on;
22720a87d0a966 Hans de Goede    2023-05-10  182  		unsigned long delay_off = led_cdev->delayed_delay_off;
22720a87d0a966 Hans de Goede    2023-05-10  183  
22720a87d0a966 Hans de Goede    2023-05-10  184  		led_blink_set(led_cdev, &delay_on, &delay_off);
22720a87d0a966 Hans de Goede    2023-05-10  185  	}
fa15d8c69238b3 Hans de Goede    2023-05-10  186  }
fa15d8c69238b3 Hans de Goede    2023-05-10  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

