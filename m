Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA611ECC4A
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2020 11:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgFCJPZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Jun 2020 05:15:25 -0400
Received: from smtp.asem.it ([151.1.184.197]:54582 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgFCJPY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Jun 2020 05:15:24 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000293951.MSG 
        for <linux-leds@vger.kernel.org>; Wed, 03 Jun 2020 11:15:19 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Jun
 2020 11:15:17 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 3 Jun 2020 11:15:17 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1] dt-bindings: leds: fix macro names for pca955x
Date:   Wed, 3 Jun 2020 11:15:16 +0200
Message-ID: <20200603091516.31907-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A090207.5ED76A26.004C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The documentation reports the wrong macro names
related to the pca9532 instead of the pca955x

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Acked-by: Rob Herring <robh@kernel.org>
---

v1: add "Acked-by: Rob Herring <robh@kernel.org>"

 Documentation/devicetree/bindings/leds/leds-pca955x.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
index 7984efb767b4..7a5830f8d5ab 100644
--- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
@@ -26,9 +26,9 @@ LED sub-node properties:
 		from 0 to 15 for the pca9552
 		from 0 to  3 for the pca9553
 - type: (optional) either
-	PCA9532_TYPE_NONE
-	PCA9532_TYPE_LED
-	PCA9532_TYPE_GPIO
+	PCA955X_TYPE_NONE
+	PCA955X_TYPE_LED
+	PCA955X_TYPE_GPIO
 	see dt-bindings/leds/leds-pca955x.h (default to LED)
 - label : (optional)
 	see Documentation/devicetree/bindings/leds/common.txt
-- 
2.17.1

