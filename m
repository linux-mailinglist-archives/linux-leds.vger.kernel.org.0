Return-Path: <linux-leds+bounces-7590-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGoiOh9Rymmb7QUAu9opvQ
	(envelope-from <linux-leds+bounces-7590-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:31:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484C35955E
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4A8E3143FB8
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 10:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F980389477;
	Mon, 30 Mar 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7PzCdQK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA723B8BB1
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865702; cv=none; b=qXX5GQhUh4WzMIlXMwbSHJo5mOL91nwRQ/I6m4XHKRP6N48PfiMWocIvSb3G4kF81PQvfp/yuCi43XPX/XBP3g4n5QoZYcIJ2E3N5jPMP5xqJOjshS6kQrwbNgD4vVOYosBOAGhueBwOGW9r3cfjJzPdkVRDA+eBzwCmwcL4BIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865702; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbKEUEUeAOCq2n2GeucTCDmNvOemu1OMxEX0CpO7EDIFr0hUzye4flSoU2wCqrFlmjnwRrGVco5PE/ArquO02YSaY5g0N8njhRdXpm+TeGDTU8ZnzGYML93+Qs/fdQIgeUwaWCDZS4FE+0u37J8lpmpiQr3/CrxihlRn/vR1dFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7PzCdQK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ae379000fso1484153b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865701; x=1775470501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=d7PzCdQKI2FjXAFhI7feJnqgEwLAb0PkUqOEuLRa44GWKkPO2uVQL/JeYHwcpdSrO4
         uhcz8YMjGejFfGF6eQh9AAWK6HABlXgR7RtYRZwhm3WhUCRpC6gVuRu1cyzrN3OjZ7ml
         VelI8XqZICAe+alJ8AlxexsyEmBkulELss4947d/ozuO9IdUAUj0lskQBTliNyX61Ydt
         Z+242OE4q5L/nl/7HAY+H8L6KzbSLW0PlzG5jR5XdHnRa+cbyprzDGWBMHkUwY2C0+tt
         xGmzxMfQbSFTP0XpCAa2yVYAv7PW1alkVSX5CQyEY3RZ8NiS5kB+PWaYxgnID5aJ18Fn
         khSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865701; x=1775470501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=GqoUypFch8kitkH3RK0xsE3rv/fhm0dbjslWqbTAe+fVoIAXKtZHc6M1tNqOIpG8nl
         I3uFYVUAtuJg+8I20FRfZywLSO16G8qUyJt+DoyzfMSbzxjGLYHf5T6py6KBNPo9JDnA
         EvnRZ0GkQ6MN7NAN4QwFGiMa/4I+lleBMs9SgbAnr933VfBs7uynCMLzx1ZazHxxxQ/2
         ACOG9dKBoEplf9rz5ZSfKVD5s4ZxQ827nFCOeMQkUVjs4P/NfNYcuNJqH2+KO94OTXyj
         5FBzGs9Lw8iByuWL36u1etVQzEVg9LGNT2HWM2//5W3E0iIsluJydkJro7FHBOwNhQHd
         BGng==
X-Forwarded-Encrypted: i=1; AJvYcCVUvzOjq8U5URQIUjjzC4rvhN0NExrWBIjV39aYpPZpRJFEVu7PMHQO4KngkQaV3qAjNlAfgztZPwvo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdc2rvka/IVvglNbSgORhzL97lkT7uKMf5UvwZFr4r41hE89Z8
	UZLzsBHtFUWUnBlkJMh6puX14tlCz+W7WSexdKFNeWq3hziXBWjR5d3D
X-Gm-Gg: ATEYQzxfm564Cy8BE0Zg2ie/SFhSSgi4nxFu1WKfnsMWyNpbDsHtX0Qm8RjjYkXY5xt
	2vx3GDklJ5yPJZxRfYvgDbcec3unsBipIcHtUthNZNR3lK/7jMtI8wHBbK5rCfeAF91tXfehk9j
	reQQh3OvlyWYYlClWn1WDNLToghfhJ6lMCn2y7fE3XPyxV6OMy+PDrRLqun4mw4mzAPYtjw7GKH
	BCqisBsoMYRdgkK8u4qND0CjwmgZqveEkstqS/U83wKyfD4CbjMKsso7vQGTiFdjJ93c0L7EmVF
	51gVr0bdJHyixXN7l/BfdKZPqRyD9mqPZCn0hs5W4YsBaS75kKiLgr1wV0st42UJ3TwKuGvWi5R
	wom65YAAbADgPn3JY/DruuToirAJZQaPwfORBhsyeDpq3gxMLnYLU8/PQnMD1MhtRux/xMsWYTG
	DZKyjWo46dp9MWxtUpn4FFdVIiAemJ
X-Received: by 2002:a05:6a00:1c81:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82c968762eamr9218652b3a.8.1774865700537;
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:00 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:53 +0000
Subject: [PATCH v3 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-6-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=vESfFUjfFGKmOK/hDu/HFDuHjmi5fusU4ve1ZmPLbaemgxTmnuwyCQLnQCnN3/xFqngqK3IT8
 SDrNOUspY92DbEZYsp20mHxibSWyg1pOrifHZHZrcDoCeEbBzoQ4HKT
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7590-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 6484C35955E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0


