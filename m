Return-Path: <linux-leds+bounces-7986-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LhxOIAU+WkY5QIAu9opvQ
	(envelope-from <linux-leds+bounces-7986-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 23:49:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FF4C4390
	for <lists+linux-leds@lfdr.de>; Mon, 04 May 2026 23:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6E7230160E7
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2026 21:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAB7369998;
	Mon,  4 May 2026 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCM2vi2q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98D364029;
	Mon,  4 May 2026 21:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777931389; cv=none; b=NY4yH7N3ZViFxn7Oh57Chd/4hXj75us6m01h969szP8tEkCWo8gjjtbeHNyV0fr4gdHKHkggQMlPHj9TuFkU1iXSOukaA7iOzWBx16ZIbZpcbNiL/rJ9Naji2GMDU0YgiLgnyQFjPef/UMTp9Qu83ksQux4BWwz1cJR0hdGIgNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777931389; c=relaxed/simple;
	bh=cbnU6gj7O0ry9v8dc64v8x0h01WyetZZ+GqiP32svHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9TX6DUgeTGKjjYxSUMrVDrkxfvACIGxBllij3GTd9Rwz99FiGHBrMWCG2azScFm3wwWLju1Y94p6l9+Y29gGKSsOxrT4DwgKJ88QNDei0bLFjUusZjA2RMEuwLbMVXN5K/tmkejKZenNyCaaKUI/fbboIzPwoIWqp54658s1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCM2vi2q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777931388; x=1809467388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cbnU6gj7O0ry9v8dc64v8x0h01WyetZZ+GqiP32svHw=;
  b=aCM2vi2qEx5MWlQE4d9f+4k1unqOpsWb26QnNglIrHFOuZ9gl445UtPY
   hTTgk8kn62yFSj23akBkx/UYVAIWxL1mD7MTMRWqI/CDwf24aROS6Aiaf
   XeurpeoRymz9BlXbtQvKhbNQ8PwfbB258EocXOXo1Dp/JCW0CTyUP3fJL
   XFj6aAlgnE0taxj7ZcIEZiKhKtKsBUrf5LfwzMfV1yLj1Y8tPV4yxUa2G
   Q1rtJIwmyWbWgB3DxwCTUX5ARNcdTlr9CXiDJbMnsoFi6PlP9OAffSzTg
   f5bgYNrNpCyKMeD0jyi68iFx5/eJLXCEkFDI/zM51eWzLnch0hl8hYqZP
   g==;
X-CSE-ConnectionGUID: hs7IP025TiyV+3RULHZdcA==
X-CSE-MsgGUID: F6GiE9l8RP6MK0Q7NJkYXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78698824"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="78698824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 14:49:47 -0700
X-CSE-ConnectionGUID: dRKqUbYQQWuKkdWo+jsxiA==
X-CSE-MsgGUID: X6zScUrHRR+LKzFLUZum9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="232492386"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 14:49:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK1Ac-000000005yv-3Mng;
	Mon, 04 May 2026 21:49:42 +0000
Date: Mon, 4 May 2026 23:49:38 +0200
From: kernel test robot <lkp@intel.com>
To: James Ye <jye836@gmail.com>, jikos@kernel.org, bentiss@kernel.org,
	lee@kernel.org, pavel@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, denis.benato@linux.dev,
	James Ye <jye836@gmail.com>
Subject: Re: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
Message-ID: <202605042355.hVEd8jjX-lkp@intel.com>
References: <20260503072643.2774762-7-jye836@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503072643.2774762-7-jye836@gmail.com>
X-Rspamd-Queue-Id: 4C3FF4C4390
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7986-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on lee-leds/for-leds-next linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ye/HID-input-delete-hid_battery-on-disconnect/20260504-013406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260503072643.2774762-7-jye836%40gmail.com
patch subject: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260504/202605042355.hVEd8jjX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042355.hVEd8jjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042355.hVEd8jjX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/hid-input.c:2423:48: error: no member named 'batteries' in 'struct hid_device'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                  ~~~  ^
   include/linux/list.h:869:30: note: expanded from macro 'list_for_each_entry_safe'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:20:26: note: expanded from macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> drivers/hid/hid-input.c:2423:48: error: no member named 'batteries' in 'struct hid_device'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                  ~~~  ^
   include/linux/list.h:869:30: note: expanded from macro 'list_for_each_entry_safe'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:610:63: note: expanded from macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/hid/hid-input.c:2423:48: error: no member named 'batteries' in 'struct hid_device'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                  ~~~  ^
   include/linux/list.h:869:30: note: expanded from macro 'list_for_each_entry_safe'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:620:14: note: expanded from macro 'list_first_entry'
     620 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:609:15: note: expanded from macro 'list_entry'
     609 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:610:63: note: expanded from macro '__same_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/hid/hid-input.c:2423:48: error: no member named 'batteries' in 'struct hid_device'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                  ~~~  ^
   include/linux/list.h:871:32: note: expanded from macro 'list_for_each_entry_safe'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:773:30: note: expanded from macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   4 errors generated.


vim +2423 drivers/hid/hid-input.c

  2407	
  2408	void hidinput_disconnect(struct hid_device *hid)
  2409	{
  2410		struct hid_input *hidinput, *next;
  2411		struct hid_battery *bat, *bat_next;
  2412	
  2413		list_for_each_entry_safe(hidinput, next, &hid->inputs, list) {
  2414			list_del(&hidinput->list);
  2415			if (hidinput->registered)
  2416				input_unregister_device(hidinput->input);
  2417			else
  2418				input_free_device(hidinput->input);
  2419			kfree(hidinput->name);
  2420			kfree(hidinput);
  2421		}
  2422	
> 2423		list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
  2424			list_del(&bat->list);
  2425		}
  2426	
  2427		/* led_work is spawned by input_dev callbacks, but doesn't access the
  2428		 * parent input_dev at all. Once all input devices are removed, we
  2429		 * know that led_work will never get restarted, so we can cancel it
  2430		 * synchronously and are safe. */
  2431		cancel_work_sync(&hid->led_work);
  2432	}
  2433	EXPORT_SYMBOL_GPL(hidinput_disconnect);
  2434	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

