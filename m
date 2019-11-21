Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F7B10545E
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2019 15:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfKUO1k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Nov 2019 09:27:40 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36684 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfKUO1g (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Nov 2019 09:27:36 -0500
Received: by mail-qk1-f195.google.com with SMTP id d13so3196766qko.3;
        Thu, 21 Nov 2019 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3gwfygBNjto+s4EabazzGNb2PsGRdds8Ie+HhfI+rQM=;
        b=VENeXGxAEt6U0bdDDFs3mDRxKrgnI2TOgZ2r4MYZOPJWcc/jD4zFtTws1kWBDdVknD
         8vNk8OqAzTzepfWORFJVMBZaRfTOKCSylS2lKuzEIuIuneLpoFPy2+RqQ/sI0yO530DU
         8hM4rUh9cQk+uLrbor8QpYavYidnYXx/OVmR6Q/oYBYRpTxf/dHoiPi2JR0NfarkIU5p
         NwjbIVfg2Kd0T38vNZ5EVC5d8z+5tHGrDeWeN0g542DoYpogfjvHKAsZtG93E5BjZ5x6
         rHe9XablMW+0KN3f4TceQcHJkN4mDPu6e05Glr97dULx6iP5rTCdKW56MCVhPTggX+Js
         V40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3gwfygBNjto+s4EabazzGNb2PsGRdds8Ie+HhfI+rQM=;
        b=dsshYGKiL7O6tLotkNESmdAxdN8K9TIUGpQEP9N4YQaQYbWiAWCnKCLG+nTCOBPqXC
         tcgW7w+55/v/YKxI/2e5YMy3Wqr6lFibTqleafx54XNJYILWixougKZsm3sad8a4nBvI
         SrGtDb+kt/MHg1pcSZjCkuTeN7QuMRGriOE6HVdEAmCPCVmuWvhbIEzmbpNbJG7anB+Y
         fI4o4ITPb3T3TGBMdcyj6m0xfJVe/DkQU30KhbOA6gaf90jb7Kjm2RFEkr5PdqdCbPfB
         v4yLM/5bKDSgnwU1A7HBQXgqTvFc9/6CAwsghxVBtn5ZIc1DDSE7j5hm1JDlYlpMiiU8
         zArQ==
X-Gm-Message-State: APjAAAXqlIAK8RiLWOnJz8eySv4PTuCJ6/mwVULrl6/9fbWDGCQ3qQGt
        eXr420OHUEbhMcs19vY7hww=
X-Google-Smtp-Source: APXvYqzhsS4C6Nlwm46pupvpnhHdtO1KwhJgy7xUQZ+UqEpyTHx9KZ9N2fJbGYvfkAwDsjMYTPWcXg==
X-Received: by 2002:a05:620a:1090:: with SMTP id g16mr7290769qkk.41.1574346454702;
        Thu, 21 Nov 2019 06:27:34 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id l198sm1442931qke.70.2019.11.21.06.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 06:27:34 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Date:   Thu, 21 Nov 2019 09:27:26 -0500
Message-Id: <20191121142726.22856-3-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121142726.22856-1-TheSven73@gmail.com>
References: <20191121142726.22856-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver has been extended to optionally get its operational
mode, regulator init data and led naming from the devicetree.

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
index 93602c7a19c8..1fc9aa3ed882 100644
--- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
+++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
@@ -7,11 +7,56 @@ Required properties:
 - compatible:		"ti,tps61050" or "ti,tps61052"
 - reg:			Specifies the I2C slave address
 
-Example:
+Optional sub-node:
+
+This subnode selects the chip's operational mode.
+There can be at most one single available subnode.
+
+- regulator: presence of this sub-node puts the chip in regulator mode.
+	see Documentation/devicetree/bindings/regulator/regulator.txt
+
+- led: presence of this sub-node puts the chip in led mode.
+	Optional properties:
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+			(deprecated)
+
+Example (GPIO operation only):
+
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+	};
+};
+
+Example (GPIO + regulator operation):
 
 i2c0 {
 	tps61052@33 {
 		compatible = "ti,tps61052";
 		reg = <0x33>;
+
+		regulator {
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+	};
+};
+
+Example (GPIO + led operation):
+
+#include <dt-bindings/leds/common.h>
+
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+
+		led {
+			color = <LED_COLOR_ID_WHITE>;
+		};
 	};
 };
-- 
2.17.1

