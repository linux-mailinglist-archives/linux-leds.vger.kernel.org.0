Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E00A23AB4B
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbfFITIf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42969 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729120AbfFITId (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id x17so6953748wrl.9;
        Sun, 09 Jun 2019 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Gi+RQar2xIxGko9w1zT7uY953FhVhvBTDf+plIbqWkc=;
        b=RKAsJCLyhC36qHrUXGNGQjgrKh3+5v6fMd5Dq8bibO3rZVFui7aDjghIfbztyDqX4D
         TbyqVxR8Mf1/QsHgtFT1CYiI+i+FaDuy3DQeVpe1JP7P7E443t2Y8NzWP9grQV91eYhe
         mp9VEsj2kbkDyB4WX9iwcM5U71W7WdQauN2wsvH7IS5aIZObmMt3YzKtOMmmrIRxRbYd
         +q0ReFSQq9G3DtdPYG69QMg3jWCL9CYA2G7ys0ugGz9o3eZQsDXgMORWIl6xZOrYl+su
         Rqo+YrCutFYyJlQBAZ5nlBkBn98PvWQ8xC0lOOloyhndAmYsg9/mbPBfJ6fuYKfFwwlV
         TGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Gi+RQar2xIxGko9w1zT7uY953FhVhvBTDf+plIbqWkc=;
        b=q70M7r1l6SlM5V6o1oNdjeg0oriZaTe3vMPVPkf58DnebUdOQECg4zABJYGqkmCGj7
         sd7NYi4W2CteYI/3NDPnmU3nYOGckP/QBl0TTMoiFvKfhK5Kt9wEI/VNXT0iXfNo4PaF
         DE9YTKwFoiVJKTowrrB1vVO1zK390xMmSz43s+ovz1LeORyKdknZmTr5J8wSiTOwPJdC
         xN7WjBK5moiTRNAVscrMNCfkIN5uHaHXCkHcOMGy9XLnsSzCOx5eqz3nSdFjPIBEF4ip
         1Hzdi/ngwXgsMpbSzoIy5ue10lnnl0LdoESCoxGDstvUs7MImhEq7SYbp8D9Gs/bzvNM
         53SA==
X-Gm-Message-State: APjAAAXO7hy7PQ4dCQsRxK95LdEm21xeRYz8tMK16Lt/jFQqS63hVYHi
        3tHS/o75XIs2RCCPYzPj4YKq0T5B
X-Google-Smtp-Source: APXvYqy2R7pP8BljBqliJ7YnxTcYXYAnm+rX1YHEgszcVRfF/ABZ2MvevOeWlSOS0nVq6T9jqeAgpA==
X-Received: by 2002:adf:8385:: with SMTP id 5mr14993575wre.194.1560107310949;
        Sun, 09 Jun 2019 12:08:30 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:30 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 03/26] dt-bindings: leds: Add LED_FUNCTION definitions
Date:   Sun,  9 Jun 2019 21:07:40 +0200
Message-Id: <20190609190803.14815-4-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add initial set of common LED function definitions.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Dan Murphy <dmurphy@ti.com>
---
 include/dt-bindings/leds/common.h | 44 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 217ee9e0dd6c..9e1256a7c1bf 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -3,8 +3,9 @@
  * This header provides macros for the common LEDs device tree bindings.
  *
  * Copyright (C) 2015, Samsung Electronics Co., Ltd.
- *
  * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
+ *
+ * Copyright (C) 2019 Jacek Anaszewski <jacek.anaszewski@gmail.com>
  */
 
 #ifndef __DT_BINDINGS_LEDS_H
@@ -30,4 +31,45 @@
 #define LED_COLOR_ID_IR		7
 #define LED_COLOR_ID_MAX	8
 
+/* Standard LED functions */
+#define LED_FUNCTION_ACTIVITY "activity"
+#define LED_FUNCTION_ALARM "alarm"
+#define LED_FUNCTION_BACKLIGHT "backlight"
+#define LED_FUNCTION_BLUETOOTH "bluetooth"
+#define LED_FUNCTION_BOOT "boot"
+#define LED_FUNCTION_CPU "cpu"
+#define LED_FUNCTION_CAPSLOCK "capslock"
+#define LED_FUNCTION_CHARGING "charging"
+#define LED_FUNCTION_DEBUG "debug"
+#define LED_FUNCTION_DISK "disk"
+#define LED_FUNCTION_DISK_ACTIVITY "disk-activity"
+#define LED_FUNCTION_DISK_ERR "disk-err"
+#define LED_FUNCTION_DISK_READ "disk-read"
+#define LED_FUNCTION_DISK_WRITE "disk-write"
+#define LED_FUNCTION_FAULT "fault"
+#define LED_FUNCTION_FLASH "flash"
+#define LED_FUNCTION_HEARTBEAT "heartbeat"
+#define LED_FUNCTION_INDICATOR "indicator"
+#define LED_FUNCTION_KBD_BACKLIGHT "kbd_backlight"
+#define LED_FUNCTION_LAN "lan"
+#define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MTD "mtd"
+#define LED_FUNCTION_MICMUTE "micmute"
+#define LED_FUNCTION_MUTE "mute"
+#define LED_FUNCTION_NUMLOCK "numlock"
+#define LED_FUNCTION_PANIC "panic"
+#define LED_FUNCTION_PROGRAMMING "programming"
+#define LED_FUNCTION_POWER "power"
+#define LED_FUNCTION_RX "rx"
+#define LED_FUNCTION_SD "sd"
+#define LED_FUNCTION_SCROLLLOCK "scrolllock"
+#define LED_FUNCTION_STANDBY "standby"
+#define LED_FUNCTION_STATUS "status"
+#define LED_FUNCTION_TORCH "torch"
+#define LED_FUNCTION_TX "tx"
+#define LED_FUNCTION_USB "usb"
+#define LED_FUNCTION_WAN "wan"
+#define LED_FUNCTION_WLAN "wlan"
+#define LED_FUNCTION_WPS "wps"
+
 #endif /* __DT_BINDINGS_LEDS_H */
-- 
2.11.0

