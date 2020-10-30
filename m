Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6983D29FB7E
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 03:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgJ3CjX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Oct 2020 22:39:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgJ3CjW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Oct 2020 22:39:22 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 636702098B;
        Fri, 30 Oct 2020 02:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604025562;
        bh=znp1m5FtTSQuGw0FNwpIZYGhwZs/SzfmEzsFBUYYnOY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0h82vF1neulWauaCC+KP/oWQMAl46tAEEzyIZQ02/Kc4dahfbMe/dAPgQBN5ADAkE
         FrHw8CdTJqmJv1Sk8biHC07qDfZW/r9J05KljC5QhoGi0cJDBGc4RoQcrhJiK4Ovpz
         fH4EG77t+UaLyjWF3DI15EOQ4XXpr7FoTRElNecY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 5/5] leds: turris-omnia: check for LED_COLOR_ID_RGB instead LED_COLOR_ID_MULTI
Date:   Fri, 30 Oct 2020 03:39:06 +0100
Message-Id: <20201030023906.24259-5-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201030023906.24259-1-kabel@kernel.org>
References: <20201030023906.24259-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

LED core does not allow LED_COLOR_ID_MULTI for now and instead for RGB
LEDs prefers LED_COLOR_ID_RGB.

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
---
 drivers/leds/leds-turris-omnia.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index c0b4e1e0e945..7b2f4d0ae3fe 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -90,9 +90,9 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	}
 
 	ret = of_property_read_u32(np, "color", &color);
-	if (ret || color != LED_COLOR_ID_MULTI) {
+	if (ret || color != LED_COLOR_ID_RGB) {
 		dev_warn(dev,
-			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_MULTI\n",
+			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_RGB\n",
 			 np);
 		return 0;
 	}
-- 
2.26.2

