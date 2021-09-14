Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE63B40B139
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 16:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbhINOkN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 10:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbhINOkH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 10:40:07 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D1DC0617A6
        for <linux-leds@vger.kernel.org>; Tue, 14 Sep 2021 07:38:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by andre.telenet-ops.be with bizsmtp
        id tqeg2500H2aSKa101qeg6T; Tue, 14 Sep 2021 16:38:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a3-004VGx-Rm; Tue, 14 Sep 2021 16:38:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a2-0028z2-Ow; Tue, 14 Sep 2021 16:38:38 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v6 11/19] auxdisplay: ht16k33: Remove unneeded error check in keypad probe()
Date:   Tue, 14 Sep 2021 16:38:27 +0200
Message-Id: <20210914143835.511051-12-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143835.511051-1-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is no need to check the return code of input_register_device(),
just propagate it to the caller.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Acked-by.
---
 drivers/auxdisplay/ht16k33.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 99daf1974980b435..8c9acc4800bc94e0 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -378,11 +378,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 
 	ht16k33_keypad_stop(keypad->dev);
 
-	err = input_register_device(keypad->dev);
-	if (err)
-		return err;
-
-	return 0;
+	return input_register_device(keypad->dev);
 }
 
 static int ht16k33_probe(struct i2c_client *client,
-- 
2.25.1

