Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BD9454671
	for <lists+linux-leds@lfdr.de>; Wed, 17 Nov 2021 13:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhKQMiU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Nov 2021 07:38:20 -0500
Received: from smtprelay02.ispgateway.de ([80.67.18.14]:51242 "EHLO
        smtprelay02.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhKQMiU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Nov 2021 07:38:20 -0500
X-Greylist: delayed 11966 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Nov 2021 07:38:20 EST
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay02.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1mnH2b-0002o1-A1; Wed, 17 Nov 2021 10:15:41 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH 2/3] dt-bindings: vendor-prefixes: Add ocs prefix
Date:   Wed, 17 Nov 2021 10:14:04 +0100
Message-Id: <20211117091405.7412-3-git@apitzsch.eu>
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

Add the prefix for Orient Chip Technology.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 66d6432fd781..b077092905c7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -842,6 +842,8 @@ patternProperties:
     description: NXP Semiconductors
   "^oceanic,.*":
     description: Oceanic Systems (UK) Ltd.
+  "^ocs,.*":
+    description: Orient Chip Technology Co., Ltd.
   "^oct,.*":
     description: Octavo Systems LLC
   "^okaya,.*":
-- 
2.34.0

