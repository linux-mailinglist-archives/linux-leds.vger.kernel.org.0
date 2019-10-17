Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B53DA615
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 09:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407971AbfJQHMv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 03:12:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42458 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407994AbfJQHMu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 03:12:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so1001947wrw.9
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=02ptUi820rtgb1rVywdXHHVh+A6FBo6gb2V5cVn00l4=;
        b=TMCOuFGslVYaietD3Npaye2HNfQyRxbQihRWW/0tacQLD/VcOtmBgnO21eTt/nyM+f
         yeNG7TvCKABshRGXDI5Lh5arQn0Rg5ZRQE5owPHB9yWQZLU0viVX5zHNHY4jcFe+saPl
         pEK3jQ+5P5JVqc9u9OA2ZcUDiIvr6Idfwl7muzVO905/jq7CpQZtc2KBiV37gTLZlydL
         5IAmyx/D6uHUKZ3xbK1cV/TOSFS+NTjsy/4Bc6bnDTRP8+CHeB5ebrSPm1kfJd5QNGWg
         +xgi0+y9lDv6DKi1IZOa0kmWI4BW3HjJlvWhPyjjVepYpEb6sis1TRBIgFN/BxVlINeZ
         bUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02ptUi820rtgb1rVywdXHHVh+A6FBo6gb2V5cVn00l4=;
        b=Pi93D+nHwo0UOj35N3CWcAb5KjHKKib5RPN0n/HD+1/KRHE3wxDzlXLhVMe5g7nLaK
         gwDqRdBV7naIA0SEuzdELTEP9ygHVvkMhVShH0kNj29Rr2l1mofpOabWAklpLFfBc2Yx
         Ds+bjVSmQLKZ5LnmdZVVN2QcggkwIXzvt645l48TgOlEgirKnV8iSeZt2IO/kdJvEJEs
         od4qcXEzZcTWF5+vH5H3M7qbxRhxhv1ch0h8RGFg31j75uaBL7ZHE+4PwhnmFKzw77dQ
         GItQEM93MpP7k3w5lpwOSHFr0OkTPSkpinQ/c1bHBX98lOrAJIsbBuh2xdj1aRWZaIsy
         hgOg==
X-Gm-Message-State: APjAAAVE7ixnoD//EhUC1FwjFD5f4wEGBBZ88A4NSTW/nFqoUnmsvTfG
        AThOkAd8OTxeoPSSLhrzHITsXA==
X-Google-Smtp-Source: APXvYqwavR8cAD6sd1m49Q97NupEKTiiZz7QIevjs5S9SSkZYg8tuEDju8swtsi9FLS3lhJYAoVutg==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr1666117wrq.227.1571296367586;
        Thu, 17 Oct 2019 00:12:47 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n22sm1156689wmk.19.2019.10.17.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 00:12:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 6/6] MAINTAINERS: update the list of maintained files for max77650
Date:   Thu, 17 Oct 2019 09:12:34 +0200
Message-Id: <20191017071234.8719-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017071234.8719-1-brgl@bgdev.pl>
References: <20191017071234.8719-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The DT bindings for MAX77650 MFD have now been converted to YAML.
Update the MAINTAINERS entry for this set of drivers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a69e6db80c79..c05e6fd6aedb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9903,8 +9903,8 @@ MAXIM MAX77650 PMIC MFD DRIVER
 M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/*/*max77650.txt
-F:	Documentation/devicetree/bindings/*/max77650*.txt
+F:	Documentation/devicetree/bindings/*/*max77650.yaml
+F:	Documentation/devicetree/bindings/*/max77650*.yaml
 F:	include/linux/mfd/max77650.h
 F:	drivers/mfd/max77650.c
 F:	drivers/regulator/max77650-regulator.c
-- 
2.23.0

