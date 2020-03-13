Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE71B184D6E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Mar 2020 18:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCMRTl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Mar 2020 13:19:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38589 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgCMRTl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Mar 2020 13:19:41 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jCnyD-00007Y-Ot; Fri, 13 Mar 2020 17:19:37 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lm3532: make bitfield 'enabled' unsigned
Date:   Fri, 13 Mar 2020 17:19:37 +0000
Message-Id: <20200313171937.220884-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bitfield 'enabled' should bit unsigned, so make it unsigned.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lm3532.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index 188a57da981a..aa9bf8cda673 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -140,7 +140,7 @@ struct lm3532_led {
 	int ctrl_brt_pointer;
 	int num_leds;
 	int full_scale_current;
-	int enabled:1;
+	unsigned int enabled:1;
 	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
 	char label[LED_MAX_NAME_SIZE];
 };
-- 
2.25.1

