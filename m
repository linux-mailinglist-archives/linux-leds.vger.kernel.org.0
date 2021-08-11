Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F383E8DAE
	for <lists+linux-leds@lfdr.de>; Wed, 11 Aug 2021 11:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbhHKJ6h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Aug 2021 05:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236844AbhHKJ6e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Aug 2021 05:58:34 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCB6C0613A1
        for <linux-leds@vger.kernel.org>; Wed, 11 Aug 2021 02:58:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by laurent.telenet-ops.be with bizsmtp
        id g9y5250031gJxCh019y58a; Wed, 11 Aug 2021 11:58:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzs-001zgQ-QS; Wed, 11 Aug 2021 11:58:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzr-005NPE-JH; Wed, 11 Aug 2021 11:58:03 +0200
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
Subject: [PATCH v5 10/19] auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
Date:   Wed, 11 Aug 2021 11:57:50 +0200
Message-Id: <20210811095759.1281480-11-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811095759.1281480-1-geert@linux-m68k.org>
References: <20210811095759.1281480-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the existing HT16K33_FB_SIZE definition instead of open-coding the
same calculation using an hardcoded value.
While at it, restore reverse Christmas tree variable declaration order.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Acked-by.
---
 drivers/auxdisplay/ht16k33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 2b630e194570f6e5..99daf1974980b435 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -168,9 +168,9 @@ static void ht16k33_fb_update(struct work_struct *work)
 
 static int ht16k33_initialize(struct ht16k33_priv *priv)
 {
+	uint8_t data[HT16K33_FB_SIZE];
 	uint8_t byte;
 	int err;
-	uint8_t data[HT16K33_MATRIX_LED_MAX_COLS * 2];
 
 	/* Clear RAM (8 * 16 bits) */
 	memset(data, 0, sizeof(data));
-- 
2.25.1

