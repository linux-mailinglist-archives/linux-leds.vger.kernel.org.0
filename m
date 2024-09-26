Return-Path: <linux-leds+bounces-2826-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD5987BA6
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E362869BE
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19E21B14EA;
	Thu, 26 Sep 2024 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD0y2voO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40001B1420;
	Thu, 26 Sep 2024 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392889; cv=none; b=aq6XAMDy3vCvC/T5/U2EMKo++Md/tYdx6PdtAa4bJkeU7SywxUlGJu0JUdSvyz8fRSTp1GrKWeIJ4LYR54oJYzCPhxbWyOIS6lo9rWfJ7lYkAM7pYIBh5+mHjZD0vYqXpywzEEKozTH8ASIlKU/ZRUXHhh8Ac8vo8zoOynhjhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392889; c=relaxed/simple;
	bh=d0/jBZeOQ8xCvysG4yJkfCKJi0DJ8XXoa660caQmywM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CgGk8gBxf00OW7Y0Kqt9QdEHMn/ug8fNs9e4awideoa82z94ZntrIDzgTbMavBkAaadLTZ0Z9FUGw4NeBtpTEGHd77ePj63eLVuuH4RwGThOXKVUitZ+l9R+9T+2dNG2T9j2VguUabbUJQujIX7AMUWh/JGbQqNmmtm0TeVKG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DD0y2voO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so1578568a12.2;
        Thu, 26 Sep 2024 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392886; x=1727997686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=DD0y2voOIVN588i+EkmjXWPYyCxbY+5XI0z52AD51ejDqOHqPqMGxFdLdLGprFoBhr
         l8W+Vn5qsudKD4EOf29+IV7ZI5G3GNTc+GkxUr1Pmw9ZuDtcaeL+Tke88vgi2rU7h3D6
         EegSt+HZbBUqrfDhhz4c02yX4SVKTk2ISa4GB9hM+XTzX5KA66PBL/fxmKaX+M7p4QMX
         fTfz8xMRmbO9m4M0qVRq960d+di70lF7z3DCCGchpDYw6AH1K8ANp+gtsKpYOXcLtSMl
         Je6qMX0ZCeSE59KXfh2HnAKNSjg3Q0qLooN+LHwCD45iGuQ6MM9uXswVrX5UxEPqEAEw
         5N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392886; x=1727997686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=bh7GecA7BwEwQ6WqFAFwRtOmUVisTJA7/C0t1y/uJIwUO0D+4jb9dBx4j8rEet0WKo
         jBipMIFk695l2WfZmFSv+bQ9Fo13Cy+m+rLfDz2uxQVWkLW4Dy4YO1lciakXn6MlntKx
         XbjB0RFxujbp1ZvwfFXVdhbLod/u3Qp8ubO9E+IZdy7PbBhE6rV3x5mG5KOrEdehhtI1
         lqtRjV0+LacW5mpIba8IHXvzAPGwOPX9jaxs6WM2oyA1g6tR+v60C9+aoOlhfdykXGvL
         cO2XwT4IFDgVihAvFLosQvD9EjezlutTjN7jdZghwVUHFwMf64UFmweDvdCEUfNgoyR/
         j/qg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5yOjrXuyyosi903gZvl0dORe2bSCvqp8KlNo53cGjlgVkocsEn0yGooQ5GxwaHrItXoZcVDpnJXXAms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UBFSi/YOvXX4F1x7icT3fu8dOQT5DwPzzFFe4t/ZeNtQNKYf
	ZsEJANnJe1OTJyHfveYW4QaUJZCqAqTiuTnlc3H9sEebu3jQnNHg
X-Google-Smtp-Source: AGHT+IGEbTyX4azDhptvTAbyqHSfEzTyPNNE/JgVuXwIVkiF6dJaxNfrq6Yp0EW4PANwfpfda2QaAA==
X-Received: by 2002:a17:907:d14:b0:a8a:83e9:43e2 with SMTP id a640c23a62f3a-a93c48f926amr75943566b.12.1727392886119;
        Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:55 +0200
Subject: [PATCH 04/18] leds: aw200xx: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-4-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1474;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=d0/jBZeOQ8xCvysG4yJkfCKJi0DJ8XXoa660caQmywM=;
 b=tR0vcqDoOSP5Z2owKMnAB9bhX8x7lqHl3M+byu6E1aArGwC6Yf4PxLgUabwsOkMjFx/oaq0zI
 VzAnF+19OBbC8V0VBuGNYGHfa/Q/kR9spuC+zWidBB4bco6IBrAZbCS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-aw200xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index f9d9844e0273..08cca128458c 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -409,7 +409,6 @@ static int aw200xx_probe_get_display_rows(struct device *dev,
 
 static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 {
-	struct fwnode_handle *child;
 	u32 current_min, current_max, min_uA;
 	int ret;
 	int i;
@@ -424,7 +423,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 	min_uA = UINT_MAX;
 	i = 0;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		struct aw200xx_led *led;
 		u32 source, imax;
@@ -468,10 +467,8 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 
 		ret = devm_led_classdev_register_ext(dev, &led->cdev,
 						     &init_data);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			break;
-		}
 
 		i++;
 	}

-- 
2.43.0


