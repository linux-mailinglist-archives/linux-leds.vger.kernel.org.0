Return-Path: <linux-leds+bounces-6517-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07263CEE83D
	for <lists+linux-leds@lfdr.de>; Fri, 02 Jan 2026 13:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF44B30559CC
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jan 2026 12:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EBB30F543;
	Fri,  2 Jan 2026 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjR9VZdF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C092E8B8B;
	Fri,  2 Jan 2026 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356469; cv=none; b=O4/DbqsHyS+wert4aOegILackyzu0fmyavLEk1MlAfty6Y/GWpU8t8dqradyDRyxrbvosSiV2+FDRNhvGHaFDTcle6JnlQfHT43W3gW6wVKX3tZMH0FOsVGUGgWyVW/0WlANSDR1fgf4+T3lOHPknHeX/i9tp5H/5oeepB28+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356469; c=relaxed/simple;
	bh=rUnoPtcwk4Ezw0NO4tbZHTLhr6V43Zt3ZC96KWS6zS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuY496cGoS9Zi3nnS2U+KE7Sp5alzFPX9ncwyg2sdVLNT80hP+skI3KBD9ODAcaYLOeJTit0QYvM5gibBXccjhEy8VnUMhDwAw4QdtBFwYRINhD8RmTSISNxAH5D1pnuXnKqWxo7GvicGsMt9m/nFAtDE8gmpm0fekh7AeP+ppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjR9VZdF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767356466; x=1798892466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rUnoPtcwk4Ezw0NO4tbZHTLhr6V43Zt3ZC96KWS6zS0=;
  b=EjR9VZdFZ25+2kWXCy2MZBA8t73kk8BSuCEn6PCH/9M1kxNZbokz40Jt
   1fTKOQz9xEn6h58gLeV//hEkxmnrzbTKz3/pRPuBfdl+8gVFpP2/lVwBc
   wKZl1uX2CSe6Zn+RFJ3zZ2DqBBvxdPiIsGAlZtKRcGGqUjzkk2Pc1uJ42
   XGodL8vJ9kDR51OrmxRRmkzhkjetc13M/NjBuwLxeTnN3BbK1RlH+sqon
   i0m64rEHs4YYbJOalEk5AUL17y/Kc+7d/qDQAyZrRHdyvo1MK67Wu60Rr
   e6UieF9olfCNmXr6VBlzn2JlbxvDoFkYWuqGiuK7USv5QstOfKHZ/WEa3
   g==;
X-CSE-ConnectionGUID: IDrsBPb6RF+oNyVSgzm+bQ==
X-CSE-MsgGUID: 8Zi9JOhGSUyI6jc/BQTJiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94319255"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="94319255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:21:05 -0800
X-CSE-ConnectionGUID: Tx/khKvyQ6SvIDbf0uIxuw==
X-CSE-MsgGUID: 8qIYNS51R7KZixY9idgVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="201802724"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jan 2026 04:21:02 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbe9L-000000002FB-3M51;
	Fri, 02 Jan 2026 12:20:59 +0000
Date: Fri, 2 Jan 2026 20:20:04 +0800
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
Message-ID: <202601022018.gzb8zblD-lkp@intel.com>
References: <20251230082336.3308403-7-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260102/202601022018.gzb8zblD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601022018.gzb8zblD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601022018.gzb8zblD-lkp@intel.com/

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
>> drivers/leds/led-core.c:296:6: warning: conflicting types for 'led_stop_software_blink'; have 'void(struct led_classdev *)'
   drivers/leds/led-core.c:152:17: note: previous implicit declaration of 'led_stop_software_blink' with type 'void(struct led_classdev *)'
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:332:6: warning: no previous prototype for 'led_set_brightness_nopm' [-Wmissing-prototypes]
     332 | void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-core.c:362:6: warning: no previous prototype for 'led_set_brightness_nosleep' [-Wmissing-prototypes]
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
   drivers/leds/led-triggers.c:342:40: error: 'leds_list' undeclared (first use in this function); did you mean 'lru_list'?
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
   drivers/leds/led-triggers.c:368:40: error: 'leds_list' undeclared (first use in this function); did you mean 'lru_list'?
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

d4887af9c2b6ab5 Heiner Kallweit  2016-02-16   64  
49404665b935447 Kees Cook        2017-10-25   65  static void led_timer_function(struct timer_list *t)
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   66  {
41cb08555c41649 Ingo Molnar      2025-05-09   67  	struct led_classdev *led_cdev = timer_container_of(led_cdev, t,
41cb08555c41649 Ingo Molnar      2025-05-09   68  							   blink_timer);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   69  	unsigned long brightness;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   70  	unsigned long delay;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   71  
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   72  	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07   73  		led_set_brightness_nosleep(led_cdev, LED_OFF);
a9c6ce57ec2f136 Hans de Goede    2016-11-08   74  		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   75  		return;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   76  	}
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   77  
a9c6ce57ec2f136 Hans de Goede    2016-11-08   78  	if (test_and_clear_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f136 Hans de Goede    2016-11-08   79  			       &led_cdev->work_flags)) {
a9c6ce57ec2f136 Hans de Goede    2016-11-08   80  		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   81  		return;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   82  	}
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   83  
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  @84  	brightness = led_get_brightness(led_cdev);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   85  	if (!brightness) {
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   86  		/* Time to switch the LED on. */
eb1610b4c273370 Hans de Goede    2016-10-23   87  		if (test_and_clear_bit(LED_BLINK_BRIGHTNESS_CHANGE,
eb1610b4c273370 Hans de Goede    2016-10-23   88  					&led_cdev->work_flags))
eb1610b4c273370 Hans de Goede    2016-10-23   89  			brightness = led_cdev->new_blink_brightness;
eb1610b4c273370 Hans de Goede    2016-10-23   90  		else
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   91  			brightness = led_cdev->blink_brightness;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   92  		delay = led_cdev->blink_delay_on;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   93  	} else {
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   94  		/* Store the current brightness value to be able
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   95  		 * to restore it when the delay_off period is over.
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   96  		 */
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   97  		led_cdev->blink_brightness = brightness;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   98  		brightness = LED_OFF;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28   99  		delay = led_cdev->blink_delay_off;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  100  	}
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  101  
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  102  	led_set_brightness_nosleep(led_cdev, brightness);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  103  
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  104  	/* Return in next iteration if led is in one-shot mode and we are in
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  105  	 * the final blink state so that the led is toggled each delay_on +
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  106  	 * delay_off milliseconds in worst case.
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  107  	 */
a9c6ce57ec2f136 Hans de Goede    2016-11-08  108  	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags)) {
a9c6ce57ec2f136 Hans de Goede    2016-11-08  109  		if (test_bit(LED_BLINK_INVERT, &led_cdev->work_flags)) {
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  110  			if (brightness)
a9c6ce57ec2f136 Hans de Goede    2016-11-08  111  				set_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f136 Hans de Goede    2016-11-08  112  					&led_cdev->work_flags);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  113  		} else {
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  114  			if (!brightness)
a9c6ce57ec2f136 Hans de Goede    2016-11-08  115  				set_bit(LED_BLINK_ONESHOT_STOP,
a9c6ce57ec2f136 Hans de Goede    2016-11-08  116  					&led_cdev->work_flags);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  117  		}
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  118  	}
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  119  
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  120  	mod_timer(&led_cdev->blink_timer, jiffies + msecs_to_jiffies(delay));
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  121  }
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  122  
fa15d8c69238b35 Hans de Goede    2023-05-10  123  static void set_brightness_delayed_set_brightness(struct led_classdev *led_cdev,
fa15d8c69238b35 Hans de Goede    2023-05-10  124  						  unsigned int value)
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  125  {
d33d1214a1ddf9e Lee Jones        2024-06-12  126  	int ret;
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  127  
fa15d8c69238b35 Hans de Goede    2023-05-10  128  	ret = __led_set_brightness(led_cdev, value);
d33d1214a1ddf9e Lee Jones        2024-06-12  129  	if (ret == -ENOTSUPP) {
fa15d8c69238b35 Hans de Goede    2023-05-10  130  		ret = __led_set_brightness_blocking(led_cdev, value);
d33d1214a1ddf9e Lee Jones        2024-06-12  131  		if (ret == -ENOTSUPP)
d33d1214a1ddf9e Lee Jones        2024-06-12  132  			/* No back-end support to set a fixed brightness value */
d33d1214a1ddf9e Lee Jones        2024-06-12  133  			return;
d33d1214a1ddf9e Lee Jones        2024-06-12  134  	}
d33d1214a1ddf9e Lee Jones        2024-06-12  135  
d84d80f38f0ff4e Heiner Kallweit  2016-01-22  136  	/* LED HW might have been unplugged, therefore don't warn */
d33d1214a1ddf9e Lee Jones        2024-06-12  137  	if (ret == -ENODEV && led_cdev->flags & LED_UNREGISTERING &&
d33d1214a1ddf9e Lee Jones        2024-06-12  138  	    led_cdev->flags & LED_HW_PLUGGABLE)
d33d1214a1ddf9e Lee Jones        2024-06-12  139  		return;
d33d1214a1ddf9e Lee Jones        2024-06-12  140  
d33d1214a1ddf9e Lee Jones        2024-06-12  141  	if (ret < 0)
1afcadfcd184c3b Jacek Anaszewski 2015-10-19  142  		dev_err(led_cdev->dev,
1afcadfcd184c3b Jacek Anaszewski 2015-10-19  143  			"Setting an LED's brightness failed (%d)\n", ret);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  144  }
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  145  
fa15d8c69238b35 Hans de Goede    2023-05-10  146  static void set_brightness_delayed(struct work_struct *ws)
fa15d8c69238b35 Hans de Goede    2023-05-10  147  {
fa15d8c69238b35 Hans de Goede    2023-05-10  148  	struct led_classdev *led_cdev =
fa15d8c69238b35 Hans de Goede    2023-05-10  149  		container_of(ws, struct led_classdev, set_brightness_work);
fa15d8c69238b35 Hans de Goede    2023-05-10  150  
fa15d8c69238b35 Hans de Goede    2023-05-10  151  	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
fa15d8c69238b35 Hans de Goede    2023-05-10 @152  		led_stop_software_blink(led_cdev);
fa15d8c69238b35 Hans de Goede    2023-05-10  153  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
fa15d8c69238b35 Hans de Goede    2023-05-10  154  	}
fa15d8c69238b35 Hans de Goede    2023-05-10  155  
fa15d8c69238b35 Hans de Goede    2023-05-10  156  	/*
fa15d8c69238b35 Hans de Goede    2023-05-10  157  	 * Triggers may call led_set_brightness(LED_OFF),
fa15d8c69238b35 Hans de Goede    2023-05-10  158  	 * led_set_brightness(LED_FULL) in quick succession to disable blinking
fa15d8c69238b35 Hans de Goede    2023-05-10  159  	 * and turn the LED on. Both actions may have been scheduled to run
fa15d8c69238b35 Hans de Goede    2023-05-10  160  	 * before this work item runs once. To make sure this works properly
fa15d8c69238b35 Hans de Goede    2023-05-10  161  	 * handle LED_SET_BRIGHTNESS_OFF first.
fa15d8c69238b35 Hans de Goede    2023-05-10  162  	 */
2c70953b6f535f7 Remi Pommarel    2025-02-20  163  	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags)) {
fa15d8c69238b35 Hans de Goede    2023-05-10  164  		set_brightness_delayed_set_brightness(led_cdev, LED_OFF);
2c70953b6f535f7 Remi Pommarel    2025-02-20  165  		/*
2c70953b6f535f7 Remi Pommarel    2025-02-20  166  		 * The consecutives led_set_brightness(LED_OFF),
2c70953b6f535f7 Remi Pommarel    2025-02-20  167  		 * led_set_brightness(LED_FULL) could have been executed out of
2c70953b6f535f7 Remi Pommarel    2025-02-20  168  		 * order (LED_FULL first), if the work_flags has been set
2c70953b6f535f7 Remi Pommarel    2025-02-20  169  		 * between LED_SET_BRIGHTNESS_OFF and LED_SET_BRIGHTNESS of this
2c70953b6f535f7 Remi Pommarel    2025-02-20  170  		 * work. To avoid ending with the LED turned off, turn the LED
2c70953b6f535f7 Remi Pommarel    2025-02-20  171  		 * on again.
2c70953b6f535f7 Remi Pommarel    2025-02-20  172  		 */
2c70953b6f535f7 Remi Pommarel    2025-02-20  173  		if (led_cdev->delayed_set_value != LED_OFF)
2c70953b6f535f7 Remi Pommarel    2025-02-20  174  			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
2c70953b6f535f7 Remi Pommarel    2025-02-20  175  	}
fa15d8c69238b35 Hans de Goede    2023-05-10  176  
fa15d8c69238b35 Hans de Goede    2023-05-10  177  	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
fa15d8c69238b35 Hans de Goede    2023-05-10  178  		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
22720a87d0a9667 Hans de Goede    2023-05-10  179  
22720a87d0a9667 Hans de Goede    2023-05-10  180  	if (test_and_clear_bit(LED_SET_BLINK, &led_cdev->work_flags)) {
22720a87d0a9667 Hans de Goede    2023-05-10  181  		unsigned long delay_on = led_cdev->delayed_delay_on;
22720a87d0a9667 Hans de Goede    2023-05-10  182  		unsigned long delay_off = led_cdev->delayed_delay_off;
22720a87d0a9667 Hans de Goede    2023-05-10  183  
22720a87d0a9667 Hans de Goede    2023-05-10  184  		led_blink_set(led_cdev, &delay_on, &delay_off);
22720a87d0a9667 Hans de Goede    2023-05-10  185  	}
fa15d8c69238b35 Hans de Goede    2023-05-10  186  }
fa15d8c69238b35 Hans de Goede    2023-05-10  187  
a403d930c58eb84 Bryan Wu         2012-03-23  188  static void led_set_software_blink(struct led_classdev *led_cdev,
a403d930c58eb84 Bryan Wu         2012-03-23  189  				   unsigned long delay_on,
a403d930c58eb84 Bryan Wu         2012-03-23  190  				   unsigned long delay_off)
a403d930c58eb84 Bryan Wu         2012-03-23  191  {
a403d930c58eb84 Bryan Wu         2012-03-23  192  	int current_brightness;
a403d930c58eb84 Bryan Wu         2012-03-23  193  
a403d930c58eb84 Bryan Wu         2012-03-23  194  	current_brightness = led_get_brightness(led_cdev);
a403d930c58eb84 Bryan Wu         2012-03-23  195  	if (current_brightness)
a403d930c58eb84 Bryan Wu         2012-03-23  196  		led_cdev->blink_brightness = current_brightness;
a403d930c58eb84 Bryan Wu         2012-03-23  197  	if (!led_cdev->blink_brightness)
a403d930c58eb84 Bryan Wu         2012-03-23  198  		led_cdev->blink_brightness = led_cdev->max_brightness;
a403d930c58eb84 Bryan Wu         2012-03-23  199  
a403d930c58eb84 Bryan Wu         2012-03-23  200  	led_cdev->blink_delay_on = delay_on;
a403d930c58eb84 Bryan Wu         2012-03-23  201  	led_cdev->blink_delay_off = delay_off;
a403d930c58eb84 Bryan Wu         2012-03-23  202  
8d82fef8bbee588 Stefan Sørensen  2014-02-04  203  	/* never on - just set to off */
8d82fef8bbee588 Stefan Sørensen  2014-02-04  204  	if (!delay_on) {
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  205  		led_set_brightness_nosleep(led_cdev, LED_OFF);
a403d930c58eb84 Bryan Wu         2012-03-23  206  		return;
8d82fef8bbee588 Stefan Sørensen  2014-02-04  207  	}
a403d930c58eb84 Bryan Wu         2012-03-23  208  
a403d930c58eb84 Bryan Wu         2012-03-23  209  	/* never off - just set to brightness */
a403d930c58eb84 Bryan Wu         2012-03-23  210  	if (!delay_off) {
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  211  		led_set_brightness_nosleep(led_cdev,
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  212  					   led_cdev->blink_brightness);
a403d930c58eb84 Bryan Wu         2012-03-23  213  		return;
a403d930c58eb84 Bryan Wu         2012-03-23  214  	}
a403d930c58eb84 Bryan Wu         2012-03-23  215  
a9c6ce57ec2f136 Hans de Goede    2016-11-08  216  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
9067359faf890b3 Jiri Kosina      2014-09-02  217  	mod_timer(&led_cdev->blink_timer, jiffies + 1);
a403d930c58eb84 Bryan Wu         2012-03-23  218  }
a403d930c58eb84 Bryan Wu         2012-03-23  219  
a403d930c58eb84 Bryan Wu         2012-03-23  220  
20c0e6b8787c528 Bryan Wu         2012-06-15  221  static void led_blink_setup(struct led_classdev *led_cdev,
a403d930c58eb84 Bryan Wu         2012-03-23  222  		     unsigned long *delay_on,
a403d930c58eb84 Bryan Wu         2012-03-23  223  		     unsigned long *delay_off)
a403d930c58eb84 Bryan Wu         2012-03-23  224  {
a9c6ce57ec2f136 Hans de Goede    2016-11-08  225  	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
5bb629c504394f4 Fabio Baltieri   2012-05-27  226  	    led_cdev->blink_set &&
a403d930c58eb84 Bryan Wu         2012-03-23  227  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
a403d930c58eb84 Bryan Wu         2012-03-23  228  		return;
a403d930c58eb84 Bryan Wu         2012-03-23  229  
a403d930c58eb84 Bryan Wu         2012-03-23  230  	/* blink with 1 Hz as default if nothing specified */
a403d930c58eb84 Bryan Wu         2012-03-23  231  	if (!*delay_on && !*delay_off)
a403d930c58eb84 Bryan Wu         2012-03-23  232  		*delay_on = *delay_off = 500;
a403d930c58eb84 Bryan Wu         2012-03-23  233  
a403d930c58eb84 Bryan Wu         2012-03-23  234  	led_set_software_blink(led_cdev, *delay_on, *delay_off);
a403d930c58eb84 Bryan Wu         2012-03-23  235  }
5bb629c504394f4 Fabio Baltieri   2012-05-27  236  
757b06ae04b3b6c Jacek Anaszewski 2015-09-28 @237  void led_init_core(struct led_classdev *led_cdev)
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  238  {
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  239  	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  240  
49404665b935447 Kees Cook        2017-10-25  241  	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  242  }
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  243  EXPORT_SYMBOL_GPL(led_init_core);
757b06ae04b3b6c Jacek Anaszewski 2015-09-28  244  
5bb629c504394f4 Fabio Baltieri   2012-05-27  245  void led_blink_set(struct led_classdev *led_cdev,
5bb629c504394f4 Fabio Baltieri   2012-05-27  246  		   unsigned long *delay_on,
5bb629c504394f4 Fabio Baltieri   2012-05-27  247  		   unsigned long *delay_off)
5bb629c504394f4 Fabio Baltieri   2012-05-27  248  {
8fa7292fee5c524 Thomas Gleixner  2025-04-05  249  	timer_delete_sync(&led_cdev->blink_timer);
5bb629c504394f4 Fabio Baltieri   2012-05-27  250  
7b6af2c53192f17 Jacek Anaszewski 2018-01-03  251  	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
a9c6ce57ec2f136 Hans de Goede    2016-11-08  252  	clear_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
a9c6ce57ec2f136 Hans de Goede    2016-11-08  253  	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
5bb629c504394f4 Fabio Baltieri   2012-05-27  254  
5bb629c504394f4 Fabio Baltieri   2012-05-27  255  	led_blink_setup(led_cdev, delay_on, delay_off);
5bb629c504394f4 Fabio Baltieri   2012-05-27  256  }
2806e2ff489975e Jacek Anaszewski 2015-09-28  257  EXPORT_SYMBOL_GPL(led_blink_set);
a403d930c58eb84 Bryan Wu         2012-03-23  258  
5bb629c504394f4 Fabio Baltieri   2012-05-27  259  void led_blink_set_oneshot(struct led_classdev *led_cdev,
5bb629c504394f4 Fabio Baltieri   2012-05-27  260  			   unsigned long *delay_on,
5bb629c504394f4 Fabio Baltieri   2012-05-27  261  			   unsigned long *delay_off,
5bb629c504394f4 Fabio Baltieri   2012-05-27  262  			   int invert)
5bb629c504394f4 Fabio Baltieri   2012-05-27  263  {
a9c6ce57ec2f136 Hans de Goede    2016-11-08  264  	if (test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
9067359faf890b3 Jiri Kosina      2014-09-02  265  	     timer_pending(&led_cdev->blink_timer))
5bb629c504394f4 Fabio Baltieri   2012-05-27  266  		return;
5bb629c504394f4 Fabio Baltieri   2012-05-27  267  
a9c6ce57ec2f136 Hans de Goede    2016-11-08  268  	set_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags);
a9c6ce57ec2f136 Hans de Goede    2016-11-08  269  	clear_bit(LED_BLINK_ONESHOT_STOP, &led_cdev->work_flags);
5bb629c504394f4 Fabio Baltieri   2012-05-27  270  
5bb629c504394f4 Fabio Baltieri   2012-05-27  271  	if (invert)
a9c6ce57ec2f136 Hans de Goede    2016-11-08  272  		set_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
5bb629c504394f4 Fabio Baltieri   2012-05-27  273  	else
a9c6ce57ec2f136 Hans de Goede    2016-11-08  274  		clear_bit(LED_BLINK_INVERT, &led_cdev->work_flags);
5bb629c504394f4 Fabio Baltieri   2012-05-27  275  
5bb629c504394f4 Fabio Baltieri   2012-05-27  276  	led_blink_setup(led_cdev, delay_on, delay_off);
5bb629c504394f4 Fabio Baltieri   2012-05-27  277  }
2806e2ff489975e Jacek Anaszewski 2015-09-28  278  EXPORT_SYMBOL_GPL(led_blink_set_oneshot);
5bb629c504394f4 Fabio Baltieri   2012-05-27  279  
22720a87d0a9667 Hans de Goede    2023-05-10  280  void led_blink_set_nosleep(struct led_classdev *led_cdev, unsigned long delay_on,
22720a87d0a9667 Hans de Goede    2023-05-10  281  			   unsigned long delay_off)
22720a87d0a9667 Hans de Goede    2023-05-10  282  {
22720a87d0a9667 Hans de Goede    2023-05-10  283  	/* If necessary delegate to a work queue task. */
22720a87d0a9667 Hans de Goede    2023-05-10  284  	if (led_cdev->blink_set && led_cdev->brightness_set_blocking) {
22720a87d0a9667 Hans de Goede    2023-05-10  285  		led_cdev->delayed_delay_on = delay_on;
22720a87d0a9667 Hans de Goede    2023-05-10  286  		led_cdev->delayed_delay_off = delay_off;
22720a87d0a9667 Hans de Goede    2023-05-10  287  		set_bit(LED_SET_BLINK, &led_cdev->work_flags);
32360bf6a5d4016 Dmitry Rokosov   2024-09-04  288  		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
22720a87d0a9667 Hans de Goede    2023-05-10  289  		return;
22720a87d0a9667 Hans de Goede    2023-05-10  290  	}
22720a87d0a9667 Hans de Goede    2023-05-10  291  
22720a87d0a9667 Hans de Goede    2023-05-10  292  	led_blink_set(led_cdev, &delay_on, &delay_off);
22720a87d0a9667 Hans de Goede    2023-05-10  293  }
22720a87d0a9667 Hans de Goede    2023-05-10  294  EXPORT_SYMBOL_GPL(led_blink_set_nosleep);
22720a87d0a9667 Hans de Goede    2023-05-10  295  
d23a22a74fded23 Fabio Baltieri   2012-08-15 @296  void led_stop_software_blink(struct led_classdev *led_cdev)
a403d930c58eb84 Bryan Wu         2012-03-23  297  {
8fa7292fee5c524 Thomas Gleixner  2025-04-05  298  	timer_delete_sync(&led_cdev->blink_timer);
437864828d82b9d Fabio Baltieri   2012-06-07  299  	led_cdev->blink_delay_on = 0;
437864828d82b9d Fabio Baltieri   2012-06-07  300  	led_cdev->blink_delay_off = 0;
a9c6ce57ec2f136 Hans de Goede    2016-11-08  301  	clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
d23a22a74fded23 Fabio Baltieri   2012-08-15  302  }
d23a22a74fded23 Fabio Baltieri   2012-08-15  303  EXPORT_SYMBOL_GPL(led_stop_software_blink);
d23a22a74fded23 Fabio Baltieri   2012-08-15  304  
af0bfab907a011e Abanoub Sameh    2020-12-11  305  void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
d23a22a74fded23 Fabio Baltieri   2012-08-15  306  {
f1e80c07416adac Jacek Anaszewski 2015-10-07  307  	/*
7cfe749fad51582 Tony Makkiel     2016-05-18  308  	 * If software blink is active, delay brightness setting
f1e80c07416adac Jacek Anaszewski 2015-10-07  309  	 * until the next timer tick.
f1e80c07416adac Jacek Anaszewski 2015-10-07  310  	 */
a9c6ce57ec2f136 Hans de Goede    2016-11-08  311  	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
f1e80c07416adac Jacek Anaszewski 2015-10-07  312  		/*
f1e80c07416adac Jacek Anaszewski 2015-10-07  313  		 * If we need to disable soft blinking delegate this to the
f1e80c07416adac Jacek Anaszewski 2015-10-07  314  		 * work queue task to avoid problems in case we are called
f1e80c07416adac Jacek Anaszewski 2015-10-07  315  		 * from hard irq context.
f1e80c07416adac Jacek Anaszewski 2015-10-07  316  		 */
af0bfab907a011e Abanoub Sameh    2020-12-11  317  		if (!brightness) {
a9c6ce57ec2f136 Hans de Goede    2016-11-08  318  			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
32360bf6a5d4016 Dmitry Rokosov   2024-09-04  319  			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
f1e80c07416adac Jacek Anaszewski 2015-10-07  320  		} else {
a9c6ce57ec2f136 Hans de Goede    2016-11-08  321  			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
a9c6ce57ec2f136 Hans de Goede    2016-11-08  322  				&led_cdev->work_flags);
eb1610b4c273370 Hans de Goede    2016-10-23  323  			led_cdev->new_blink_brightness = brightness;
f1e80c07416adac Jacek Anaszewski 2015-10-07  324  		}
d23a22a74fded23 Fabio Baltieri   2012-08-15  325  		return;
d23a22a74fded23 Fabio Baltieri   2012-08-15  326  	}
437864828d82b9d Fabio Baltieri   2012-06-07  327  
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  328  	led_set_brightness_nosleep(led_cdev, brightness);
a403d930c58eb84 Bryan Wu         2012-03-23  329  }
2806e2ff489975e Jacek Anaszewski 2015-09-28  330  EXPORT_SYMBOL_GPL(led_set_brightness);
3ef7de5304edf60 Jacek Anaszewski 2014-08-20  331  
af0bfab907a011e Abanoub Sameh    2020-12-11 @332  void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  333  {
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  334  	/* Use brightness_set op if available, it is guaranteed not to sleep */
d4887af9c2b6ab5 Heiner Kallweit  2016-02-16  335  	if (!__led_set_brightness(led_cdev, value))
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  336  		return;
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  337  
fa15d8c69238b35 Hans de Goede    2023-05-10  338  	/*
fa15d8c69238b35 Hans de Goede    2023-05-10  339  	 * Brightness setting can sleep, delegate it to a work queue task.
fa15d8c69238b35 Hans de Goede    2023-05-10  340  	 * value 0 / LED_OFF is special, since it also disables hw-blinking
fa15d8c69238b35 Hans de Goede    2023-05-10  341  	 * (sw-blink disable is handled in led_set_brightness()).
fa15d8c69238b35 Hans de Goede    2023-05-10  342  	 * To avoid a hw-blink-disable getting lost when a second brightness
fa15d8c69238b35 Hans de Goede    2023-05-10  343  	 * change is done immediately afterwards (before the work runs),
fa15d8c69238b35 Hans de Goede    2023-05-10  344  	 * it uses a separate work_flag.
fa15d8c69238b35 Hans de Goede    2023-05-10  345  	 */
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  346  	led_cdev->delayed_set_value = value;
2c70953b6f535f7 Remi Pommarel    2025-02-20  347  	/* Ensure delayed_set_value is seen before work_flags modification */
2c70953b6f535f7 Remi Pommarel    2025-02-20  348  	smp_mb__before_atomic();
2c70953b6f535f7 Remi Pommarel    2025-02-20  349  
2c70953b6f535f7 Remi Pommarel    2025-02-20  350  	if (value)
fa15d8c69238b35 Hans de Goede    2023-05-10  351  		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
2c70953b6f535f7 Remi Pommarel    2025-02-20  352  	else {
fa15d8c69238b35 Hans de Goede    2023-05-10  353  		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
22720a87d0a9667 Hans de Goede    2023-05-10  354  		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
fa15d8c69238b35 Hans de Goede    2023-05-10  355  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
fa15d8c69238b35 Hans de Goede    2023-05-10  356  	}
fa15d8c69238b35 Hans de Goede    2023-05-10  357  
32360bf6a5d4016 Dmitry Rokosov   2024-09-04  358  	queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  359  }
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  360  EXPORT_SYMBOL_GPL(led_set_brightness_nopm);
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  361  
af0bfab907a011e Abanoub Sameh    2020-12-11 @362  void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  363  {
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  364  	led_cdev->brightness = min(value, led_cdev->max_brightness);
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  365  
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  366  	if (led_cdev->flags & LED_SUSPENDED)
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  367  		return;
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  368  
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  369  	led_set_brightness_nopm(led_cdev, led_cdev->brightness);
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  370  }
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  371  EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
81fe8e5b73e3f4d Jacek Anaszewski 2015-10-07  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

