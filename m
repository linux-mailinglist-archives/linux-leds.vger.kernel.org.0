Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E00F35E486
	for <lists+linux-leds@lfdr.de>; Tue, 13 Apr 2021 19:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347013AbhDMRC5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Apr 2021 13:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239106AbhDMRC4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Apr 2021 13:02:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5255C061574
        for <linux-leds@vger.kernel.org>; Tue, 13 Apr 2021 10:02:32 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id 12so17190793wrz.7
        for <linux-leds@vger.kernel.org>; Tue, 13 Apr 2021 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8erc3rKLXDMkSDo/2tMNG4iaqAw1JGVz2TYbTCmyzoQ=;
        b=H2KmxQa9v5b0IYK2E34U+bqxoiLhP/znWtE6TcNBv4zhF/coqI36jltutSi012erDE
         8Wg2GpUhUj8H8wXlZ4GDW2NzTz5MBVS8gfdxhXanrBYc8XIn/W4di4vDxl2oN4PBkyQp
         8klD1j96x292Fq+l6G79UQtEMGthXsun3ghUFrZbCnSlAjjLamZB7FSsZmM4MOmqMR3L
         /mBSHSbBHCJINTDMaKDDuTeXz1rZZiFgze1M4Iz1KOepWXY/rJSiEJc5DW8wItgiiJVW
         ej36uBp/V59r5FVPvV3yFAtc012oxnq7DsuTETiNSkXF9e6Twalm5dB4RfwwSl7yBGHm
         0dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8erc3rKLXDMkSDo/2tMNG4iaqAw1JGVz2TYbTCmyzoQ=;
        b=CzhpYUHAfT5ZF1kl+EdN55yY/J5SBS8IX1QKxqRdmPH/RP6Bcl4Tlq6A46J2Y0RUlj
         pzc36hcNbyqavjRdasz4HxT69NWC+7Zx9s/nWxMozT66uJ24KKIFWUDbNi8Glj94SIEw
         QJbibofRRR5mzt4v5vlTohSFo+TFoKpa0t1zcUfWzEtzJjZoom5ijFtgB2UBfN/LvzlF
         F5emC5irJ8g7qypP3pVgYYDuvQhvt43Rb/Scu+8QMgQElNvMNAm8zqrJd7AeJX8EuTnb
         szlSEBVkQ66I980dt6dgfq9QzKhtNzRof+G0OtaSn5VrpDNZfNgkrYiE3zVWYcX8iKCA
         48IA==
X-Gm-Message-State: AOAM533imtt6Qpqfo4ujmHf5dMc+Rq4pgpX31HC7/78PkqAqN6cOo158
        feNtiGzG3bJGm1GVKNEMaljXzo9snUs=
X-Google-Smtp-Source: ABdhPJxLuFvR8YTe5QyB97UOH1NHYWvPVN00KvOlgzjNZduXPhen+83wVDfGMuFCkcn316DRAl4Wqg==
X-Received: by 2002:adf:ea83:: with SMTP id s3mr14567422wrm.39.1618333351589;
        Tue, 13 Apr 2021 10:02:31 -0700 (PDT)
Received: from tp440p.steeds.sam ([41.84.243.33])
        by smtp.gmail.com with ESMTPSA id 24sm3449423wmk.18.2021.04.13.10.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:02:30 -0700 (PDT)
Date:   Tue, 13 Apr 2021 19:02:26 +0200
From:   Sicelo <absicsz@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
Subject: lp5523/lp5xx-common : Keyboard and RGB LEDs Not Working on Nokia N900
Message-ID: <YHXOotfNMEdG9oXQ@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

For some time now, the keyboard LEDs on Nokia N900 have not been
working. In dmesg is the error:
  
    lp5523x probe of 2-0032 failed with error -22

and consequently they do not get populated under /sys/class/leds.

I have finally had time to look into this, and found that the N900 dts
falls short of the current lp55xx binding specs. I have updated it and
will be submitting a separate patch. However, this was not enough to
make them work, and a new error appeared:

    [11363.247375] lp5523x 2-0032: GPIO lookup for consumer enable
    [11363.254394] lp5523x 2-0032: using device tree for GPIO lookup
    [11363.254455] of_get_named_gpiod_flags: can't parse 'enable-gpios' property of node '/ocp@68000000/i2c@48072000/lp5523@32[0]'
    [11363.254547] of_get_named_gpiod_flags: parsed 'enable-gpio' property of node '/ocp@68000000/i2c@48072000/lp5523@32[0]' - status (0)
    [11363.254638] gpio gpiochip1: Persistence not supported for GPIO 9
    [11363.254669] gpio-41 (enable): no flags found for enable
    [11363.295959] lp5523x 2-0032: device detection err: -121
    [11363.303710] lp5523x: probe of 2-0032 failed with error -121


This is because the chip does not get enabled even though dts contains:

    enable-gpios = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */

which is correct for this board.


I came up with this patch (against 5.12-rc6), which makes it work again.


diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 81de1346bf5d..9af84fc335b3 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -694,7 +694,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
        of_property_read_u8(np, "clock-mode", &pdata->clock_mode);

        pdata->enable_gpiod = devm_gpiod_get_optional(dev, "enable",
-                                                     GPIOD_ASIS);
+                                                     GPIOD_OUT_HIGH);
        if (IS_ERR(pdata->enable_gpiod))
                return ERR_CAST(pdata->enable_gpiod);


However, I am not sure if this is a proper way to fix the issue, or if
it is a dirty hack. It looks like all the chips handled by this driver
(lp5521, lp5523, lp5562, and lp8501) get enabled by pulling their ENable
pin high, so I suppose it is fine, but would like to get some feedback
before submitting a cleaned up patch. It is also possible that this
should be defined via dts elsewhere, although at this point I am not
sure how.

Looking forward to your help.

Sincerely
Sicelo
