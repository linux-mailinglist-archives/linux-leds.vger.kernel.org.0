Return-Path: <linux-leds+bounces-6386-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387ACAF121
	for <lists+linux-leds@lfdr.de>; Tue, 09 Dec 2025 07:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C3B9301AA48
	for <lists+linux-leds@lfdr.de>; Tue,  9 Dec 2025 06:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2043F27F4E7;
	Tue,  9 Dec 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRAeg8LH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85227B4F5
	for <linux-leds@vger.kernel.org>; Tue,  9 Dec 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263396; cv=none; b=B1rgFMpPzIsyrrByT85B4c3+zFVtB8SvOWO/dUPoNkvzECt/o+sN+ywyeLjojQZ3DsZHspu+BXZX4AlhIwTxPJgRyDmNgvdeR6Paxp6P4pMklhGNQMyW0fr0ze9ux8ZEI9pXOM4q6V/trpR7VEJ0/kM/zzrfbnRb9gkh149E1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263396; c=relaxed/simple;
	bh=6iFRA45dPKiXNveZ1wXay7FvVPKi5iIumQ5qYPzeCM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiiInK1TtyIwi9w9zcsShPBeY+pJz9x9P6shkZfPX5ZIzDZI35sd806m8oVT+OYZ4V+xZ1EfZXuy9AHX3Kq+QpvCb+/W6YCbBZCPuiNiWPTYGLupY5sk/OMQ4WeFNIf2RirEyUqkP3qKeeWrZyrAvQTuPMM1Rfb/Lo2f/k7b8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRAeg8LH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so55552495e9.3
        for <linux-leds@vger.kernel.org>; Mon, 08 Dec 2025 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263393; x=1765868193; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHIRJtJwasNsdM3LPTiBUAFA6xA3CvX5kgG0LlrG2hg=;
        b=iRAeg8LHh5av5qRUAgYIXTyWApRzZvcL4/lwtwHK0NpPt0jqD6HiL06BYAmF874A8b
         ugqHAqTg7syPnWxNM1YaMNBLh+LpR9eWTzW7Z8Bs99et5Q+6HpGEGHOiBhl41NFFRXjq
         5TycuDZhRqFh1SGixCK+aBiZ8NHw7smimGWRfUuExNNA68vlLfYx4rRg2rp67A8+DZ20
         kf4miUEEWbQgTN50GvRbkwWJMwVq83Do5FmIXH4nwmwYerljcrtuBZZIh+iPly1Ttd4f
         QEqlM35pL0CA/HhpziNUAR7BH+jwjW+c/aJlLaE1TOVlZAbfDta+NPfzwUFFszdmPLmg
         b2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263393; x=1765868193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHIRJtJwasNsdM3LPTiBUAFA6xA3CvX5kgG0LlrG2hg=;
        b=BERWLUEz1rdgTQHXUtyiZaWKDP7+3Jvw0m6MBaVGi0MLyHPVzqtLR4/Pd03R3I9gvo
         0Rx8bz/CzZQ6ZB3WYHPCI6DXzFYplWQpc8bsKt7XsHiJ1ozoTFUhWYiG+9JFd742a6Es
         IB0qq6R69AJOYPLFRx1eXkSss9xYM3vEyS9kh2PO9e9RU57QF5b6y2En3CIuw5pikfx+
         9Wbg34h6+21fPMEuxU+A1FZ/KU1X6LWw6Ebm8oZhevqhXRuyTBqLe9CODvTrpYZTd+4J
         NL8LaQNWFWcMrD+WCbf92aNkt8wKifI8c9PPpc5i4yJmFzUD8PKGoaC+eBvX01S4Vfwz
         K+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0O8WSJYwuI1DCFMkss291Y9ak4IRQwNYAasHO27c1s8eUZwqlMjPLotlH+QJQlY6NZ8/nFpz92R6S@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXLyjLXgXbcar0vArg+5N04TERvbjxtWt/RC+3EZG1uWtN9Rx
	MuaItvY4YlJkWf+Qq+eWCl+OVRxVgFMMdJxe03jZ7EgT/ZpCZhkDu3QeCyit0AbA1Ig=
X-Gm-Gg: ASbGncsCGOy1f5pVXw3hET48nECE+onh8bLnr+Ws1WIjmX/z7KHoXOC9V1JpqhWwRRj
	L/90OA0KjSDelWRocDSqHJJmh0/16IdVQJSruLWyXSe8MbuwMmu7KKigwwoPvcYfXX8+XTXTOtl
	9+HDh9rg6/Ze+4KMEJERgZsTU2MFegzZMpdkwdMLrjnBZaUBRD/ivBTh015jVIeui4ga4EO+rt4
	rPlgbvD1jje0XlTYp2ibN/Pgq4uHocbSVgSirujUs1ADzt2e+7va5XqlNAJs70K1/g0XEYVZc2R
	Q/c/AGmCumYLQMAHbSAUXIrt2RtPluU08UEIqCy7RAcLk3/kVa2KKZM2IXHjylJKcJSIQCFyR7o
	b4WkEiNnW8SxkKTOll1km6lH/RqXH0Qsv4zhr3IHSPkR4hI0Qt3cY2KlGTZW1t5XWgAU4GAGK2B
	+wgpEnhfZTTUF2eLDr
X-Google-Smtp-Source: AGHT+IEUTCsh2YjbuWgwjA9kSB0ES+TnIdyt4FuUa3p/09Hcq5GxbqSJOTL2WUyG6So5dXKx25k28A==
X-Received: by 2002:a05:600c:1384:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47939df1478mr118585015e9.7.1765263392577;
        Mon, 08 Dec 2025 22:56:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da2e4c2sm9447925e9.18.2025.12.08.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:56:32 -0800 (PST)
Date: Tue, 9 Dec 2025 09:56:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kate Hsuan <hpa@redhat.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: rgb: leds-ktd202x: Fix error code in
 ktd202x_setup_led_rgb()
Message-ID: <aTfIHE_2-iKIrwqv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if the "reg" value is invalid.  This is unlikely to
happen in real life because it comes from the firmware, whether from
device tree or ACPI.

Fixes: f14aa5ea415b ("leds: rgb: leds-ktd202x: Get device properties through fwnode to support ACPI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/rgb/leds-ktd202x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index e4f0f25a5e45..3b7f2272036c 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -410,7 +410,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 		if (ret != 0 || reg >= chip->num_leds) {
 			dev_err(chip->dev, "invalid 'reg' of %pfw\n", child);
 			fwnode_handle_put(child);
-			return ret;
+			return ret ?: -EINVAL;
 		}
 
 		ret = fwnode_property_read_u32(child, "color", &mono_color);
-- 
2.51.0


