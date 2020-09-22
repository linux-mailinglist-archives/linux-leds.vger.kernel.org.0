Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0571B27492E
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 21:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVTbZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 15:31:25 -0400
Received: from vsmx012.vodafonemail.xion.oxcs.net ([153.92.174.90]:10448 "EHLO
        vsmx012.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbgIVTbZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 22 Sep 2020 15:31:25 -0400
Received: from vsmx004.vodafonemail.xion.oxcs.net (unknown [192.168.75.198])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTP id A23C7F3523C;
        Tue, 22 Sep 2020 19:31:23 +0000 (UTC)
Received: from app-43.app.xion.oxcs.net (app-43.app.xion.oxcs.net [10.10.1.43])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 57DEC19AEA9;
        Tue, 22 Sep 2020 19:31:15 +0000 (UTC)
Date:   Tue, 22 Sep 2020 21:31:15 +0200 (CEST)
From:   Markus Moll <moll.markus@arcor.de>
To:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org
Message-ID: <198551419.101933.1600803075307@mail.vodafone.de>
Subject: [PATCH v1 1/2] leds: pca9532: read pwm settings from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev73
X-Originating-Client: open-xchange-appsuite
X-VADE-STATUS: LEGIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

While the two pca9532 pwms can be configured in the platform data
struct, there was no corresponding dt binding. Users need to configure
the pwm if some leds should blink or continue blinking during boot.

Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
---
 drivers/leds/leds-pca9532.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index d37fd9577d4..27d02716547 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -480,6 +480,11 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
+	of_property_read_u8_array(np, "nxp,pwm", &pdata->pwm[0],
+				  ARRAY_SIZE(pdata->pwm));
+	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[0],
+				  ARRAY_SIZE(pdata->psc));
+
 	for_each_available_child_of_node(np, child) {
 		if (of_property_read_string(child, "label",
 					    &pdata->leds[i].name))
-- 
2.25.1
