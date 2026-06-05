Return-Path: <linux-leds+bounces-8495-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zEYhArzRImoheAEAu9opvQ
	(envelope-from <linux-leds+bounces-8495-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 15:40:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9C64896E
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 15:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nzLVUVPP;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8495-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8495-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69A9130022B2
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 13:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B3D1F1534;
	Fri,  5 Jun 2026 13:37:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E83D247291
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 13:37:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666666; cv=none; b=LT46BnXdysFn4EMNqoE7JZ+v/kwW4Ip0E72vyhW1dUoF0jdTpeKSL+Y8GLK5K4OZJaNjC0zV67jVSwfzvsafOvHSYaNykY6LDvFqEhKpROzOMTUswx2WVgvqvauJxqMDQc3EXXY4oQM77ONbSCtSWZ8gUYI+EEUwcX2I0rDT6H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666666; c=relaxed/simple;
	bh=z5L6aXPtqgcJFgjpgmdCpgzUQRgbKTRcQyDXv1eSXmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RaJhC0Z7bBLu74JDkXh5IDDvaD28AnOZ+nklZXe/EF6CyVZJs5a/ykqEr1Fb1KWILBq0kwm3Ab2iiW3GW1alewB80TXPai+YQW8bFPoW+QkG4FrJGXPzAf/PNKOIEC8wvbpn9x96jazx0x08DXxeEWjL23DWz6f4uEXtt6gZQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzLVUVPP; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780666666; x=1812202666;
  h=date:from:to:cc:subject:message-id;
  bh=z5L6aXPtqgcJFgjpgmdCpgzUQRgbKTRcQyDXv1eSXmc=;
  b=nzLVUVPPZXvyfs1vyj/x3Ma+dQIu9tCacC5+0QxMHvuLrx8igFSWwDYy
   62AplLCTvuOCqqV79IlIVhJBI8OBpo/Bf+y2sal8L+RRJo6XgmnSeyOD6
   v/MhB1OD2PG7dbRQkrLBLb1UaVca5NUQbkDhQ0TFRJYN7fd/vSO/3ciGM
   EeJS/9nuL/BZFtmPwSADk2Ee0eKP1MxvNiEixueOg+fo6OQ9VM7wXVsmE
   XWsQ09F/zdYKi8XyU5mLF2h7wbnGyKtL2rDL6gNsG3UKr9z2K3WSExd+B
   8mBki/wFRaOyeNlMGvOVVwbjaNR4i7m2CO01Bp/P2VNY4FEdCPGRWZgB5
   A==;
X-CSE-ConnectionGUID: jtZsNvv9RaCC2OU7N6Z1EQ==
X-CSE-MsgGUID: fyyZD4t8QSW++mVVyQS9yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81245730"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81245730"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:37:45 -0700
X-CSE-ConnectionGUID: KPwxS+brQr2h1yZkpK0dFw==
X-CSE-MsgGUID: 0k6WhznkSkuTqu34P9JD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240392040"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 06:37:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVUk1-00000000G4U-0gqj;
	Fri, 05 Jun 2026 13:37:41 +0000
Date: Fri, 05 Jun 2026 21:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 21/28]
 drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error:
 linux/mfd/samsung/s2mu005.h: No such file or directory
Message-ID: <202606052139.rVWUP0Hn-lkp@intel.com>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8495-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kauschluss@disroot.org,m:oe-kbuild-all@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12B9C64896E

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: 366ed7a6d22e682e6dfd4d64d8f543bc70c6b58e [21/28] leds: rgb: Add support for Samsung S2M series PMIC RGB LED device
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606052139.rVWUP0Hn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052139.rVWUP0Hn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052139.rVWUP0Hn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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

