Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70322A6783
	for <lists+linux-leds@lfdr.de>; Wed,  4 Nov 2020 16:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730774AbgKDPWc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Nov 2020 10:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729992AbgKDPWb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Nov 2020 10:22:31 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F961C0613D3
        for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2020 07:22:31 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id e6so5213695wro.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2020 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=q6hdviCMUNDpB25Riq30Bi5OEfr4eLtHUB6k7K/aZvY=;
        b=N+ZQkza/J4iL2cPwAzJDzR2TDBxa/ygHQqtkEBsQnPxwe0lwLCJ8zkeWrONmUupLVt
         I36bZ9MmN+isW9a3PipNRr7HFmQLJXRYh3h2jTx5SvCwWBbqSoCWaKhrJDzeS1c8lxbj
         OKmo7GVKj1pCYRoW+pfE9quncDqfpUNXwxo8Q2FtwwzdSmRMBc3NCc75nuZwKSQzHyyQ
         4WDnGDutraDZSK8aS66n6whaSUdnPCLbFK33gX8TbyWB6CALiLEyO2iruwRyI8YW2SCH
         So/W0SKiq7vaa1AB+AVJUXO2DrMpjHR1Sly/IPzksIBFuIEzyH7jloN6kk2A5it9d8Ag
         hsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q6hdviCMUNDpB25Riq30Bi5OEfr4eLtHUB6k7K/aZvY=;
        b=OlLuolQOT2d4ejHGvfmPznriRODIjWu618OwH89pLJLXUaUJbSXms87rSXsB6XgUih
         Q1+aWlPxZcymlOYoZmjGdRiZTTc/dqEKxL7qOfqFiu9e60dButdxVjsAd7aTYgUSMOby
         fhMfETbI7amLYXQFObWujTzLcB4pEDWixigAh+m1E5RM1d9ApZszvLKf0/aZT38nvBRe
         OOIj9tGHYdoxnY0PmjjE3JD0u1a85Yg7Yp3dts5OgZdJ0zJTvUj1rCtQBtxhL8Y009Bm
         McwHF7hrWGCpwhL/6hAzT2V5+4xsyrgKEroFXjU2Br9WFh+QECdy4oenCKq8vw72SsW/
         W2fA==
X-Gm-Message-State: AOAM533tsmqvSgttcSI7BzSYA28cRfqU7MqINqUvg7CzXXYLsrXvjRvQ
        +kGLzMDOHDLO0WkMA7QquqFsAg==
X-Google-Smtp-Source: ABdhPJxQzdXyGNDCkYY6//Qtcy3N7vuWJ5LfVvcTG8og0tM/Z01cSnk7BnqMscR9XtB5I8c4B16htw==
X-Received: by 2002:a5d:63cb:: with SMTP id c11mr30926563wrw.243.1604503349944;
        Wed, 04 Nov 2020 07:22:29 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id y201sm2893312wmd.27.2020.11.04.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 07:22:29 -0800 (PST)
Date:   Wed, 4 Nov 2020 15:22:27 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        kbuild-all@lists.01.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCH v6 2/6] drivers: mfd: Add a driver for iEi WT61P803
 PUZZLE MCU
Message-ID: <20201104152227.GM4488@dell>
References: <20201019221859.56680-3-luka.kovacic@sartura.hr>
 <202010201049.3V7m9mtx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202010201049.3V7m9mtx-lkp@intel.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 20 Oct 2020, kernel test robot wrote:

> Hi Luka,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on hwmon/hwmon-next]
> [also build test WARNING on v5.9]
> [cannot apply to pavel-linux-leds/for-next lee-mfd/for-mfd-next next-20201016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Luka-Kovacic/Add-support-for-the-iEi-WT61P803-PUZZLE-MCU/20201020-062048
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: ia64-randconfig-r002-20201020 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/855e7cca9db335136d09555f9983d7245fca1f4b
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Luka-Kovacic/Add-support-for-the-iEi-WT61P803-PUZZLE-MCU/20201020-062048
>         git checkout 855e7cca9db335136d09555f9983d7245fca1f4b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mfd/iei-wt61p803-puzzle.c:311:5: warning: no previous prototype for 'iei_wt61p803_puzzle_buzzer' [-Wmissing-prototypes]
>      311 | int iei_wt61p803_puzzle_buzzer(struct iei_wt61p803_puzzle *mcu, bool long_beep)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~

This bot has been complaining about this patch since at least v3.

Are you going to fix the issue?  Or is it moot?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
