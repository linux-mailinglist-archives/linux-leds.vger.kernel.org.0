Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ECC210845
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2020 11:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729237AbgGAJfu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Jul 2020 05:35:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52862 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGAJfu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Jul 2020 05:35:50 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jqZ9d-0006Cn-B5; Wed, 01 Jul 2020 09:35:45 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     anthony.wong@canonical.com,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: core: Use blocking op for system suspend
Date:   Wed,  1 Jul 2020 17:35:40 +0800
Message-Id: <20200701093541.14191-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sometimes LED won't be turned off by LED_CORE_SUSPENDRESUME flag upon
system suspend.

led_set_brightness_nopm() uses schedule_work() to set LED brightness.
However, there's no guarantee that the scheduled work gets executed
because no one calls flush_scheduled_work().

As flush_scheduled_work() may affect other drivers' suspend routines,
take a more contained approach which uses blocking op to make sure the
LED gets turned off.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/leds/led-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..9a5bfcd7a704 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -269,6 +269,11 @@ EXPORT_SYMBOL_GPL(led_set_brightness);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
+
+	if (led_cdev->flags & LED_SUSPENDED &&
+	    !__led_set_brightness_blocking(led_cdev, value))
+		return;
+
 	/* Use brightness_set op if available, it is guaranteed not to sleep */
 	if (!__led_set_brightness(led_cdev, value))
 		return;
-- 
2.17.1

