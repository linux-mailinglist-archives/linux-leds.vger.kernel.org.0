Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2CF1C3FE7
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 18:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbgEDQbV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 12:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbgEDQbU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 12:31:20 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ADCC061A0E;
        Mon,  4 May 2020 09:31:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id g10so10268525lfj.13;
        Mon, 04 May 2020 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4avq83gWIG6SXwwBo1Hj4fF/IIUaH4nxZfaD4L5SnFE=;
        b=L0/+Xr/w4yFFzy4bogzYfkmz1AZ3u2BeSMjapYEs8rlq1inGyU/asGfw1AfKXZ91LJ
         FuRQG6qenY7B4mkJIfA/IrAhw5DHEBIe+WutDVY1DAqt/f1qTPaPNIjGvEof2JbuMb61
         BzQFQjNIngtCTU9HRJOhpQ487yQBJxJmt4D/Ujp4I1DukW2AdFTSbI+klnYSZzzEhAZO
         rmOt85o257xqb31PPDpWx8ixQ7VtaYSPD7yuvjqF5EgstdQ5nJy66ZwjVDHRSZDHuGmd
         4SPqrprx7FsU2idiMX+QipZWy6VFt8Ra2iYvjEMnvC2fSK0tLmHEemO4saJn44pq+hGP
         4vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4avq83gWIG6SXwwBo1Hj4fF/IIUaH4nxZfaD4L5SnFE=;
        b=Q3GjtwTPjPCMCD5w+P6SrF9g9UmuuI3rnvpqZnQI/1jRpiJ9fM7frcr5G+BSXXGGa9
         yki/HvLfi68Sf6Wikas8nr75ydXoo31H2lfsFDo7yYpn4Co+WYPdL0Ssip/z0NIAqudy
         0TdrCW8JAgDjZX4gYCrAmL2mOl4Sz4Nr8diwA+u9QFakX8sNEGfAjkAOJXAQUR7zIUpQ
         UPKSy6TYPjdPhKJ60X336BI2NVreK0yPolSXKB4bnMucI7DLnboczqaDAF2Ml5pB23K+
         e4A4Asudf0EpHRzp0fGHZr8nxqsfBX7axV10sSceY1WckGzdVtHU2ah2iHM9HU31okpM
         O7Pw==
X-Gm-Message-State: AGi0PubBpnLwSHOXfVbMZsFKYYiOMUK0C/Hk0k9oc2zWv9ytN9ecj/Qo
        whM4uueJC0KaGzZTgBxiA0Q=
X-Google-Smtp-Source: APiQypLDPg2vU7jptKdk7VGk4y+m4eL+7FP/fEJH56euDyfiiTuACqOBmVWF2P8/Kyak5lL8/dZT6Q==
X-Received: by 2002:a19:4b57:: with SMTP id y84mr12320267lfa.214.1588609878171;
        Mon, 04 May 2020 09:31:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:22b8:4400:7ca3:a735:45d1:7107])
        by smtp.gmail.com with ESMTPSA id o3sm10166624lfl.78.2020.05.04.09.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 09:31:17 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 3/3] dt-bindings: vendor-prefixes: Add Shanghai Awinic Technology Co., Ltd.
Date:   Mon,  4 May 2020 21:29:34 +0500
Message-Id: <20200504162934.4693-3-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504162934.4693-1-nikitos.tr@gmail.com>
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
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
index 334393037861..6a77e14c216e 100644
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

