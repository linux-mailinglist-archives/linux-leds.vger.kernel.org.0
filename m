Return-Path: <linux-leds+bounces-598-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CE482C958
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jan 2024 05:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7561F238AB
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jan 2024 04:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C9AE554;
	Sat, 13 Jan 2024 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evittPQm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C75E545
	for <linux-leds@vger.kernel.org>; Sat, 13 Jan 2024 04:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705120947; x=1736656947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDrbI/wwLGFW6CUTteLBX7GtuCrUD8sbWUIUTBuRvok=;
  b=evittPQmxri3o33JqU1TOgusqjdrAnPHu6fyDt6nG932MBG7Q17tN6sq
   CXFP9RyFKrChokv4sUqwjctCYKZiwrhkIz/PTxfrrwSsse6lgSMBWoiMw
   VqbaQe6s7qY1Q3znCVTueJzqKVzNFGo4ZNSVUWLt3Rwokcc5BNBKqBPvF
   HbuOTv8yWfHKpHfpGgb38J1MdM3wnv/Uqt+TTSU+/Qxz5SFrrpwRmDwq0
   wAiqFsPFtfF809TxX3NuUgYUUP4Kz5yoT53M1qHWUmC8XmxYtWtDm2OT4
   FRbVC+az7Pomq5bIzq1+ykaxqus1BYuUd5/lE3GjwaakWUizRRKmEoH0+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="17953177"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="17953177"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 20:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906511971"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="906511971"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2024 20:42:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOVqg-000A6e-1n;
	Sat, 13 Jan 2024 04:42:22 +0000
Date: Sat, 13 Jan 2024 12:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next-next 48/56]
 drivers/leds/rgb/leds-qcom-lpg.c:17:10: fatal error:
 linux/soc/qcom/qcom-pbs.h: No such file or directory
Message-ID: <202401131235.zLTJE6Po-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next-next
head:   1f88a09c35f8d50eff1adbc9e35cc2982b3ac9f9
commit: 07a1afc8fbb77cc893e2285112482902ac88a295 [48/56] leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240113/202401131235.zLTJE6Po-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131235.zLTJE6Po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131235.zLTJE6Po-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-qcom-lpg.c:17:10: fatal error: linux/soc/qcom/qcom-pbs.h: No such file or directory
      17 | #include <linux/soc/qcom/qcom-pbs.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/leds/rgb/leds-qcom-lpg.c

  > 17	#include <linux/soc/qcom/qcom-pbs.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

