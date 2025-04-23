Return-Path: <linux-leds+bounces-4530-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 324FAA981F0
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 09:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FEAE7AF4CC
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 07:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD30027817D;
	Wed, 23 Apr 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sD1EDxSL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B3274FF6
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394848; cv=none; b=oEwpxjShkNPQUdBlPUSNl/E00iVX2uJPHptG/V1MBsYqbqZj4lkdXbbHwA7GHsxcE2/zoC0s8I1bwsYL/dfyPMPpUfwoyLGggjCh1HV6KmmuooeKQXsyift784txa9yqTfDv/9AG72RnXV67JH4RS1g4CNPbxzJMnZ6yvPyq9FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394848; c=relaxed/simple;
	bh=zxOjYTiJyy84RQtnZPalRY61UtBT2cLl+d5QqitJRy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYtrt+uxJgRjIuagfoVTg7QN/RrBKPz47CK5uCXcLMhAQCcmolZJ4PxYzXTWcEp8AYHHrFxHefIdP7JUoVaDp229kIB0bx7KB2n0mbGurkpNwyhLsxsVD/kISic73xwuLoOcIcb6xcHhyNaHHUb+QY9jSQyEMJiNH51gaKYsjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sD1EDxSL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39149bccb69so2813075f8f.2
        for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745394844; x=1745999644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awmpLsPRHTvySKAhJ2vpQU4oTjj4fckiHhE0P3e8Csw=;
        b=sD1EDxSLOBZMDiLk/qGgOMmAw1fNF7boSwGBkMJXDAtrD3ZP/qQ8gH9x/79R/7AN6q
         zWa1fLzuGZoV//mf8oxsOGL3Ui94T+1VCBTXjX7B66VqNTZvj5rBo0IAbQWdAkVjkZdm
         ZL3uzMYvoXbDH6YBr1s4UVPHiczQdccRY1r7/gGjC+gUXxxgRRLSwEUjPVDeVPJm8Sgq
         WZ48aPsh2uG6gb8KoZnI/VpkA/Cvdm0bWazt7ijzaoCYwsLxgK8GP1qniH5QpgVGV/vi
         hSf9NfY850pqB808P03DlEnDvx6tMJxB4hzoijudLXpOnSGQVQLTW6CRUpJZxMRGDsMA
         SREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394844; x=1745999644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awmpLsPRHTvySKAhJ2vpQU4oTjj4fckiHhE0P3e8Csw=;
        b=pjfLBlLO6tjZ25/IVR6D4AxWesngUKsZMEfyN0fNZru3xJwp4iYjp62JNBN+0YSCCd
         HUKMz1G9CDgWBU7YwsE3Lr1SxT9bDGJOL2Tv8/vF0eeLNJeOZb9M/urzKLLy19wN0Xa6
         BO6BGZR1259Qq7m9OzmcrKKE0uInBFH8aWrg3nEnjV/RxO/gXycxoL2leDnBrPv2P0Dh
         /LudEdBrCQjhbIpnyxGR8tQaa+upTOoWx6IqzHpVzkYkUz+Uruqzzz1jUA7KpmOEvH8X
         7pKePIE7FBbhn/bXJOOzwcp62MgwVXe2U9sVkludoLCk02U4qf74B/NIfUSPo5ssTXdH
         2Xkw==
X-Gm-Message-State: AOJu0YzC9FrD6xvl61ATEywQdv2tiECPZBKcmClYQP6Z+e1Xu0uzBIK/
	cfWMcGSwjt7vZTN3UITaeeTZ9MkIolYwSJPvrH3OUOg8igcwNdS/ppOJziAX//4=
X-Gm-Gg: ASbGncvfJ2cSrznvZuciapVBPxFk1K9E3YwhRjeTtsulaXI/aM4n5M9EMmBlMedLBYW
	jKInwEVdGY/kCwB0Qbt1+DVKTqM6K2hq6RIvSh0+W93wNiWPT8XXo/BmJVmua94mGonmswjUlzn
	+EStCqvGp2aitkZMl67IzeORTRAGqTBFnJhAGOal5VSddraj1b1yljZEEBDghh6QwVpknejm7G7
	BGT/60EImMLvL+Yqg7XgVYS3vvGmxrclxHD1CFgwa+m8iwFm7PEijvOwgu49UNP493k/hCttAkh
	XM18r3vQ8E3fqtI2Y3gmPuUDhcaS82clJw==
X-Google-Smtp-Source: AGHT+IHpJiw5FVvm/29U2iCX1LZCw0i/Nbm/maOexa2urIHeoGl97Wey43Yj0psGVkkZuo14ySAJXA==
X-Received: by 2002:a5d:5849:0:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39efba5b647mr15739927f8f.31.1745394844088;
        Wed, 23 Apr 2025 00:54:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm18266655f8f.33.2025.04.23.00.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:53:52 +0200
Subject: [PATCH 3/4] leds: pca9532: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-leds-v1-3-2f42d8fbb525@linaro.org>
References: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-leds-v1-0-2f42d8fbb525@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Riku Voipio <riku.voipio@iki.fi>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q4N59dzS+Vuc+KWJbtCOPhsNB+gdq0KgGsw4pEhqZY0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJyXc4I884o6/Xyc/tB3w4hoVI2mzM6RHhnTy
 h8HDxNzCriJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiclwAKCRARpy6gFHHX
 cmdJEACil87EJKYf+Q8ROqUg1EIZAdyX1ELY8HGoJKDg50NwtPybyVb9CryftIWOX/JNRLrITVb
 aGTfPVIOTPwNPha9yMuXqYqQpTXhaAJctQmIdudIfaTcYHXSeYtKixn37VA0h8hXaoZ8NVtaGuF
 clbey04B1txEdgOZgXv9Y/XcGdA78fAQoVitn7PG5Lg59qc4qtFElYep0bVF6QVMXn+WmmIvrJH
 j5xYt0FJGJ8cUUjNw/fhOOXV/XuYdPMpoILT9vA02uwgATbfjx/h7IjB22xsUXXBWcZCiWDDqJD
 iAJqABycco25U5TSpkJJYUommbclinDkjx4Gf41yIKblHRIf1z7Raxy2UwNlmHGj2wPqySedLHa
 /Or+31/FeHIvds4F7AK9v2ZJ0/yRfeAqC0Ev0vuSNHKlsMiKXy6KgAAQPDFO1BMZsyXwvDQpB7b
 TQUCNdO3xF7C690ep9kQNJ8mWpLovYUlMgKVD6+L6M3TmUt3vac26UQP26+H1wt4YDBigXPNp8d
 TrfFRNTyuWZUbffroo1Z3kolwGlIXnGldSOYKwdPRoxakHKI/pMc6R/W0l76EG13XpD7XEjs/su
 zUNSqmIDVG20uzcIMAQhIIr8mLeHDpsNS0hodQE9VXhaU4UGI5LSbpkC9Lh+XSBxc2/opu5CkJ9
 F7+HOsImPhA2FDQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/leds/leds-pca9532.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 1b47acf54720..7d4c071a6cd0 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -318,7 +318,8 @@ static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
 	return -EBUSY;
 }
 
-static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int val)
+static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				  int val)
 {
 	struct pca9532_data *data = gpiochip_get_data(gc);
 	struct pca9532_led *led = &data->leds[offset];
@@ -329,6 +330,8 @@ static void pca9532_gpio_set_value(struct gpio_chip *gc, unsigned offset, int va
 		led->state = PCA9532_OFF;
 
 	pca9532_setled(led);
+
+	return 0;
 }
 
 static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
@@ -351,9 +354,7 @@ static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 
 static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
 {
-	pca9532_gpio_set_value(gc, offset, val);
-
-	return 0;
+	return pca9532_gpio_set_value(gc, offset, val);
 }
 #endif /* CONFIG_LEDS_PCA9532_GPIO */
 
@@ -472,7 +473,7 @@ static int pca9532_configure(struct i2c_client *client,
 		data->gpio.label = "gpio-pca9532";
 		data->gpio.direction_input = pca9532_gpio_direction_input;
 		data->gpio.direction_output = pca9532_gpio_direction_output;
-		data->gpio.set = pca9532_gpio_set_value;
+		data->gpio.set_rv = pca9532_gpio_set_value;
 		data->gpio.get = pca9532_gpio_get_value;
 		data->gpio.request = pca9532_gpio_request_pin;
 		data->gpio.can_sleep = 1;

-- 
2.45.2


