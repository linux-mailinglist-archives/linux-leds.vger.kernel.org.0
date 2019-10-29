Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FE8E8F99
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2019 19:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732089AbfJ2Sy2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Oct 2019 14:54:28 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:35870 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728492AbfJ2Sy2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 29 Oct 2019 14:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8qXMF18KwuhIBxEjpbV0BD087kurmWidJw1E63DDswk=; b=VtVRBnxfNioWWOt88m63wzIauE
        wUwHgTC95bTRT0EvggGuNe3GbeFk42DGXsHKJVids6OlzG3XfQ86F9MqhKSSkElZ2QaY17Y1Q7fsl
        9DgX/OeFJ0dSNStPsZnMeRXjlyV5k5CPQRYjB/Tj+8828xC4+YGQEL+y8pBXif3CAqGw=;
Received: from p200300ccff099e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff09:9e00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iPWdE-0002QE-1J; Tue, 29 Oct 2019 19:54:16 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iPWdD-00087K-Av; Tue, 29 Oct 2019 19:54:15 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH next] dt-bindings: backlight: lm3630a: fix missing include
Date:   Tue, 29 Oct 2019 19:53:50 +0100
Message-Id: <20191029185350.31155-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

example failed to compile due to undefined GPIO_ACTIVE_HIGH
fix that by adding the needed #include to the exammple

Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index c8470628fe02..08fe5cf8614a 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -93,6 +93,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.20.1

