Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE29C26ADA3
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 21:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgIOTcP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 15:32:15 -0400
Received: from vsmx012.vodafonemail.xion.oxcs.net ([153.92.174.90]:57333 "EHLO
        vsmx012.vodafonemail.xion.oxcs.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727952AbgIOTcM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 15 Sep 2020 15:32:12 -0400
X-Greylist: delayed 371 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Sep 2020 15:32:11 EDT
Received: from vsmx004.vodafonemail.xion.oxcs.net (unknown [192.168.75.198])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTP id 78146F35DC1;
        Tue, 15 Sep 2020 19:25:14 +0000 (UTC)
Received: from app-35.app.xion.oxcs.net (app-35.app.xion.oxcs.net [10.10.1.35])
        by mta-8-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 40B3419AE02;
        Tue, 15 Sep 2020 19:25:08 +0000 (UTC)
Date:   Tue, 15 Sep 2020 21:25:08 +0200 (CEST)
From:   Markus Moll <moll.markus@arcor.de>
To:     linux-leds@vger.kernel.org
Cc:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Message-ID: <57063916.12950.1600197908221@mail.vodafone.de>
Subject: [PATCH 1/2] leds: pca9532: read pwm settings from device tree
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev73
X-Originating-Client: open-xchange-appsuite
X-VADE-STATUS: LEGIT
Sender: linux-leds-owner@vger.kernel.org
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
index 890f19d3c62..6c2a6395829 100644
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
 	for_each_child_of_node(np, child) {
 		if (of_property_read_string(child, "label",
 					    &pdata->leds[i].name))
-- 
2.25.1
