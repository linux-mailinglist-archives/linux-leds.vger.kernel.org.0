Return-Path: <linux-leds+bounces-8508-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mewfEHn1ImoZfwEAu9opvQ
	(envelope-from <linux-leds+bounces-8508-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 18:12:41 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAC649A7B
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 18:12:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=BNfp0Flp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8508-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8508-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA49C303D303
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 16:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0B03E2765;
	Fri,  5 Jun 2026 16:04:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8E3B8958
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 16:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675496; cv=none; b=sBd65Yy7LxkuUP+VjBPrME9OeS1D0w5ivVnTOX3B3CuD0Y/4agWUPLFdceqNVxiKXfxOn8jn6w/I0WEl59ZlBjmx5bX0f8ctJ3JTptDSgAkC91kjZo2NIuwz9ysSN/kufexGTk91AAslF1La/KSUMPvRisCRNqzxNl+AJUPAz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675496; c=relaxed/simple;
	bh=7YRovzqhtQWhqyaUemtxUz48deQGxS6GpTQpH7wejM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epslvMR0AHI6gYUXDCDkx2VUJD1oaXnFId4ZoeCUg7w2wswfD9+BFsp04PB8lrQtGhAJSheEP3EEWA0aBPycXejf2hw0KIood4JB3N8VnaGs1765WkQq0WSBsMAw3/JYpOR055nUYbSCw1FDdFnkLkAX0wFx1hcbwLVAcwnsqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNfp0Flp; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780675494; x=1812211494;
  h=date:from:to:cc:subject:message-id;
  bh=7YRovzqhtQWhqyaUemtxUz48deQGxS6GpTQpH7wejM0=;
  b=BNfp0FlpIztbMIF16I235az6n57MW5fwq8ieIe27W3ZA5edCZSyv7HD2
   UTEdGrLLutdE+2iU3gIesvMHVWnjoV4ATBtjuGPKJANAhl6sJQlkIQXcB
   UL48lfCiml1r4G+gKanklm7wUV5DDq6w3bCGzMmh/MHHyFrpK6arqn/aD
   S2vNHSYUWUPc5by3xCPcq2+B4d0E8uMQhLdcLziTD1z662oFcjDgsQ/Db
   nvbVp9/Q3kuj4QvkVth+xzbYWx8Ug+IaYCtL5Skv6R6yKBS/viyhRPiWH
   ltGc2t6QQPvpi9C/pHMtVDqec3BBhmThEqCLsg1ZwByp8pG+p/zJWIp+B
   w==;
X-CSE-ConnectionGUID: ZL+jRBKvSDSucmRieCDm6Q==
X-CSE-MsgGUID: q+8E/BEtS560PzTDPxpjig==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="69042513"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="69042513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 09:04:54 -0700
X-CSE-ConnectionGUID: 6kKwHVUHR7yviWz3ovCr3Q==
X-CSE-MsgGUID: ja7WdAdDSH+juScXa14FrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="246703931"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 09:04:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVX2Q-00000000GCk-0I5v;
	Fri, 05 Jun 2026 16:04:50 +0000
Date: Sat, 06 Jun 2026 00:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 21/28]
 drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error:
 'linux/mfd/samsung/s2mu005.h' file not found
Message-ID: <202606052337.5WHsvu5q-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8508-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98CAC649A7B

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: 366ed7a6d22e682e6dfd4d64d8f543bc70c6b58e [21/28] leds: rgb: Add support for Samsung S2M series PMIC RGB LED device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606052337.5WHsvu5q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052337.5WHsvu5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052337.5WHsvu5q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/leds/rgb/leds-s2m-rgb.c

  > 12	#include <linux/mfd/samsung/s2mu005.h>
    13	#include <linux/minmax.h>
    14	#include <linux/module.h>
    15	#include <linux/mutex.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/regmap.h>
    19	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

