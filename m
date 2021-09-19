Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE48410C1D
	for <lists+linux-leds@lfdr.de>; Sun, 19 Sep 2021 17:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbhISPRg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 19 Sep 2021 11:17:36 -0400
Received: from ixit.cz ([94.230.151.217]:42940 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230503AbhISPRg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 19 Sep 2021 11:17:36 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 411B023B26;
        Sun, 19 Sep 2021 17:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1632064564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vjJn7Q1mIO9PwVF5yLremqaWidVb9IF8rIl52enZifc=;
        b=Et2Dr8SwfFGJe9Ap16dN9km/rIHw/utTNmJxDjSZeabuEU+RqgYs3KZMt//1GR97t1ZMm7
        7/P8AmE/06/03Y5kMyHiUYUkvfwnDttgBiOctCUXPlmSSQ3Lssh88DBtLPIFqQsDedxpel
        MlnZKhTlqshgP1+UyXJGbabCYbprBok=
From:   David Heidelberg <david@ixit.cz>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] dt-bindings: leds: document rfkill default action
Date:   Sun, 19 Sep 2021 17:14:44 +0200
Message-Id: <20210919151444.68845-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Used only in Toshiba AC100 / Dynabook AZ, but throws ugly warning:
arch/arm/boot/dts/tegra20-paz00.dt.yaml: gpio-leds: led-0:linux,default-trigger:0: 'rfkill0' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'ide-disk', 'timer', 'pattern']

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..d3814e6bf3cf 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -96,6 +96,8 @@ properties:
       - timer
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
+      - rfkill0
+        # LED indicates rfkill state
       - pattern
 
   led-pattern:
-- 
2.33.0

