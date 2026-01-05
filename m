Return-Path: <linux-leds+bounces-6523-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C0CF2867
	for <lists+linux-leds@lfdr.de>; Mon, 05 Jan 2026 09:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E464430024FE
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jan 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC246328611;
	Mon,  5 Jan 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpOFaPPq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E3328271
	for <linux-leds@vger.kernel.org>; Mon,  5 Jan 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603092; cv=none; b=jRvb7uJUAd4fBTDf6UTvCkDZ7/mhIRsf2RVDPVch0k7sBfB9kdVfyoTNpm/VKJDxfrB+tJ7jkk0A0WTIIsIGwTWOUgHx9PKygOfhSKSRj1rD6NKTtUQKzSa/cRqeRkAX3iqLyhQl4Rl6goxychnbrXfeQY8toa63RnRJNAeolgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603092; c=relaxed/simple;
	bh=itcUwean7UbvHQ+5/h9YYVCyXLTIelI0ikVV2LFiJKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bmb1tw0uk3q9FjSApUlX3ZWKFzJulfR0BGFzuy/+jvYEe9w7ACc4mCIcjLMeYhl3UKtSmWtCuwpy0TxOjlgQZFcsCiMQVy+zCWp0JZ/BPmgrs5lnBuGgznspycll803TqzrQ7iODk54648wE4jaEwfxYkrjsEd7Ao8Tb9tGhYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpOFaPPq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so14678454a91.3
        for <linux-leds@vger.kernel.org>; Mon, 05 Jan 2026 00:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767603088; x=1768207888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl3uiFs67UDa8ZibSp3TCnzqWfwUKgTkl0JL8TbUXMo=;
        b=MpOFaPPqKVIhWdfLkv4vdHBUR3WuxizQBiP5B0Z00bxZwyoNaTdCxq3WmFg6dD7XHV
         jDhpQlg/t579Q+hdNtp47fq2M9mOPAUlrrCqYib0wSbSRV+y3ercv1qlovGCzWJqmVzr
         RsE1BF6K8+6MzGNCPEYSse9infsWRNhS4BSKW/R4xCuKnmTIcLL7OqQJLQxIadsTUPhy
         2RNecOFzuiTgVZQOVGmgRy+DEKlATpMCFy+7Qns2MUfua0a1J1TxRsoPIghnCRsx84qT
         9SD1R1rVdVg8Ij3acN8RvOA8kbEuTiXWY9Vw3lj64Jx3pMO1+mJFVIpXT/igN2C9i2p4
         RVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603088; x=1768207888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl3uiFs67UDa8ZibSp3TCnzqWfwUKgTkl0JL8TbUXMo=;
        b=Oulvxa8tNtnc7obqVXTb09FOrcAoeDD0q+6g95W4G0jPJ3iENVBwmJc3Ozd67dGNHQ
         4NhiSX8GdBEHG4YpU4Jo8aWk6hD7iTXaxg6uEB/p0IPsz7n2wPaQ9J2r8Cl4CLU1Yfof
         6Zz5Rs0dyahWSpzJ7qe1TaLm+JWr36o2MqH+QdRxu+F0w0PiWRQr5z4eqxLV9RHw5LB0
         L7pIIFPFZl+NvxGQWL0MJc6CvS+TWMYOQ/RfdHKdAAWt7Ej6uRUlwCy/zQza2zQztcOz
         N/fZ51BpHHzNjUHRr7bqcCrf/EdBp+tE3CKjnpLmSnEXvjo0/XGtFMn4HheJ/zOgbC1D
         3FOA==
X-Forwarded-Encrypted: i=1; AJvYcCW/xrKh7Vko8VXDsXlk0UQ9mqQiPNfoP9CR5/nhN0euVSe4l8AvWqkK/6X+0CKADfHvTDcS/PrsmCJw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69/iZeIEslqCv3e6TAJRrHNTIov1U5e7Z6yyMgjVgaD40EMdE
	DV9uf9T+KyzEwLx70pwo7Ce3tGzLWDKLUv6h8/50OrRKfhfB4VixW/eq
X-Gm-Gg: AY/fxX4WffpKLDw/2EVwV3Jr1/85O3zQowugAF2eqwo/EgpqOWWrqDnsoCtDa+18V9D
	sNuIakh7tOsUMX8FaqHLS0BAB5UaCmeMfJjV0QHvzPVkRDBfrWh1mLztAiCKyEzes3alc7k84pD
	k0oufg8A8/g7zDqrOoxM6ZLm94mEVkdoOD0cZNlX7CMR2rzwV7/bqc7hTCh9TYem/QqLP3I/Ys2
	CexoD7DvaiS5rwgKuTsojM+W9L84tf3BttnFVdEzFIXmZoVTCJNs0rHvzHyggVMrG5iz+w1pJW+
	YQdeKQuPqwpxXmOnwhjeHnDdxdpnBN5A9av5KU0J83z7REjppRkqiGXSWRbZjHz/e8zyKeNo34q
	FXhxEUQ7Rt7yq/Te6dwKnZpNoXRPY/aGUwdL+F807J7ezIHO37HQB4kdqv5jL051/0M1dexaCy7
	eeyrtovY3c0t4AjwI7JebPdIYpb83pZaxy6ay8
X-Google-Smtp-Source: AGHT+IFv5GpgGolY+Hm971OnXPqumtM8dOJ/xZWxT5pLM3JhzOyMQkgCUWKBDEgNNeae53lKPk0A8A==
X-Received: by 2002:a17:90b:2f05:b0:343:a631:28b1 with SMTP id 98e67ed59e1d1-34e9214e781mr48976231a91.16.1767603088314;
        Mon, 05 Jan 2026 00:51:28 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476fab12sm5631951a91.5.2026.01.05.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:51:27 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v1 0/2] backlight: gpio-backlight: Add support for multiple GPIOs
Date: Mon,  5 Jan 2026 14:21:18 +0530
Message-Id: <20260105085120.230862-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch extends the gpio-backlight driver and its Device Tree 
bindings to support multiple GPIOs for controlling a single
backlight device.

Some panels require more than one GPIO to enable or disable the
backlight, and previously the driver only supported a single GPIO. 
With this change:
 - The driver now handles an array of GPIOs and updates all of them 
   based on brightness state.
 - The Device Tree binding has been updated to allow specifying 1 or 2 
   GPIOs for a backlight node.

This approach avoids describing multiple backlight devices in DT for a 
single panel. 

Thanks,
Anusha

Sudarshan Shetty (2):
  dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
  backlight: gpio: add support for multiple GPIOs for backlight control

 .../leds/backlight/gpio-backlight.yaml        | 12 +++-
 drivers/video/backlight/gpio_backlight.c      | 61 ++++++++++++++-----
 2 files changed, 56 insertions(+), 17 deletions(-)

-- 
2.34.1


