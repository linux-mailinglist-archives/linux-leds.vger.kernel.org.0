Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBC8B24EE
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 20:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbfIMSPw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 14:15:52 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:34394 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389005AbfIMSPw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 13 Sep 2019 14:15:52 -0400
X-Greylist: delayed 475 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Sep 2019 14:15:51 EDT
Received: from localhost.localdomain (pD95EF66C.dip0.t-ipconnect.de [217.94.246.108])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E8CA32A2E79;
        Fri, 13 Sep 2019 18:03:21 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     jacek.anaszewski@gmail.com
Cc:     linux-leds@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH] drivers: leds: tlc591xx: check error during device init
Date:   Fri, 13 Sep 2019 20:07:49 +0200
Message-Id: <20190913180749.25740-1-daniel@zonque.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver currently ignores errors from register writes at probe time.
It will hence register an LED class device no matter whether the
pyhsical device is present or not.

To fix this, make the device probe fail in case regmap operations
return an error.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/leds/leds-tlc591xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 59ff088c7d75..00702824d27c 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -147,7 +147,10 @@ tlc591xx_configure(struct device *dev,
 	unsigned int i;
 	int err = 0;
 
-	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
+	err = tlc591xx_set_mode(priv->regmap, MODE2_DIM);
+	if (err < 0)
+		return err;
+
 	for (i = 0; i < TLC591XX_MAX_LEDS; i++) {
 		struct tlc591xx_led *led = &priv->leds[i];
 
-- 
2.21.0

