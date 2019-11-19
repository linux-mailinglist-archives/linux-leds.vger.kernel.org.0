Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536FB102889
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 16:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbfKSPqZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 10:46:25 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38104 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbfKSPqY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 10:46:24 -0500
Received: by mail-qt1-f196.google.com with SMTP id p20so25106188qtq.5;
        Tue, 19 Nov 2019 07:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M8plwUGqzRu7vrgV7/AsiHy4S0SxA51BEoVHYwcW5lA=;
        b=JyzAEu/6ws9pxBMKgWcKSYsKAY6v1iDQlhimW0fo3mVWXhlxvJxvDXQo0xctEUWGSE
         Pt8VVy5rEJGIoAxhEfUPch66BMCN211Z8O6rUnIxw0Ru61N+MLcxuHR20pATQexpV5tB
         ThZmMlEXQa5whche9/AeeFgvZx8/KQ41RRQV8hkgr6yluEr6jQI+8sNNuO3ZlhONLq/8
         8C0wh/aiatk86HowX7vOXUxLffdZz5ExA9uPJmCroJnD7UypLzsVDyA0m8JtCx8d1lD8
         zB73fwsvVtItCnQt4qzBwXO/liKX/Ixq4Vz0ILVKY+14uoEk95UN2b1K6fafL3xmpui2
         3nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M8plwUGqzRu7vrgV7/AsiHy4S0SxA51BEoVHYwcW5lA=;
        b=tl+KwG+hSGKCdVpoiiOU2oglD0dYzyy2cIlLpYWxi1mHeRmeahsiORMaLsTG8XooTE
         wBqDkkb7e/3dX25LHtW30WZW1tS/Ts02bzv2DnQCYfX0wkTK/VVBNPhVlsBwoQmtflOg
         jWKW9JvaL2vWtcr4bd016x13q8cuXdy16NjNxC6/SrBeIHuM4NcOqLjwkY+yZUiOYEtm
         JmHxNCLzmgWmaYC2/+vEGenz0/NBfHSJ5tV3tpd4/Qjx8aRkvAfYtje1xcSphTLoDY6e
         U12OtcdSKEwPRiwGc4LUmHDlW/ShyOhddjFOMB5BcaxtQKWHGuVRSkFML0MypDi2IHaO
         Bu7g==
X-Gm-Message-State: APjAAAXc3DII/2JKDtQcf1jNM+U3I8yiWgBSrn0p9c/uGDkQwKx8wglh
        sbdz2/24TzbezDBKcNNixMM=
X-Google-Smtp-Source: APXvYqzTwS2JcKYsV+NK7gaJatS2f0ktlgeaG5oXB4W8nNqlmdDNWDRG8T4z6FvpvCEDV5SZJQDQBQ==
X-Received: by 2002:ac8:44c3:: with SMTP id b3mr32324566qto.313.1574178383029;
        Tue, 19 Nov 2019 07:46:23 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 50sm12949919qtv.88.2019.11.19.07.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:22 -0800 (PST)
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
Subject: [PATCH v2 4/4] dt-bindings: mfd: update TI tps6105x chip bindings
Date:   Tue, 19 Nov 2019 10:46:11 -0500
Message-Id: <20191119154611.29625-5-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119154611.29625-1-TheSven73@gmail.com>
References: <20191119154611.29625-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The driver has been extended to optionally get its operational
mode, regulator init data and led label from the devicetree.

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 .../devicetree/bindings/mfd/tps6105x.txt      | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
index 93602c7a19c8..ab5d4c52074f 100644
--- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
+++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
@@ -7,11 +7,51 @@ Required properties:
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
+		- label: see Documentation/devicetree/bindings/leds/common.txt
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
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+
+		led {
+			label = "tps-torch";
+		};
 	};
 };
-- 
2.17.1

