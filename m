Return-Path: <linux-leds+bounces-8506-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5n03HLnfImqhegEAu9opvQ
	(envelope-from <linux-leds+bounces-8506-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:39:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA15648E89
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GRsFLFn+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8506-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8506-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A96C3027DA4
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993343B6343;
	Fri,  5 Jun 2026 14:39:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2B35CB6A
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 14:39:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670390; cv=none; b=vDBc1qDiJP+eifvo3GhNrjqETdmUEZClWmyTwjVmUqXvg94k9xmihIiyVPbw1CL6e1SNY3IUJ+f6kHYYaCp8orEIqbfea58rJtvCJGF3Hfrl3u5X+HbA4jQkyFciCdDkbIW6H3YkmIgx/zpBF9nT6njnRFtuTTS/1h/+9zmp6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670390; c=relaxed/simple;
	bh=ecDNEYeL7Zo4XUl6n+Nj/B51f2QqerN16IJVVJauoy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X/7ONXiVJkD8CXNn7K4R884JoPE2geNTJibA0VMrEBy22HnedEvyaO+9zvaBYyCdEFMmueyKcW09A3vIMumrLSg00lGsNznzB4zGXuog+un1PSBsiUbyaUkNQr8tJFIb3brdZZ1Cakr8+fHPd3gv7bEIv19pjdWB9sxiMoCGwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRsFLFn+; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780670390; x=1812206390;
  h=date:from:to:cc:subject:message-id;
  bh=ecDNEYeL7Zo4XUl6n+Nj/B51f2QqerN16IJVVJauoy8=;
  b=GRsFLFn+gQNIWWDMda/+hZaW750qXCUfbq7QJ51b75WaYYwa2Ed3iN6j
   q6CNF7Novn7VXnBbS0mEE4BjDWu63ZLJfvtDWdGUk46vC4ag2ashGZOSz
   fsvof0EKJENuyn74l5vsrFJnFAaRVB7naAoYFyqBNsY5Zt2QmNSWOgCBC
   h5DQjUFN2q9+BmyFbiOUQsU4udEViASA71MyhYjjC+4RP9yivRK+nkmQ9
   rqOxXZKLGeoJ4WV4SMjyt9KCCj6/Ovn7zjOu2aq3WG4zNevOmhyn17n/T
   b2nY3Totd+y1oklZvXqjgJ8uTpXjW6/dUmsTVpv+RwNVn9X2GVXc6Be85
   A==;
X-CSE-ConnectionGUID: FzhJd6b5TKyIOXkP12IFaQ==
X-CSE-MsgGUID: lavKEEUdQhKnUsV04UZ38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81502967"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81502967"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:39:49 -0700
X-CSE-ConnectionGUID: bOzb2OOuSquxRZi5/r0GCA==
X-CSE-MsgGUID: 7JKQD2noS5CKzVg4vT2TJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249786909"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Jun 2026 07:39:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVi4-00000000G84-1qnj;
	Fri, 05 Jun 2026 14:39:44 +0000
Date: Fri, 05 Jun 2026 22:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 20/28]
 drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error:
 'linux/mfd/samsung/s2mu005.h' file not found
Message-ID: <202606052213.CzcS7Ap7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8506-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBA15648E89

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: f0878c58430c378c47aaece1b29484e4ae8d7faf [20/28] leds: flash: Add support for Samsung S2M series PMIC flash LED device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606052213.CzcS7Ap7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052213.CzcS7Ap7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052213.CzcS7Ap7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/leds/flash/leds-s2m-flash.c

  > 12	#include <linux/mfd/samsung/s2mu005.h>
    13	#include <linux/module.h>
    14	#include <linux/of.h>
    15	#include <linux/platform_device.h>
    16	#include <linux/regmap.h>
    17	#include <media/v4l2-flash-led-class.h>
    18	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

