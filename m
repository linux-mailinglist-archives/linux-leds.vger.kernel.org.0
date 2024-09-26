Return-Path: <linux-leds+bounces-2827-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E3987BA8
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12575B220A9
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD911B151E;
	Thu, 26 Sep 2024 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux+DkKbV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4001B150F;
	Thu, 26 Sep 2024 23:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392892; cv=none; b=Mf1kryW2XuNzr+64tVNoOao2sgdV+WOuNnjMqYVIwbanKe0IaHmQ8MrNc+e5hPuBltT9zombNpbscaO3jXLv8Ly81fsZ4iV7lrwQjXPDf965O+EB5A52XlJEYsEeec6CjkkPYYC2LMBwJpsH2qQmoazAGn7TGRe/Pwkj0d7rWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392892; c=relaxed/simple;
	bh=ReP7Qr/J0AJ2qUDKb/L8HtY4TnwQiLgJ9A1DOQKpN7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDAJ+74NWCZE0R/vnwrWMHe+bDfqtvWaVKEe4oG/L9IcW7eskeJAib6F72ZRdWmxP2NsPvb1meIgzrQfuL22fNP4LJBLPSVbqi963MfUuaXV6+n1YLWcCWDEQsgrD3l716XN+9H0RY5HEl3bd0Fyg8evZucm3/891jJOM8jR0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux+DkKbV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so244089066b.1;
        Thu, 26 Sep 2024 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392890; x=1727997690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=Ux+DkKbVvzno4Gm6x8XdNYwXvk0Wfy48f7bKF5Qfozszl8ckpIOW5drtmQycjnqY67
         V3P3s0yWBgtmb20+sH09amo7Bflc41OYQxAgYL5y4YOgPjitBU/S5EMjTuS+P8Sm7Tz4
         V2TG1uJ0GKH2ATrwMpLn6RuzobWOqOrRxBmuICVOosRGdrE4E5F5wXTJ+T34paf0Q2TY
         3brVqDZoIVTayOK0tYqH00u6CNR+ISga0mEl35JZmpl5E7wW9i/CvQemij0vzYXdOeuP
         guSPsZ4wsIeSayy4//c6cKscy6u0LnT8E+FhOlAwpnl+q5IROq1GUFI0XHeC8GVNB5M/
         Z2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392890; x=1727997690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKtvZEPDH+fIZPKBCRGZ7MZSFbm8PGwqKLmwiboGd/E=;
        b=gUd3xKP8QswHmphD/cTB6riFtVjryl2MGP+m01JiTqL4bkEmG95Pm2nsCCtH2YJnKi
         Fi1JDVdgejB5p9CuVEJ+5ebM6glOwbYkNZFsZdk0aSKMCXQc8JDr5SOE9q0KTkwSUnSk
         17vydFv1OEjqCDRMUOL6DFvpn8T5iIz1SmOaW7lrpqMa6lZWMtFzLZNCUbhnXv0+9tYq
         yqTIDdQqPaAtC+vYDBkd7mehzKSDjqwP5dPUJ5u89tdMqobfeqZDf9gkk1SIBzZIyRvB
         Sc3jRoJdq1pzxNBQ4JeoG2IbUkijB5q7UL0MxVBfzYwPwcIeV0DLaACGSwFtOjkyjRtq
         fvRw==
X-Forwarded-Encrypted: i=1; AJvYcCWrN28YF9PrIXA7gYYj9mj7H8axy53Hl32Ri5TW5WzmcCFq9+CR8tX0qpSTiSb0/kni52w4T335X3TJFIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxkZoZ5FFhWWv0x9JlXLzeJyXwCByciuwwbEGNTBWVP9hQi6pJ
	4is6WkQwfb7YQ1wZoyHMp+/XokkgKaZOi+VEcCKN/qxeKuFWqiJw+WklnZ/8
X-Google-Smtp-Source: AGHT+IHjxclqmwCts53ey2Mkw8lOf7cm6f6r/L5Uli3GTjR48O81vxvj6U2y1w0YBmydxDpTTVPPDQ==
X-Received: by 2002:a17:907:6ea4:b0:a8d:555f:eed1 with SMTP id a640c23a62f3a-a93c4946d94mr84366166b.31.1727392889478;
        Thu, 26 Sep 2024 16:21:29 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:56 +0200
Subject: [PATCH 05/18] leds: cr0014114: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-5-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1242;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ReP7Qr/J0AJ2qUDKb/L8HtY4TnwQiLgJ9A1DOQKpN7I=;
 b=jAh+BzDwMT0vn09JLTdN0MvzxhKKOiSKKW8O/GHNIet44fgm7ZR14Rvbw3/y5IEMMN9dMTqL7
 Q05KmODqeDkDJyq7FeIhBaMWdt9zpVsDxf2x/EqmSbBsNmsdTzpoi0R
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-cr0014114.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index c9914fc51f20..7e51c374edd4 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -181,11 +181,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 {
 	size_t			i = 0;
 	struct cr0014114_led	*led;
-	struct fwnode_handle	*child;
 	struct led_init_data	init_data = {};
 	int			ret;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node_scoped(priv->dev, child) {
 		led = &priv->leds[i];
 
 		led->priv			  = priv;
@@ -201,7 +200,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device, err %d", ret);
-			fwnode_handle_put(child);
 			return ret;
 		}
 

-- 
2.43.0


