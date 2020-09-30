Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E49427DDEC
	for <lists+linux-leds@lfdr.de>; Wed, 30 Sep 2020 03:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgI3Blh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 21:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729787AbgI3BlY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 21:41:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B696C0613D4
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 18:41:24 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l17so69881edq.12
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 18:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j1nzLd4cVTawFtv7my0W6MRV0qtnqLD9Ylpuzx5aPFs=;
        b=Eh/2MbHTg7C7wg5J5iI7Jm2IbflWfNjmKw2xeKOYJfodnE3icMcftISphSs+qobhLM
         wimziWrIEDDRWj4xruXppexqqUCr3UBi5Nq+KVw/b/eEvgaSYmvaMel491DW9PVr101H
         l6azZspgCvVff8knC1YUeS8Df4uJvnfp5DwTMlx0O4ijou4NyY706Tf0UpU4QS5WOzUM
         cQEIFHMsJ7lROXn82YZudY867yjp8RRDIWi0uN1gY8Bd8MGwL6Dex1KlV4C7aTOawJfX
         3DgsNKlwlf7HInWRD3tADsINgLzwy9b0qeFr4zTt7qFywQyQJs1cKWZsOml4baCveckX
         afNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j1nzLd4cVTawFtv7my0W6MRV0qtnqLD9Ylpuzx5aPFs=;
        b=XbpQlSOKcoXqd/6l0z1fKRalDgO7mxy/2cIGG3W/GW+NzhooV1yn4vUr5A67H/QW9+
         8nUbgzsuvkhI3mJw9ZmNb2yS977IErxtm+Divy0fS8tNV5XlPMwLOErdL1GtAboY/JYT
         lAMALboVVM5FiO/vCiC5oVqFPCyEUPx3mRbnz3URAOz1GLU3vflkn5sEp1xKNZrYVJ+u
         Cyap0kPn/JAknSu6Jgd1sLfXn8a/11AZWnFgYck0i9n9BRyfddYQ7wdQH36Pn6t7ikw3
         ftGHTPie3QYz9F6Tm2o3zg22zp/6RNLHQBuhlPtw2531JBGC6VSJiih8IKfYwF48gCbk
         0cZQ==
X-Gm-Message-State: AOAM531kSQBOXYCohe23q1iZ6XqyU+mci4EcaT2mhKlFWgjyhVu3VQV5
        /VEcHlE9eU+fJDPLDo5O2tGyGg==
X-Google-Smtp-Source: ABdhPJyranPrEpXvW91gZlFSSM4AzTx8KUkqiJNG1xr+dWveWBsCKZud8F2QaxfpXVp11QFQOb4Klg==
X-Received: by 2002:aa7:d144:: with SMTP id r4mr266149edo.303.1601430082966;
        Tue, 29 Sep 2020 18:41:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3000:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id q1sm203258ejy.37.2020.09.29.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 18:41:22 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v3 6/7] MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
Date:   Wed, 30 Sep 2020 03:40:57 +0200
Message-Id: <20200930014058.44460-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930014058.44460-1-luka.kovacic@sartura.hr>
References: <20200930014058.44460-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add an entry for the iEi WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 190c7fa2ea01..0adf6cc499e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8455,6 +8455,19 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
+F:	Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
+F:	Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
+F:	drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
+F:	drivers/leds/leds-iei-wt61p803-puzzle.c
+F:	drivers/mfd/iei-wt61p803-puzzle.c
+F:	include/linux/mfd/iei-wt61p803-puzzle.h
+
 IFE PROTOCOL
 M:	Yotam Gigi <yotam.gi@gmail.com>
 M:	Jamal Hadi Salim <jhs@mojatatu.com>
-- 
2.26.2

