Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300BC24FBA2
	for <lists+linux-leds@lfdr.de>; Mon, 24 Aug 2020 12:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgHXKjh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Aug 2020 06:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgHXKjc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2020 06:39:32 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8098AC061573
        for <linux-leds@vger.kernel.org>; Mon, 24 Aug 2020 03:39:30 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dp2so5947304ejc.4
        for <linux-leds@vger.kernel.org>; Mon, 24 Aug 2020 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ukMwQbFzoefCOQGMwd5tNOLCJom6+rFwugwx1XLvVhQ=;
        b=OKOZVfLtBPUQaSY8S/kiqZI1LtxJpC5QwAGngsZI9ptvoV1fUCg73/s4JvMTEgeKtP
         C4ngkApYwyHlXbdLUjyChv/qIiKaPTq5u933l8w65YEy3ssLtOBourQLAa5pEwvvuwhy
         M7tXLISkTI5Nq0klHvO/IJFzGKLWFncnSO7b7ZZJQGaMMrKLefnC0BBH04TLdJg4hmSS
         7panJBcTFZ+6TgIQzGIaY0ZY+t62EEaSVeVmvNNHx7Mmk1J84F8FN3NBiS6Yrb2jDvjo
         LX88e4Jr1EcUhLwaVjGlDq7ooHJ2PgWgnlDQgO/Y+qItrZ8Jb6+pmULe3D1Po+X7P9Q6
         VGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ukMwQbFzoefCOQGMwd5tNOLCJom6+rFwugwx1XLvVhQ=;
        b=VYUI58PV7SkFiCgw5bd46dKRtZ0RFORR80H4TEemxq5qR9kcSkxmP1AeFFdNBTHMyI
         i/tC2FWPFPWSTZDhHRJUcQIlUma2ztrx7K4K949N3jd6xsTvcvkbdCxKIJtKlaBpcIsr
         5s2jMIdUPaZCc5llkuQ6D6p8INrg1gUKZcCeEiX//SayxIMfCamWwPV/qgRMkYG2AMLu
         bKr7sGkhX3+Q27XGXKcF/Pwy0XDfm5U5rEwNNt83OCIXh5RN27AG1lmqzJ2rHOIOCkPQ
         YTHDfGcod+HtkYZqrdp8s3TIMaV0pgmweGEW5mk0fA4gFlRnBDIAFf2mkZrrnFIVWsB4
         3VNA==
X-Gm-Message-State: AOAM531ECxRSPcJFMYaH07jQZi64DPNwelWHgO8GJY+Za7BeFAzzERlb
        OuSDSH89hHWhTobwvBynajsbxg==
X-Google-Smtp-Source: ABdhPJx2QX66kk/ftCuLrvWMzSkGHZJhYNF2AjMArcrqP3X/wkz3LaZ2ICBbOMFaC0m5rzYzh04a3g==
X-Received: by 2002:a17:906:4b0d:: with SMTP id y13mr4865906eju.39.1598265569390;
        Mon, 24 Aug 2020 03:39:29 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id e4sm8870919edv.73.2020.08.24.03.39.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 03:39:28 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: common: Add missing triggers
Date:   Mon, 24 Aug 2020 12:39:27 +0200
Message-Id: <f24b081ad7f4695c039cfb9256aae8a522797fcf.1598265564.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Xilinx ZynqMP zcu100/ultra96 v1 defines additional triggers which are not
covered by common.yaml. The patch adds missing triggers for this platform.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

There are a lot of other triggers which are missing but the patch focus on
fixing my platform
---
 Documentation/devicetree/bindings/leds/common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541bca73c..c3d728a06782 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -82,6 +82,8 @@ properties:
     enum:
         # LED will act as a back-light, controlled by the framebuffer system
       - backlight
+        # LED indicates enabling power for bluetooth device
+      - bluetooth-power
         # LED will turn on (but for leds-gpio see "default-state" property in
         # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
       - default-on
@@ -97,6 +99,9 @@ properties:
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
       - pattern
+        # LED flashes based on networking activity on tx and rx channels
+      - phy0tx
+      - phy0rx
 
   led-pattern:
     description: |
-- 
2.28.0

