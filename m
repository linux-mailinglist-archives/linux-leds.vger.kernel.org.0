Return-Path: <linux-leds+bounces-7989-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOktBfxU+WnF7wIAu9opvQ
	(envelope-from <linux-leds+bounces-7989-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 04:25:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF54C5FB6
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 04:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE3AD300E164
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 02:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC473932F6;
	Tue,  5 May 2026 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfnHutnN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1638E35839E;
	Tue,  5 May 2026 02:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777947895; cv=none; b=IoQk8jyeRBxbAf7u15MFmYd/Fqu5Q/9V3ZMe3umbcV8XazRBUdhD1IjIUNlq7x5fRVE/sz1q75GKx0yIv5bAWVBjd6Uk+fzuIeEQ7LmZoyG3dWdjF45p9AH/YY1MpIuSWxpl4Y1Q2imK5hW7WgmT5gRlm/6y0bl5g7XKDTNm460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777947895; c=relaxed/simple;
	bh=fSMkhgHKSMB/wjHAWrXttxnwi81JgB6NIQOYqA6+e4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6epgb5F68ftJx4H9K++tvj9QFJDBfEtHQpSSbN3ApxfUw8SPpglOyb97ullTEd2dvXt3RFWeSX5ptwbGvZ/SkhiT72p7dURCUZIN1onbMNTU1OL8jJiVn2UIoIBaxCdZ4NCg+wBZCE7ha3TwjEPbleXLk7kNh1LczoFWOEbxQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfnHutnN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777947893; x=1809483893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fSMkhgHKSMB/wjHAWrXttxnwi81JgB6NIQOYqA6+e4Y=;
  b=ZfnHutnNIVQxE7P6G6USA8zYmD7gijFLcMiYTuEcvxyTdk9i+97fBvNM
   i9AzEJtgEP83xIGzuGHgrt1V+cwmrEMrqKvxRCfab6DSGQ8QU7NqlK/rn
   DWZqaMOa/lrkGfvHe8rVCwaesw71lo2iUMlhQHoT/hulR0iox51plwPuR
   xYWkok7Ldw1NXZU/ZonbthyBQHaFO9beevYVa+VLyezfT2Pylcy2jJopv
   eUtm4RYEWhAUSZAXel/nQH1H3uF3kbTUQGCJ6nNZ84sPngaANQRd9dp24
   OHIXiXj7CVTs8s53bc0dcjpF5lzcsOf3ASjJkjxCq0w9AOlKDphOIqFp1
   g==;
X-CSE-ConnectionGUID: Y5rS2TnKSSCwsONsCnjZpg==
X-CSE-MsgGUID: YHGKPnZUTzm2fvBTQ5t5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66341355"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="66341355"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 19:24:52 -0700
X-CSE-ConnectionGUID: 2dwCd0eQTEiblfPsVoBhNg==
X-CSE-MsgGUID: sKkp8elRQTK93d4gmQF+NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="231306794"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 May 2026 19:24:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK5Sq-0000000064H-0N93;
	Tue, 05 May 2026 02:24:48 +0000
Date: Tue, 5 May 2026 04:24:16 +0200
From: kernel test robot <lkp@intel.com>
To: James Ye <jye836@gmail.com>, jikos@kernel.org, bentiss@kernel.org,
	lee@kernel.org, pavel@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	denis.benato@linux.dev, James Ye <jye836@gmail.com>
Subject: Re: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
Message-ID: <202605050414.YJmW3t4y-lkp@intel.com>
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
X-Rspamd-Queue-Id: 54EF54C5FB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7989-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid]

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on hid/for-next]
[also build test ERROR on lee-leds/for-leds-next linus/master v7.1-rc2 next-20260504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ye/HID-input-delete-hid_battery-on-disconnect/20260504-013406
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260503072643.2774762-7-jye836%40gmail.com
patch subject: [PATCH 6/6] leds: led-class: mark classdev as unregistering early
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260505/202605050414.YJmW3t4y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050414.YJmW3t4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050414.YJmW3t4y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/hid/hid-input.c:16:
   drivers/hid/hid-input.c: In function 'hidinput_disconnect':
>> drivers/hid/hid-input.c:2423:53: error: 'struct hid_device' has no member named 'batteries'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                     ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/hid/hid-input.c:2423:9: note: in expansion of macro 'list_for_each_entry_safe'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
>> drivers/hid/hid-input.c:2423:53: error: 'struct hid_device' has no member named 'batteries'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                     ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/hid/hid-input.c:2423:9: note: in expansion of macro 'list_for_each_entry_safe'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-input.c:2423:53: error: 'struct hid_device' has no member named 'batteries'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                     ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/hid/hid-input.c:2423:9: note: in expansion of macro 'list_for_each_entry_safe'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/hid/hid-input.c:2423:9: note: in expansion of macro 'list_for_each_entry_safe'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/hid-input.c:2423:53: error: 'struct hid_device' has no member named 'batteries'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |                                                     ^~
   include/linux/list.h:773:37: note: in definition of macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/hid/hid-input.c:2423:9: note: in expansion of macro 'list_for_each_entry_safe'
    2423 |         list_for_each_entry_safe(bat, bat_next, &hid->batteries, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


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

