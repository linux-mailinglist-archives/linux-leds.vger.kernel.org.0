Return-Path: <linux-leds+bounces-9037-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E+eFA46ZUmqJRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9037-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91D742B02
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sholland.org header.s=fm3 header.b="V xj7jxr";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=CkKFC1uT;
	dmarc=pass (policy=none) header.from=sholland.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9037-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9037-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6818B30221F0
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BF928850E;
	Sat, 11 Jul 2026 19:28:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9750A259C82;
	Sat, 11 Jul 2026 19:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798137; cv=none; b=pAcKTCHVjLgN11xa3cyLORjgQjrRG1uBs6CFWAN7E57PfJzMZSK/T7+olwn+qlWLe9WFu5EafCPIMnRja+22WHMXqHyHMpLbVrvWTZXmYmA435p5JkxpK9CB6ozD7r17p+psoHfiqvCMSVgCTYR/d5y7tXs+oSf/N3SntLCSbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798137; c=relaxed/simple;
	bh=IlQgOTTGjdJ3fqtP3PuW5Yfqp2nP+vZwsNYVGe3qfaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrrCwGsSynsKyHsISZQq5panFTPXCyMJ7uEeVzp43FogrBwWs7U5CiEyXCMxrUhRkwZ14zZ5hcLacbh1X8JKkUAgBi+i4gzEmgIvYADkybjx3bBBMpj0zbOGLedGL4VMbrThRZ4EGH8vFsSXDS1Jb4XUgMoo0Yge9yiZ3REkITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org; spf=pass smtp.mailfrom=sholland.org; dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b=Vxj7jxrA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CkKFC1uT; arc=none smtp.client-ip=202.12.124.158
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D71117A00FF;
	Sat, 11 Jul 2026 15:28:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 11 Jul 2026 15:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798134; x=
	1783884534; bh=aX2RnisGLr4E8o5po1MDvWbrusnd1W84soVanA/bOJY=; b=V
	xj7jxrA68pMEZQS/nrdj6ixSTdxR39PPHFZcTBEgcs3wQMn4M1MRFqROemEJ/Djr
	Oyuy7yD4J1koJ4qDaP8awcdFErOZ0cRgLmz1+Bsd2OnEwzRx3cXT3h4g4WzM/70q
	VvWiao+8/yE5dXEFF7Fwo44/CapcGTpCdYv9gk4CZ8llanljmuhB8qrmzPAbErZa
	mDCvzAexy3Dco6fYP+oR4X0BLrRgAYa/eV7yrrwQPAZdq0jgVK+vxbRxUta+kcKT
	UMYU1cGePlk0o/lX5kABj9sfxHKMMu5PELE35sulnWeBOtCrMmVxNPt73P8TA76B
	IukLpEZTQA6b0CfPnC4ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798134; x=1783884534; bh=a
	X2RnisGLr4E8o5po1MDvWbrusnd1W84soVanA/bOJY=; b=CkKFC1uTJiRZ5De/2
	gGQbJ9veGg+/s+3thriIwhNy42PY0AN9GtYHDdsgZm8R48ivGyxJGa3qgafsWmWy
	Cxg+ydAMYeFuOWqhLA+pzMxLkeO90aEHkRCeZyxEZl4LXuO6q80SzsFWY0i6Fo7k
	+vFtSyrT/5AJugs+up+3yybV7qc+s8h/jBIV7DixiFwVElnNV9suaoZfLNa8Trs8
	9ciEIel7KGV1D844rP1knnJOZ1JV4KW0MJSXB7zyMKN900EALXua1YDLwtaXt7lT
	fIwg+RGfCvFoe+T1YoWgMnL7854gi2TlykVchJsJC4UAwTGzM40sCGi9yYJUwIoW
	xTfxQ==
X-ME-Sender: <xms:dplSaiK1eaQc_MLHqtf8kaEoV8HsZgcSZGxrVjH5vMCqnHEUMVTOqA>
    <xme:dplSagpLVD1YKbjxQmzme0tbUdELScBOudnRS8VWJ-Gqeh562QUL79jCdtZEFuCXe
    RBvA07KcKkHnHMBRjlR5B4asSQNcR92tyQbDGzTLJwBd5_CBn0sqA>
X-ME-Received: <xmr:dplSagv6cEps1stkWy8-ZQ-2_iokHRe5Dr8bS7iN2yQRKPI6nzMso9lBNM44bLSscZ6S73zQtIJ0AjaDNVwM4uHPX1syv94NITIz_SnPiRJ-bAuIqiE>
X-ME-Proxy-Cause: dmFkZTEepNtIgoM1Fyk7GBGw4gbWyEgW9yAi38A4eO2Ck62KjI7ty8TSEaBFWZPUUJh1GJ
    nAzRXvy7afFiqmvvk6ftLKBtaqsODmPKwz5QvNVIqgGT0HeIi0mEvtLmMDW+9YXxWgw8+o
    oXCy2H91fxLVFsCUCqZYrJkVfQpyqtobi5FF8rZmnUuvbsLtUDdFkWgnb5YobqY8eJYnQI
    f/hck29y/TLcFpj9sZBoi5tSSWpZsL29DU/L3Azo1pXGNMPTEoNOog7Q1KA4IguljVS538
    G+HygWMF+jZcX2RkqjixM3gA6QTWG2eM7QhOEWAkBEcAAEt31NpmlBrlHYLV7LDSfLCDR5
    3nu4W1A9NUrS8EcSxP3bN11DhXdVbkwDERCWEqGpwiXJzLzJQ+DB9japMhLDoSW86xSb4S
    b2FvELtenVBnSax79yDQTPaY89IEGVI31byxELy1DJwBakqBiKm6wk3rmgJvNJ+2NbVnJJ
    7zZCNFVdMOl3O97EO65W/6zfL8hPf19pPf0rCAeOX+NG8ve0hafa+N2n0jZwaSd1GoegDA
    Q9K1c6wiRjjmHSC6cD6FEIPWH47NfbAw/wCM7E7f4VX5Se6efKn4G5opCYTP9r0HW5tWUO
    AgIU+UsI63UuYG7XY+mHu1HFkePiS2gXO+haM5NtDl5IaydFbE6YYmXN6b7g
X-ME-Proxy: <xmx:dplSaqKkjkwmwhWhChmvIh8KvkjFoSUwRmSB7m8k7y9kLUm3ETdA-A>
    <xmx:dplSavqH63vAJCDggmGp3PXxA0mBwINX9pSztEY66STm1Zwzh_8GHg>
    <xmx:dplSatV0sSPARW4pP1HEkGb9f3IRrBda7N_-cWeeTsIJ8bxiIBbvDQ>
    <xmx:dplSak1qWdPQcv3IfOI2Z0bi5VqCRDJXKZwt7slM-vEXnacz7QMSeQ>
    <xmx:dplSaqPvImcqBAD9mV7pbO3cI-r8BB4BtAxyADXu-AZ8j3EKczPPWeiD>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:53 -0400 (EDT)
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
Subject: [PATCH 3/4] dt-bindings: arm: rockchip: Add LincStation E1
Date: Sat, 11 Jul 2026 14:28:27 -0500
Message-ID: <20260711192842.845048-4-samuel@sholland.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[samuel@sholland.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-9037-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:samuel@sholland.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sholland.org:from_mime,sholland.org:email,sholland.org:mid,sholland.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A91D742B02

LincStation E1 is an entry-level NAS device powered by the RK3568B2 SoC
with two 3.5" HDD slots and two m.2 2280 slots for SSDs. It is marketed
under the LincPlus[1] brand, but the OEM appears to be Techvision
Intelligent Technology Co., Ltd[2]. The OEM model number is TVD8322R,
which is referenced by the vendor devicetree, a sticker on the board,
and a design patent (CN309443154S) matching the system chassis.

Link: https://www.lincplustech.com/products/lincstation-e1-network-attached-storage.html [1]
Link: https://cn.techvision.com.cn [2]
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ca2e4327ac3f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -779,6 +779,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: LincPlus LincStation E1
+        items:
+          - const: techvision,tvd8322r
+          - const: rockchip,rk3568
+
       - description: LinkEase EasePi R1
         items:
           - const: linkease,easepi-r1
-- 
2.54.0


