Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058546F5B4
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2019 23:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfGUVAZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Jul 2019 17:00:25 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:53740 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfGUVAZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Jul 2019 17:00:25 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d11 with ME
        id fZ0M2000J4n7eLC03Z0Nan; Sun, 21 Jul 2019 23:00:23 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 Jul 2019 23:00:23 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] leds: an30259a: Fix typo
Date:   Sun, 21 Jul 2019 22:59:55 +0200
Message-Id: <20190721205955.25317-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

All this file is about an30259a, including the reference to the datasheet
at the top of the file.

So change the 2 places where an32059a is used instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
an32059a is another chip from panasonic
---
 drivers/leds/leds-an30259a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index 1c1f0c8c56f4..37e7c7998972 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -353,7 +353,7 @@ MODULE_DEVICE_TABLE(i2c, an30259a_id);
 
 static struct i2c_driver an30259a_driver = {
 	.driver = {
-		.name = "leds-an32059a",
+		.name = "leds-an30259a",
 		.of_match_table = of_match_ptr(an30259a_match_table),
 	},
 	.probe_new = an30259a_probe,
@@ -364,5 +364,5 @@ static struct i2c_driver an30259a_driver = {
 module_i2c_driver(an30259a_driver);
 
 MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
-MODULE_DESCRIPTION("AN32059A LED driver");
+MODULE_DESCRIPTION("AN30259A LED driver");
 MODULE_LICENSE("GPL v2");
-- 
2.20.1

