Return-Path: <linux-leds+bounces-8494-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9w1cI5/OImqydwEAu9opvQ
	(envelope-from <linux-leds+bounces-8494-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 15:26:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F064886B
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 15:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hilvlboa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8494-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8494-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF643002518
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 13:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EA640E8E7;
	Fri,  5 Jun 2026 13:26:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918ED40E8FC
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 13:26:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666006; cv=none; b=M7X2QZv2gStBSb2vX2ECvc2KHLrbutLLG4WH+KPmz/h79mzM3b9b31VQ/1Q99FgbjXunxnygYfwrZMjy6owNhqiluqcfgBSg+f+7swhqO/uW9l854BLFiCu8vWsFiFZzdEQOPgIvSbFzjyVKAOv8olkZVkHTFgPIX9cDCjN0flE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666006; c=relaxed/simple;
	bh=+zHVsAlXHiwXej9hAwMiT1Bmsu7hhvhmfPp8qE5YiU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKgKywsyjf6cCKTFUuhEr6SpUyLqz3NclLyyffWDlRM7e4u8Nccw+DXIQ87l6853r0kbmzKVIAn/sGjEAJa7LnmJvjY8ReFvA9G6AIXSuPZzSwjlLqSjTjoumw+RCyL0gmL8qFgKQIZ0yA7NFRhPcRo+ARAkBT5qzPOCn5QQMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hilvlboa; arc=none smtp.client-ip=192.198.163.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780666005; x=1812202005;
  h=date:from:to:cc:subject:message-id;
  bh=+zHVsAlXHiwXej9hAwMiT1Bmsu7hhvhmfPp8qE5YiU4=;
  b=hilvlboaWblXe6GW0vwJ4oadkiyByj79y6KZUks0DfBo41guVKtCqQ3w
   noETOMeJX+s//8c5I+Sp9sq6yU5XcoOZ6PCew5F9MRJCaiL+oZP5sztKD
   0TNwjA0vtBVBCPnr/9EM2j3LQ8mxSVJQ/SGJnOIAv7S7fSToql6me8WS3
   qMtQKodxUOyx/4qFyNaZ0dcKAKiMNeV9moz1lbJbbtoQe8xCRGPcGmGTx
   qxFgBxOOhX4y6gmN6B00YBMFx2hqJH5mKrt40QumMHTXTwQlX0mkypAWk
   P8/OqCijUdA7vjcGwvpq6IFKsNI9KgTSD/h7GXxC1+F1s0mgAOsYKcyXj
   Q==;
X-CSE-ConnectionGUID: 90q/uWFMRhubCxz/Adlp8A==
X-CSE-MsgGUID: 6II3mTcOT8SHg4VgQfyLAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92873183"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92873183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:26:44 -0700
X-CSE-ConnectionGUID: xnzlRfy5TryA0IqsCDtR5w==
X-CSE-MsgGUID: Hp3ZWmsWSECO8vUs+l+ROA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2026 06:26:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVUZM-00000000G2g-0hE6;
	Fri, 05 Jun 2026 13:26:40 +0000
Date: Fri, 05 Jun 2026 21:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 20/28]
 drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error:
 linux/mfd/samsung/s2mu005.h: No such file or directory
Message-ID: <202606052113.SVU1F2CZ-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8494-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:oe-kbuild-all@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A8F064886B

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: f0878c58430c378c47aaece1b29484e4ae8d7faf [20/28] leds: flash: Add support for Samsung S2M series PMIC flash LED device
config: microblaze-randconfig-r073-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052113.SVU1F2CZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052113.SVU1F2CZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052113.SVU1F2CZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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

