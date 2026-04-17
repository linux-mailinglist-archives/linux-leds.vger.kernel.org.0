Return-Path: <linux-leds+bounces-7747-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WArWA5ne4WklzQAAu9opvQ
	(envelope-from <linux-leds+bounces-7747-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0BC417D27
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9CB931D0F66
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE28345CD8;
	Fri, 17 Apr 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="espvJQ4K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF0343D85
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409899; cv=none; b=SCsGHQJBoPV0gYTvbjbUUr0tqud+PrJlrJRANaEwdz0jrIZMBMuQZ6uUoC5TUlVkS+lACoGiXwUuBrnB8splIyWbUdZmlfpNIPrnuktCWGyCRNoRZc6rsQjBgza1B4XzEJjvTlJwR9hjIcZo+z8QhSmuUlhhGul8jemX2FY4y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409899; c=relaxed/simple;
	bh=gqngTd4MHiV3D5QcORWGXlDKp1XsVNvEDILzzthOEwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXiVfi/ToCDRoBwfjziP3ttBeKUDjEPuC20nV3cbOiHjiiStEOTQqEso6aFCylZwEpdaSJKb/BUm9tkm9s50L6/K3gloyBoJCqs1Y3m7B2kWhQ8sxIYEwW2sr2hGWDpuezDoitD75Q5OA0GBCe/c1cM/8RUzVaNJ1V38ZLIFYPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=espvJQ4K; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso3152111fa.3
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409895; x=1777014695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UojtAg/yVrt1TCj/dA87iY3tTJuq7q4q7W75tUN9wMM=;
        b=espvJQ4Kr93ZaOeYve87ZnHLkMpny3NDSKe3/XpPswLdx2sjrB0KfQA617qUf+gpdG
         M/bifbRRv9vM6UdSWCbz2xiA1GA78SHrOULXJNnCodBnzbA7FyqrjT22jaEoXUBPAmsl
         2Jvto/3eIK8jQPXrEIEuyjS50jWU9U73gnDm0J1nQBapfgZCf6u3LUeUPRw1irqSgLkL
         3kBhg9Ss0PkR4nSUJBEIqVEuA/VuitJBCjZLsHh/Ez/QReKyDc83MVtWnFuKNMwQkfNG
         CQ04PIx5LRTOaQvrAwF12Srx5R0MkbBfUT2f8eujKoVJ6DfC9hZGvfrvh64ZP8iG5Q06
         X42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409895; x=1777014695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UojtAg/yVrt1TCj/dA87iY3tTJuq7q4q7W75tUN9wMM=;
        b=A9PcGuunX/Dj+53+XFCzARRyN+3n0Zw6XU2o3bVC9/rxLyKsQMObYiGmefP4zUhAYf
         iO4i7RXuYgWHK3f/kJdX1U7/lfLrEwgJJ2fKsJ1B6OtDO+NtJ3MkRN0dvDHapc090xES
         vWtYApA/0/a96KpdZgO0wgfGu0BFw/xVRPxkyYIWfbav8+/VoGD0GqzmcvsW21/30r6I
         mE1O38c/y8dkkBJIoNG8lQbTHmA1SLnfRNDHsRioVY/l6xMRBLWs/4q7h6leFcGqTtp8
         wkTYu9aWWbhU0BDewPwdZloR6dUASsPPHD5mpXESyIrjbY/jx6o1yUauvWoSfXZBsjLX
         0Ozg==
X-Forwarded-Encrypted: i=1; AFNElJ9eeNAbzGz2di5PZzSbFKZKc/UCJwCSJee9sBoZ/voCVY/mSQXcAjuN9JFWtWs/uY5QghU0tuapYv9E@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2VQNLo8+cbRP85jkIqchRFugSXg4ug1N28OL6vG2LM8u0eQH
	i6YT7IUYDtyFuzbTcZf/uOwWsHe2BU2kuDQ2TnZj49mZ13+sKmAGuJDw
X-Gm-Gg: AeBDietwSXizQG1rgFXxRUSz2L6Qnql9ZQiCKOQJKSS8/ZSDpLQx3wK5buR5u7zIkly
	ZiBj54yUFP3DPwcjgnBFqv2BNgzF6+Hg0/vXwtNbZwu5NRgAChJAymF8ewZORQyMWXNERi2XF/7
	35cQlvx/n4QZVMNbxpAYKOELSazF5EBHEHjQm4+S6MGOvl0WaXC3iAFuNTO35p78VZZget+qSfK
	bx/ZwK13hIiuHakB/mSt+qhtLle4XUJwuT8/1VBVovojMKa399H5rNku6DV7IWzEYuFRRdiFhfl
	6DWQTacc64zyZ37z5/cKP9NCpsjN2B67gN2oDprDU65frrc4/gVjdK3JjZBQbUmLr0ZICUQ57wU
	IjPyeBVVZpntmPTjumW0tIJ5qGN6i4qXJdsTO7z+z2rWR0MirW6SMnIXCdLr2v5gGW7MZtVP+6B
	kGUev0QAKCW4JXY8hAuqucS1M=
X-Received: by 2002:a05:6512:3196:b0:5a4:56:aa88 with SMTP id 2adb3069b0e04-5a4172e7bd3mr495747e87.27.1776409895107;
        Fri, 17 Apr 2026 00:11:35 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Fri, 17 Apr 2026 10:11:04 +0300
Message-ID: <20260417071106.21984-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417071106.21984-1-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7747-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B0BC417D27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index eea5b2efa80c..487e5456864b 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.51.0


