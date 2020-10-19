Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDECA293127
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgJSWUi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388040AbgJSWTc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:32 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE0EC0613D3
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:30 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id dn5so892856edb.10
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1eT9+f8E9Rdu5LlhMetVCscQccHc6i1e7dX0+vR0H0=;
        b=fKLKZZsJGfqFbLfIScBogF6GMs2tS1L1qFyCLGRsvIBAT7YOT5KzZc2CMUxr6jCI+B
         oHgp3KLcUj7V5rCGH+HU1xcRbihZJTNJHjnWfuA3m2WR/9It+UaypdNqpRqezrAYf2bT
         wDEXptP2Dkx690t1nwf2ZFcrMIuoT3kKDPTytzv+FsSDWXU9QikA7MLYuwznN4zt/GDO
         n5N6p8udzD8xA5TPY//w9SMzUq43y7b29c+bBd01hmp8JArkuG1JZGsbsoOVdaLFGl5F
         bBdzbBPe05hh+XNtfYOWkRzBpB24xrDybw3qXb6XtdHwWrtDzDQd87qT/8QJPLCEg/KE
         V0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1eT9+f8E9Rdu5LlhMetVCscQccHc6i1e7dX0+vR0H0=;
        b=QfySlpgCjYtP2Ipt1YwYvD9T4NHJAmc6+DG1t4nbjmj2Vz6rb0uy8L5C/Ra+cqNFsu
         2mkoBgBFKdzJumorLdz9TItWlLLZXk8iY4RJ9eIvnQ4P/0Awd8wtQq+Byvcs5+GMj2gE
         xCIIdJAkGOQwvbzbWUCuMt6oI4BscC823fzATK1qoYBSqHAUlf6krribrm03L8KETgmB
         tS7flhywnhuzSjizMH/MrW6OmI4WvAwdlKgzPbZ9IW6XcauNZ5tUpcRu0nTS6zoMq6Uv
         rxUF2E9JYMaDENMWq/X26hW1D+qYilZScTVwYVmdWE8vgMeHNyf5C6kc6SEoBRHuiRAf
         pOSw==
X-Gm-Message-State: AOAM530MwyKaMVIK4j6SRT5XRoqFv6gSkx8rm/UxGZI8VdQBPiKxBi7B
        kDA+Ucz8VlFxrcga6KSD0MHDxA==
X-Google-Smtp-Source: ABdhPJzn4Jj7OS31YF+yBfhXsRD+PbYIP2mZJM2yNeukc1mEegntzHXBcY+Z/yR/3aas3P6lynFQ1g==
X-Received: by 2002:a05:6402:124a:: with SMTP id l10mr1996766edw.99.1603145969470;
        Mon, 19 Oct 2020 15:19:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:28 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 6/6] MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
Date:   Tue, 20 Oct 2020 00:18:59 +0200
Message-Id: <20201019221859.56680-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
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

