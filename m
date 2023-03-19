Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD3B6C008A
	for <lists+linux-leds@lfdr.de>; Sun, 19 Mar 2023 11:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjCSKmK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 19 Mar 2023 06:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCSKmJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 19 Mar 2023 06:42:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF1522122
        for <linux-leds@vger.kernel.org>; Sun, 19 Mar 2023 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679222528; x=1710758528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vroytviTcMsDgJWV0chpXYs2+nVSafQMYYHo7SoKyhA=;
  b=STh6cdMr50lNB6GOd3BChrVIozJHoeglIJFpzf7oQXN8abRFNnvVMyh8
   5bluGwZhAex1AxlkWdZZP07Am7NmRmQgpgvdOhsyfgiU3nWAcl0cgEszy
   NdQ9+wDXCeYopi/9ZseNA+zTHUsX1D53UoAfSlmXLzKsZyTdtJnQm5qgB
   u6nsKDRRhlbHXpn0NmbZJtzi01njO2wZmWU1xLvSOtrnXzV0e/IQ+P4i4
   1jaCr93N3Xv0iQRc6X6u7jUAhkm2ClE/6fmKsVf8zDJlAl3mED7dKVNSc
   m2A8L9GfzJEbpNoCaQWaB3n78Lm4XTIFtKlu4Y4i9sgMehzQSWpYjf72N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="337210149"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="337210149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 03:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="1010176018"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="1010176018"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2023 03:42:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdqUG-000AUw-3A;
        Sun, 19 Mar 2023 10:42:04 +0000
Date:   Sun, 19 Mar 2023 18:41:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     ChiYuan Huang <cy_huang@richtek.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Alice Chen <alice_chen@richtek.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>
Subject: [lee-leds:for-leds-next 13/15]
 drivers/leds/rgb/leds-mt6370-rgb.c:889:8: error: call to undeclared function
 'FIELD_GET'; ISO C99 and later do not support implicit function declarations
Message-ID: <202303191803.6bgnovZl-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   4ba9df04b7ac66d2d000ed7ae2d8136302d99a57
commit: 55a8a5c16eb37e7723244337af04388557f4fa2f [13/15] leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support
config: riscv-randconfig-r042-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191803.6bgnovZl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?id=55a8a5c16eb37e7723244337af04388557f4fa2f
        git remote add lee-leds https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
        git fetch --no-tags lee-leds for-leds-next
        git checkout 55a8a5c16eb37e7723244337af04388557f4fa2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/leds/rgb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191803.6bgnovZl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-mt6370-rgb.c:889:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           vid = FIELD_GET(MT6370_VENDOR_ID_MASK, devinfo);
                 ^
   1 error generated.


vim +/FIELD_GET +889 drivers/leds/rgb/leds-mt6370-rgb.c

   879	
   880	static int mt6370_check_vendor_info(struct mt6370_priv *priv)
   881	{
   882		unsigned int devinfo, vid;
   883		int ret;
   884	
   885		ret = regmap_read(priv->regmap, MT6370_REG_DEV_INFO, &devinfo);
   886		if (ret)
   887			return ret;
   888	
 > 889		vid = FIELD_GET(MT6370_VENDOR_ID_MASK, devinfo);
   890		if (vid == MT6372_VENDOR_ID || vid == MT6372C_VENDOR_ID) {
   891			priv->reg_fields = mt6372_reg_fields;
   892			priv->ranges = mt6372_led_ranges;
   893			priv->pdata = &mt6372_pdata;
   894		} else {
   895			/* Common for MT6370/71 */
   896			priv->reg_fields = common_reg_fields;
   897			priv->ranges = common_led_ranges;
   898			priv->pdata = &common_pdata;
   899		}
   900	
   901		return 0;
   902	}
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
