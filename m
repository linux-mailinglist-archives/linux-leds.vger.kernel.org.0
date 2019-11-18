Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0825F1009CD
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 17:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKRQyY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 11:54:24 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37910 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfKRQyQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 11:54:16 -0500
Received: by mail-qt1-f196.google.com with SMTP id p20so20980902qtq.5;
        Mon, 18 Nov 2019 08:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CMliZbMmgQlyE8GZhRLJHK4msHkdSN6JBW1TZzgnJmU=;
        b=crOFSaQrhFuUlWzurOTc1UKlws+/tTmqNYZ1gBwFC62K429mRZJIU/esJZtyVORwo+
         a8RnudZOOeItMHDIvp7R37i+TxqwQdM6M/ue7daeXo+/gMzmbP0kpD7cQGDzxOS0vOmw
         S54bJZw2kKKQGs+Wurv2dLq0bYgeHyAw1jTw3/rrB0ztjtV6kgkycBEeZ/gR3aCooqvs
         HlhAiEHS6rnDzoFSO1D1dI9hEnu68NzovYvOXL8CvVjoaG2oGVB+oEgRkIcR9w1K4axg
         u+6cNb/ts1xjEabGMISfzCxCPz1AFsNI4slxO6MnXk9sB4llHjfn4A1Fex6ty/8vHb1c
         Kimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CMliZbMmgQlyE8GZhRLJHK4msHkdSN6JBW1TZzgnJmU=;
        b=boQcLXQqh82dr1rI/NX979I2/lOK+sapu2l0jOfjf5cEcJPQeLB8CH7vPbmEcJLrum
         jxBkyd+t9dhV9b7Y6xv2+SjQmIIvW/xdB0czrJQQ7rdxj7ds1g+HfB0RtJN9KPWNqsL3
         Dex0Xi2VYL0iIkshg+Un77znGPr7zCn/VuBbWaTTPXxaT5h/dX2mxmpGroz2GZUCMjF7
         hBMS5xjLQrXWcYLs60vQZsc5oTEUeeReA7UgZjocoFQR3l6hvwdGFx4Ya/Fu6HcHP54P
         NzN1WeV4Lc/dK0y4UYiv76LcVFtTBNhVbkeRZz7gbXfvxsDwJ2veqQJNz3oNEZHgSJet
         fC5A==
X-Gm-Message-State: APjAAAU522M6My+AdZ3cJxh/5lBvkOt4gM7n6AH2IOTWCvqJOh7fUpV/
        28cnyXPtC6ADoejLkMCki0M=
X-Google-Smtp-Source: APXvYqw/LjMWWQ4YFTX1uO13xtjiVEdOpj5myZUyTC7KbLDouKST1+jYWsaz2KjkBqr3dyFHJaWtOA==
X-Received: by 2002:ac8:ecc:: with SMTP id w12mr28213814qti.134.1574096054850;
        Mon, 18 Nov 2019 08:54:14 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id a3sm8634648qkf.76.2019.11.18.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:54:14 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v1 4/4] dt-bindings: mfd: update TI tps6105x chip bindings
Date:   Mon, 18 Nov 2019 11:54:00 -0500
Message-Id: <20191118165400.21985-5-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118165400.21985-1-TheSven73@gmail.com>
References: <20191118165400.21985-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver has been extended to optionally get its operational
mode and regulator init data from the devicetree.

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/mfd/tps6105x.txt      | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
index 93602c7a19c8..7c690812336a 100644
--- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
+++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
@@ -7,7 +7,21 @@ Required properties:
 - compatible:		"ti,tps61050" or "ti,tps61052"
 - reg:			Specifies the I2C slave address
 
-Example:
+Optional subnode:
+
+The subnode selects the chip's operational mode.
+There can be at most one single subnode.
+
+- regulator
+	Required properties:
+		- compatible: "ti,tps6105x-regulator"
+	see Documentation/devicetree/bindings/regulator/regulator.txt
+
+- led
+	Required properties:
+		- compatible: "ti,tps6105x-leds"
+
+Example (GPIO operation only):
 
 i2c0 {
 	tps61052@33 {
@@ -15,3 +29,19 @@ i2c0 {
 		reg = <0x33>;
 	};
 };
+
+Example (GPIO + regulator operation):
+
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+
+		regulator {
+			compatible = "ti,tps6105x-regulator";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+	};
+};
-- 
2.17.1

