Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049B335B239
	for <lists+linux-leds@lfdr.de>; Sun, 11 Apr 2021 09:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbhDKHp4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 11 Apr 2021 03:45:56 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:47177 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbhDKHpz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 11 Apr 2021 03:45:55 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d26 with ME
        id rKle2400B3g7mfN03KlfiZ; Sun, 11 Apr 2021 09:45:39 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Apr 2021 09:45:39 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     pavel@ucw.cz, mallikarjunax.reddy@linux.intel.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] leds: lgm: Fix an error handling path in '__sso_led_dt_parse()'
Date:   Sun, 11 Apr 2021 09:45:38 +0200
Message-Id: <1fd61230aa6e56abc02598768bf0dca10b49cc55.1618126878.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <22e1f8245251f0ec297881942abfa2b00eff48d2.1618126878.git.christophe.jaillet@wanadoo.fr>
References: <22e1f8245251f0ec297881942abfa2b00eff48d2.1618126878.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If a memory allocation fails, we must free the already allocated resources
before returning.

Fixes: c3987cd2bca3 ("leds: lgm: Add LED controller driver for LGM SoC")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/blink/leds-lgm-sso.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 3da242d4ce7d..ef632ebabac9 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -631,8 +631,10 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 
 	fwnode_for_each_child_node(fw_ssoled, fwnode_child) {
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
-		if (!led)
-			return -ENOMEM;
+		if (!led) {
+			ret = -ENOMEM;
+			goto __dt_err;
+		}
 
 		INIT_LIST_HEAD(&led->list);
 		led->priv = priv;
-- 
2.27.0

