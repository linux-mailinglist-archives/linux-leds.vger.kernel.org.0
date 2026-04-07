Return-Path: <linux-leds+bounces-7645-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AERCATPt1GkjywcAu9opvQ
	(envelope-from <linux-leds+bounces-7645-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 13:40:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FFA3ADD41
	for <lists+linux-leds@lfdr.de>; Tue, 07 Apr 2026 13:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 274B630157F8
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2026 11:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BA13AEF4E;
	Tue,  7 Apr 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJYVesjv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032533AEF36
	for <linux-leds@vger.kernel.org>; Tue,  7 Apr 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561986; cv=none; b=T5rh2OHqppInR7fVgBkP4b/mqs/s4BmXv6o6QC0CsPh2uR7tnn6Q9yUyBvMBFbe0XdqwtxFIAUYQvJ/64JJqiDjF0baW+e8UrzsEqAr9Nemkm/hqDX57WoaneNfu+PRvWBpNzuKkfN51FJV0z9i5MrMc8vLl+eT4tkBFjMBFYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561986; c=relaxed/simple;
	bh=n+cco1S0OyYRuxEMzY+PLkVJ/sZM1nWD7kqiGrKgcFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QnXrTcNgst5FO8ZU0yAxyyu5dKoxYy5xSRtHKHNu0REkJykfYP+/bCkI/myOvUaUm/YBgQqRq6JF1NpYHC4vx68EHzCda6oxuHDKKLUcVoMq8zDK75SXfgwGpJ9yHw+tRLIIF0gq7W44/ykjm8dD7rDo88TniAd3Nky7TYsVeuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJYVesjv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so2925032f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2026 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775561983; x=1776166783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1ceQoJsM6Bw1xdQbkZZgkgd/hqxOHuuN0XbPDXQLMg=;
        b=FJYVesjvI+2wiomMOM9qd+8ydcM8vDs/J2BHOOt8vP6tJl6g4aueBaRbh3bFiY/p4X
         ocsjSJjHHD2STIawFDPGKu6D/uftEowCT1x1b7G3txvMmsq+kqwTvHrsTFKTJ2xY2YKs
         NRTq4jihKQ6HgCBMrVdtE5Y2zkNM9sJ+QlP8EbePZCIfxsCfKwfQCJo86qIJWPP8z/In
         w9VjEAMYRk52av9j4E3WHHWxhWRPJhT0CsEAUPHiSl222p9MdvWig600wUct+N+0vqKu
         UT1pSnd1WvHxitjSWfZ0oUHGnOTW/iKlaWSji/KbRkDsKa/T9o3B4lcwDe6BipwojcDW
         8jRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561983; x=1776166783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1ceQoJsM6Bw1xdQbkZZgkgd/hqxOHuuN0XbPDXQLMg=;
        b=rhzT/LWapbqn1MQeZwWkRrrOaPt+ZibkdAe8fYLfiffCfOXH2atZE4/s/tMY/G3RiH
         Ru0UOXhqH5PyEKO0b88YeGjyuOMYCy4JgvLhRMsKKyIYR885GitpfWy+ItR/eGEaa8Ea
         ehFJ5bgbq55t/Ltx9iuE/sZ/vhJAaDpLUfROkxa+FfLCP1igvuOc4D5kC2XbF4nNM7nC
         RImabhP0HnD7+YyHE7oHyUM15y+E0q1cN597n4cxQnnLWixyI9noCkv3A8NfyqX0S7HT
         J6IX7u/Z3V8caFWuogXaGZIUoueGojPUfyfdS8FyI+uWkRpdwsjqRoEfioGDHDPMBZI4
         3gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo0bZnfbK94f8GbgJODvaMKHTC/NO0FtUzRJWennP1BD89+n8gPYccgSKOAaA9jcJuZVFrdDGZ8C2i@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsQQv3RENuEB3SwEd1nVGlajlyHSatbaxFLEjBvyjh9FC4+SW
	eq1w6vqpLAwcrjt7L4kVCVDmRidqDg2WYyTXoYWXYbLGuseX5hZJiFqu
X-Gm-Gg: AeBDieuOCXRe8cpZnyXsquNOxioBDgkHRPL8kAgBmxwZ+H6VRO2HatGcSPI97/uE6k7
	tNYOWSe7nsATVYvFwIstE2HiKzHWOZFsTccPeIOX+O2fcknZ+sgbMEDGae0jFP1RLYOdJ14yPeL
	2Oo2HSlsHtEhm+sLAZdqK6DVQDCyX7zXv70lHAjmUcIgg09FQa7lPfTq4mV4T7WUj+Fv0BFa/5A
	jbR3Nvbavn4D8ZqWYILGWpLeXAaduJaTSvXIIlr70d1e4ERioCcFRQUI7BPW3XHQ3ara7RvrK/i
	YVE07zuE+QX8EyHGRkP1OKQ/ucDcHY5IxxkvgWT5oQ8LEvu+p/w2Kxo89MX2dL4ohLjBHT4dT7m
	clTgAoD88lK3H0JAMj8mqI2ftwacvJqs6pdmGBBmWt81M8sghG7Nyg93Z4CkM/lowFXsqtXASGX
	FBpdgaE03Oo+jyjclShN01MRQ=
X-Received: by 2002:a05:6000:2582:b0:43c:fde6:212e with SMTP id ffacd0b85a97d-43d292d33bfmr23794244f8f.24.1775561983168;
        Tue, 07 Apr 2026 04:39:43 -0700 (PDT)
Received: from PC-DA2D10.. ([62.159.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c54bdsm50787867f8f.16.2026.04.07.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:39:42 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	Rob Herring <robh@kernel.org>,
	linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	=?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
	Ashley Towns <mail@ashleytowns.id.au>,
	Dan Murphy <dmurphy@ti.com>,
	Gergo Koteles <soyer@irl.hu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Pavel Machek <pavel@ucw.cz>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Roderick Colenbrander <roderick@gaikai.com>
Subject: [PATCH] dt-binding: leds: publish common bindings under dual license
Date: Tue,  7 Apr 2026 13:39:41 +0200
Message-ID: <20260407113941.43239-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7645-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,beckhoff.com,ashleytowns.id.au,ti.com,irl.hu,linuxfoundation.org,gmail.com,samsung.com,linux-foundation.org,schinagl.nl,ucw.cz,milecki.pl,gaikai.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corvinkoehne@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07FFA3ADD41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Corvin Köhne <c.koehne@beckhoff.com>

Changes leds/common.h DT binding header file to be published under GPLv2
or BSD-2-Clause license terms. This change allows this common LED
bindings header file to be used in software components as bootloaders
and OSes that are not published under GPLv2 terms.

All contributors to leds/common.h file in copy.

Cc: Ashley Towns <mail@ashleytowns.id.au>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Gergo Koteles <soyer@irl.hu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: INAGAKI Hiroshi <musashino.open@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Roderick Colenbrander <roderick@gaikai.com>

Cc: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
---
 include/dt-bindings/leds/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 4f017bea0123..b7bafbaf7df3 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
 /*
  * This header provides macros for the common LEDs device tree bindings.
  *
-- 
2.47.3


