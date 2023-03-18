Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342846BFB4C
	for <lists+linux-leds@lfdr.de>; Sat, 18 Mar 2023 16:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjCRPlv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 18 Mar 2023 11:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjCRPlu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 18 Mar 2023 11:41:50 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCA535EF1;
        Sat, 18 Mar 2023 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679154109; x=1710690109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIoihsHFTmios8QFArCY8ILcbSU2x2W40OINfk/BLP8=;
  b=Kxc/pLu/7oyWeN27Kp6r67x8wrIDPwJfrV2yLbCkp5hib8497fNB9TOS
   IcU7fgR3ck8+McnQglaMm9MZQ2GgrqNTBP7PolAuKaqUN50wokkV25Gzd
   M8CqGLfdcBUcIpFpzLxDDrUoTT2s/Ej2yZ4NyDnQqDvpwxe7e0uyJ6iCx
   +zXJ6jqsLKxIMJsXTAH/3Y2DdLFgqIcKs7z2lRrge0BLofeTAzNEhuIQ6
   Dq3IR1pEGQVsaFhDy9mFLXEyNyqy8/6JYgJ68VLjF/luLWcN9OJeBAizq
   rvWMJKdPb6Fz9cIKL1xyCh4eO1KxMeEsf7udpxCBBKoDxujM+Ruli2AcB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="401018657"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="401018657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 08:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769702405"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="769702405"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 08:41:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdYgk-000A8E-1P;
        Sat, 18 Mar 2023 15:41:46 +0000
Date:   Sat, 18 Mar 2023 23:41:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     ChiYuan Huang <cy_huang@richtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
        Lee Jones <lee@kernel.org>, ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-doc@vger.kernel.org
Subject: [lee-leds:for-leds-next 15/15] htmldocs:
 Documentation/leds/leds-mt6370-rgb.rst:39: WARNING: Literal block ends
 without a blank line; unexpected unindent.
Message-ID: <202303182310.tB1mUzU7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
commit: 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57 [15/15] docs: leds: Add MT6370 RGB LED pattern document
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?id=4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
        git remote add lee-leds https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
        git fetch --no-tags lee-leds for-leds-next
        git checkout 4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/leds/leds-mt6370-rgb.rst:39: WARNING: Literal block ends without a blank line; unexpected unindent.
>> Documentation/leds/leds-mt6370-rgb.rst:41: WARNING: Line block ends without a blank line.
>> Documentation/leds/leds-mt6370-rgb.rst:46: WARNING: Unexpected indentation.
>> Documentation/leds/leds-mt6370-rgb.rst:44: WARNING: Inline substitution_reference start-string without end-string.
>> Documentation/leds/leds-mt6370-rgb.rst:50: WARNING: Literal block expected; none found.
>> Documentation/leds/leds-mt6370-rgb.rst: WARNING: document isn't included in any toctree

vim +39 Documentation/leds/leds-mt6370-rgb.rst

    33	
    34	     "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
    35	
    36	      ^
    37	      |           ============
    38	      |          /            \                                /
  > 39	Icurr |         /              \                              /
    40	      |        /                \                            /
  > 41	      |       /                  \                          /   .....repeat
    42	      |      /                    \                        /
    43	      |   ---                      ---                  ---
  > 44	      |---                            ---            ---
    45	      +----------------------------------============------------> Time
  > 46	       < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
    47	
    48	Timing description::
    49	
  > 50	Tr1:    First rising time for duty 0 to 30%.
    51	Tr2:    Second rising time for duty 31% to 100%.
    52	Ton:    On time for duty 100%.
    53	Tf1:    First falling time for duty 100% to 31%.
    54	Tf2:    Second falling time for duty 30% to 0%.
    55	Toff:   Off time for duty 0%.
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
