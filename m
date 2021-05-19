Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15B3389219
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 16:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348443AbhESO7d (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 10:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354539AbhESO7c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 May 2021 10:59:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23C3C061763
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:58:12 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso3623091wmm.3
        for <linux-leds@vger.kernel.org>; Wed, 19 May 2021 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1aFRaHHFKJ6x18LGycEaCKz4wrr4/D+9Rt11aT0I+a8=;
        b=wUBKg6Fyezzjq/2EZUBRqmJTcmPEgvRZP1TwzDavxhCl0WJ+uCBY01+tq7Wlkdn5bF
         7Z+7UjYjNWE1F8lwL/UtAA3y0o9SkAHyTdrGEQQcnmPW45RIosvdZF1+GfvOay17nWoK
         22t+spFwuPCjDWJPyr4xaWMCZFG2M54dcPBImOcqOkQdVsAymK0HZ+WedGuhBf3MkD0G
         2kzu4NKiRWGTDROIO09E4FdBk4Jsu24KpqVqqxZAiZ/5hblM5RY+kacWg9okehTZnfI9
         dhkWh/AZEFtBF3R5rpemdXa9N5Kqp7hkNfIYI8smhiWk9HOYWFmmmbtIgC09nb6brQIN
         uOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1aFRaHHFKJ6x18LGycEaCKz4wrr4/D+9Rt11aT0I+a8=;
        b=ONBoIQ3sdjQfG6b6TcUUbW0W9AQMiDI30L9o0lgB7ZHDA420Nu9irBlb/V5xzJFSs4
         KLt26f4XSTZfoOV7gJoXkcpxiKLKetCMrEPLCzrqqNIqZow6/1aAoiUDnM2AflUavApU
         v0vXXzdQpsyYdKCPeaVsl6EgnJsfTdA1dIkg++nhQ2i189npsio9Ytw3CIKPCAlwrEm+
         H2oMvPuiNwvasipI/kcrFuFEmkRpPR7o2/A9MDE2jQVP5qtgcb+t9DHIZCBx7F3q8adB
         u1CIVrqkUbyqL0eJNeu8LNYgQwKf3lkbPVkDmUVCLZ6pbQ1lOWOzdHUkjM0MpXmVVrZg
         V4HQ==
X-Gm-Message-State: AOAM533mTkz0sw10Zwcj8fTbTGYqc1KFAW1PDamBDK/SrtiInTbpX5jh
        ResN7qLyFe89I9zcnSzQFPV/kA==
X-Google-Smtp-Source: ABdhPJwBf+VTZaU733lVGtsRCpf87e3k7gMQlv2pErkQagPlvFaWd5TFIBpq+STzHaAPtzXkfAfEmQ==
X-Received: by 2002:a05:600c:292:: with SMTP id 18mr4269151wmk.175.1621436291251;
        Wed, 19 May 2021 07:58:11 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id f1sm29262959wrr.63.2021.05.19.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:58:10 -0700 (PDT)
Date:   Wed, 19 May 2021 15:58:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mfd: Add RTL8231 core device
Message-ID: <20210519145809.GI2549456@dell>
References: <f6fb81e62f5006a9e7772f5f2840d94b8d0d885d.1620735871.git.sander@svanheule.net>
 <202105122140.ZFyj5hQy-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202105122140.ZFyj5hQy-lkp@intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 12 May 2021, kernel test robot wrote:

> Hi Sander,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on pavel-linux-leds/for-next]
> [also build test ERROR on lee-mfd/for-mfd-next pinctrl/devel v5.13-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Sander-Vanheule/RTL8231-GPIO-expander-support/20210511-202618
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
> config: h8300-randconfig-r012-20210512 (attached as .config)
> compiler: h8300-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e031cc2da2c2948230bacd1ca56cfe9990e1aefd
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sander-Vanheule/RTL8231-GPIO-expander-support/20210511-202618
>         git checkout e031cc2da2c2948230bacd1ca56cfe9990e1aefd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=h8300 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl8231_mdio_reg_write':
> >> rtl8231.c:(.text+0x4f): undefined reference to `mdiobus_write'
>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl8231_mdio_reg_read':
> >> rtl8231.c:(.text+0x75): undefined reference to `mdiobus_read'
>    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `mdio_module_init':
> >> rtl8231.c:(.init.text+0xd): undefined reference to `mdio_driver_register'
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Please could you take a look at these failures.

Either fix them up or report a false positive.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
