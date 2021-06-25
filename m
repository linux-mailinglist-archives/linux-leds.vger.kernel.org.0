Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE5A3B440B
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jun 2021 15:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhFYNI7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Jun 2021 09:08:59 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:55902 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhFYNI6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Jun 2021 09:08:58 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GBHBp2MrBzMqmNf
        for <linux-leds@vger.kernel.org>; Fri, 25 Jun 2021 14:59:14 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by baptiste.telenet-ops.be with bizsmtp
        id MQzD250012B1U9901QzD7Y; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQO-003TMJ-Gg; Fri, 25 Jun 2021 14:59:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sQi-KO; Fri, 25 Jun 2021 14:59:11 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 07/18] auxdisplay: linedisp: Use kmemdup_nul() helper
Date:   Fri, 25 Jun 2021 14:58:51 +0200
Message-Id: <20210625125902.1162428-8-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the existing kmemdup_nul() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - No changes.
---
 drivers/auxdisplay/line-display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index 4b97c20ac0b381ee..3f35199bc39f511f 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -91,13 +91,10 @@ static int linedisp_display(struct linedisp *linedisp, const char *msg,
 		return 0;
 	}
 
-	new_msg = kmalloc(count + 1, GFP_KERNEL);
+	new_msg = kmemdup_nul(msg, count, GFP_KERNEL);
 	if (!new_msg)
 		return -ENOMEM;
 
-	memcpy(new_msg, msg, count);
-	new_msg[count] = 0;
-
 	kfree(linedisp->message);
 
 	linedisp->message = new_msg;
-- 
2.25.1

