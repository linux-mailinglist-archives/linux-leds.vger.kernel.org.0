Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36BA11572A0
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2020 11:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJKOH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Feb 2020 05:14:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45049 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgBJKOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Feb 2020 05:14:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so6411923ljj.11
        for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2020 02:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGRQ+1VdvzmVdEQmBilazowC17TPaTmOUWHyF5XIFu4=;
        b=r191XJKTtni0zRyHNeoX9pgfSz6DOF6DG6abJWES4rfk1Dn8YBMsrpm8/piTxi8mdb
         3/zvcfy1XTMndQr1RKy6deJfGl/+SaBVsMscKLHwpp31ELywf8QHGELbBiepe6+xGj3d
         X9theD5tw5vUFt1tmIzASKmYbTKDThRbnn/YXL8kv3c7bzqXGck3wvRlvGdBMZuFIu2I
         71+VLJZe6D0ewqvy95r5DnqizwAEuEZuRcKJ3zPfh1+ewsungibcqPg8P3fvQP2IS+54
         q8yujLyqpWjpxjQTCMPoRuBoiENlruu7V9TeWOSyZ6UHxX6t42pn0SCXg5WVlpDaq+aG
         hlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGRQ+1VdvzmVdEQmBilazowC17TPaTmOUWHyF5XIFu4=;
        b=G1YLq+HlR/NGIG2njN+179vXiJoEVAXvUExrY1mIEvb4F9R6GhcxU6aY7LB8TN7vFx
         UbmLjWUA3Q6ghX6f1p0k9ubNU4OZy1gEu3me6jiBlcBEMl7pE0A518F8KfopFkPbqKPT
         wZ86S/lgVDYQP25fkYKd3/cjKWaoF39ZpLyesb8+7zdT5VVG5ApY7MJMkSU9tNOF0DKu
         AwlkFOc264ZVfWJ0myLjGcY5+8eArbxPlvG71dVZBfJmBEMfeNGR+j8flyKUuBxq78fY
         sq3oA7tkxPHhilUEy2n0zUVd+zEBmgttzCuPYz6Hr/YYmzEyHkcHU7fAammI/OqCMpD0
         vpzw==
X-Gm-Message-State: APjAAAVG6CkSgHTW65Vf7vNs7jaWFUt6moZylx2Wp1ndQBv/jry1kn6x
        g+SvT4QC7ihzFW5e3I1Kdpe+HQ==
X-Google-Smtp-Source: APXvYqwydcXtoYK7x/1fv7u2ofG/nfcMvSb+Z7g48gvsjbtJuqlNs4PFW4lpElw33O8CwTqIvqxgmw==
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr424737ljj.257.1581329643372;
        Mon, 10 Feb 2020 02:14:03 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m3sm5047250lfl.97.2020.02.10.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 02:14:02 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH 1/2 v2] leds: ns2: Absorb platform data
Date:   Mon, 10 Feb 2020 11:13:53 +0100
Message-Id: <20200210101354.287045-1-linus.walleij@linaro.org>
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

Cc: Vincent Donnefort <vdonnefort@gmail.com>
Tested-by: Simon Guinot <simon.guinot@sequanux.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Simon's Tested-by tag
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

