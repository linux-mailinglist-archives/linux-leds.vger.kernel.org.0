Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3CA0DEC9A
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 14:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfJUMow (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 08:44:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37594 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728847AbfJUMom (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 08:44:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so12647762wmc.2
        for <linux-leds@vger.kernel.org>; Mon, 21 Oct 2019 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NCkJW8hsmdyLXFt6MhpHpJY81uuJvP6lUEoz3ZFYt/w=;
        b=ION8LIsvfEy5SqihAZKz7LKPRfMSL7i6m0aEyJki29pNZWbjKk5IQCX6MEmGEpqUcY
         5L+aW90H+eyc7YrYq8Qxq76oXlq2KQ0ybB+GYKjfDtZrVzKyb8ZAVtMxwfox5VhVXu4e
         KPc4VgpUhHqqgCdP74oIbZHVw3MIkmloiw5RXczIk0Et1UGrFB/fibdaR48SvB4pzDSa
         9Q0607kMFH4qSDLamWjbbYmbqvcuL6Sh6dt1QSjNRhQ114snxRNfxAl131lB1AR5G49e
         tFcH0mpJdVSBZesAxS3+pfYZHIctHKmrZBWbDNyXOuQCQ2iljgU6e6zV3LYDoHgsdobQ
         U6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NCkJW8hsmdyLXFt6MhpHpJY81uuJvP6lUEoz3ZFYt/w=;
        b=Li1sT3suvnJKc+n7aJt/Tk64ujD0pZTLFKgQNaMfcLqwrrTOMY71xGLdt3/rqwzkve
         R5hYzdEWqJ3ZnjeSe4FhpA2ElvquYZajxMN6sBGF8qVwlo38hreIm2Mr4jU8uPQ5RpQG
         iNagtCTSMUOfK/9drd53knXVYO4LnpM/nyktap1PZXKbsViKW4s+RcX6Jn4/F2+RKgML
         rfqmAmwWqKhrBT1oo7OBiXegZq5jkjzIpzDbCkROuP149r7a6DbP4u6ZGHnvJHaLQ5bP
         DH+thtB/7JAkKPrs6sNYDGMNpQIhBNQSny9twZ8CL8C3PV5mgcQMgLWXTVMKpcc7YyMs
         +hFw==
X-Gm-Message-State: APjAAAXoAVVkH1tJ90P11GW2WpQJ9Mp8x/YtfWYHRPOWR3bL2Qnoe0JG
        8oOT6b7W5ohIcoq8E0epbLZWaA==
X-Google-Smtp-Source: APXvYqx0+yUmRQS7ukveB8lxPxiZgZjPrOEofvzcha2EYE39MifDue4d8z23bg2kYvWFW5FqkLtuaw==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr6671242wmd.103.1571661881081;
        Mon, 21 Oct 2019 05:44:41 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id a17sm10216150wmb.8.2019.10.21.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:44:40 -0700 (PDT)
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
Subject: [PATCH v4 6/6] MAINTAINERS: update the list of maintained files for max77650
Date:   Mon, 21 Oct 2019 14:44:28 +0200
Message-Id: <20191021124428.2541-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021124428.2541-1-brgl@bgdev.pl>
References: <20191021124428.2541-1-brgl@bgdev.pl>
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
index e51a68bf8ca8..aba7de45a7ca 100644
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

