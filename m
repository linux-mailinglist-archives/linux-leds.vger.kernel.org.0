Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B553D49D2
	for <lists+linux-leds@lfdr.de>; Sat, 24 Jul 2021 22:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhGXTon (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Jul 2021 15:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhGXTom (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Jul 2021 15:44:42 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1675FC061575
        for <linux-leds@vger.kernel.org>; Sat, 24 Jul 2021 13:25:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r2so6191029wrl.1
        for <linux-leds@vger.kernel.org>; Sat, 24 Jul 2021 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bTM//VFkvVMYtly57edrLNPeziMUoJEgYIBoWp7VNfI=;
        b=UE0MgJRt/shehIlnw6zB3QPX1duUAtfJPmAJMxl1Ytww18skV5zVHgXLyZwRPsc+xa
         XpHUm85suL/0zXHVn3S/uuYVrTW1RUsxEESmRnYQfX/yZx2SLWNMmceWeA/SWaqN2PDO
         nNibWd+ryFPSFoqLJJ0puyQ2o9Hc+w4hW6k9d+uIlOWKslCn/ZYgjn2QkGwHvDkwCO2m
         0dNYWLYdrlFFFE2LCd17YPvhSVis4t2ylzq25NDkoQ4es0HEt5SIyoWgbe3QWW1XYyuA
         krp3zqNKEJpdOoqz3wxG1OV59NMMHH9DzAHa9mnmccer7RWX9E6ND1ql/u1ONv6IbRcJ
         ODMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=bTM//VFkvVMYtly57edrLNPeziMUoJEgYIBoWp7VNfI=;
        b=agQuROmP/9E2Gsg0RLETHCEfI0P/gCwtaC0IXNOVVXRU/3zahO0rwK1l5NhgM7WDBi
         Q08Zyf+NUSqltjjKPYRTR7VVzW2A+wRvvYzvmNAaMt/4I8IkVM255h0JpJSHot6veXvg
         f9YcuV4A3pmEUOxAXCPpXCWpxviSDDnvv4Ts08TU+ga4e77GBEGnZsjZ+b6GJyklQV62
         kmz/7BzH6yDIihtAMJX36CFBki5UkF5/QzAFEwCmTo0TOQUDZTIwjXv4jIJRW2EYgH9G
         c1c/qN14C0T2uEOeK0gadNibUrL729yhPf5XD+4EDW0LWRZ8MVvi6/oiRrFCVhY2IkYY
         IkgA==
X-Gm-Message-State: AOAM531JCsKSBl32lHT6mhCtA0nde7aFP5c00w1SAe0maL7olzIf50EJ
        6ONr+IFvsCoNPYS2HR3RTtwmH/KoteE=
X-Google-Smtp-Source: ABdhPJxF3qayT/IRNUnj3Lc97tTaYPEjVkbDSowA9wJvgFlfKeD1jR0UntpE6O98hxt7c0+CdxM4Mw==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr11405229wrq.269.1627158311444;
        Sat, 24 Jul 2021 13:25:11 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:516f:52b0:18cd:af7c? (p200300ea8f3f3d00516f52b018cdaf7c.dip0.t-ipconnect.de. [2003:ea:8f3f:3d00:516f:52b0:18cd:af7c])
        by smtp.googlemail.com with ESMTPSA id n11sm9813770wms.0.2021.07.24.13.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jul 2021 13:25:10 -0700 (PDT)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: class: don't expose brightness attributes if needed
 callbacks aren't implemented
Message-ID: <6f61a6e8-147f-18de-2cbe-1a52f01e1529@gmail.com>
Date:   Sat, 24 Jul 2021 22:25:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If neither brightness_set nor brightness_set_blocking callback is
implemented (e.g. for a LED supporting HW triggers only), then exposing
the brightness-related sysfs attributes doesn't make sense.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-class.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index f704391d5..742d59296 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -74,6 +74,18 @@ static ssize_t max_brightness_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(max_brightness);
 
+static umode_t led_brightness_attrs_visible(struct kobject *kobj,
+					    struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (!led_cdev->brightness_set && !led_cdev->brightness_set_blocking)
+		return 0;
+
+	return attr->mode;
+}
+
 #ifdef CONFIG_LEDS_TRIGGERS
 static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write, 0);
 static struct bin_attribute *led_trigger_bin_attrs[] = {
@@ -92,6 +104,7 @@ static struct attribute *led_class_attrs[] = {
 };
 
 static const struct attribute_group led_group = {
+	.is_visible = led_brightness_attrs_visible,
 	.attrs = led_class_attrs,
 };
 
-- 
2.32.0

