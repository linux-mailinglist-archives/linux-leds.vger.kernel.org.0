Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAC46BE603
	for <lists+linux-leds@lfdr.de>; Fri, 17 Mar 2023 10:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjCQJ5I (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Mar 2023 05:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjCQJ5H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Mar 2023 05:57:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7331ADDF3D
        for <linux-leds@vger.kernel.org>; Fri, 17 Mar 2023 02:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679047026; x=1710583026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoVHF5Bcw+l9VWLKnSvHM1eA+V1JoChLir7f99Arapw=;
  b=jdBYHt/7JsMG67Y8lNC2i92s39ECOnirYFEdV2AioYNVY1cc/+72+q79
   9HAKLFogdajQ8DdjWg56v+X4rk4ofGpyN+UpRN6SFQB9iPd3FDu4LPOTw
   r1J4SVCC0qDfRBJ7w43kksy7XgBkUk1XQytkOGiDtJwxaqy7UVS9pTm0H
   gnJ6ze1mp6RGu/qfA5RfqBaEEDn/1XT2TPTsKKnxSRAcSGLhejRphDXi1
   x4UVq8BIl+ifdUZsK2qMP3XZTNOTYxq8aBTBtxjWVop6qq7d//7uu08zY
   Jb8LR9xBlYRCRJhN+luN77IKqpSkkeYqwxL7hXRSuxfSrc1kT2ky5+t0z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="340589325"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="340589325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 02:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682626481"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="682626481"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 17 Mar 2023 02:57:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pd6pb-0009H4-2O;
        Fri, 17 Mar 2023 09:57:03 +0000
Date:   Fri, 17 Mar 2023 17:57:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     ChiYuan Huang <cy_huang@richtek.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
        Lee Jones <lee@kernel.org>,
        Alice Chen <alice_chen@richtek.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>
Subject: [lee-leds:for-leds-next 13/15]
 drivers/leds/rgb/leds-mt6370-rgb.c:889:15: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202303171729.CcgyFx17-lkp@intel.com>
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
commit: 55a8a5c16eb37e7723244337af04388557f4fa2f [13/15] leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303171729.CcgyFx17-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/commit/?id=55a8a5c16eb37e7723244337af04388557f4fa2f
        git remote add lee-leds https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
        git fetch --no-tags lee-leds for-leds-next
        git checkout 55a8a5c16eb37e7723244337af04388557f4fa2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/leds/rgb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171729.CcgyFx17-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/rgb/leds-mt6370-rgb.c: In function 'mt6370_check_vendor_info':
>> drivers/leds/rgb/leds-mt6370-rgb.c:889:15: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     889 |         vid = FIELD_GET(MT6370_VENDOR_ID_MASK, devinfo);
         |               ^~~~~~~~~
   cc1: some warnings being treated as errors


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
