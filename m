Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C661CD75D
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 13:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgEKLMf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 07:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKLMe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 11 May 2020 07:12:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E23C061A0C;
        Mon, 11 May 2020 04:12:32 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u6so8988097ljl.6;
        Mon, 11 May 2020 04:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mMtYnNr5g5oPqRSwkm+a7GegW70Zgr2odwgJUALqy5M=;
        b=jzqMD4GFmw7hY4mmQs5D/9emGa0bpq2rJne0VNBhNf7hDbgXzXSJdNelFjR8vQxxEf
         GXNYV85NSCrdSPYGque0Gvj3jmGLG9j4pVGU7BkQOp20xLyHhFnjs527WzLav09tvRon
         0+tUg0YHMuipCcP+ijS6f5sbmDHRu5Ghunh49b0m/f0Bdu2ZO1jmnYd/r3QSOyANWI3F
         D33VH9Q5SpGycQrsec5UaKFg2Xhp0vrYnXOxhBxW8Aq0CP8DG21ZUNCGlrjxbvpvINJC
         alIXV+4qQ8pIw+8dsYczW8nCA6QOWxwNvdxGcYmGS4pSHiz3dkBgsQfWL3VRG2xTCSly
         /1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mMtYnNr5g5oPqRSwkm+a7GegW70Zgr2odwgJUALqy5M=;
        b=g2Kv7BeHrHrG2NW5UwGfFhrESyDehVd0s7o/zyvDRWjKOTnCNziPZ9e9lhyYmzphwz
         qb+dDJsPN6zXCGBFEe+V4Qz2jmD4SUgvUz/bEGXzfKtl557oWHMXMxfWGSRZm2nCVJ5A
         qwLRfaTmNiXGD0l1PNDU3oO+fKu3NWKfKUJ0FE+hguPLhIelxB5e7V+z8JAFjTJQhxRk
         ZhL8IV7jvFB2n7oJRcxcIFApimpxieHbckiqdG33Wcd0H4ckBKmyl1lV+cpfPj71VjPK
         n0nhuyk5qieALpP98o0K9tGK6OaTsJfc8YJlO2faBv61//DwAvVEQUNeaCfiEkct+mSc
         bjLA==
X-Gm-Message-State: AOAM532dHH8goTpN/AHRu7tj64SiSloCAQNcGjP36uBsNWImGCupe3gL
        uCLgKUhI40YiOfXlpsObqMg=
X-Google-Smtp-Source: ABdhPJx0rQ9Nle2jdwmDEEXHCuUDR4FhUp2ahZdnjHyWpmgvZ4u3vONskdSLbOwjYap4pMLl29pcLA==
X-Received: by 2002:a2e:8047:: with SMTP id p7mr9430036ljg.206.1589195549981;
        Mon, 11 May 2020 04:12:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:28d4:e600:cdb2:b5ce:8f29:26b7])
        by smtp.gmail.com with ESMTPSA id a10sm9498128ljp.16.2020.05.11.04.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:12:29 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shanghai Awinic Technology Co., Ltd.
Date:   Mon, 11 May 2020 16:11:26 +0500
Message-Id: <20200511111128.16210-1-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add the "awinic" vendor prefix for Shanghai Awinic Technology Co., Ltd.
Website: https://www.awinic.com/

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 442579a4c837..8da5b275ece8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -133,6 +133,8 @@ patternProperties:
     description: Shanghai AVIC Optoelectronics Co., Ltd.
   "^avnet,.*":
     description: Avnet, Inc.
+  "^awinic,.*":
+    description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axis,.*":
-- 
2.20.1

