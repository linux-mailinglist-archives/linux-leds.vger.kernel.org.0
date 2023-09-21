Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5097A9AF1
	for <lists+linux-leds@lfdr.de>; Thu, 21 Sep 2023 20:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjIUSvq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Sep 2023 14:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjIUSvY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Sep 2023 14:51:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239C0A0C34
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2023 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695319057; x=1726855057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmbTOduQ3ZT1/v2kr+SrBklHsMNnCIaWWftGoVb99oE=;
  b=Trsz8uP6kxj9TA6kJ8PgGcB9dzluqmpxykcBtUB8MsP5Gwt3u9bwkg/x
   r3nGZ/cQ1hvgTLMvSt9PZwvRSHgyfuXDNjFiCe09yOUKKt0TbeaT41vM8
   TCTEdw+a91o7YftIMXgBRhopwYIbAv+APhddC+6JMNEUGn/nwHow2wnvW
   jKJtd7hg+BWiG4R2dQYCpdk2tHTieySRu0pDNSHZMmmcM7gEf0rOXhtDl
   ZM19hG4A+FYQTir9f77OMLXxdL5Clxt7baZr3tgJCwaZViPYGr8IWj2tx
   pbCjG1hVqzccuwFAH1ZdcFLZNuvWDP9xobeynDV1WI3H2/P4TrTGyRhdi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383288453"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383288453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="776456969"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="776456969"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Sep 2023 07:31:19 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qjKi4-00002Z-3A;
        Thu, 21 Sep 2023 14:31:16 +0000
Date:   Thu, 21 Sep 2023 22:30:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
        Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 53/56]
 drivers/leds/leds-turris-omnia.c:47:13: warning: unused variable 'ret'
Message-ID: <202309212215.Yl5VQaSm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   c015f343e07aa8ed701372b8acdb4bdc021eaeaa
commit: 5e5ec959d9d6143e95427d1cf562ab61b8d17ed4 [53/56] leds: turris-omnia: Do not use SMBUS calls
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309212215.Yl5VQaSm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309212215.Yl5VQaSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309212215.Yl5VQaSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/leds/leds-turris-omnia.c: In function 'omnia_cmd_write_u8':
>> drivers/leds/leds-turris-omnia.c:47:13: warning: unused variable 'ret' [-Wunused-variable]
      47 |         int ret;
         |             ^~~


vim +/ret +47 drivers/leds/leds-turris-omnia.c

    43	
    44	static int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd, u8 val)
    45	{
    46		u8 buf[2] = { cmd, val };
  > 47		int ret;
    48	
    49		return i2c_master_send(client, buf, sizeof(buf));
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
