Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD1C4385FB
	for <lists+linux-leds@lfdr.de>; Sun, 24 Oct 2021 02:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJXA0l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 23 Oct 2021 20:26:41 -0400
Received: from phobos.denx.de ([85.214.62.61]:56282 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbhJXA0l (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 23 Oct 2021 20:26:41 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 432E483303;
        Sun, 24 Oct 2021 02:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1635035060;
        bh=Lt3RsbjDDeAgJvNyYzgGa7Fh7W2YYEMvbuZaDCtx448=;
        h=From:To:Cc:Subject:Date:From;
        b=cp0J8dYK9Mwe0XILJqVtO+f6/b0Kg/gFtGNKxyitdA144LiM5anzw5F8Fkm44bgzK
         9XebenZC97hUGzzWkyAjayuvVMw7k+1cjIls2RERF2IM35jFzrl9QzPaP1v1vMb0c5
         VTVaNjoAcyluSEXGfainhe4U8NWXNDtBjcxnEA9gj0xAGSIysYOW/7ayt4Rvjsb/KB
         JSFeu9i+uohAXPIrB1m8CZ7x6ngVSQNIx1yFyhWz4aRKUBjHYFPojZC6IIcDWFPOO0
         QUTUbsXi4IoUxyURyWUbcfhT4SN0A7soI4Txw4kKvn+qN0m9L0XAsRP03afupLss5d
         zExq0gwKOV/lg==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: Document none trigger
Date:   Sun, 24 Oct 2021 02:23:57 +0200
Message-Id: <20211024002358.225750-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is a trigger called "none" which triggers never, add it to the
list of valid trigger values.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-leds@vger.kernel.org
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 697102707703a..22197376fa3c7 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -92,6 +92,8 @@ properties:
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
       - ide-disk
+        # LED is not triggered
+      - none
         # LED flashes at a fixed, configurable rate
       - timer
         # LED alters the brightness for the specified duration with one software
-- 
2.33.0

