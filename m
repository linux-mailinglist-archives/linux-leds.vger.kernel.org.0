Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6B147926A
	for <lists+linux-leds@lfdr.de>; Fri, 17 Dec 2021 18:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239129AbhLQRHU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Dec 2021 12:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239636AbhLQRHT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Dec 2021 12:07:19 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A77C061574;
        Fri, 17 Dec 2021 09:07:19 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg2-20020a05600c3c8200b0034565c2be15so4543844wmb.0;
        Fri, 17 Dec 2021 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rj5IyEdB5LfycbzI0ZIjHtZ0iD/3vI9d8AkqKZ9gT38=;
        b=adHyDt0K5r7da7gXAlO/cl46F93q8YB11ACsGn9ohSPiTWVmEGrZpe0QikzYVTH78z
         aiJDKCfXGbsebmia2ilp44/EOrdOcVWqUfzZHxwaalhR8nLduf9pLfYkaVS3PkuYqAb4
         oRZp8ZyUN9uYyyoXvzOC/Utcs6+1U1zwUplvNZ3kKIq7JcFhAMwhs4ybfLAd9V6WGQe6
         XRRjscRRLnTA+VfxmhwD6p9o2BxVthAR9D6R9/Uq87/Zf/hL4dD7+/00wXk18SPZRGys
         3KCrSGtBCsf/+wOcRwywCcVwr97gT8p/zrGNvfHgQT/E7MNNgwJZuhFntOp9fKMYhtbN
         xJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rj5IyEdB5LfycbzI0ZIjHtZ0iD/3vI9d8AkqKZ9gT38=;
        b=KbYE1QxjI/mir7ZWjJhbPRYq4VMNnoR1zuSAKYor0i7+CGr4EDFewl6pRan4sXbUHZ
         T1pQUqyFC2G1/fcnG9q+s016K6zDi3PWJS38PT/DvUyr/1PNqt9NvTChFe/1GvTDGIng
         8+W0yMCuxyFFMuaTqKTb0+X4GSoc+FVodpIEwosBBa7shI1Mj3WwewirGdaI2x/d1IG/
         DvrJZ9NXcxsmeKqZDOS5FJhaRP2pcX7fWM1QCuKgXBeN2yfM8GJDSUWA1buRcq1GVbMX
         Jz0XlgU+9foIzHGURmIL5+FcGSah7aF/TMZmM3GDXtzryoK/DLA5ZH+n4ZwNG1yw2rI3
         6F0Q==
X-Gm-Message-State: AOAM5331FKf+9OEnHhc5mmvtt1ArDxFGpSDE+gF9wATo5idd1FmZV3Xh
        wbPb+/e3zpmNXy6gXndv1Xo=
X-Google-Smtp-Source: ABdhPJwmvDx62eDbmIAfL5AeTax+2/vdjtBv/diBvtkgm60FDAly3+dkMrD9dNIXOBOkgVaXBkjQbg==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr10219610wmd.161.1639760837868;
        Fri, 17 Dec 2021 09:07:17 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l8sm11940149wmc.40.2021.12.17.09.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 09:07:16 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Milo Kim <milo.kim@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: Document rfkill* trigger
Date:   Fri, 17 Dec 2021 18:07:14 +0100
Message-Id: <20211217170715.2893923-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

LEDs can use rfkill events as a trigger source, so document these in the
device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..f686907b4907 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,24 +79,25 @@ properties:
       the LED.
     $ref: /schemas/types.yaml#/definitions/string
 
-    enum:
+    oneOf:
         # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
+      - const: backlight
         # LED will turn on (but for leds-gpio see "default-state" property in
         # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
+      - const: default-on
         # LED "double" flashes at a load average based rate
-      - heartbeat
+      - const: heartbeat
         # LED indicates disk activity
-      - disk-activity
+      - const: disk-activity
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
-      - ide-disk
+      - const: ide-disk
         # LED flashes at a fixed, configurable rate
-      - timer
+      - const: timer
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
-      - pattern
+      - const: pattern
+      - pattern: "^rfkill[0-9]+$"
 
   led-pattern:
     description: |
-- 
2.34.1

