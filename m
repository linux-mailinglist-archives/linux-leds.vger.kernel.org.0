Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E431321965
	for <lists+linux-leds@lfdr.de>; Mon, 22 Feb 2021 14:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhBVNvY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Feb 2021 08:51:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36335 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhBVNub (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Feb 2021 08:50:31 -0500
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lEBal-00017E-Pu; Mon, 22 Feb 2021 13:49:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Amireddy Mallikarjuna <mallikarjunax.reddy@linux.intel.com>,
        linux-leds@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] leds: lgm: Fix spelling mistake "prepate" -> "prepare"
Date:   Mon, 22 Feb 2021 13:49:39 +0000
Message-Id: <20210222134939.1510720-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/blink/leds-lgm-sso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 7d5c9ca007d6..6a63846d10b5 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -793,7 +793,7 @@ static int intel_sso_led_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(priv->gclk);
 	if (ret) {
-		dev_err(dev, "Failed to prepate/enable sso gate clock!\n");
+		dev_err(dev, "Failed to prepare/enable sso gate clock!\n");
 		return ret;
 	}
 
-- 
2.30.0

