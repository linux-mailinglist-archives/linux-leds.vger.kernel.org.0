Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913725B274
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 02:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfGAA2f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Jun 2019 20:28:35 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38471 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGAA2f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Jun 2019 20:28:35 -0400
Received: by mail-qk1-f195.google.com with SMTP id a27so9703799qkk.5;
        Sun, 30 Jun 2019 17:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HKNvw3apNedvPNTZXgfoh6gluQQ+cVAOJ/uV9fQblt8=;
        b=XjQMQpqpIfiJexl2wv5HW5IaOomJjJQGNmkMKYB+fXK58Kq7SIo+FIlb3LuTRL1c4K
         WQxHSsRLAQ4ZHBtXnx53zYgJkiUCaCO27l6ykRXWNZxcqHJwa01PcRhPur4ufuuVoUw0
         1Y3u0t3krgG0wjvMAjSQeqAwgq/IhAiWLtOyUpfqRYPL7os/TMnWSQutYKBRDm9qlxqJ
         /l8VHWjmji8eCz7F7y5i0j1DkGwdU96bzDuMvq73wsM9F0m5LjMDslLhmesJVdsIqmZm
         RCn1EdCFSsU57KI6JVqf9Tk/Xn69aEeNIL/cXiLckYYlfgOV4LKGRPpbHVNnADa6v1Th
         SfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HKNvw3apNedvPNTZXgfoh6gluQQ+cVAOJ/uV9fQblt8=;
        b=gZMxdlYQXtCkVuJxvl7tnqkm7ayQCTjYtO0tJKhfjxg0w+K6I+saP2cQw981A8Ur7Q
         GR5ZYHajQg6DdvEzrNOan3aBF8zWT/rLnmgRFzLYGsGNrDy2zbluDWRCdFt11H7vJzEG
         fssGFuQvROrIoBQxmigKR+xFzAFXVjz5MBNBGFK1d6I53K/Uqni9IyLpCngDUe6eKF2c
         2RaewjP4AHKMPtR9CAXqaZXyWq08GcQGHo4Zi/WnwN8XaSHyDhucSaHAc3SOuhZWh4Yl
         O/Drl2HF66MnuAmy+Zyb9B5K7XlXXdw0VJo3+6+Q0qF8GuuTXzmK+/P8WI847Q+LcKUP
         rbew==
X-Gm-Message-State: APjAAAW6jLfDaw73wLsdoj4XJNZpfvbeguXtnWJccny8WS58p0blC5QF
        ZfeGZ7hS1s69EthSOoOJkV8=
X-Google-Smtp-Source: APXvYqyPFGUYsrCeq17oaPYdrWNxFEHboE/ILrbLppbw6ARNF392bJ8ysvYwaXD8bKQm3GhOsE4LgA==
X-Received: by 2002:a05:620a:13f9:: with SMTP id h25mr16514567qkl.283.1561940914554;
        Sun, 30 Jun 2019 17:28:34 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id 70sm3971404qkj.118.2019.06.30.17.28.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 30 Jun 2019 17:28:33 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com, Brian Dodge <bdodge09@gmail.com>
Subject: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for ArcticSand arcxcnn driver bindings
Date:   Sun, 30 Jun 2019 20:28:14 -0400
Message-Id: <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The vendor-prefixes.txt file properly refers to ArcticSand
as arctic but the driver bindings improperly abbreviated the
prefix to arc. This was a mistake in the original patch. This
patch adds "arctic" and retains "arc" (deprecated) bindings

Signed-off-by: Brian Dodge <bdodge09@gmail.com>
---
 .../bindings/leds/backlight/arcxcnn_bl.txt         | 31 +++++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
index 230abde..4d98394 100644
--- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
@@ -1,8 +1,13 @@
-Binding for ArcticSand arc2c0608 LED driver
+Binding for ArcticSand arc family LED drivers
 
 Required properties:
-- compatible:		should be "arc,arc2c0608"
-- reg:			slave address
+- compatible: one of
+	"arctic,arc1c0608"
+	"arctic,arc2c0608"
+	"arctic,arc3c0845"
+	"arc,arc2c0608" (deprecated)
+
+- reg:		slave address
 
 Optional properties:
 - default-brightness:	brightness value on boot, value from: 0-4095
@@ -11,19 +16,25 @@ Optional properties:
 - led-sources:		List of enabled channels from 0 to 5.
 			See Documentation/devicetree/bindings/leds/common.txt
 
-- arc,led-config-0:	setting for register ILED_CONFIG_0
-- arc,led-config-1:	setting for register ILED_CONFIG_1
-- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
-- arc,comp-config:	setting for register CONFIG_COMP
-- arc,filter-config:	setting for register FILTER_CONFIG
-- arc,trim-config:	setting for register IMAXTUNE
+- arctic,led-config-0:	setting for register ILED_CONFIG_0
+- arctic,led-config-1:	setting for register ILED_CONFIG_1
+- arctic,dim-freq:	PWM mode frequence setting (bits [3:0] used)
+- arctic,comp-config:	setting for register CONFIG_COMP
+- arctic,filter-config:	setting for register FILTER_CONFIG
+- arctic,trim-config:	setting for register IMAXTUNE
+- arc,led-config-0:	setting for register ILED_CONFIG_0 (deprecated)
+- arc,led-config-1:	setting for register ILED_CONFIG_1 (deprecated)
+- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used) (deprecated)
+- arc,comp-config:	setting for register CONFIG_COMP (deprecated)
+- arc,filter-config:	setting for register FILTER_CONFIG (deprecated)
+- arc,trim-config:	setting for register IMAXTUNE (deprecated)
 
 Note: Optional properties not specified will default to values in IC EPROM
 
 Example:
 
 arc2c0608@30 {
-	compatible = "arc,arc2c0608";
+	compatible = "arctic,arc2c0608";
 	reg = <0x30>;
 	default-brightness = <500>;
 	label = "lcd-backlight";
-- 
2.7.4

