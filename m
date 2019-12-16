Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC3E31208B6
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 15:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfLPOdJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 09:33:09 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41914 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfLPOdJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2019 09:33:09 -0500
Received: by mail-qk1-f196.google.com with SMTP id u5so4614433qkf.8;
        Mon, 16 Dec 2019 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b3n3Kfle6iU1BrFAyB3vXy4iLossBp48BoHQ88uRT0E=;
        b=tZI2rIKp+Iecmn0roFCkMpG2UHfHCKdqG8nOdHlVzC99671hMOyodEQMdkSRxMbuY4
         H0dsHxhgv/MVQzU5N6WRAvjN36Q6j31EmxttJ7gL8hE2TVw+t9QD30371Xhlqy8CM4Wp
         DdYyEBDpBhyodXRUJLjuFIGnoeI2iiwsX+P8moicEWTuPXCYOsPDUP0zQy9nHxsycl4v
         b0oDcM2IVRlMXkZeNnPKKoa6KCu/5jX28Iz8D/4U+Rmg4vI2BQ6JrSwWnYF40AtKyPMh
         t+GwEwreNAhvs8KULWEqccKFnxGUEGYiXmtZIvYBlgkuq6d9MHycpFRzo7+47J2VR4Zb
         pw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b3n3Kfle6iU1BrFAyB3vXy4iLossBp48BoHQ88uRT0E=;
        b=n8r4dRkQoXlDFXn1MxktKbCH/KmKJMUT2n/9po2v18qxnUvVJ6UUaVGiW+y4WmJPfi
         bCDcQUf1K8Qojz1FdgVDoV2Q9dlPhnFs+A7Ldxo8lJOwQutLla3qffvZo+Bwsmzz9VdJ
         XtYRpNS/cIRKvVs8OPipzi9WhkHraWgGpfruEfAkA6r22LvcHiW4lO7lwIJjfpDOGhEj
         5Kf9mEMFecaCGMQPC2m84U/UHEwoyoHGPPl++Wcn21GIg0nh3aWXWlyVwYFldUaYjH6f
         RDYTj9cBH2u7QtcvfrwdRIVSwPQ4dKAwNWdLOr0IaLBpHMUIbw15ap8aGCK9C5j+6Syd
         jaiw==
X-Gm-Message-State: APjAAAVolySh5Kl975Q6AT7ltyhnMvj0AdR6wVtUiyhwjQsY4SbJMHqK
        i8yqzM0VF1ZTtHI+RdR8d/Y=
X-Google-Smtp-Source: APXvYqxDYhGdtN/BGOqPRD4pavuWko1kVtlkknI3dzB5zqCUhSKJnF5KjcDgKsDJUNrPC1d38fS4Ew==
X-Received: by 2002:a37:8085:: with SMTP id b127mr1241501qkd.424.1576506787748;
        Mon, 16 Dec 2019 06:33:07 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id b3sm6966992qtr.86.2019.12.16.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 06:33:07 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v6 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Date:   Mon, 16 Dec 2019 09:32:59 -0500
Message-Id: <20191216143259.24587-3-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216143259.24587-1-TheSven73@gmail.com>
References: <20191216143259.24587-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver has been extended to optionally get its operational
mode, regulator init data and LED naming from the devicetree.

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
index 93602c7a19c8..dc448a9d5b4d 100644
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
+	see ../regulator/regulator.yaml
+
+- led: presence of this sub-node puts the chip in led mode.
+	Optional properties:
+	- function : see ../leds/common.txt
+	- color    : see ../leds/common.txt
+	- label    : see ../leds/common.txt
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

