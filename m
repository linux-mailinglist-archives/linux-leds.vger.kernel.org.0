Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C6B1F63BF
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jun 2020 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgFKIh1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Jun 2020 04:37:27 -0400
Received: from smtp.asem.it ([151.1.184.197]:53118 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbgFKIh1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 11 Jun 2020 04:37:27 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000311037.MSG 
        for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2020 10:37:24 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 10:37:23 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 11 Jun 2020 10:37:23 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 1/1] leds: fix spelling mistake
Date:   Thu, 11 Jun 2020 10:37:17 +0200
Message-ID: <20200611083717.18308-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A09020E.5EE1ED43.0054,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix typo: "Tigger" --> "Trigger"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Alexander Dahl <ada@thorsis.com>
---
 drivers/leds/led-triggers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 79e30d2cb7a5..0836bf7631ea 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -358,7 +358,7 @@ int devm_led_trigger_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_led_trigger_register);
 
-/* Simple LED Tigger Interface */
+/* Simple LED Trigger Interface */
 
 void led_trigger_event(struct led_trigger *trig,
 			enum led_brightness brightness)
-- 
2.17.1

