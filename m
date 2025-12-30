Return-Path: <linux-leds+bounces-6509-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 425DECEAB58
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 22:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D2DF3005304
	for <lists+linux-leds@lfdr.de>; Tue, 30 Dec 2025 21:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644D120C488;
	Tue, 30 Dec 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x2O1E5NX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F01DFE22
	for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767129756; cv=none; b=Rzc47w3+2bswVLz4todlocmid2pX280Z1KW9rbM6lSH9XeBfxkOieCYqg61TGO/Zm7TBRJ7LnVuxUBmj+6ZIGdaomkg9HEhYqSOrgJhds7XohMzdhufJj26mlN9kmGGQ1CWmWgKpVs/3uSlyPwCoAGuMAWP3opl9NuSq/JGUFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767129756; c=relaxed/simple;
	bh=58nJL78mZb4L/r540FIIGmpaC9+0CK1OZCYFmquRRgI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gnoQ1x0kZ4mVIMjcrmw1crLEhsctV+jGf1UobnOUxNg1p5EFFmbMdw5+B4TAJKpt+PUrL9fWkZYIIOr6s91QSXDfZMiVwkHDMkuKlFqUZ20h9ZvaHCkCcEM5KgJjbfcgt3Ws87EUzwYWiNAIMnCC1eA8VbbJFZmguzmtIVl9OoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x2O1E5NX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso9803966a12.1
        for <linux-leds@vger.kernel.org>; Tue, 30 Dec 2025 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767129754; x=1767734554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5fjrjqtIG0QKNagwrK1D4QB/QYPJKmvCpq/Rsho6vIE=;
        b=x2O1E5NXYTZeWp3TyHxkgBFrZwHtBdN2gBAci3JrXExEplCu3uQUvuEcgXgERmsjuG
         XaiaDggUPW7dv5vX1bmqv4Ku2y0QdTGe6h0ZDrt+j45OJZ2oP4PPqeBBd3ASlZyzgZZc
         fdEAreNImsaxCGSLvCPyD50ALycysKgUKcz3Am25+8S4+Tr5q6wmje23vxYz3mkp1DYT
         cC2+XukUXXQxj/5skv63Cw9sDMgcpDTlFg3CddXklBp/MKnUCMnJlYO/bADa3jyVC3xt
         UD5l53oh5H86HzBpsEtBQ0PqNxSf+4p28IS/VnnbtxitiXt5+BkKLzv8TA0mYJwKi+dU
         MROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767129754; x=1767734554;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fjrjqtIG0QKNagwrK1D4QB/QYPJKmvCpq/Rsho6vIE=;
        b=DGLWoOz5sTl6qHnKuQ2HqXLJDKiU+7beZlrFqEe80SMyC429ONmbnsWGLHe2brzknq
         UvnDIuiC6Xsk7fHBaZl8gZSl4Y1Dyr77PSxnY3bzytaeNQ8s7OLX+ZasWchQGezL3TVw
         vDe8PqubFyQW6PouIb4z4A68UdTPQoqFVoijsldKoWLolZuGJ7/+LfU7jucPhMbwoBS0
         Ps5Gr2b4s6t6wdCDJuWb9okWqDk3lzyJPJzFVh5gEdM6dCyQqTtD9WqSxAhUcKKQnlna
         dszEsEzGu2KWmnW707E/y78zA+r6O3PwtU2NWG4YPFHg7ejllDU22Dsw5XdH6wKLSzJF
         ES5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX99JpDvWGHl8stbSn5KOS8JQs5AL5C3TVGMEUedlZdU7TW9eRMnpZ1FP67g3fEltY/fPNp7o2OgXx8@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgHKpz1zKnvh/YycN9Rc27JRy/5/OizamMMV9UhYO8QL+TPz0
	UUlT3LjJAik2zT+nvuWnGLn11/G91qehHwujtloJ8pyi8Wwz8THne3gcpKYsjGnAE2sa1Gpr05k
	+pX0qgJM/HQ==
X-Google-Smtp-Source: AGHT+IEGYlPL2lA3yZE2BJr8FDY5hZZaHFraBU2esJ2otmtbSZJsOry7w/7+OxDNE0gYz41t/G5o0K+mvzdR
X-Received: from dlbvg4.prod.google.com ([2002:a05:7022:7f04:b0:121:778d:9d5f])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:793:b0:11b:95fe:beed
 with SMTP id a92af1059eb24-121722ebc89mr31751249c88.38.1767129754008; Tue, 30
 Dec 2025 13:22:34 -0800 (PST)
Date: Tue, 30 Dec 2025 13:22:16 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230212215.1613954-2-ynaffit@google.com>
Subject: [PATCH 5.10,5.15,6.1,6.6] leds: spi-byte: Initialize device node
 before access
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


