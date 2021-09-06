Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FEE401CAF
	for <lists+linux-leds@lfdr.de>; Mon,  6 Sep 2021 15:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242820AbhIFN4F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 Sep 2021 09:56:05 -0400
Received: from m12-18.163.com ([220.181.12.18]:36960 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244237AbhIFNzc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 6 Sep 2021 09:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=UlU0ugQ9eiCibe2wkZ
        2zmgFWKjVJd3Z1u7PCG+vABgc=; b=hvIrKPGPUVz5JsluKF7Hl9ULrUkQ1pGf/j
        z3aBHe+2mUO3zXPVtvA7XPpiPHENAk/5bnHtw2HXB50zKHgDUio3InCy3kQUwtda
        NgyfHkVXTfGLuIfohMikwnhJOq83R3ebTdguFPNUL1yh3f50DIqLlFIysJXH29gX
        /aWkjTXHs=
Received: from localhost.localdomain (unknown [183.220.75.228])
        by smtp14 (Coremail) with SMTP id EsCowABX_b5kHTZhfthN4A--.43881S4;
        Mon, 06 Sep 2021 21:53:51 +0800 (CST)
From:   chaochao2021666@163.com
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jan.kiszk@siemens.com,
        464759471@qq.com, chao zeng <chao.zeng@siemens.com>
Subject: [PATCH 3/3] dt-bindings:leds:Extend panic led state
Date:   Mon,  6 Sep 2021 21:53:20 +0800
Message-Id: <20210906135320.23134-3-chaochao2021666@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210906135320.23134-1-chaochao2021666@163.com>
References: <20210906135320.23134-1-chaochao2021666@163.com>
X-CM-TRANSID: EsCowABX_b5kHTZhfthN4A--.43881S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7GF4xKr13WFy3try8WF1xXwb_yoW8JF15pw
        s3Ca4jqFyrtryxu3s2q3W0qw1akF4kCFyUGFZrWw1UtFs8JF1Sgw4Skr15WFyUAayxZay7
        uF1SkFyUKa40yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bOvtZUUUUU=
X-Originating-IP: [183.220.75.228]
X-CM-SenderInfo: 5fkd0uhkdrjiasrwlli6rwjhhfrp/1tbiEQ8GdV7+4qFwbgAAsQ
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: chao zeng <chao.zeng@siemens.com>

Add extra "panic-indicator-on" and "panic-indicator-off"
to extend the panic led status.Not only blink to indicate
the panic

Signed-off-by: chao zeng <chao.zeng@siemens.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703..7eb367063155 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -125,7 +125,19 @@ properties:
   panic-indicator:
     description:
       This property specifies that the LED should be used, if at all possible,
-      as a panic indicator.
+      using blink as a panic indicator.
+    type: boolean
+
+  panic-indicator-on:
+    description:
+      This property specifies that the LED should be used, if at all possible,
+      using led on as a panic indicator.
+    type: boolean
+
+  panic-indicator-off:
+    description:
+      This property specifies that the LED should be used, if at all possible,
+      using led off as a panic indicator.
     type: boolean
 
   retain-state-shutdown:
-- 
2.17.1


