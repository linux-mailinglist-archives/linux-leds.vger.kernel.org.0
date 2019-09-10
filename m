Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9960CAF296
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 23:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfIJV3m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 17:29:42 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:51578 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfIJV3m (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Sep 2019 17:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Dk2cypFp9qRpGk+x/WI3YUW36HoBZTZBqKH2frB5PD4=; b=Izn17ZFma0evvGmBQDZxmLni0R
        HXOg5DQ5qjJLlPOEUCKD26G+ZT1QiaWtj/6JESRhVjm8weV2TIhziqkxRY6AJNN8qz3A+zaffogdN
        otbKK1wAEO9mGfJzd2BkqWZ6GXIlNP9hwrtRgEsVtqkLwmxuzSvaM+yUUODtcWY439qA=;
Received: from p200300ccff17ef001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff17:ef00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1i7nhf-0001id-DV; Tue, 10 Sep 2019 23:29:35 +0200
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1i7nhe-0004ik-Th; Tue, 10 Sep 2019 23:29:34 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date:   Tue, 10 Sep 2019 23:29:08 +0200
Message-Id: <20190910212909.18095-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910212909.18095-1-andreas@kemnade.info>
References: <20190910212909.18095-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

add enable-gpios to describe HWEN pin

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
changes in v2: add example
 .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index dc129d9a329e..1fa83feffe16 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -29,6 +29,10 @@ properties:
   '#size-cells':
     const: 0
 
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -92,6 +96,7 @@ examples:
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
+        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
 
         led-controller@38 {
                 compatible = "ti,lm3630a";
-- 
2.20.1

