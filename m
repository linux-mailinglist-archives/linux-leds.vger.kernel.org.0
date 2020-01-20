Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 242AD1423A3
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jan 2020 07:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgATGlj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jan 2020 01:41:39 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33350 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgATGlj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jan 2020 01:41:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so23125405lfl.0;
        Sun, 19 Jan 2020 22:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=toYl/KF3mEVEdTomw4/UPz124rBs7u5BLLWOAhMJCDQ=;
        b=fBF7/f5jW3DFuuk2PGK7ivTwQyOolekRo2pJMwvFuFaNopUV+srqt84SJz6NCtVx7D
         ErjD7QibEunRDt0NKIm/UTKAGEjsTyxHYdqCPtfFdqf1pGGcLcEvtNtDX8G9ZpBakdXA
         o/YqF86Ambi8ux9OVjjiASXFQADvIelJ/nyoB/L0ENFNGVfmdbz3iDsb0Ovf0kh77sXl
         /lyXhbREcQdWggHTJeU9vlNBJnbomA2O1FkzlzSQIG+qDLeerTEUIVLL6q4UgLyRTlEu
         Gi3s+VXmq/QpwxjP8UcNFYlo/w4gydoeywb9MnvIfDEfyWw5c2Z21ksEaqEKm01qcpBZ
         N5Dw==
X-Gm-Message-State: APjAAAVfRPCinTx8jJOeVjuG7aTSo33pcha4tQdXfR60rPBvf0VPvzDq
        DNj48G0RaO7nCVPEKwg0k8U=
X-Google-Smtp-Source: APXvYqwyxZiSjKt73CmdR56jH1MSUiMAJcGzDqhuejT6ZdW+30Ew9OFnF+kYOvOv99qlOTtMqogIAQ==
X-Received: by 2002:ac2:5496:: with SMTP id t22mr3176684lfk.85.1579502494321;
        Sun, 19 Jan 2020 22:41:34 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 21sm16144301ljv.19.2020.01.19.22.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2020 22:41:33 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:41:21 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v11 10/13] rtc: bd70528: add BD71828 support
Message-ID: <1b35ea86b50127f17f76e4f63a6d0ca2f191cdfc.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

ROHM BD71828 PMIC RTC block is from many parts similar to one
on BD70528. Support BD71828 RTC using BD70528 RTC driver and
avoid re-inventing the wheel.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
No changes since v10

 drivers/rtc/Kconfig              |   3 +-
 drivers/rtc/rtc-bd70528.c        | 220 +++++++++++++++++++++++++------
 include/linux/mfd/rohm-bd70528.h |  13 +-
 include/linux/mfd/rohm-bd71828.h |   4 +-
 include/linux/mfd/rohm-shared.h  |  21 +++
 5 files changed, 206 insertions(+), 55 deletions(-)
 create mode 100644 include/linux/mfd/rohm-shared.h

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index d77515d8382c..df7a3843069d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -498,12 +498,13 @@ config RTC_DRV_M41T80_WDT
 	help
 	  If you say Y here you will get support for the
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
+
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528 PMIC RTC"
 	depends on MFD_ROHM_BD70528 && (BD70528_WATCHDOG || !BD70528_WATCHDOG)
 	help
 	  If you say Y here you will get support for the RTC
-	  on ROHM BD70528 Power Management IC.
+	  block on ROHM BD70528 and BD71828 Power Management IC.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-bd70528.
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 627037aa66a8..bbbb1f07c91f 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -6,6 +6,7 @@
 
 #include <linux/bcd.h>
 #include <linux/mfd/rohm-bd70528.h>
+#include <linux/mfd/rohm-bd71828.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -15,7 +16,7 @@
 /*
  * We read regs RTC_SEC => RTC_YEAR
  * this struct is ordered according to chip registers.
- * Keep it u8 only to avoid padding issues.
+ * Keep it u8 only (or packed) to avoid padding issues.
  */
 struct bd70528_rtc_day {
 	u8 sec;
@@ -36,6 +37,13 @@ struct bd70528_rtc_wake {
 	u8 ctrl;
 } __packed;
 
+struct bd71828_rtc_alm {
+	struct bd70528_rtc_data alm0;
+	struct bd70528_rtc_data alm1;
+	u8 alm_mask;
+	u8 alm1_mask;
+} __packed;
+
 struct bd70528_rtc_alm {
 	struct bd70528_rtc_data data;
 	u8 alm_mask;
@@ -43,8 +51,10 @@ struct bd70528_rtc_alm {
 } __packed;
 
 struct bd70528_rtc {
-	struct rohm_regmap_dev *mfd;
+	struct rohm_regmap_dev *parent;
 	struct device *dev;
+	u8 reg_time_start;
+	bool has_rtc_timers;
 };
 
 static int bd70528_set_wake(struct rohm_regmap_dev *bd70528,
@@ -123,14 +133,14 @@ static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
 {
 	int ret;
 
-	ret = bd70528_wdt_set(r->mfd, new_state & BD70528_WDT_STATE_BIT,
+	ret = bd70528_wdt_set(r->parent, new_state & BD70528_WDT_STATE_BIT,
 			      old_state);
 	if (ret) {
 		dev_err(r->dev,
 			"Failed to disable WDG for RTC setting (%d)\n", ret);
 		return ret;
 	}
-	ret = bd70528_set_elapsed_tmr(r->mfd,
+	ret = bd70528_set_elapsed_tmr(r->parent,
 				      new_state & BD70528_ELAPSED_STATE_BIT,
 				      old_state);
 	if (ret) {
@@ -138,7 +148,7 @@ static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
 			"Failed to disable 'elapsed timer' for RTC setting\n");
 		return ret;
 	}
-	ret = bd70528_set_wake(r->mfd, new_state & BD70528_WAKE_STATE_BIT,
+	ret = bd70528_set_wake(r->parent, new_state & BD70528_WAKE_STATE_BIT,
 			       old_state);
 	if (ret) {
 		dev_err(r->dev,
@@ -152,12 +162,18 @@ static int bd70528_set_rtc_based_timers(struct bd70528_rtc *r, int new_state,
 static int bd70528_re_enable_rtc_based_timers(struct bd70528_rtc *r,
 					      int old_state)
 {
+	if (!r->has_rtc_timers)
+		return 0;
+
 	return bd70528_set_rtc_based_timers(r, old_state, NULL);
 }
 
 static int bd70528_disable_rtc_based_timers(struct bd70528_rtc *r,
 					    int *old_state)
 {
+	if (!r->has_rtc_timers)
+		return 0;
+
 	return bd70528_set_rtc_based_timers(r, 0, old_state);
 }
 
@@ -213,22 +229,52 @@ static inline void rtc2tm(struct bd70528_rtc_data *r, struct rtc_time *t)
 	t->tm_wday = bcd2bin(r->week & BD70528_MASK_RTC_WEEK);
 }
 
+static int bd71828_set_alarm(struct device *dev, struct rtc_wkalrm *a)
+{
+	int ret;
+	struct bd71828_rtc_alm alm;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	struct rohm_regmap_dev *parent = r->parent;
+
+	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+			       &alm, sizeof(alm));
+	if (ret) {
+		dev_err(dev, "Failed to read alarm regs\n");
+		return ret;
+	}
+
+	tm2rtc(&a->time, &alm.alm0);
+
+	if (!a->enabled)
+		alm.alm_mask &= ~BD70528_MASK_ALM_EN;
+	else
+		alm.alm_mask |= BD70528_MASK_ALM_EN;
+
+	ret = regmap_bulk_write(parent->regmap, BD71828_REG_RTC_ALM_START,
+				&alm, sizeof(alm));
+	if (ret)
+		dev_err(dev, "Failed to set alarm time\n");
+
+	return ret;
+
+}
+
 static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 {
 	struct bd70528_rtc_wake wake;
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *bd70528 = r->mfd;
+	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_WAKE_START,
+	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_WAKE_START,
 			       &wake, sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to read wake regs\n");
 		return ret;
 	}
 
-	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -246,14 +292,14 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 		wake.ctrl &= ~BD70528_MASK_WAKE_EN;
 	}
 
-	ret = regmap_bulk_write(bd70528->regmap,
+	ret = regmap_bulk_write(parent->regmap,
 				BD70528_REG_RTC_WAKE_START, &wake,
 				sizeof(wake));
 	if (ret) {
 		dev_err(dev, "Failed to set wake time\n");
 		return ret;
 	}
-	ret = regmap_bulk_write(bd70528->regmap, BD70528_REG_RTC_ALM_START,
+	ret = regmap_bulk_write(parent->regmap, BD70528_REG_RTC_ALM_START,
 				&alm, sizeof(alm));
 	if (ret)
 		dev_err(dev, "Failed to set alarm time\n");
@@ -261,14 +307,38 @@ static int bd70528_set_alarm(struct device *dev, struct rtc_wkalrm *a)
 	return ret;
 }
 
+static int bd71828_read_alarm(struct device *dev, struct rtc_wkalrm *a)
+{
+	int ret;
+	struct bd71828_rtc_alm alm;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	struct rohm_regmap_dev *parent = r->parent;
+
+	ret = regmap_bulk_read(parent->regmap, BD71828_REG_RTC_ALM_START,
+			       &alm, sizeof(alm));
+	if (ret) {
+		dev_err(dev, "Failed to read alarm regs\n");
+		return ret;
+	}
+
+	rtc2tm(&alm.alm0, &a->time);
+	a->time.tm_mday = -1;
+	a->time.tm_mon = -1;
+	a->time.tm_year = -1;
+	a->enabled = !!(alm.alm_mask & BD70528_MASK_ALM_EN);
+	a->pending = 0;
+
+	return 0;
+}
+
 static int bd70528_read_alarm(struct device *dev, struct rtc_wkalrm *a)
 {
 	struct bd70528_rtc_alm alm;
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *bd70528 = r->mfd;
+	struct rohm_regmap_dev *parent = r->parent;
 
-	ret = regmap_bulk_read(bd70528->regmap, BD70528_REG_RTC_ALM_START,
+	ret = regmap_bulk_read(parent->regmap, BD70528_REG_RTC_ALM_START,
 			       &alm, sizeof(alm));
 	if (ret) {
 		dev_err(dev, "Failed to read alarm regs\n");
@@ -290,14 +360,14 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	int ret, tmpret, old_states;
 	struct bd70528_rtc_data rtc_data;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *bd70528 = r->mfd;
+	struct rohm_regmap_dev *parent = r->parent;
 
 	ret = bd70528_disable_rtc_based_timers(r, &old_states);
 	if (ret)
 		return ret;
 
-	tmpret = regmap_bulk_read(bd70528->regmap,
-				  BD70528_REG_RTC_START, &rtc_data,
+	tmpret = regmap_bulk_read(parent->regmap,
+				  r->reg_time_start, &rtc_data,
 				  sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to read RTC time registers\n");
@@ -305,8 +375,8 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	}
 	tm2rtc(t, &rtc_data);
 
-	tmpret = regmap_bulk_write(bd70528->regmap,
-				   BD70528_REG_RTC_START, &rtc_data,
+	tmpret = regmap_bulk_write(parent->regmap,
+				   r->reg_time_start, &rtc_data,
 				   sizeof(rtc_data));
 	if (tmpret) {
 		dev_err(dev, "Failed to set RTC time\n");
@@ -321,27 +391,32 @@ static int bd70528_set_time_locked(struct device *dev, struct rtc_time *t)
 	return ret;
 }
 
+static int bd71828_set_time(struct device *dev, struct rtc_time *t)
+{
+	return bd70528_set_time_locked(dev, t);
+}
+
 static int bd70528_set_time(struct device *dev, struct rtc_time *t)
 {
 	int ret;
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
 
-	bd70528_wdt_lock(r->mfd);
+	bd70528_wdt_lock(r->parent);
 	ret = bd70528_set_time_locked(dev, t);
-	bd70528_wdt_unlock(r->mfd);
+	bd70528_wdt_unlock(r->parent);
 	return ret;
 }
 
 static int bd70528_get_time(struct device *dev, struct rtc_time *t)
 {
 	struct bd70528_rtc *r = dev_get_drvdata(dev);
-	struct rohm_regmap_dev *bd70528 = r->mfd;
+	struct rohm_regmap_dev *parent = r->parent;
 	struct bd70528_rtc_data rtc_data;
 	int ret;
 
 	/* read the RTC date and time registers all at once */
-	ret = regmap_bulk_read(bd70528->regmap,
-			       BD70528_REG_RTC_START, &rtc_data,
+	ret = regmap_bulk_read(parent->regmap,
+			       r->reg_time_start, &rtc_data,
 			       sizeof(rtc_data));
 	if (ret) {
 		dev_err(dev, "Failed to read RTC time (err %d)\n", ret);
@@ -362,19 +437,36 @@ static int bd70528_alm_enable(struct device *dev, unsigned int enabled)
 	if (enabled)
 		enableval = 0;
 
-	bd70528_wdt_lock(r->mfd);
-	ret = bd70528_set_wake(r->mfd, enabled, NULL);
+	bd70528_wdt_lock(r->parent);
+	ret = bd70528_set_wake(r->parent, enabled, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to change wake state\n");
 		goto out_unlock;
 	}
-	ret = regmap_update_bits(r->mfd->regmap, BD70528_REG_RTC_ALM_MASK,
+	ret = regmap_update_bits(r->parent->regmap, BD70528_REG_RTC_ALM_MASK,
 				 BD70528_MASK_ALM_EN, enableval);
 	if (ret)
 		dev_err(dev, "Failed to change alarm state\n");
 
 out_unlock:
-	bd70528_wdt_unlock(r->mfd);
+	bd70528_wdt_unlock(r->parent);
+	return ret;
+}
+
+static int bd71828_alm_enable(struct device *dev, unsigned int enabled)
+{
+	int ret;
+	struct bd70528_rtc *r = dev_get_drvdata(dev);
+	unsigned int enableval = BD70528_MASK_ALM_EN;
+
+	if (!enabled)
+		enableval = 0;
+
+	ret = regmap_update_bits(r->parent->regmap, BD71828_REG_RTC_ALM0_MASK,
+				 BD70528_MASK_ALM_EN, enableval);
+	if (ret)
+		dev_err(dev, "Failed to change alarm state\n");
+
 	return ret;
 }
 
@@ -386,6 +478,14 @@ static const struct rtc_class_ops bd70528_rtc_ops = {
 	.alarm_irq_enable	= bd70528_alm_enable,
 };
 
+static const struct rtc_class_ops bd71828_rtc_ops = {
+	.read_time		= bd70528_get_time,
+	.set_time		= bd71828_set_time,
+	.read_alarm		= bd71828_read_alarm,
+	.set_alarm		= bd71828_set_alarm,
+	.alarm_irq_enable	= bd71828_alm_enable,
+};
+
 static irqreturn_t alm_hndlr(int irq, void *data)
 {
 	struct rtc_device *rtc = data;
@@ -397,14 +497,19 @@ static irqreturn_t alm_hndlr(int irq, void *data)
 static int bd70528_probe(struct platform_device *pdev)
 {
 	struct bd70528_rtc *bd_rtc;
-	struct rohm_regmap_dev *mfd;
+	const struct rtc_class_ops *rtc_ops;
+	struct rohm_regmap_dev *parent;
+	const char *irq_name;
 	int ret;
 	struct rtc_device *rtc;
 	int irq;
 	unsigned int hr;
+	bool enable_main_irq = false;
+	u8 hour_reg;
+	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
-	mfd = dev_get_drvdata(pdev->dev.parent);
-	if (!mfd) {
+	parent = dev_get_drvdata(pdev->dev.parent);
+	if (!parent) {
 		dev_err(&pdev->dev, "No MFD driver data\n");
 		return -EINVAL;
 	}
@@ -412,16 +517,39 @@ static int bd70528_probe(struct platform_device *pdev)
 	if (!bd_rtc)
 		return -ENOMEM;
 
-	bd_rtc->mfd = mfd;
+	bd_rtc->parent = parent;
 	bd_rtc->dev = &pdev->dev;
 
-	irq = platform_get_irq_byname(pdev, "bd70528-rtc-alm");
-	if (irq < 0)
+	switch (chip) {
+	case ROHM_CHIP_TYPE_BD70528:
+		irq_name = "bd70528-rtc-alm";
+		bd_rtc->has_rtc_timers = true;
+		bd_rtc->reg_time_start = BD70528_REG_RTC_START;
+		hour_reg = BD70528_REG_RTC_HOUR;
+		enable_main_irq = true;
+		rtc_ops = &bd70528_rtc_ops;
+		break;
+	case ROHM_CHIP_TYPE_BD71828:
+		irq_name = "bd71828-rtc-alm-0";
+		bd_rtc->reg_time_start = BD71828_REG_RTC_START;
+		hour_reg = BD71828_REG_RTC_HOUR;
+		rtc_ops = &bd71828_rtc_ops;
+		break;
+	default:
+		dev_err(&pdev->dev, "Unknown chip\n");
+		return -ENOENT;
+	}
+
+	irq = platform_get_irq_byname(pdev, irq_name);
+
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq\n");
 		return irq;
+	}
 
 	platform_set_drvdata(pdev, bd_rtc);
 
-	ret = regmap_read(mfd->regmap, BD70528_REG_RTC_HOUR, &hr);
+	ret = regmap_read(parent->regmap, hour_reg, &hr);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to reag RTC clock\n");
@@ -431,10 +559,10 @@ static int bd70528_probe(struct platform_device *pdev)
 	if (!(hr & BD70528_MASK_RTC_HOUR_24H)) {
 		struct rtc_time t;
 
-		ret = bd70528_get_time(&pdev->dev, &t);
+		ret = rtc_ops->read_time(&pdev->dev, &t);
 
 		if (!ret)
-			ret = bd70528_set_time(&pdev->dev, &t);
+			ret = rtc_ops->set_time(&pdev->dev, &t);
 
 		if (ret) {
 			dev_err(&pdev->dev,
@@ -454,7 +582,7 @@ static int bd70528_probe(struct platform_device *pdev)
 
 	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->range_max = RTC_TIMESTAMP_END_2099;
-	rtc->ops = &bd70528_rtc_ops;
+	rtc->ops = rtc_ops;
 
 	/* Request alarm IRQ prior to registerig the RTC */
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
@@ -468,27 +596,37 @@ static int bd70528_probe(struct platform_device *pdev)
 	 *  leave them enabled as irq-controller should disable irqs
 	 *  from sub-registers when IRQ is disabled or freed.
 	 */
-	ret = regmap_update_bits(mfd->regmap,
+	if (enable_main_irq) {
+		ret = regmap_update_bits(parent->regmap,
 				 BD70528_REG_INT_MAIN_MASK,
 				 BD70528_INT_RTC_MASK, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
-		return ret;
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to enable RTC interrupts\n");
+			return ret;
+		}
 	}
 
 	return rtc_register_device(rtc);
 }
 
+static const struct platform_device_id bd718x7_rtc_id[] = {
+	{ "bd70528-rtc", ROHM_CHIP_TYPE_BD70528 },
+	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
+
 static struct platform_driver bd70528_rtc = {
 	.driver = {
 		.name = "bd70528-rtc"
 	},
 	.probe = bd70528_probe,
+	.id_table = bd718x7_rtc_id,
 };
 
 module_platform_driver(bd70528_rtc);
 
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
-MODULE_DESCRIPTION("BD70528 RTC driver");
+MODULE_DESCRIPTION("ROHM BD70528 and BD71828 PMIC RTC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:bd70528-rtc");
diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index edae6f7afd8e..a57af878fd0c 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/mfd/rohm-generic.h>
+#include <linux/mfd/rohm-shared.h>
 #include <linux/regmap.h>
 
 enum {
@@ -307,17 +308,6 @@ enum {
 
 /* RTC masks to mask out reserved bits */
 
-#define BD70528_MASK_RTC_SEC		0x7f
-#define BD70528_MASK_RTC_MINUTE		0x7f
-#define BD70528_MASK_RTC_HOUR_24H	0x80
-#define BD70528_MASK_RTC_HOUR_PM	0x20
-#define BD70528_MASK_RTC_HOUR		0x3f
-#define BD70528_MASK_RTC_DAY		0x3f
-#define BD70528_MASK_RTC_WEEK		0x07
-#define BD70528_MASK_RTC_MONTH		0x1f
-#define BD70528_MASK_RTC_YEAR		0xff
-#define BD70528_MASK_RTC_COUNT_L	0x7f
-
 #define BD70528_MASK_ELAPSED_TIMER_EN	0x1
 /* Mask second, min and hour fields
  * HW would support ALM irq for over 24h
@@ -326,7 +316,6 @@ enum {
  * wake-up we limit ALM to 24H and only
  * unmask sec, min and hour
  */
-#define BD70528_MASK_ALM_EN		0x7
 #define BD70528_MASK_WAKE_EN		0x1
 
 /* WDT masks */
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index d013e03f742d..017a4c01cb31 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -5,6 +5,7 @@
 #define __LINUX_MFD_BD71828_H__
 
 #include <linux/mfd/rohm-generic.h>
+#include <linux/mfd/rohm-shared.h>
 
 /* Regulator IDs */
 enum {
@@ -160,6 +161,7 @@ enum {
 #define BD71828_REG_RTC_YEAR		0x52
 
 #define BD71828_REG_RTC_ALM0_SEC	0x53
+#define BD71828_REG_RTC_ALM_START	BD71828_REG_RTC_ALM0_SEC
 #define BD71828_REG_RTC_ALM0_MINUTE	0x54
 #define BD71828_REG_RTC_ALM0_HOUR	0x55
 #define BD71828_REG_RTC_ALM0_WEEK	0x56
@@ -178,6 +180,7 @@ enum {
 #define BD71828_REG_RTC_ALM1_MASK	0x62
 
 #define BD71828_REG_RTC_ALM2		0x63
+#define BD71828_REG_RTC_START		BD71828_REG_RTC_SEC
 
 /* Charger/Battey */
 #define BD71828_REG_CHG_STATE		0x65
@@ -204,7 +207,6 @@ enum {
 #define BD71828_REG_INT_MASK_TEMP	0xdd
 #define BD71828_REG_INT_MASK_RTC	0xde
 
-
 #define BD71828_REG_INT_MAIN		0xdf
 #define BD71828_REG_INT_BUCK		0xe0
 #define BD71828_REG_INT_DCIN1		0xe1
diff --git a/include/linux/mfd/rohm-shared.h b/include/linux/mfd/rohm-shared.h
new file mode 100644
index 000000000000..53dd7f638bfd
--- /dev/null
+++ b/include/linux/mfd/rohm-shared.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2020 ROHM Semiconductors */
+
+
+#ifndef __LINUX_MFD_ROHM_SHARED_H__
+#define __LINUX_MFD_ROHM_SHARED_H__
+
+/* RTC definitions shared between BD70528 and BD71828 */
+
+#define BD70528_MASK_RTC_SEC		0x7f
+#define BD70528_MASK_RTC_MINUTE		0x7f
+#define BD70528_MASK_RTC_HOUR_24H	0x80
+#define BD70528_MASK_RTC_HOUR_PM	0x20
+#define BD70528_MASK_RTC_HOUR		0x3f
+#define BD70528_MASK_RTC_DAY		0x3f
+#define BD70528_MASK_RTC_WEEK		0x07
+#define BD70528_MASK_RTC_MONTH		0x1f
+#define BD70528_MASK_RTC_YEAR		0xff
+#define BD70528_MASK_ALM_EN		0x7
+
+#endif /* __LINUX_MFD_ROHM_SHARED_H__ */
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
