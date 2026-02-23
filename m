Return-Path: <linux-leds+bounces-6994-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIvjLTr2m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-6994-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9C172373
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98197301D4D6
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4AF34A3C5;
	Mon, 23 Feb 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3e5B5Nb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18206346FCA
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828755; cv=none; b=cjH5uKdhu06rjaHgzbjwPYiSLkE5Rx61AYX39AICICIsmRHb+xUReRInYAIMU5bEM5LUN7n3VEwG/0jOPL1EDXHNXFm5IMCglEftNSLHWXMxhcgdCtsf5C0Y7OWXIEggMoALvuj7/fGl9dQqzC2juxVP3YZvRf76PyCOM/V9yTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828755; c=relaxed/simple;
	bh=Hiwv3J5f8T4xRB2Iui0BluAqlu57K6cNFHiipxvCbK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2oSRMrI8BRut75vXUipBFYNs4HFGpE5oWXQ89JJoUrAxNwpW4EI4rGt8y1gkPFlwnsYqlVFNXY2GYxKxHOwKW2D9cSiS+90jPKmwJq7nMPCEu9TLmG13jg3RVErQAvsI5Hi9wFbHRRafEQdYLa29s7Q/dwQJK6xfNMu9yK3OJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3e5B5Nb; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59e6253b16bso4421361e87.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828751; x=1772433551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y75LAbRPNmnF+JWA+lclJuQoC0srlLt7G7opFFmU2PA=;
        b=J3e5B5NbYgB2KADyGq+jP6ip3E99dyp7pzbkitym2IB+jsOYz4iIy8sFBZLYITyd9W
         dH/m2Dx1NLoWDP2w7YEkVqdBrodTCZgSwh23cpqfTRKzmTctvUnRVpVKkR2F9OCF5iBA
         gbmvfb/zomFDHmADR8Mer4wsTwu3L2ayWSrk/tPztZmSUTyQx6Voju9cYGhxEghOhObi
         d28pCDorXa+wkUn5qj3kwTyaIb6nMoFl3kPlPwjxC+NR9lQyQCGO0hhrV3Njr1fo0AIy
         dU+sBrZAH2xzwJIm4sBPs5OYsW9oImhqv5NOHS/5TZa6RkVm0GzetfuX75uCLkEhvXhK
         Nm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828751; x=1772433551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y75LAbRPNmnF+JWA+lclJuQoC0srlLt7G7opFFmU2PA=;
        b=v3DO7FxWlPGTBfhSFgxX2YRYM5Os0vdFTb6/7H7ifexryr/KLFKPeaDW/pFFrOCSZT
         /B8+6VOwapX3Z6iYpxGqVl2VjOQ3N971lSmFG5+od8MpNqg6knbFfCvEk2rCVNUWsGg+
         5RJiYfWKrwJAKX/b41wMNK8/+upYfs9RTz2LshnFpze5bkGWkVP/SipelLIIufSZS9Ab
         1AofQD6sLdBhgh/Wc8DGjsNJJYpN3aRUJG51IzdJI/eDrSnPucPRzBFXrRuz0mIosam4
         CBl0pPJbuY6jyjNraVPylEpuIHU4KXINSQ8JPT0l0BadE4cCCbwENk8+DGkfXOppFu80
         y0+g==
X-Forwarded-Encrypted: i=1; AJvYcCUpLnXb5pDqxpsrp5synUgUxfktwN8/dqVWHXKOezZIZ80lxCfjbBc0jmPJk/+RM9bvNsSbsMs4RdXw@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkPhVGGxEoQGxr/BdSM/IN/kKJkXAtqB336rRvFtlZEo7i3b2
	3AhKvnI97JtxSso5xIsE6TOgeKQcJu7OH8kgNFNEOoaBfNskfphC9cLi
X-Gm-Gg: AZuq6aKDhnfeUWvD1ftdkkvAcZbzKU08tvBhXa7KEvAaLFtFM9dO03wPoUVay9i9HyN
	vGLqA25flvbZn4MchIVYUSB9pae8Art+VNiWV6vtFBJbL2A8rm9miTv75BFOjyWly66Tn/J2/C4
	2bbVXC8HWV2Q4AexL5jabUBjPN8WILwt1/ssuwat8LYVBuUiNOG4OwbmUq1Fb0sTrZcQmrWfh9B
	4W9Rl9DMnF9Tj1XNvHnUHH7XfYU30GkTg8KL2mmahD3Jy2gOwKOD4YHnJpZagBK8Ho3xmPd6PYf
	fwKjAswIwcWG3sHvISouyrHAJVRo9nkVity09plEx50vxq+3SPDc3RlgGXt1im4geHKgnXsL8AS
	70KgsgXjlm136KRaF2AQLW9OSyGG8zddEin2BSk+L0mix+z1rd84bVFTZhf2vhmrgL8EmtY8206
	tIlCdU6LUSROm+
X-Received: by 2002:a05:6512:1153:b0:59d:e589:c977 with SMTP id 2adb3069b0e04-5a0ed99c694mr2127041e87.26.1771828751162;
        Sun, 22 Feb 2026 22:39:11 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 2/9] dt-bindings: regulator: cpcap-regulator: document Mot regulator
Date: Mon, 23 Feb 2026 08:38:51 +0200
Message-ID: <20260223063858.12208-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223063858.12208-1-clamor95@gmail.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6994-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48C9C172373
X-Rspamd-Action: no action

Document regulator composition used by the CPCAP of Tegra20 Mot board,
that is a base for Atrix 4G and Droid X2.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/regulator/motorola,cpcap-regulator.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
index ed28d2653a55..1a44c8e61243 100644
--- a/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - motorola,cpcap-regulator
       - motorola,mapphone-cpcap-regulator
+      - motorola,mot-cpcap-regulator
       - motorola,xoom-cpcap-regulator
 
   regulators:
-- 
2.51.0


