Return-Path: <linux-leds+bounces-7890-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPr1AxXU8GkSZQEAu9opvQ
	(envelope-from <linux-leds+bounces-7890-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:36:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAB487FF1
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79079301D1B5
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9A8399039;
	Tue, 28 Apr 2026 15:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r4nYMmJk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002A396D09
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390605; cv=none; b=DAl/x94C9vO+3qZ56qolRZKhu/xqXLTOqEOGjATx44N8e6KPJo5lkP08JKDb21XFg/22HAw7+dXkWPFw77WJT/GvivZpVJX8r9Pnw3inU48XlG73kdWS3gqC8yqRO/DxyvhL6bIleYQ1QSBgum9koIy5O6jsaNZWtsrmrzbyq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390605; c=relaxed/simple;
	bh=0gEwZwS/FYqnGRZ59VSyvYE3yvqWMDCYZCh5Jh3+mCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YekpUT0X5/t+csSQCzzk8xkh2h7SwmGLoeXWpRMtjMfe4N9wIxsec5eYUjNlbZC9sTOvOxTzmWWsTBGTJL35Y+8FV7XbE4aXGU95S8nAX6ykh9lKCnvDI0EI6KTlDsZjWiP3LUYRXbnrRQ/kOsJUoebMf9T0ijgpba5pp/PwjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r4nYMmJk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so142204405e9.2
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390599; x=1777995399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=r4nYMmJkiJTzRJALEoN24245AHb4CqIdo17Jns3G8n63iDncjs01KiHsuYg0Sqpspf
         BfJfemDC7I0uzEUtAwYY1auLUAkmBb88nZ9xETv2Jv5gZ1/zpCrMOr3FAlJkAky6ZT4l
         ydUwXHZR5eE4l6u83FeKOPRudATyx4Gyz3gjK5AoWOKGcZeT3zpCmmfDXKvAM0QBsOLR
         MqhLoGMXCQ1UvfO0uDe4XAIQff+KYQ9BXR6Kzj6X5wKZ5qYZ6KchatBo9oz7J3nD/pNY
         U59W1xbdTkysfrL+xH9nVPcHfgFc62ljOEdYwVsTQr9Ca1jWJfBxg6z6p4h/wzzhCWxX
         064g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390599; x=1777995399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4Ch5JjZSDRX/44ND7WHKAD/uEQw2ql3s+wN8Su8rG0=;
        b=S1cuQ7jdMgnrbQNPdNalXvGP7MZjBAdpmNZVOL2u3vkSnbpVfR5iXGas+GQaHeRkPr
         TFYIDgXwlzOF+Mxyd8erCAJS5l8EI26Cd1v0nmlrno+DfreYx6VDv/tRCpSXdabY6zsL
         DkuRwFfijmy+cDIn3l1f+0ntGkrxL24Vvu90oyq0/BCESKcXr8XCO9gXE6uGxZ1u0WPX
         rtLjLA1OEJXpGsMIwsmJxtynD52Wg+fvNsah7Y4ImIHiAPWy/Mov6eTe49jMtLa+diwa
         yeWnFwHcWMVpADDsVe5QISRG7k8LXgj4bMIy8Jb+anxVBOgAcolxeXpsm3QSd7Vj4EtX
         oaDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SqEURaj7nP0DaMFvIY2sczBv2TDeLCWTJb7+9CJr3SRfX688+MmRLIKMb+A/IgdQ2/zxrpbZkFOi5@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXCtEG/z5TkU3WEJJW03b32KWoz4p9G1PTiLNIlB03oQjHSIA
	x7eSyi0L8xh8Wa/sjs7vxxppyhGBSTRUZw4QSs22BhwQcOARYpAHkN3e
X-Gm-Gg: AeBDietMPQcGAGOp1F1GKTvKLnOQr3+QSPZHMFWXEGzER7jRrjr/TuVmbBE4o1Am845
	rPj9JwgGZPf6Sffunxu9t5ZSUyGL+gZ/gcarosbiA/ZwxKDstnfz441xP/EOEPPGQnGbPdC9py6
	Uv74NrogTsQmHH3iHsvFpaadZ5B4n85kDwOZ3ghHojX2qdzUujGbb28u8ny3652IkFd1WYE4Hfc
	7TBFAhVGUHrrArjCnq9jcQTIL8rUDgxmzv7HCd1b6/1lBln8dyk4OYnoxZgmTf3WF0GjzzAxcq7
	1CVZ+n54KYV7Uaig2ch4Vccp4ARD8vn3v5IFrUKnsko3Gp+tdQtecRSRtyzpSq/gS0d1JIqFBcZ
	Ui7SZ4nr04y1PNTrgtsia5xc0TjPFvldg+FN1nqTpC3Io/KYulNpkX90GTyG9qrKmEXyeOHdX/w
	IB5fL3u9fuqdX0pHSN4npNxEn8o+o7KhCbQw==
X-Received: by 2002:a05:600c:b8d:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-48a77b21791mr56327465e9.28.1777390598799;
        Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
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
Subject: [PATCH v4 4/6 RESEND] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Tue, 28 Apr 2026 18:36:09 +0300
Message-ID: <20260428153611.142816-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92BAB487FF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7890-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 7f257f3a1a5a..542d149d2b39 100644
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


