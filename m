Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EEC297FB6
	for <lists+linux-leds@lfdr.de>; Sun, 25 Oct 2020 02:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1766004AbgJYA7o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 20:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1766005AbgJYA7l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 20:59:41 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F073EC0613D7
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id p13so5682763edi.7
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ve+g7yzha+kqfqdGqXpj/2snQKKTgSW/x5r8vVHUiK4=;
        b=QGH5hDI8Hd8y5MrXbJP2aNTf7VQEKvsotI6K0PQZxetjrvQh7qQKE8IQwIWEA7CNDG
         TSHSzD9U1rgrabpmY1YJYnSuBooGWGg8DKZGKSgCHH0x4NFae4wR3lb8H3wW+hwGKv9q
         /QcnB61IgnJsiGScDKgJMOwJKtwycFgTdw0nl4JxtvQMhUnc+vwB6kToi0aXAoUu3xSD
         rMeKVCb0wDoqV2zDcgrxWscaNfXaT7gWmSseGJeZUxp+escfiWYRK1Kv/KxDrKZKuLBr
         YkqN89WiotEsL4FoPgP7tQFdOVuP9K9+CUUJfzsd6Wd3v7lxMtn3N1wTvMw0qFfpyIyz
         HxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ve+g7yzha+kqfqdGqXpj/2snQKKTgSW/x5r8vVHUiK4=;
        b=MQ1LY9znDLcmfZYyDC4y7zxl972B1M87qv56ckhbP10F81UBnbaYAUzWkabLLQ5u+p
         88exXYSLVH9iXbX5cEskFGAPRVxawV3xYcG1hdLYnAGwVPh0q4RbSthRVxWum4m9plkj
         ZA+MzDlhNtdnSeZ4I8Ce3lYfsz0ahgCFXy43s21ViDpuDI0Kiw6cCneaDZFYJXwwY0/r
         vuKynExXVltundcynaFvz3659D26Zn7VBp2chryhMUaTHfePOS4WDdeLaMTugqZVf1wc
         F/Q41g3qtV1pvyKZKTqQeAIxNnXltXTQRPw5isGDazh0h62mBAKdRrHSmnqxbnicQncV
         mL6w==
X-Gm-Message-State: AOAM531eNCQ/9OpWkIq49JLJCWRca1bAcsdJMPUrTlwYS5huIo8kcoAA
        pNMIiPVBqXwZdTw0oCRBNIzwgBJvfGcdKQ==
X-Google-Smtp-Source: ABdhPJwolPXq3q6ayIHgj2Llk3qDBqNWadvUfztpEUU6Xrq9oUb81d+t+e+WyC0U3Ysd1mlouuuQPQ==
X-Received: by 2002:a50:d751:: with SMTP id i17mr9408440edj.337.1603587579517;
        Sat, 24 Oct 2020 17:59:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id q5sm2797274edt.79.2020.10.24.17.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 17:59:38 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v7 6/6] MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver
Date:   Sun, 25 Oct 2020 02:59:16 +0200
Message-Id: <20201025005916.64747-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201025005916.64747-1-luka.kovacic@sartura.hr>
References: <20201025005916.64747-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add an entry for the IEI WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867157311dc8..d56fdc300066 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8460,6 +8460,20 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
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

