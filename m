Return-Path: <linux-leds+bounces-3711-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0379FDEC1
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 12:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA71188243D
	for <lists+linux-leds@lfdr.de>; Sun, 29 Dec 2024 11:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9918C17BEC6;
	Sun, 29 Dec 2024 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWOh41HU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183DC172BD5;
	Sun, 29 Dec 2024 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735470859; cv=none; b=CkIJge5lRgCvun8KuPQzJc8QZbMqTS79l4JUiJCcXMT8pSUYUP2eiR1YqVXvmzk+kN96y8tyOhH2EIO96VCNMFlxAEgJBe+mmNFJBYOp/zHqgALxXsJH0l7OyFB3N+34hXwCk9Rx0Ygv/qWreA9ZiDslTb3HyFRj+qEN0aQ9CvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735470859; c=relaxed/simple;
	bh=YYeDbhIsCX0ErJFbadBI6Svg8sUwSIAIaRJnDZ+vcPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxPC8INwmtZgEKXnF6EPR3iJ9/Lb/AD3XpWeXWWLRjixBgw4h9Ld+msTve/RqTEg0dvwNsuiQ1KiOyNu6b1kka0vAjhXz7qWNhzcZIOCr+1JQMi4DqTjb/ewYOO4F/URXW+Xnc1+MYFFK4GivV1kfPfIufmJ2r/nsZDCH4+pIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWOh41HU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21654fdd5daso100430185ad.1;
        Sun, 29 Dec 2024 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735470857; x=1736075657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=lWOh41HUYl/tr9k1VTy+2B83r8Z8sLC6gr/QdYyg508EqjYX5w3AObaXgpXdR1eO8J
         70Y6/kM1k8uFgmJMajFakpw+DgrxxxCxRRZjflqtJx2kIjkJNn4PQgLlrbqG40u+Znr1
         hxT+ywR8HmaXKtnQ2QIuYpPksC+sjvL92bPgRTG+OXSqn49djhTvgWOn4iIEba2NGDV4
         Yv5c/kTn+on7M6+6XpPfzm/yREW7GIcDjDxyjClazFy5j0Om1wbC78fhGV1aP9Tf/xz3
         GQ0c47HTMr6YocqizcXHLoCWv7s40/4TPPwZKFayiEPkvofSKPS1wIC8rFo6hEpkBbhi
         sE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735470857; x=1736075657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9J38BNMU1Uzv4f7FCoN1Yfwc75lF73CELPPui56iYw=;
        b=kKrIu1zM2UkFUNL7+jTpueesYQ1tpzbQdS/IgOAS5toa52aaebDG0ct9NwKzzjGk0e
         OdPdPGnd/m5dXN23BVQcycC71d8BAFSQDSj2NHKerl7q79n/F+eEm+S14r/l1FhuXHRh
         NOttM8Vl4hHXK1cc5wnYGsecLKCj5V2V8aZD9LqA6IyGhQRC7r3xdcbLSgb74GpJ35fK
         +mL+ibzTJf0kSe/FQy5XeuXaGjFiJFtFN0yv/RFCsskpX/DGU2N3qFlbBZySBnAoWMnd
         R9rw/lA9WKxN7uu6B2qBnSQDVL3aQA7swFpr7w14H7G+we2VO5j0nJXmf9hndkIA6bPv
         xHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3q7h+E/3WES9GfN77LM2MsNAUMGmtaMAeSUWzXdYC4K+tQV7/atz+Z6kpcf85rVufoWkA/aDALRQj@vger.kernel.org, AJvYcCVqWPeTT1gxWtSISwCKg5H7GDfA9Eno7PfJNmSVUEjKBh+vZm9HiNKTJ97/2woMWyzwTXB2lOdDVO3iKZSC@vger.kernel.org, AJvYcCW9cJC9D74mff2VW9yLWSFOiTJUTBoSTJ3oennuVZkdvepMLkdNGNub4bwcyM13LsUNzn+k1wWFwT0Y5Q==@vger.kernel.org, AJvYcCXdaerqE5HDNCcqEW1JqjansfEMwLxpSRRrFeUG4TqOC8goLdOcQx8BGySR5jSsALexo1a4Z+1DUfCaiG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUiVNXdgDdvsYJwHd61WMhRq6zM5bXAAlGc94VwiaECmnN+8L
	nAyfnfYUlh8ba1NVY4Rl7cNtBRMWwVt5OizlOus0XOGhUfRvVDWM
X-Gm-Gg: ASbGncsFAWbSMY1PaE3UdH5/+0N/5Jdl2pnomE3rVdjuSqj317rhBOYWJm0PfNhNPw1
	Ey7585DEaZSKjA7TTLPdf4puJU+KTkbL7DAKw7ZINJ9y4yIJzP3dBCIfs7Svg/MF/MtYwzIBx+i
	yBMbMOIMVfOrOG1+QBlub5VY+svAKpdZ7FwUloLWRnvAItrLVGWZ9+aRtJ4qusmr0+Sj0OJMzqQ
	iLg2QTwMd8V4PLUPqHWIYhRZROlcnxPHDjx2GjAMRq/ZZq4+OkeRNMptg==
X-Google-Smtp-Source: AGHT+IHj1y3F1X3HGHzS3Px3LuQKUEyT2NVI7IfSKzHwkiIrQ3sJyJpJf3UtrIia+cnNqjNTX6LRiw==
X-Received: by 2002:a17:902:c412:b0:216:4972:f8e0 with SMTP id d9443c01a7336-219e6f2ffb4mr459732985ad.44.1735470857377;
        Sun, 29 Dec 2024 03:14:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 03:14:16 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 RESEND 3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
Date: Sun, 29 Dec 2024 19:11:19 +0800
Message-ID: <20241229111322.4139-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entries for the driver.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 910305c11e8a..54a6c8ca7017 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2196,6 +2196,7 @@ F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
+F:	Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -2221,6 +2222,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/video/backlight/dwi_bl.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.47.1


