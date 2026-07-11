Return-Path: <linux-leds+bounces-9036-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M4cBL56ZUmqNRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9036-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E100742B10
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sholland.org header.s=fm3 header.b="a steMCw";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=RqvAlEds;
	dmarc=pass (policy=none) header.from=sholland.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9036-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9036-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A8ED302EEB5
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D7825B08E;
	Sat, 11 Jul 2026 19:28:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E741231A3B;
	Sat, 11 Jul 2026 19:28:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798134; cv=none; b=kZmMK4mqoVsM+tF+1EoDzTqtRDhjHYRgAamEHqV/T8VF9XXRdF88GbOFoR9Ns0iCvK70cOvzHB5OmWdFt9dSzAtznOLmH2X7D1mKoN80CFPkbFwyFnpOnz+hvzW+8fLzy3vKfABMyPMoJ35me1YF2G01T52g1dIsvC/O4fo6lSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798134; c=relaxed/simple;
	bh=8jEtP3AM3KENYmLwM01pz3MY/SieJRh+HP4PPNUiRXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3js04W7gZQMkLznsPUYJbh88jNlEBImhjn2PSMS4INerUY98QEYLWEylgzx0aoQR1r6WIMvK8435iRHuwZElPX4JUeKL30gvrAHXHR1vGTF585Fr6c8Bw3VW/aaBFE8g/8CdZ61Q5SHYx8YKEUMdyXeTHFeDPQ4EK/o7RMkRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org; spf=pass smtp.mailfrom=sholland.org; dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b=asteMCwk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RqvAlEds; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B1AED7A007B;
	Sat, 11 Jul 2026 15:28:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 11 Jul 2026 15:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798131; x=
	1783884531; bh=12wpZl1AXXNIx4mO1A7JN/Th+0erz6iENBmhe4EqJP0=; b=a
	steMCwk3RVu2mvkfeYa22H2irY7KRdx8lcFLiz5/1iydVl1wFnbhAPr+jUbdonty
	Bu7YPx1emxa7OyqjG94vAJh59saHUue+3neB98gNhUPFzUkTZHYI6fWGNsaQOIHu
	uu7FxH5B+X198b0jBCs08GQfYkt/PrseriCBycWUf048CZLUeqgDcWmEZ00me1zi
	h3Y6jg7FQUOGgD9aJh6dp++qM+5nuxJn0lADZgeTbWArXolJKSJSx8llNMvIlVau
	PNT1Y92YvqLWRnZ6gYeFxwQFPsK8XPxtcymsqC9RpjkY5IxV/6QlPIJk4GvTgigP
	FXqqtmjAY1pkuQ6sWxJ1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798131; x=1783884531; bh=1
	2wpZl1AXXNIx4mO1A7JN/Th+0erz6iENBmhe4EqJP0=; b=RqvAlEds1RdmoVAym
	IpyON/zEzLm97IlMAOL7i5YE4Q+uQ4eeMeO+zIT3EsXhCByB9av3T3KmxwbQFl3/
	XPoq9a8oMESBfFZW1BmiO/PizpieYe5dC9ZrAaSeNHMJH+PIBnOdAvaJEeWkd6//
	J4mxrIubWVAXUb5myPVlDf3+s2Q/gnIu9OARcKJDEHNRq+zQbadT46JqUumXQCxU
	NKJZbFWecEPibVZjZ2Oxk/QTq0OlXwluw42WuPKn/mliVT5dfSvW1CCW/NrSq1yM
	kzwfv7wjDM9q/4UmOSC1yPDsJr2N1OVtx4VIUVmOKz1ZAXyVVgg4faelpJLghghD
	XXHSA==
X-ME-Sender: <xms:c5lSaivfet8VYgEYo0jVA3LopcKvdyxf0NlXY7lvrFnlpaiTRDmm3w>
    <xme:c5lSat9G4_YOfBXm8mcIF740iRDNLV1EVVGECeiexkcUrjDc2DorjELwj5qfe8eTk
    h2DoGC3IV6gVWUChjzk_KG0S8UKl_RSTzOQ-3wj0GJkNJ94HvsHk10>
X-ME-Received: <xmr:c5lSaryR76BF93Y_TDaWtlQArMAVeulzwMR8ikZpwvSU3xxifIdJWh0v0wZXUJHI7H06s3A8_Eo5y6x2M2aOxmWkFgnF90KZ1eYOHIwqZygVQer_BPo>
X-ME-Proxy-Cause: dmFkZTGNC6QRiLt7NIXGg/qRZFC50QRTSBR3yiaGReXgL5tZ2XlJTNiWr3BlX+yWFvtiEh
    Ggej3m67BiHZnymEek9+m7eb7JhFvSNDZOw2VpzbZP+y2ihrRLZktQ7TFj1OiYwlII60o3
    nMm0gEXKwTtMkDkq80F6u7EgSH1gePGOjT088S6G0+wT1AB9J2YyC1i3z/MvO9areKVgqL
    9u9cbFjUkl+VWHTB81UWMX49asMiBkqlCXH0uuBkxGnZLjhFj/OKygDD9fHX3diD+j3nQR
    zQb8q3Yn8gOSXWwYzJANkCGoIHYRI/L+gcLFFMBmmuntf87Ebfbtm82YBPpiUvbYcM8mJN
    3wwqQDpzFLn+OVXxPZy/NV4rl6zQIt4718N2CODdFML3QkgkPafpOV9lZU+CCogC34oM0R
    0IrhyhBFWPZo4H5WKBPtp04SVo2BGR4xDhzIsIuB/mpQIG/zxbVe9c+j8kVv/F8DUuxUM5
    5jyM39HNupkaA0If6WhKtdtemSP+VNer5gZFS/88ViyxKIlVgYCoX2ksLylP9mHM39xEAI
    YXHJJowSJKwXH4M0c1wS7gfis5cw+gifEkVFlVsnn29DQKgPc/ffGK/w7NOp+To/yWvVpA
    sMX7FL5f/Ss2xbRaRq2Rkt3RJ/OeS0scmK9ruaiGOzW55wxv540yYS+5TuSA
X-ME-Proxy: <xmx:c5lSav9A6jEWpOTr718d-6bDaJcOJT3VaMDffL0i4rK1KWlPVin-Zw>
    <xmx:c5lSapOpJD4G330GxNNtbg_uW5mrg4swZBNKyWJLJXJwaHf6cQiR-A>
    <xmx:c5lSavo4QNE95LV72yqrMDC8n2DP-CBl_KhnEGlhxS58BWZsRudMEA>
    <xmx:c5lSag4seOVAp4PTQ82cE--QkswmeK67AM-iSg1TGvkrR3u0lnyAiQ>
    <xmx:c5lSaqvabtEQmrssTanLTS8KWwB4fBh70xKmGjpYGgpW19RBX20eCLlL>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:50 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Add techvision
Date: Sat, 11 Jul 2026 14:28:26 -0500
Message-ID: <20260711192842.845048-3-samuel@sholland.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260711192842.845048-1-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sholland.org,none];
	R_DKIM_ALLOW(-0.20)[sholland.org:s=fm3,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-9036-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:samuel@sholland.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sholland.org:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sholland.org:from_mime,sholland.org:email,sholland.org:mid,sholland.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E100742B10

Techvision Intelligent Technology Co., Ltd[1] aka Shenzhen Huiwei
Intelligent Technology Co., Ltd[2] is a manufacturer of single-board
computers.

Link: https://cn.techvision.com.cn/ [1]
Link: https://www.techvision.com.cn/ [2]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..2355505013a0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1662,6 +1662,8 @@ patternProperties:
     description: Technologic Systems
   "^techstar,.*":
     description: Shenzhen Techstar Electronics Co., Ltd.
+  "^techvision,.*":
+    description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
   "^teejet,.*":
-- 
2.54.0


