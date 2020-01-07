Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A231132877
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jan 2020 15:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgAGOKj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 09:10:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33603 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGOKj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 09:10:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so46845634lji.0
        for <linux-leds@vger.kernel.org>; Tue, 07 Jan 2020 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXK6t3owG6GeGu6ZNg+NrMaydSH2di5lL3mtq9EawNQ=;
        b=DhElgpSMt50NIkscc20iDmDRna/+977/R7yTK+ZcFYDiHsAJWtxIG2LFSI7HjYjSOB
         qF4u1S6VmmwLPyxpbMXZ4xVwldP3V/+WulFef/n/Xjs9ZhS6RbLWGz9n5ChHUs1RiRY5
         ZDREohEkiELGpZ4rwEns/YjGq1dBE+dIyofWL3bGRtaM+J1yz/yml+YAFRtWidYrn/hy
         J1EvBmfBy2Vh0Sn8MsjzLXgx96D2hJ0CUOKALgTSAMVYm9u3eVk8gZAqImzmPzToXohB
         GI3xfrpOkzt8klK6kX7kiuh8WhH9RHvLRSrT3LH/M0GjJn0hnfaDnj0DJ7SAwqxX9FIT
         ql2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXK6t3owG6GeGu6ZNg+NrMaydSH2di5lL3mtq9EawNQ=;
        b=uCBO9YW9d1BtNneW1PPFjXVVBadLYODXnl+MDotW8ljjjEFOLNrmFWuI3XSi5dktNz
         YY2wJcGTPXsvYDWQc3AWtU4OLZfh5lVUuqeMaQEh6LJm/KKZ+BHc+iyVYxk09PtKFbfY
         ObC5ct1hgNDMWKiZDr2QeoJAoGhOol69EaW1jR+WOJaruGWubU5/FLCIYZJyYycspkWa
         Biri8C+KZ5Vfww110YaZ21tl9dN5KX6il2ZU6+gPAXNdn0U0b9WyYm6QhdK5NGrn5T+b
         en1+RMKfTOKqgPm4AE4iHMZ5DDzD346FlLYUErBM+YlX7oqiQRFTKay/41GazTi9xr2X
         7p+A==
X-Gm-Message-State: APjAAAX51VW42CQNt1zMSUvJu3uqSmuAg/zhTmOjN/Hibq2HywQ4TwTe
        SxqsbJd4fCBDkXX1GWJFaT03nA==
X-Google-Smtp-Source: APXvYqxKNT+hux4DsvqW3+scyamqTLzoOrU6Cik1h4U1W+jGYo7UXCfaM+nCeXThOE372Z1TklRsgg==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr65206466ljk.229.1578406235856;
        Tue, 07 Jan 2020 06:10:35 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id a14sm30317770lfh.50.2020.01.07.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 06:10:35 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Guinot <simon.guinot@sequanux.org>,
        Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH 1/2] leds: ns2: Absorb platform data
Date:   Tue,  7 Jan 2020 15:10:28 +0100
Message-Id: <20200107141030.74052-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Nothing in the kernel includes the external header
<linux/platform_data/leds-kirkwood-ns2.h> so just push the
contents into the ns2 leds driver. If someone wants to use
platform data or board files to describe this device they
should be able to do so using GPIO machine descriptors but
in any case device tree should be the way forward for these
systems in all cases I can think of, and the driver already
supports that.

Cc: Simon Guinot <simon.guinot@sequanux.org>
Cc: Vincent Donnefort <vdonnefort@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-ns2.c                       | 30 +++++++++++++--
 .../linux/platform_data/leds-kirkwood-ns2.h   | 38 -------------------
 2 files changed, 27 insertions(+), 41 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-kirkwood-ns2.h

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 7c500dfdcfa3..6d37dda12c39 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -12,14 +12,38 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/leds.h>
 #include <linux/module.h>
-#include <linux/platform_data/leds-kirkwood-ns2.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include "leds.h"
 
+enum ns2_led_modes {
+	NS_V2_LED_OFF,
+	NS_V2_LED_ON,
+	NS_V2_LED_SATA,
+};
+
+struct ns2_led_modval {
+	enum ns2_led_modes	mode;
+	int			cmd_level;
+	int			slow_level;
+};
+
+struct ns2_led {
+	const char	*name;
+	const char	*default_trigger;
+	unsigned	cmd;
+	unsigned	slow;
+	int		num_modes;
+	struct ns2_led_modval *modval;
+};
+
+struct ns2_led_platform_data {
+	int		num_leds;
+	struct ns2_led	*leds;
+};
+
 /*
  * The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
  * modes are available: off, on and SATA activity blinking. The LED modes are
diff --git a/include/linux/platform_data/leds-kirkwood-ns2.h b/include/linux/platform_data/leds-kirkwood-ns2.h
deleted file mode 100644
index eb8a6860e816..000000000000
--- a/include/linux/platform_data/leds-kirkwood-ns2.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Platform data structure for Network Space v2 LED driver
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __LEDS_KIRKWOOD_NS2_H
-#define __LEDS_KIRKWOOD_NS2_H
-
-enum ns2_led_modes {
-	NS_V2_LED_OFF,
-	NS_V2_LED_ON,
-	NS_V2_LED_SATA,
-};
-
-struct ns2_led_modval {
-	enum ns2_led_modes	mode;
-	int			cmd_level;
-	int			slow_level;
-};
-
-struct ns2_led {
-	const char	*name;
-	const char	*default_trigger;
-	unsigned	cmd;
-	unsigned	slow;
-	int		num_modes;
-	struct ns2_led_modval *modval;
-};
-
-struct ns2_led_platform_data {
-	int		num_leds;
-	struct ns2_led	*leds;
-};
-
-#endif /* __LEDS_KIRKWOOD_NS2_H */
-- 
2.23.0

