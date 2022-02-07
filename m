Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE1ED4ACCF3
	for <lists+linux-leds@lfdr.de>; Tue,  8 Feb 2022 02:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbiBHBFN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Feb 2022 20:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245543AbiBGXJn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Feb 2022 18:09:43 -0500
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de [80.67.18.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BBBC0612A4;
        Mon,  7 Feb 2022 15:09:43 -0800 (PST)
Received: from [92.206.166.137] (helo=note-book.lan)
        by smtprelay05.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1nHD6w-0001JC-Rm; Tue, 08 Feb 2022 00:07:54 +0100
From:   =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ocs prefix
Date:   Tue,  8 Feb 2022 00:06:36 +0100
Message-Id: <20220207230638.56730-2-git@apitzsch.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207230638.56730-1-git@apitzsch.eu>
References: <20211117091405.7412-1-git@apitzsch.eu>
 <20220207230638.56730-1-git@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the prefix for Orient Chip Technology.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45a23..9ffffa9773ca 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -854,6 +854,8 @@ patternProperties:
     description: NXP Semiconductors
   "^oceanic,.*":
     description: Oceanic Systems (UK) Ltd.
+  "^ocs,.*":
+    description: Orient Chip Technology Co., Ltd.
   "^oct,.*":
     description: Octavo Systems LLC
   "^okaya,.*":
-- 
2.35.1

