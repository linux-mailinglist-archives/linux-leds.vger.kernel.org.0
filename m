Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7573C3773D7
	for <lists+linux-leds@lfdr.de>; Sat,  8 May 2021 21:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhEHTiG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 May 2021 15:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhEHTiG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 May 2021 15:38:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54AAC061574
        for <linux-leds@vger.kernel.org>; Sat,  8 May 2021 12:37:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id a4so12532455wrr.2
        for <linux-leds@vger.kernel.org>; Sat, 08 May 2021 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEo0WAuiIGyJ5CDvk1ac5Tqyo04Cf0hE7j39nrK35ys=;
        b=fbzelkrk+0TTa3pkBv+dmQukTIsG34G6gIOgLD9fM16pJReJ5509oS/ze0+taLVGHg
         sr3H6Vof07wXK6xREBCpXvkXzuJXYT5O2c04N6xyxnQemJZO/rWxemo2YMFBJpJemePp
         dsUOYWCnsgb5Xq7J//kEVTpsZZEY3jUgMUPg7g8gaXoV/szcPMJt9/+70JtBY7hp5JB1
         6kd62WwQbjnh5AUmaabRRNPNF0kMYFwQcu9sS+FUUmrOQTiZn0nH8Dpu+ICjOWaI7KD2
         wQOoosqWFSWBe6ybTHL4TgxN7E1kD4mI0D91e7/OWXVM9U+30HXzp1KmsKt4zPTe0th6
         DOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LEo0WAuiIGyJ5CDvk1ac5Tqyo04Cf0hE7j39nrK35ys=;
        b=FnaE04C2r5785rVxHIIhFEivdS7GDCduCn3M7PnyBgHW82jaAM23uRZuswirKoMPq1
         ZCgj/zrS/+8fWpXigdxiuuBpe7En1xc008S6TiVhAjbBl8dvAXSimohG4GqFtcZcufOz
         aoBMviZUR+tI8KHrmgxzIeT9HDcx7fhzk0kTiHUf42rg7jvT7D/Yb2ElIrum+1YY7uiu
         H2BuE3CSb0+v6GlQuP805BLDuB8t/8FCqyhQPiYJaygSqdUzy2fJ0TN+5MZMmDmr739H
         Rd7f0WWFr6XyGRZmDFc3I85PXhZ3x+WtVEWe61fEkiO7qZlQU6rjWzEcv/pEZgu0m0Hu
         tT4Q==
X-Gm-Message-State: AOAM530gVwtNtGImD4u80i21lWVxtfXz5aFVO4JToMiCh31+kl9lEKsE
        n81HGzS9HIEpP7Xjpxi1zEPSPzxveyQtP/co
X-Google-Smtp-Source: ABdhPJyAy4aO1WA2QMWfEWlZ/iqi7IGUZe4FseS4cZeOyWdfkoVWW1cwchcgObR4s+Jc3sTtDAWWFg==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr20747795wrw.224.1620502621566;
        Sat, 08 May 2021 12:37:01 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k10sm45356028wmf.0.2021.05.08.12.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 12:37:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     pavel@ucw.cz, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
        linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: leds: common: add disk write/read and usb-host
Date:   Sat,  8 May 2021 19:36:54 +0000
Message-Id: <20210508193654.2596119-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The triggers enum misses 3 cases used by gemini DT.
usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
so we add also as valid trigger usb-gadget which was added along in this
commit.

disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index b1f363747a62..a9b8c21779e3 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -89,6 +89,8 @@ properties:
       - heartbeat
         # LED indicates disk activity
       - disk-activity
+      - disk-read
+      - disk-write
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
       - ide-disk
@@ -97,6 +99,8 @@ properties:
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
       - pattern
+      - usb-gadget
+      - usb-host
 
   led-pattern:
     description: |
-- 
2.26.3

