Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAD64546CA
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 14:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237351AbhKQNDa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 08:03:30 -0500
Received: from smtprelay02.ispgateway.de ([80.67.18.14]:16527 "EHLO
        smtprelay02.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237224AbhKQNDa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 08:03:30 -0500
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1mnH2b-0002o1-Jv; Wed, 17 Nov 2021 10:15:41 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH 3/3] dt-bindings: leds: sgm3140: Document ocp8110 compatible
Date:   Wed, 17 Nov 2021 10:14:05 +0100
Message-Id: <20211117091405.7412-4-git@apitzsch.eu>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117091405.7412-1-git@apitzsch.eu>
References: <20211117091405.7412-1-git@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 Documentation/devicetree/bindings/leds/leds-sgm3140.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
index f68259619488..1c345cf16d08 100644
--- a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: sgmicro,sgm3140
+    enum:
+      - ocs,ocp8110
+      - sgmicro,sgm3140
 
   enable-gpios:
     maxItems: 1
-- 
2.34.0

