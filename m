Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE29145F36
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jan 2020 00:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgAVXhy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jan 2020 18:37:54 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51632 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgAVXhy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jan 2020 18:37:54 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iuPZG-0007ZK-Ga; Wed, 22 Jan 2020 23:37:50 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: lm3697: fix spelling mistake "To" -> "Too"
Date:   Wed, 22 Jan 2020 23:37:49 +0000
Message-Id: <20200122233749.2829246-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lm3697.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index b71711aff8a3..872d26f9706a 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -246,7 +246,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 
 		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
-			dev_err(&priv->client->dev, "To many LED strings defined\n");
+			dev_err(&priv->client->dev, "Too many LED strings defined\n");
 			continue;
 		}
 
-- 
2.24.0

