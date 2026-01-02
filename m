Return-Path: <linux-leds+bounces-6519-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D9CEED22
	for <lists+linux-leds@lfdr.de>; Fri, 02 Jan 2026 16:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED0ED30052F1
	for <lists+linux-leds@lfdr.de>; Fri,  2 Jan 2026 15:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473B0241139;
	Fri,  2 Jan 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZV7myrl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64C248F68;
	Fri,  2 Jan 2026 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767366492; cv=none; b=VMVW4iHqzl/MgU3FvxzY6oKjeidWSoW/QigKDtb6jNt5PVpCuJnS/OeZCsGXniFi5nCNq1u6/2HYBga0PF0IxIFJGSK0qnuzqxBblu0YzBEP04vZzCYuLMtTMp1AepxTNjRdLyOYTuFOFzsKBbvcr70/9g8iNZJBFCgwTosUzhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767366492; c=relaxed/simple;
	bh=TwvpnbkuzrJ1ZPKEK2tdIjK8Jn8nbl6PUNyF7xg322w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM/l+pR4v3kG5laZEYoG+fjoVE1qKIcVhBEKAGkoEml2jweDiKnSuGGSthNjmoWmKhiA5yOT5otWmUzhj3mV4E2eS0uO2tHOfagc8g7vNdf4jxgOtYLlN/s0JIDi25bx26FVBcTXhCvHP1/ZDZmucHhJ8pgjsYLrKLZQ0y+E/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZV7myrl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767366490; x=1798902490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TwvpnbkuzrJ1ZPKEK2tdIjK8Jn8nbl6PUNyF7xg322w=;
  b=cZV7myrlsJ+t8a5Je+AewQoJsC+oZ1r62xBUd3oYY8MwQ2NtFlC21Q+z
   I5VHAgmTzlCbAfevlfj74oTUfkbXh54Sadtlr+5TUmlkIXBbPHDAjJEWD
   nSRNGi/vmCoN7km9he+FM/wsFOHhIbi8EddkAoeEnqgrsCijtp9g5niJ6
   Ik4260qoCZFEwTwe9mOMgxTOunAyc5qGk7Y2hM3OG4fErwtuG2MD6VDc3
   R1Jjkt+7qtt8kLWd5IE1oaECwmy5rtJ8PNkPdEFnmxrQPoCz1ZUXPTr7Z
   e8BWorVsRN8RuSRKurgVSfIX2gUg4h7rO70GFmiuajcE+ghv9+LPvrogv
   Q==;
X-CSE-ConnectionGUID: ExrrdQGkTw2W8f1gP9iFHg==
X-CSE-MsgGUID: h8UmMQ/ZSOaKd/W2lNNK7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68895578"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68895578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 07:08:09 -0800
X-CSE-ConnectionGUID: JnYABKukRfKBdEZVEI5WNQ==
X-CSE-MsgGUID: sI7Z3BOcQXGGAiRxarjC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="232525708"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2026 07:08:05 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbgl0-000000002JJ-1yGd;
	Fri, 02 Jan 2026 15:08:02 +0000
Date: Fri, 2 Jan 2026 23:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Andriy Shevencho <andriy.shevchenko@linux.intel.com>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 6/7] leds: Add fwnode_led_get() for firmware-agnostic
 LED resolution
Message-ID: <202601022309.ToOxpSSg-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on robh/for-next linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-add-function-virtual_status-to-led-common-properties/20251230-162857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251230082336.3308403-7-professorjonny98%40gmail.com
patch subject: [PATCH v5 6/7] leds: Add fwnode_led_get() for firmware-agnostic LED resolution
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260102/202601022309.ToOxpSSg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601022309.ToOxpSSg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601022309.ToOxpSSg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/leds/led-core.c:73:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^
   drivers/leds/led-core.c:73:3: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
>> drivers/leds/led-core.c:84:15: error: call to undeclared function 'led_get_brightness'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |         brightness = led_get_brightness(led_cdev);
         |                      ^
   drivers/leds/led-core.c:84:15: note: did you mean 'led_set_brightness'?
   include/linux/leds.h:363:6: note: 'led_set_brightness' declared here
     363 | void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
         |      ^
   drivers/leds/led-core.c:102:2: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     102 |         led_set_brightness_nosleep(led_cdev, brightness);
         |         ^
>> drivers/leds/led-core.c:152:3: error: call to undeclared function 'led_stop_software_blink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^
   drivers/leds/led-core.c:194:23: error: call to undeclared function 'led_get_brightness'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |         current_brightness = led_get_brightness(led_cdev);
         |                              ^
   drivers/leds/led-core.c:205:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     205 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^
   drivers/leds/led-core.c:211:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     211 |                 led_set_brightness_nosleep(led_cdev,
         |                 ^
>> drivers/leds/led-core.c:237:6: warning: no previous prototype for function 'led_init_core' [-Wmissing-prototypes]
     237 | void led_init_core(struct led_classdev *led_cdev)
         |      ^
   drivers/leds/led-core.c:237:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     237 | void led_init_core(struct led_classdev *led_cdev)
         | ^
         | static 
>> drivers/leds/led-core.c:296:6: error: conflicting types for 'led_stop_software_blink'
     296 | void led_stop_software_blink(struct led_classdev *led_cdev)
         |      ^
   drivers/leds/led-core.c:152:3: note: previous implicit declaration is here
     152 |                 led_stop_software_blink(led_cdev);
         |                 ^
   drivers/leds/led-core.c:328:2: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     328 |         led_set_brightness_nosleep(led_cdev, brightness);
         |         ^
>> drivers/leds/led-core.c:332:6: warning: no previous prototype for function 'led_set_brightness_nopm' [-Wmissing-prototypes]
     332 | void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
         |      ^
   drivers/leds/led-core.c:332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     332 | void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
         | ^
         | static 
>> drivers/leds/led-core.c:362:6: error: conflicting types for 'led_set_brightness_nosleep'
     362 | void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value)
         |      ^
   drivers/leds/led-core.c:73:3: note: previous implicit declaration is here
      73 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^
   2 warnings and 10 errors generated.
--
>> drivers/leds/led-triggers.c:36:9: warning: no previous prototype for function 'led_trigger_write' [-Wmissing-prototypes]
      36 | ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
         |         ^
   drivers/leds/led-triggers.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
         | ^
         | static 
>> drivers/leds/led-triggers.c:133:9: warning: no previous prototype for function 'led_trigger_read' [-Wmissing-prototypes]
     133 | ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
         |         ^
   drivers/leds/led-triggers.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     133 | ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
         | ^
         | static 
>> drivers/leds/led-triggers.c:189:3: error: call to undeclared function 'led_stop_software_blink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     189 |                 led_stop_software_blink(led_cdev);
         |                 ^
>> drivers/leds/led-triggers.c:341:13: error: use of undeclared identifier 'leds_list_lock'; did you mean 'tasklist_lock'?
     341 |         down_read(&leds_list_lock);
         |                    ^~~~~~~~~~~~~~
         |                    tasklist_lock
   include/linux/sched/task.h:55:17: note: 'tasklist_lock' declared here
      55 | extern rwlock_t tasklist_lock;
         |                 ^
>> drivers/leds/led-triggers.c:342:33: error: use of undeclared identifier 'leds_list'
     342 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |                                        ^
>> drivers/leds/led-triggers.c:342:33: error: use of undeclared identifier 'leds_list'
>> drivers/leds/led-triggers.c:342:33: error: use of undeclared identifier 'leds_list'
>> drivers/leds/led-triggers.c:342:33: error: use of undeclared identifier 'leds_list'
   drivers/leds/led-triggers.c:348:11: error: use of undeclared identifier 'leds_list_lock'; did you mean 'tasklist_lock'?
     348 |         up_read(&leds_list_lock);
         |                  ^~~~~~~~~~~~~~
         |                  tasklist_lock
   include/linux/sched/task.h:55:17: note: 'tasklist_lock' declared here
      55 | extern rwlock_t tasklist_lock;
         |                 ^
   drivers/leds/led-triggers.c:367:13: error: use of undeclared identifier 'leds_list_lock'; did you mean 'tasklist_lock'?
     367 |         down_read(&leds_list_lock);
         |                    ^~~~~~~~~~~~~~
         |                    tasklist_lock
   include/linux/sched/task.h:55:17: note: 'tasklist_lock' declared here
      55 | extern rwlock_t tasklist_lock;
         |                 ^
   drivers/leds/led-triggers.c:368:33: error: use of undeclared identifier 'leds_list'
     368 |         list_for_each_entry(led_cdev, &leds_list, node) {
         |                                        ^
   drivers/leds/led-triggers.c:368:33: error: use of undeclared identifier 'leds_list'
   drivers/leds/led-triggers.c:368:33: error: use of undeclared identifier 'leds_list'
   drivers/leds/led-triggers.c:368:33: error: use of undeclared identifier 'leds_list'
   drivers/leds/led-triggers.c:374:11: error: use of undeclared identifier 'leds_list_lock'; did you mean 'tasklist_lock'?
     374 |         up_read(&leds_list_lock);
         |                  ^~~~~~~~~~~~~~
         |                  tasklist_lock
   include/linux/sched/task.h:55:17: note: 'tasklist_lock' declared here
      55 | extern rwlock_t tasklist_lock;
         |                 ^
   2 warnings and 13 errors generated.
--
>> drivers/leds/led-class.c:87:32: error: use of undeclared identifier 'led_trigger_read'; did you mean 'led_trigger_set'?
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                ^~~~~~~~~~~~~~~~
         |                                led_trigger_set
   include/linux/sysfs.h:358:66: note: expanded from macro 'BIN_ATTR'
     358 | struct bin_attribute bin_attr_##_name = __BIN_ATTR(_name, _mode, _read, \
         |                                                                  ^
   include/linux/sysfs.h:341:10: note: expanded from macro '__BIN_ATTR'
     341 |         .read = _read,                                                  \
         |                 ^
   include/linux/leds.h:534:5: note: 'led_trigger_set' declared here
     534 | int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trigger);
         |     ^
>> drivers/leds/led-class.c:87:50: error: use of undeclared identifier 'led_trigger_write'
      87 | static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
         |                                                  ^
>> drivers/leds/led-class.c:93:15: error: initializing 'const struct bin_attribute *const *' with an expression of type 'struct bin_attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      93 |         .bin_attrs = led_trigger_bin_attrs,
         |                      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-class.c:183:2: error: call to undeclared function 'led_set_brightness_nopm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         led_set_brightness_nopm(led_cdev, 0);
         |         ^
   drivers/leds/led-class.c:183:2: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   drivers/leds/led-class.c:194:2: error: call to undeclared function 'led_set_brightness_nopm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |         led_set_brightness_nopm(led_cdev, led_cdev->brightness);
         |         ^
>> drivers/leds/led-class.c:258:22: warning: no previous prototype for function 'of_led_get' [-Wmissing-prototypes]
     258 | struct led_classdev *of_led_get(struct device_node *np, int index)
         |                      ^
   drivers/leds/led-class.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     258 | struct led_classdev *of_led_get(struct device_node *np, int index)
         | ^
         | static 
>> drivers/leds/led-class.c:348:12: error: call to undeclared function 'fwnode_get_next_parent_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                   ^
   drivers/leds/led-class.c:348:12: note: did you mean 'fwnode_get_next_parent'?
   include/linux/property.h:153:23: note: 'fwnode_get_next_parent' declared here
     153 | struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode);
         |                       ^
>> drivers/leds/led-class.c:348:10: error: incompatible integer to pointer conversion assigning to 'struct device *' from 'int' [-Wint-conversion]
     348 |         led_dev = fwnode_get_next_parent_dev((struct fwnode_handle *)args.fwnode);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/leds/led-class.c:303:22: warning: no previous prototype for function 'fwnode_led_get' [-Wmissing-prototypes]
     303 | struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
         |                      ^
   drivers/leds/led-class.c:303:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     303 | struct led_classdev *fwnode_led_get(const struct fwnode_handle *fwnode,
         | ^
         | static 
>> drivers/leds/led-class.c:647:14: error: use of undeclared identifier 'leds_list_lock'; did you mean 'leds_lookup_lock'?
     647 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
   drivers/leds/led-class.c:25:21: note: 'leds_lookup_lock' declared here
      25 | static DEFINE_MUTEX(leds_lookup_lock);
         |                     ^
>> drivers/leds/led-class.c:648:34: error: use of undeclared identifier 'leds_list'; did you mean 'leds_class'?
     648 |         list_add_tail(&led_cdev->node, &leds_list);
         |                                         ^~~~~~~~~
         |                                         leds_class
   drivers/leds/led-class.c:244:27: note: 'leds_class' declared here
     244 | static const struct class leds_class = {
         |                           ^
   drivers/leds/led-class.c:649:12: error: use of undeclared identifier 'leds_list_lock'; did you mean 'leds_lookup_lock'?
     649 |         up_write(&leds_list_lock);
         |                   ^~~~~~~~~~~~~~
         |                   leds_lookup_lock
   drivers/leds/led-class.c:25:21: note: 'leds_lookup_lock' declared here
      25 | static DEFINE_MUTEX(leds_lookup_lock);
         |                     ^
>> drivers/leds/led-class.c:656:2: error: call to undeclared function 'led_init_core'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     656 |         led_init_core(led_cdev);
         |         ^
>> drivers/leds/led-class.c:692:2: error: call to undeclared function 'led_stop_software_blink'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     692 |         led_stop_software_blink(led_cdev);
         |         ^
   drivers/leds/led-class.c:704:14: error: use of undeclared identifier 'leds_list_lock'; did you mean 'leds_lookup_lock'?
     704 |         down_write(&leds_list_lock);
         |                     ^~~~~~~~~~~~~~
         |                     leds_lookup_lock
   drivers/leds/led-class.c:25:21: note: 'leds_lookup_lock' declared here
      25 | static DEFINE_MUTEX(leds_lookup_lock);
         |                     ^
   drivers/leds/led-class.c:706:12: error: use of undeclared identifier 'leds_list_lock'; did you mean 'leds_lookup_lock'?
     706 |         up_write(&leds_list_lock);
         |                   ^~~~~~~~~~~~~~
         |                   leds_lookup_lock
   drivers/leds/led-class.c:25:21: note: 'leds_lookup_lock' declared here
      25 | static DEFINE_MUTEX(leds_lookup_lock);
         |                     ^
   2 warnings and 14 errors generated.
--
>> drivers/leds/leds-ns2.c:146:7: error: call to undeclared function 'led_get_brightness'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         if (!led_get_brightness(led_cdev))
         |              ^
   drivers/leds/leds-ns2.c:146:7: note: did you mean 'led_set_brightness'?
   include/linux/leds.h:363:6: note: 'led_set_brightness' declared here
     363 | void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness);
         |      ^
   1 error generated.
--
>> drivers/leds/trigger/ledtrig-panic.c:40:33: error: use of undeclared identifier 'leds_list'
      40 |         list_for_each_entry(led_cdev, &leds_list, node)
         |                                        ^
>> drivers/leds/trigger/ledtrig-panic.c:40:33: error: use of undeclared identifier 'leds_list'
>> drivers/leds/trigger/ledtrig-panic.c:40:33: error: use of undeclared identifier 'leds_list'
>> drivers/leds/trigger/ledtrig-panic.c:40:33: error: use of undeclared identifier 'leds_list'
   4 errors generated.
--
>> drivers/leds/trigger/ledtrig-oneshot.c:61:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                 led_set_brightness_nosleep(led_cdev, LED_FULL);
         |                 ^
   drivers/leds/trigger/ledtrig-oneshot.c:61:3: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   1 error generated.
--
>> drivers/leds/trigger/ledtrig-heartbeat.c:44:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |                 led_set_brightness_nosleep(led_cdev, LED_OFF);
         |                 ^
   drivers/leds/trigger/ledtrig-heartbeat.c:44:3: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   drivers/leds/trigger/ledtrig-heartbeat.c:90:2: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         led_set_brightness_nosleep(led_cdev, brightness);
         |         ^
   2 errors generated.
--
>> drivers/leds/trigger/ledtrig-backlight.c:40:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |                 led_set_brightness_nosleep(led, LED_OFF);
         |                 ^
   drivers/leds/trigger/ledtrig-backlight.c:40:3: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   drivers/leds/trigger/ledtrig-backlight.c:42:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |                 led_set_brightness_nosleep(led, n->brightness);
         |                 ^
   drivers/leds/trigger/ledtrig-backlight.c:87:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |                 led_set_brightness_nosleep(led, LED_OFF);
         |                 ^
   3 errors generated.
--
>> drivers/leds/trigger/ledtrig-gpio.c:33:4: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                         led_set_brightness_nosleep(gpio_data->led,
         |                         ^
   drivers/leds/trigger/ledtrig-gpio.c:33:4: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   drivers/leds/trigger/ledtrig-gpio.c:38:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |                 led_set_brightness_nosleep(gpio_data->led, LED_OFF);
         |                 ^
   2 errors generated.
--
>> drivers/leds/trigger/ledtrig-activity.c:53:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |                 led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
         |                 ^
   drivers/leds/trigger/ledtrig-activity.c:53:3: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   drivers/leds/trigger/ledtrig-activity.c:130:3: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |                 led_set_brightness_nosleep(led_cdev,
         |                 ^
   2 errors generated.
--
>> drivers/leds/trigger/ledtrig-default-on.c:18:2: error: call to undeclared function 'led_set_brightness_nosleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      18 |         led_set_brightness_nosleep(led_cdev, led_cdev->max_brightness);
         |         ^
   drivers/leds/trigger/ledtrig-default-on.c:18:2: note: did you mean 'led_set_brightness_sync'?
   include/linux/leds.h:376:5: note: 'led_set_brightness_sync' declared here
     376 | int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int value);
         |     ^
   1 error generated.
..


vim +/led_set_brightness_nosleep +73 drivers/leds/led-core.c

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
a403d930c58eb8 Bryan Wu         2012-03-23  188  static void led_set_software_blink(struct led_classdev *led_cdev,
a403d930c58eb8 Bryan Wu         2012-03-23  189  				   unsigned long delay_on,
a403d930c58eb8 Bryan Wu         2012-03-23  190  				   unsigned long delay_off)
a403d930c58eb8 Bryan Wu         2012-03-23  191  {
a403d930c58eb8 Bryan Wu         2012-03-23  192  	int current_brightness;
a403d930c58eb8 Bryan Wu         2012-03-23  193  
a403d930c58eb8 Bryan Wu         2012-03-23 @194  	current_brightness = led_get_brightness(led_cdev);
a403d930c58eb8 Bryan Wu         2012-03-23  195  	if (current_brightness)
a403d930c58eb8 Bryan Wu         2012-03-23  196  		led_cdev->blink_brightness = current_brightness;
a403d930c58eb8 Bryan Wu         2012-03-23  197  	if (!led_cdev->blink_brightness)
a403d930c58eb8 Bryan Wu         2012-03-23  198  		led_cdev->blink_brightness = led_cdev->max_brightness;
a403d930c58eb8 Bryan Wu         2012-03-23  199  
a403d930c58eb8 Bryan Wu         2012-03-23  200  	led_cdev->blink_delay_on = delay_on;
a403d930c58eb8 Bryan Wu         2012-03-23  201  	led_cdev->blink_delay_off = delay_off;
a403d930c58eb8 Bryan Wu         2012-03-23  202  
8d82fef8bbee58 Stefan Sørensen  2014-02-04  203  	/* never on - just set to off */
8d82fef8bbee58 Stefan Sørensen  2014-02-04  204  	if (!delay_on) {
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  205  		led_set_brightness_nosleep(led_cdev, LED_OFF);
a403d930c58eb8 Bryan Wu         2012-03-23  206  		return;
8d82fef8bbee58 Stefan Sørensen  2014-02-04  207  	}
a403d930c58eb8 Bryan Wu         2012-03-23  208  
a403d930c58eb8 Bryan Wu         2012-03-23  209  	/* never off - just set to brightness */
a403d930c58eb8 Bryan Wu         2012-03-23  210  	if (!delay_off) {
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  211  		led_set_brightness_nosleep(led_cdev,
81fe8e5b73e3f4 Jacek Anaszewski 2015-10-07  212  					   led_cdev->blink_brightness);
a403d930c58eb8 Bryan Wu         2012-03-23  213  		return;
a403d930c58eb8 Bryan Wu         2012-03-23  214  	}
a403d930c58eb8 Bryan Wu         2012-03-23  215  
a9c6ce57ec2f13 Hans de Goede    2016-11-08  216  	set_bit(LED_BLINK_SW, &led_cdev->work_flags);
9067359faf890b Jiri Kosina      2014-09-02  217  	mod_timer(&led_cdev->blink_timer, jiffies + 1);
a403d930c58eb8 Bryan Wu         2012-03-23  218  }
a403d930c58eb8 Bryan Wu         2012-03-23  219  
a403d930c58eb8 Bryan Wu         2012-03-23  220  
20c0e6b8787c52 Bryan Wu         2012-06-15  221  static void led_blink_setup(struct led_classdev *led_cdev,
a403d930c58eb8 Bryan Wu         2012-03-23  222  		     unsigned long *delay_on,
a403d930c58eb8 Bryan Wu         2012-03-23  223  		     unsigned long *delay_off)
a403d930c58eb8 Bryan Wu         2012-03-23  224  {
a9c6ce57ec2f13 Hans de Goede    2016-11-08  225  	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
5bb629c504394f Fabio Baltieri   2012-05-27  226  	    led_cdev->blink_set &&
a403d930c58eb8 Bryan Wu         2012-03-23  227  	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
a403d930c58eb8 Bryan Wu         2012-03-23  228  		return;
a403d930c58eb8 Bryan Wu         2012-03-23  229  
a403d930c58eb8 Bryan Wu         2012-03-23  230  	/* blink with 1 Hz as default if nothing specified */
a403d930c58eb8 Bryan Wu         2012-03-23  231  	if (!*delay_on && !*delay_off)
a403d930c58eb8 Bryan Wu         2012-03-23  232  		*delay_on = *delay_off = 500;
a403d930c58eb8 Bryan Wu         2012-03-23  233  
a403d930c58eb8 Bryan Wu         2012-03-23  234  	led_set_software_blink(led_cdev, *delay_on, *delay_off);
a403d930c58eb8 Bryan Wu         2012-03-23  235  }
5bb629c504394f Fabio Baltieri   2012-05-27  236  
757b06ae04b3b6 Jacek Anaszewski 2015-09-28 @237  void led_init_core(struct led_classdev *led_cdev)
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  238  {
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  239  	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  240  
49404665b93544 Kees Cook        2017-10-25  241  	timer_setup(&led_cdev->blink_timer, led_timer_function, 0);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  242  }
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  243  EXPORT_SYMBOL_GPL(led_init_core);
757b06ae04b3b6 Jacek Anaszewski 2015-09-28  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

