Return-Path: <linux-leds+bounces-4461-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17790A85CC3
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 14:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220AE9A1D98
	for <lists+linux-leds@lfdr.de>; Fri, 11 Apr 2025 12:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7A5208A9;
	Fri, 11 Apr 2025 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfBY2Rkr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F5298CD0
	for <linux-leds@vger.kernel.org>; Fri, 11 Apr 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373530; cv=none; b=Jm52SG+q2Jv0vYqBUYfjAeuhpku/StmS9Cne0y9zI7BbpWnAzlI1kmx9WKpC0f58eB9U7cKhS78Zc4dn+Q1n8TphZLzs6XanGIUO/HYijdOq+umjlVRbbRUqiLI6qbwzuWrsemMnCgaKPey+C7CQYgvnem6pfTm7+6gi1NQdhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373530; c=relaxed/simple;
	bh=TDJhpY7Hej3tcVAalIVnCRg8/TAzGWJ4eomNFY+33LU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRBBuuWNQe2Oa9pmztAtW+KAVBUe/2uaqKYExzgJIXusT1AvpCgnEx+5HxWqgqfXrSBNJLs3dm8fbSMyZthp93kUP+/ZxNBL0tyI+mno958HkciOBlC8OiELb2VCZN+/rctx5lV+LdReNXt4UZr2W/PyWNIQqR6iOjLPK8PZ/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfBY2Rkr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744373529; x=1775909529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDJhpY7Hej3tcVAalIVnCRg8/TAzGWJ4eomNFY+33LU=;
  b=NfBY2RkrkFc8/SRvkPo4gkOm07RVrBY0PgMQTXfjs3JHDXIQdnKseV1+
   gPBXSK07u0C20YskQLnh8gwe75w7tcCySIHmrTOOskj6unwnM60Pqlw1c
   bvq0zut9y6J86I0U55fFsPivvZzY3vrVMBZMCRFScZ+WyEAXDEE8dELoV
   ZszkjW13ZkJOMuPfChH0HBKmnrKubr4OJRldKp+2rZLq+5HqKMErpP+kw
   0RKodFIQDdvv43mIRsLFiAhRQrfThKwJX9fnMFn09AtJNUCiI76n0d2gA
   PJqN0Ywh/cJUs1Mju1j0rv4F7eTOrh2rkIiTO2ihWOCH+0CCmq3PIpoNA
   w==;
X-CSE-ConnectionGUID: nMoVJGtnRyqO9O4qeck5Qw==
X-CSE-MsgGUID: q0HILJdDS7iL3moG+EdYTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71309681"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="71309681"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:12:07 -0700
X-CSE-ConnectionGUID: G1M2IF1OROqmZckF7IRfPQ==
X-CSE-MsgGUID: kqut3c30RXuS8Sc8Jtsrcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="128951131"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2025 05:12:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3DEp-000B4g-1N;
	Fri, 11 Apr 2025 12:12:03 +0000
Date: Fri, 11 Apr 2025 20:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 12/12] drivers/leds/leds-lp8860.c:102:
 warning: Excess struct member 'enable_gpio' description in 'lp8860_led'
Message-ID: <202504112024.AFtTNUuX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e9bde6230972ad76fc91279850edd8dbc6f1cb4d
commit: e9bde6230972ad76fc91279850edd8dbc6f1cb4d [12/12] leds: lp8860: Disable GPIO with devm action
config: arm-randconfig-002-20250411 (https://download.01.org/0day-ci/archive/20250411/202504112024.AFtTNUuX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504112024.AFtTNUuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504112024.AFtTNUuX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'enable_gpio' description in 'lp8860_led'
   drivers/leds/leds-lp8860.c:102: warning: Excess struct member 'regulator' description in 'lp8860_led'


vim +102 drivers/leds/leds-lp8860.c

99ca0ea5730971 Jacek Anaszewski 2019-06-09   85  
7a8685accb9580 Dan Murphy       2014-11-19   86  /**
46cc5941a091bd Lee Jones        2021-05-28   87   * struct lp8860_led
46cc5941a091bd Lee Jones        2021-05-28   88   * @lock: Lock for reading/writing the device
46cc5941a091bd Lee Jones        2021-05-28   89   * @client: Pointer to the I2C client
46cc5941a091bd Lee Jones        2021-05-28   90   * @led_dev: led class device pointer
46cc5941a091bd Lee Jones        2021-05-28   91   * @regmap: Devices register map
46cc5941a091bd Lee Jones        2021-05-28   92   * @eeprom_regmap: EEPROM register map
46cc5941a091bd Lee Jones        2021-05-28   93   * @enable_gpio: VDDIO/EN gpio to enable communication interface
46cc5941a091bd Lee Jones        2021-05-28   94   * @regulator: LED supply regulator pointer
8a7a76c8004387 Dan Murphy       2017-11-15   95   */
7a8685accb9580 Dan Murphy       2014-11-19   96  struct lp8860_led {
7a8685accb9580 Dan Murphy       2014-11-19   97  	struct mutex lock;
7a8685accb9580 Dan Murphy       2014-11-19   98  	struct i2c_client *client;
7a8685accb9580 Dan Murphy       2014-11-19   99  	struct led_classdev led_dev;
7a8685accb9580 Dan Murphy       2014-11-19  100  	struct regmap *regmap;
7a8685accb9580 Dan Murphy       2014-11-19  101  	struct regmap *eeprom_regmap;
7a8685accb9580 Dan Murphy       2014-11-19 @102  };
7a8685accb9580 Dan Murphy       2014-11-19  103  

:::::: The code at line 102 was first introduced by commit
:::::: 7a8685accb95801bb29ab85d5b370999d3fb8e32 leds: lp8860: Introduce TI lp8860 4 channel LED driver

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: Bryan Wu <cooloney@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

