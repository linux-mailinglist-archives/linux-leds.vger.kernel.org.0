Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C289D7E1
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2019 23:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbfHZVCa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Aug 2019 17:02:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54306 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHZVCa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 26 Aug 2019 17:02:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so827355wme.4;
        Mon, 26 Aug 2019 14:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XaQjiUX0encMH3+SJOQJcV9jJJRyCPPTOQMBYUxHvdU=;
        b=rfleoTnF6Rj3uTY5S2yNFcrGwUAhfa6tkKvfWx+8QOqUkVnc5AKe5ylmNovQXUz1aO
         RIZEbb7pUuG4avfcd1m/uWn6CmjIyrmN01RNHwysUlyLjOkePTx0wpfLp5daaE5kO2kw
         igYk3FvFPnb9IT2iwwWOVAxqK8x6svQSmZmnZRmi32FnP6pgqKbgsqcw+F1RVm1YfWuy
         8s1JoUeoUriekqtaBWOdgOIM9JUsedQACZVZykkKG572YGE0UH0cZy3ngJ6aWkGRv4+x
         p4VgSQgMHtr3imCp4I+jtMMi7A+Ca5DgCg1YfZe2iX3GvUG7XnbhKmCDT44S07stsc11
         Im6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XaQjiUX0encMH3+SJOQJcV9jJJRyCPPTOQMBYUxHvdU=;
        b=dWvu6wt4gAveZkKraI1Vve7fgZ50juVRph0lN1dpgv8iMr2z5wYNt3TGJDOy+yB79y
         EtcfTzxb7Q6QO1//a0q86DEV81BbevLrmzcGsiK3jdiCGQqnI1CZkisO54itP36Ozc9Q
         7h00S1aO0Cdl6eWHlKGNgd+VoyZUaaHlLfuJNiuzziKAg2UtM8gtRetZbunReFEOwOMR
         owY+le6iWPr1aHuYhG/847eRY4DFo28DqFtFP8+E7zbCy/2/OxxuVC2XQ0NHPW7k6vTK
         8DYB4gichVYTJKFni5sQ05UkoVWDEqMnckWWq2kGVFfcqXKajYKfO7SkwykBgltICPF3
         lXGw==
X-Gm-Message-State: APjAAAXpMYVnLWmHmH94rQA+VBKfqTPRBMJjTBWpcpjwGWwVsr95qo+j
        gp8+/N6TFDkmQJNwaBcV/a0mnGtY
X-Google-Smtp-Source: APXvYqwDRfg+wQ1LaS8TOEFUgIqPA02sGTI3oxSr/2yHzOww0xQJ95IEpRtA8LOPuZwzpnZO3nwmtw==
X-Received: by 2002:a1c:a957:: with SMTP id s84mr24236072wme.65.1566853348203;
        Mon, 26 Aug 2019 14:02:28 -0700 (PDT)
Received: from myhost.home (coo134.neoplus.adsl.tpnet.pl. [83.31.194.134])
        by smtp.gmail.com with ESMTPSA id y23sm510287wma.22.2019.08.26.14.02.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 14:02:27 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: Replace {devm_}led_classdev_register() macros with inlines
Date:   Mon, 26 Aug 2019 23:02:19 +0200
Message-Id: <20190826210219.22597-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace preprocessor macro aliases for legacy LED registration helpers
with inline functions. It will allow to avoid misleading compiler error
messages about missing symbol that actually wasn't explicitly used
in the code. It used to occur when CONFIG_LEDS_CLASS was undefined
and legacy (non-ext) function had been used in the code.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 include/linux/leds.h | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index d101fd13e18e..b8df71193329 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -157,18 +157,39 @@ struct led_classdev {
  * @led_cdev: the led_classdev structure for this device
  * @init_data: the LED class device initialization data
  *
+ * Register a new object of LED class, with name derived from init_data.
+ *
  * Returns: 0 on success or negative error value on failure
  */
 extern int led_classdev_register_ext(struct device *parent,
 				     struct led_classdev *led_cdev,
 				     struct led_init_data *init_data);
-#define led_classdev_register(parent, led_cdev)			\
-	led_classdev_register_ext(parent, led_cdev, NULL)
+
+/**
+ * led_classdev_register - register a new object of LED class
+ * @parent: LED controller device this LED is driven by
+ * @led_cdev: the led_classdev structure for this device
+ *
+ * Register a new object of LED class, with name derived from the name property
+ * of passed led_cdev argument.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+static inline int led_classdev_register(struct device *parent,
+					struct led_classdev *led_cdev)
+{
+	return led_classdev_register_ext(parent, led_cdev, NULL);
+}
+
 extern int devm_led_classdev_register_ext(struct device *parent,
 					  struct led_classdev *led_cdev,
 					  struct led_init_data *init_data);
-#define devm_led_classdev_register(parent, led_cdev)		\
-	devm_led_classdev_register_ext(parent, led_cdev, NULL)
+
+static inline int devm_led_classdev_register(struct device *parent,
+					     struct led_classdev *led_cdev)
+{
+	return devm_led_classdev_register_ext(parent, led_cdev, NULL);
+}
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
 extern void devm_led_classdev_unregister(struct device *parent,
 					 struct led_classdev *led_cdev);
-- 
2.11.0

