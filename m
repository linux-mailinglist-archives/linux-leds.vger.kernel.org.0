Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47E61B192C
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 00:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgDTWMi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Apr 2020 18:12:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57977 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgDTWMe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2020 18:12:34 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jQeeT-0000To-Bq; Mon, 20 Apr 2020 22:12:29 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger: remove redundant assignment to variable ret
Date:   Mon, 20 Apr 2020 23:12:29 +0100
Message-Id: <20200420221229.99150-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/trigger/ledtrig-timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index 34a68604c46c..b4688d1d9d2b 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -28,7 +28,7 @@ static ssize_t led_delay_on_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
@@ -53,7 +53,7 @@ static ssize_t led_delay_off_store(struct device *dev,
 {
 	struct led_classdev *led_cdev = led_trigger_get_led(dev);
 	unsigned long state;
-	ssize_t ret = -EINVAL;
+	ssize_t ret;
 
 	ret = kstrtoul(buf, 10, &state);
 	if (ret)
-- 
2.25.1

