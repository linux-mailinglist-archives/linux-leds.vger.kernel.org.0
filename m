Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B79D747C96
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 07:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjGEFmH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 01:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjGEFmF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 01:42:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C058219B;
        Tue,  4 Jul 2023 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688535712; x=1720071712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUAt3U42HCZDHpLQ85nw0NDF0N9Ckkn1QxOID021dY4=;
  b=k2+51M48BsggkfJMHCB23f/vHbxXatln/Jb1nx5BS8Z36vVwIA1Vd4rA
   A/s3btga4Gy0zLscYS8XHkw1hd1cqWJb/B49f8Nulhf73POw0dix6SaQv
   vi5tNencfrFlCtx+Fr1aMJU+8X3tXNZruwwZEF5+TC/rDfKJjWZNDlA3o
   KlrHsedFnbfX+ULm9fqJkABq6cFnxrTywQURhCRw5KQ+cRDZqDFekHYvC
   0Psx0EbLCT/HtUsQx49pgXvuJw7R2562qhzHRKPrNbjgCfA1Bi8pDlQKP
   eFdCUXckJtL+ictE25zJfa3f9to9+Y2NlIUy0l883tpk5NEOcBCavMNUI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342845358"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="342845358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 22:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965687490"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="965687490"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 22:41:49 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGvGv-0000PX-0Y;
        Wed, 05 Jul 2023 05:41:49 +0000
Date:   Wed, 5 Jul 2023 13:41:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-leds@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Marek Vasut <marex@denx.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
Message-ID: <202307051306.EhTQLR8l-lkp@intel.com>
References: <20230705000407.153005-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705000407.153005-2-marex@denx.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.4 next-20230704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/leds-pca995x-Add-support-for-PCA995X-chips/20230705-080506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20230705000407.153005-2-marex%40denx.de
patch subject: [PATCH v2 2/2] leds: pca995x: Add support for PCA995X chips
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230705/202307051306.EhTQLR8l-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051306.EhTQLR8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051306.EhTQLR8l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> FATAL: modpost: drivers/leds/leds-pca995x: sizeof(struct i2c_device_id)=24 is not a modulo of the size of section __mod_i2c__<identifier>_device_table=588.
>> Fix definition of struct i2c_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
