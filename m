Return-Path: <linux-leds+bounces-6510-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE1CEAF8B
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 01:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CD453006E2D
	for <lists+linux-leds@lfdr.de>; Wed, 31 Dec 2025 00:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD721B4F1F;
	Wed, 31 Dec 2025 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kol/M04V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3F7A13A
	for <linux-leds@vger.kernel.org>; Wed, 31 Dec 2025 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767141926; cv=none; b=rC7tx6o9UprQcz/9yVZ8oihdaXxK/zVJH6zdccHsVz2lodDQZ1S/yqddM9PY7I+0s/5VbmDFmvtXLwkgopNfID9Xj5AGAm125eR6/lFjYXkN2Bqe4S9nSBrt/t9UgcEahcOQH1pJH/1kjPMB0KxbU/U5ioIhz5iOw8Sa6TxrgH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767141926; c=relaxed/simple;
	bh=58nJL78mZb4L/r540FIIGmpaC9+0CK1OZCYFmquRRgI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VJ4xBeHk/aLxpGlTfpAbfW0glRJpG90UYdYPchbVGVM4rhSmcjjJwRkXqrFq5BH1oGaJd6IqMFLZsXzgxxNzHjqo9PuxeFffsxyPV3qI32mTGA7c/E6cG0gG13w/xsSW74NK+hr2FJyfnx7K5YxSviBexk92eDfE//qoUMF/yuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kol/M04V; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-29f177f4d02so235576885ad.2
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 16:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767141925; x=1767746725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5fjrjqtIG0QKNagwrK1D4QB/QYPJKmvCpq/Rsho6vIE=;
        b=kol/M04V0q5tjuz+SYGIyhLb+6zo03x/oSOdkwxJHdXyj0rx6pLjMesrws//FbuBf9
         +k0MO6rUHvdka4D4bBxIVS5nfbALCGcUZw/OgZ7XHZaTQCkxBZtNubOTyFFcUO/TqpWH
         lv2HgAQCNW4mqxjmwEVqOLVOWkZY6V+ak+SnMYG10L9Xv/ajLFeIBtMkPhoLJhv6Bhof
         u3LDfg/+EXvgNA/+6gXurq14akzzlDGVLxr7iwx6fN/kdWKtuWa2HJSD9hKmrDR3vq4w
         fgBf+nFocXUrL1XUKLpEfen9EUPn1E7uHHDmg212TT+T+gqNKewltgkc8pWvI02//e2/
         zZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767141925; x=1767746725;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fjrjqtIG0QKNagwrK1D4QB/QYPJKmvCpq/Rsho6vIE=;
        b=qt7l3wmoZikP5uQx5YxnVbxebZI/ROR0t+EU0Tt05igNYFvEWQT3NmVSn50yQcxw0W
         3Jb6MyoTuxrmjAxPkLTMsdU750joRP0nwkGtTvNvyO6DDu5EYNbCjAoAtCLRuPZB7qBN
         UQx7PxQjZicqUk8Isha8UioK/ZIgueXsL++HUqz03qedhRXsferOikxKly6HxHzoSp0l
         ybAItREz/f3PYqeGArS60WcO0LhftdIxx+xCKRUZM7RyzAaOeApO4MGUrAinCdTKcqF/
         hrYdpx3IaTh8ge+XWYo9LyU2uOCzZka/mVf5VXAv8bluYIZmI2VQZ+kfIl9IiBp9OQ18
         WU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlkNs40hVxWPY9EZ+jY9nqZEBlYMI0WJwvk3helGdoVl2WI9jy9Q+Ag3V2JM2yaJ5PT8XpB5GTrQkR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FzSdtOXA+e3dDIXrOCAdyEy9mB8cYHyYvnkti3MnSogYZ+z/
	UoKpgZ2LO8DxEXl/IrXgZXD94BdQxvKSDK8zw0Kkp8NsQH+G1tlpDmoD7Gst8q44vroKwLN0ewi
	mcZuNdiGiYg==
X-Google-Smtp-Source: AGHT+IFzEHBCDGH6fIW5fQdRAN3RJwqMBy9/SFw04+KiP5a94waiEzLW46hMtUUrlVdXoksytpVnCtihLWua
X-Received: from dlbpy24.prod.google.com ([2002:a05:7022:e998:b0:120:5c35:c798])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c06:b0:119:e569:f258
 with SMTP id a92af1059eb24-121721acc08mr29050254c88.1.1767141924735; Tue, 30
 Dec 2025 16:45:24 -0800 (PST)
Date: Tue, 30 Dec 2025 16:45:11 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251231004510.1732543-2-ynaffit@google.com>
Subject: [PATCH 5.10,5.15,6.1,6.6 RESEND] leds: spi-byte: Initialize device
 node before access
From: Tiffany Yang <ynaffit@google.com>
To: stable@vger.kernel.org
Cc: pchelkin@ispras.ru, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
was merged in 6.11 and then backported to stable trees through 5.10. It
relocates the line that initializes the variable 'child' to a later
point in spi_byte_probe().

Versions < 6.9 do not have commit ccc35ff2fd29 ("leds: spi-byte: Use
devm_led_classdev_register_ext()"), which removes a line that reads a
property from 'child' before its new initialization point. Consequently,
spi_byte_probe() reads from an uninitialized device node in stable
kernels 6.6-5.10.

Initialize 'child' before it is first accessed.

Fixes: 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
Signed-off-by: Tiffany Yang <ynaffit@google.com>

---

As an alternative to moving the initialization of 'child' up,
Fedor Pchelkin proposed [1] backporting the change that removes the
intermediate access.

[1] https://lore.kernel.org/stable/20241029204128.527033-1-pchelkin@ispras.ru/
---
 drivers/leds/leds-spi-byte.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index afe9bff7c7c1..4520df1e2341 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -96,6 +96,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	if (!led)
 		return -ENOMEM;
 
+	child = of_get_next_available_child(dev_of_node(dev), NULL);
 	of_property_read_string(child, "label", &name);
 	strscpy(led->name, name, sizeof(led->name));
 	led->spi = spi;
@@ -106,7 +107,6 @@ static int spi_byte_probe(struct spi_device *spi)
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
-	child = of_get_next_available_child(dev_of_node(dev), NULL);
 	state = of_get_property(child, "default-state", NULL);
 	if (state) {
 		if (!strcmp(state, "on")) {
-- 
2.52.0.351.gbe84eed79e-goog


