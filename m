Return-Path: <linux-leds+bounces-6599-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BFBD08DC2
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 12:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF11F301140A
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 11:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E6733C191;
	Fri,  9 Jan 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeBX/YwV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66AC31CA50
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957627; cv=none; b=QK9PO4i31QEM23MOyYBDzeTaPs9JnezeN5r+XdaWw3T6H9L+XyDTkc54oSYWQxVRR00sdEuS7jehPEVbbpKRWXtVGZ2RuubhXnfACSW3oe5MHPP6qb8XCJbL7a0197NJGlEDk7gR85CD1yqpkK88vA/bMNztbooUGGE7KmQNQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957627; c=relaxed/simple;
	bh=Z4WWdROhH4mm9BNxvCMDL39UrFBf5iTwctPf8Yib5qI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jAkfTTBGnoHmet/48DyrX1/ga81gz7tj1wL//nterCjPtx1pIlMwXLpGi9t6TUYdI6U4bbSYGXzELhU8RoLbuiIs2WpZiCS6zwSpX30vh7/ES06Be1N6H5KRSH91fLr/Bt5luzE0/8JMVCtqBnHLWAzxFTNoF/lAORl2nGzTRRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeBX/YwV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767957626; x=1799493626;
  h=date:from:to:cc:subject:message-id;
  bh=Z4WWdROhH4mm9BNxvCMDL39UrFBf5iTwctPf8Yib5qI=;
  b=YeBX/YwV9oJgTar7AaRQK/mp+uSYvuMv+BHNl58t6u6RdsL+OI7fjlXE
   Wy4A5fRu3UzXirpjnN+haZh1wHAwcD2P8jBRzT/GfIi0PCPn8+y0WvxV+
   THoiVCAAhI+gmLUrb72oD5p4KGA33VIk6YddjlhA0d1TC0yvxQXx0yd+/
   +mqfqPp+C2XZZ4hVVdG81+2duMp20FomZTgzmBtRutXJbetcBGSaqIwDo
   13sBUpRtHPMMzFZM4C6F8xzObjE1s0rIrkIr7jhSc9d6424421vg6onwa
   mCTJk7soGHQR7ThHuj3Gp9AAyyJ6tIJpyLL3enE+VVU362Ya9rvDz/sfs
   A==;
X-CSE-ConnectionGUID: qxpuLODIRjmHXdsYODsLmA==
X-CSE-MsgGUID: 0vN1DJDDT9mOXntbuQs2Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68536316"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="68536316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:20:25 -0800
X-CSE-ConnectionGUID: jYngjA3GRr21U7hh4snFzw==
X-CSE-MsgGUID: 5Or32cueQMGkHaLGvg6FtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="208503954"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2026 03:20:23 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veAXV-00000000256-0fmt;
	Fri, 09 Jan 2026 11:20:21 +0000
Date: Fri, 09 Jan 2026 12:20:07 +0100
From: kernel test robot <lkp@intel.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 3/4] kismet: WARNING: unmet direct
 dependencies detected for LEDS_LP5860_CORE when selected by LEDS_LP5860_SPI
Message-ID: <202601091236.a8oFeS3q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   bbe55e436524c99549e05d61371fac0806718a86
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/4] leds: Add support for TI LP5860 LED driver chip
config: alpha-kismet-CONFIG_LEDS_LP5860_CORE-CONFIG_LEDS_LP5860_SPI-0-0 (https://download.01.org/0day-ci/archive/20260109/202601091236.a8oFeS3q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601091236.a8oFeS3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091236.a8oFeS3q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE when selected by LEDS_LP5860_SPI
   WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE
     Depends on [n]: NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && LEDS_CLASS [=y] && OF [=n]
     Selected by [y]:
     - LEDS_LP5860_SPI [=y] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && SPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

