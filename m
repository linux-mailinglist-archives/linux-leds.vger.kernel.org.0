Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088D72D92DF
	for <lists+linux-leds@lfdr.de>; Mon, 14 Dec 2020 06:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgLNFnN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Dec 2020 00:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbgLNFnN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Dec 2020 00:43:13 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B72C0613CF;
        Sun, 13 Dec 2020 21:42:33 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id b5so5951413pjl.0;
        Sun, 13 Dec 2020 21:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbntKyPMzDPH69+QeLjoviJGQym/fLE8dl3nxE5npUo=;
        b=SxoxgP8G8RbmhKy50JmBAJLWTfwItVlhFBHv1gSXpBHdLkpmjwTLo6PE9VF6J0AxeB
         E0nOq0hysrwm7nxxjC03ZrgIMTEYxhSedu+ClS8It8ayuBx/cJ/EzF3RT69f0bypsiTh
         3rGwVgswP9qxYoqG8MB9fo+i/uEgWcSbpWmhxJ8JQ/dd/FxbfERYw6Vlazh9MaHwpwbo
         6SVuYETRh+2FPoLncywM0SQloDUogYFTfvMOEcleLkM+T2k/1WNPhrbNgbLXrS/h66aS
         eEBQsKSCE0qQkn3Xo5XU96kI4hZ/dPD2qTBa+xpZHOllnh2zuSqoeF6txm7CqO//b7OL
         N2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wbntKyPMzDPH69+QeLjoviJGQym/fLE8dl3nxE5npUo=;
        b=QKWShBvJ3OUCqmF6WsadBsVy972BuhkkLpF9CtD19I+2ukCt0TT4IulQ0GhxN1l5qx
         McaAqfdZPJ4eoFONNJKzSBdrc8wKNLQvSFDOfQJMVK/CwO61L7H3RXADR4y8gCwqTuQG
         G8KV/IpLxt4uChQEUI1Oc5X6Mq7m4oSh3OlWfaaguAqnQ12TqNI3nRTi3qQ8dvDrnWA6
         QaQh96Mw6hvPItrQA6K2+4DmtZvLU+nj+OTm/aI+KFFat06Yv9pDgTwLRc1/nHPx876J
         LR7P1/u69h+j/SMQzhcUbMo7zc6/B51J6sYD0PFGxiUfZ9LfHqWzIGBt2czMY9iJs2Qt
         x6eg==
X-Gm-Message-State: AOAM531jtPXS6YAdhA4S+oVMP0brw1wzoTqRiJYqEgLTysQ3CzUuZ59l
        fXECWzCTujwL3i3mt9IveQ0oOUPgIS9nmuaP
X-Google-Smtp-Source: ABdhPJyCsEdG3eadYx99tyEPE/QdhPUku+YWUz+BujJWfv/wPFMZNdtOylt5+ProQEzONY9sIeLDLA==
X-Received: by 2002:a17:902:b101:b029:da:c50e:cd56 with SMTP id q1-20020a170902b101b02900dac50ecd56mr21240691plr.59.1607924552229;
        Sun, 13 Dec 2020 21:42:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:68f8:3c95:3c1d:64ce:bfb7])
        by smtp.gmail.com with ESMTPSA id f33sm17754759pgl.83.2020.12.13.21.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 21:42:31 -0800 (PST)
From:   Dwaipayan Ray <dwaipayanray1@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
        dwaipayanray1@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org, dmurphy@ti.com,
        pavel@ucw.cz
Subject: [PATCH v2] leds: Use DEVICE_ATTR_{RW, RO, WO} macros
Date:   Mon, 14 Dec 2020 11:12:05 +0530
Message-Id: <20201214054205.5263-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Instead of open coding DEVICE_ATTR() defines, use the
DEVICE_ATTR_RW(), DEVICE_ATTR_WO(), and DEVICE_ATTR_RO()
macros.

This required a few functions to be renamed, but the functionality
itself is unchanged.

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v2:
- Reword commit message

 drivers/leds/leds-blinkm.c        | 24 ++++++++++++------------
 drivers/leds/leds-lm3530.c        | 10 +++++-----
 drivers/leds/leds-lm355x.c        |  8 ++++----
 drivers/leds/leds-lm3642.c        | 16 ++++++++--------
 drivers/leds/leds-max8997.c       | 12 ++++++------
 drivers/leds/leds-netxbig.c       | 12 ++++++------
 drivers/leds/leds-ss4200.c        | 12 ++++++------
 drivers/leds/leds-wm831x-status.c | 12 ++++++------
 8 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index e11fe1788242..b4e1fdff4186 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -192,13 +192,13 @@ static int store_color_common(struct device *dev, const char *buf, int color)
 	return 0;
 }
 
-static ssize_t show_red(struct device *dev, struct device_attribute *attr,
+static ssize_t red_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	return show_color_common(dev, buf, RED);
 }
 
-static ssize_t store_red(struct device *dev, struct device_attribute *attr,
+static ssize_t red_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
 	int ret;
@@ -209,15 +209,15 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
+static DEVICE_ATTR_RW(red);
 
-static ssize_t show_green(struct device *dev, struct device_attribute *attr,
+static ssize_t green_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	return show_color_common(dev, buf, GREEN);
 }
 
-static ssize_t store_green(struct device *dev, struct device_attribute *attr,
+static ssize_t green_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
 
@@ -229,15 +229,15 @@ static ssize_t store_green(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(green, S_IRUGO | S_IWUSR, show_green, store_green);
+static DEVICE_ATTR_RW(green);
 
-static ssize_t show_blue(struct device *dev, struct device_attribute *attr,
+static ssize_t blue_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	return show_color_common(dev, buf, BLUE);
 }
 
-static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
+static ssize_t blue_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	int ret;
@@ -248,16 +248,16 @@ static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(blue, S_IRUGO | S_IWUSR, show_blue, store_blue);
+static DEVICE_ATTR_RW(blue);
 
-static ssize_t show_test(struct device *dev, struct device_attribute *attr,
+static ssize_t test_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	return scnprintf(buf, PAGE_SIZE,
 			 "#Write into test to start test sequence!#\n");
 }
 
-static ssize_t store_test(struct device *dev, struct device_attribute *attr,
+static ssize_t test_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 
@@ -273,7 +273,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(test, S_IRUGO | S_IWUSR, show_test, store_test);
+static DEVICE_ATTR_RW(test);
 
 /* TODO: HSB, fade, timeadj, script ... */
 
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index 2f8362f6bf75..2db455efd4b1 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -346,8 +346,8 @@ static void lm3530_brightness_set(struct led_classdev *led_cdev,
 	}
 }
 
-static ssize_t lm3530_mode_get(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t mode_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct lm3530_data *drvdata;
@@ -365,8 +365,8 @@ static ssize_t lm3530_mode_get(struct device *dev,
 	return len;
 }
 
-static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
-				   *attr, const char *buf, size_t size)
+static ssize_t mode_store(struct device *dev, struct device_attribute
+			  *attr, const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct lm3530_data *drvdata;
@@ -397,7 +397,7 @@ static ssize_t lm3530_mode_set(struct device *dev, struct device_attribute
 
 	return sizeof(drvdata->mode);
 }
-static DEVICE_ATTR(mode, 0644, lm3530_mode_get, lm3530_mode_set);
+static DEVICE_ATTR_RW(mode);
 
 static struct attribute *lm3530_attrs[] = {
 	&dev_attr_mode.attr,
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 1505521249b5..2d3e11845ba5 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -349,9 +349,9 @@ static int lm355x_indicator_brightness_set(struct led_classdev *cdev,
 }
 
 /* indicator pattern only for lm3556*/
-static ssize_t lm3556_indicator_pattern_store(struct device *dev,
-					      struct device_attribute *attr,
-					      const char *buf, size_t size)
+static ssize_t pattern_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
 {
 	ssize_t ret;
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -381,7 +381,7 @@ static ssize_t lm3556_indicator_pattern_store(struct device *dev,
 	return ret;
 }
 
-static DEVICE_ATTR(pattern, S_IWUSR, NULL, lm3556_indicator_pattern_store);
+static DEVICE_ATTR_WO(pattern);
 
 static struct attribute *lm355x_indicator_attrs[] = {
 	&dev_attr_pattern.attr,
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 62c14872caf7..8007b82985a8 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -165,9 +165,9 @@ static int lm3642_control(struct lm3642_chip_data *chip,
 /* torch */
 
 /* torch pin config for lm3642 */
-static ssize_t lm3642_torch_pin_store(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t size)
+static ssize_t torch_pin_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
 {
 	ssize_t ret;
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -193,7 +193,7 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
+static DEVICE_ATTR_WO(torch_pin);
 
 static int lm3642_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
@@ -212,9 +212,9 @@ static int lm3642_torch_brightness_set(struct led_classdev *cdev,
 /* flash */
 
 /* strobe pin config for lm3642*/
-static ssize_t lm3642_strobe_pin_store(struct device *dev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t size)
+static ssize_t strobe_pin_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
 {
 	ssize_t ret;
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
@@ -240,7 +240,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
+static DEVICE_ATTR_WO(strobe_pin);
 
 static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index 512a11d142d0..c0bddb33888d 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -160,8 +160,8 @@ static void max8997_led_brightness_set(struct led_classdev *led_cdev,
 	}
 }
 
-static ssize_t max8997_led_show_mode(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t mode_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct max8997_led *led =
@@ -193,9 +193,9 @@ static ssize_t max8997_led_show_mode(struct device *dev,
 	return ret;
 }
 
-static ssize_t max8997_led_store_mode(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t size)
+static ssize_t mode_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct max8997_led *led =
@@ -222,7 +222,7 @@ static ssize_t max8997_led_store_mode(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(mode, 0644, max8997_led_show_mode, max8997_led_store_mode);
+static DEVICE_ATTR_RW(mode);
 
 static struct attribute *max8997_attrs[] = {
 	&dev_attr_mode.attr,
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 68fbf0b66fad..77213b79f84d 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -204,9 +204,9 @@ static void netxbig_led_set(struct led_classdev *led_cdev,
 	spin_unlock_irqrestore(&led_dat->lock, flags);
 }
 
-static ssize_t netxbig_led_sata_store(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buff, size_t count)
+static ssize_t sata_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buff, size_t count)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct netxbig_led_data *led_dat =
@@ -255,8 +255,8 @@ static ssize_t netxbig_led_sata_store(struct device *dev,
 	return ret;
 }
 
-static ssize_t netxbig_led_sata_show(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t sata_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct netxbig_led_data *led_dat =
@@ -265,7 +265,7 @@ static ssize_t netxbig_led_sata_show(struct device *dev,
 	return sprintf(buf, "%d\n", led_dat->sata);
 }
 
-static DEVICE_ATTR(sata, 0644, netxbig_led_sata_show, netxbig_led_sata_store);
+static DEVICE_ATTR_RW(sata);
 
 static struct attribute *netxbig_led_attrs[] = {
 	&dev_attr_sata.attr,
diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 245de443fe9c..a6992323d69d 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -441,8 +441,8 @@ static void set_power_light_amber_noblink(void)
 	nasgpio_led_set_brightness(&amber->led_cdev, LED_FULL);
 }
 
-static ssize_t nas_led_blink_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t blink_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led = dev_get_drvdata(dev);
 	int blinking = 0;
@@ -451,9 +451,9 @@ static ssize_t nas_led_blink_show(struct device *dev,
 	return sprintf(buf, "%u\n", blinking);
 }
 
-static ssize_t nas_led_blink_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t size)
+static ssize_t blink_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t size)
 {
 	int ret;
 	struct led_classdev *led = dev_get_drvdata(dev);
@@ -468,7 +468,7 @@ static ssize_t nas_led_blink_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(blink, 0644, nas_led_blink_show, nas_led_blink_store);
+static DEVICE_ATTR_RW(blink);
 
 static struct attribute *nasgpio_led_attrs[] = {
 	&dev_attr_blink.attr,
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index 67f4235cb28a..c48b80574f02 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -155,8 +155,8 @@ static const char * const led_src_texts[] = {
 	"soft",
 };
 
-static ssize_t wm831x_status_src_show(struct device *dev,
-				      struct device_attribute *attr, char *buf)
+static ssize_t src_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct wm831x_status *led = to_wm831x_status(led_cdev);
@@ -178,9 +178,9 @@ static ssize_t wm831x_status_src_show(struct device *dev,
 	return ret;
 }
 
-static ssize_t wm831x_status_src_store(struct device *dev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t size)
+static ssize_t src_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct wm831x_status *led = to_wm831x_status(led_cdev);
@@ -197,7 +197,7 @@ static ssize_t wm831x_status_src_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(src, 0644, wm831x_status_src_show, wm831x_status_src_store);
+static DEVICE_ATTR_RW(src);
 
 static struct attribute *wm831x_status_attrs[] = {
 	&dev_attr_src.attr,
-- 
2.27.0

