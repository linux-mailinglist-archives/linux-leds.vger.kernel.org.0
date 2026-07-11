Return-Path: <linux-leds+bounces-9035-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F1BTAIiZUmqIRQMAu9opvQ
	(envelope-from <linux-leds+bounces-9035-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C24742AFB
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 21:29:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sholland.org header.s=fm3 header.b="H csimUW";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=lZv+ahcQ;
	dmarc=pass (policy=none) header.from=sholland.org;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9035-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9035-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11ADE301952A
	for <lists+linux-leds@lfdr.de>; Sat, 11 Jul 2026 19:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E461225B08E;
	Sat, 11 Jul 2026 19:28:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EBB2D73A1;
	Sat, 11 Jul 2026 19:28:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798130; cv=none; b=q/vwCGYYRCYx7f34toep7UuJWTcTPBUz/yC5hATJy8YRid0Xd8PL295GJ/TM4CBFWfbivcbybZV7xBfkLOsLnvZouWmHRu/GSB5W4MkAE3AAEoGLSnEhlflB0UUNIkLoPxA/4R6SGSmbmGjrSHVylhNaQcVcu/5PxBKuK8b1mTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798130; c=relaxed/simple;
	bh=EQTNLptar0VHhCDNfY3xT+XenNlunEzw9mRKleJwQw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZk/Equ4mLZ0StDW+H4lWNkzuZ1T7WE03lFoTGCgKL2zG2gyM/IdehBEhQXo1Lsb776VsOeww2UoV+uBT+E0aY/TnJuAx1LvhP0t6ymuHNvL56bzNyPyFvVg/E762eL8T/m/NKDaGbHPempxyDQ5Y7uWml33B0SsczG3CHhT6y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sholland.org; spf=pass smtp.mailfrom=sholland.org; dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b=HcsimUW5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lZv+ahcQ; arc=none smtp.client-ip=202.12.124.144
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8846C1D00081;
	Sat, 11 Jul 2026 15:28:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 11 Jul 2026 15:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1783798128; x=
	1783884528; bh=M4BS+cyiMRjg3qMYNzdPwvmaaM5ATYcZInIZ1L1twsA=; b=H
	csimUW5bBqJiOuUKQrOV/dsPMRByP++d1dPN2j3Esawbs/W1JHNGQexOwFjQtfDD
	LxJokBKVu8Ld2QNevAppCSTLGce/hIdkhTHG/6AHNEFT7AL2BUMlRg1DzORC4bRy
	bF31GI7agPrOOgp7urbpV4f9uKAGrBeDyiu2yunFM5wyIvRjPAihPAQK0lOzBZon
	rnndzqCOFM+Qu9JcvMz90168BRJ9gum4rmS0R+mRvyA/Hhdwh9RrQ0HWru7a7/Ds
	1s6NsdhmTou5ATYw+YIaidq3pRmeK+EFO3POS+9UMdj7HmRvWbqxYb+xtrkJBaq3
	kBYSZQ+ZhP6DQ2WeY1Mcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783798128; x=1783884528; bh=M
	4BS+cyiMRjg3qMYNzdPwvmaaM5ATYcZInIZ1L1twsA=; b=lZv+ahcQBeilXjDHR
	NO2PAv2f9pYeUknHwJcH66M57OGly0/Y1O75XDMZe7LDkB6Qecxbz49GN3mpZTbV
	QLLhJgNuM1kgei+pwi6Rzt7aMIa4+WUSMiFU6lhioM2Hbdv7Ty+KXz1PTtGgwd5f
	TZYpfiXMaZ1Y2O5pEVDNG66r1QYWVvBfyQcf0v2qPyX08XvvvuvRFIp/qu/3JQV6
	wX0LTwBrIuT4JZFokOPpKS5HzU73qXt77gS6d5kMcbRDBSzAdk+55BvXwJrtLpzu
	XBVL3/aHZf+fAPffcrTp1ddjEi2Dfq+RXhBqvnS6WtP/19IOHA/UI36YBcWa6ia+
	fyM9A==
X-ME-Sender: <xms:cJlSahjNd9xHpGjJfAZ4Saj0RtI_gX9O1BJydrw1lPcs7geiEi_w5Q>
    <xme:cJlSasiC08iNaKXeiiYQX-yKnr9UUqKlZ9lYU6erpIqGi3uNR5Hs-SdpV53zT2WSA
    r83HJvTuQVAWWQPEhHYdFwFSWjfFZnmgF6qbMFXSL6Mzijsz_6p8g>
X-ME-Received: <xmr:cJlSavFp2CJ48LQEHov_sfnDG6HrPjfU2eDvkQfpaX8SRtlR-9-wBXP0D4d5ikYXPnLyzfTvxMIrJmOTNvV3GwxpfMnZSgubX1ZutMPAWc2iunD3wBQ>
X-ME-Proxy-Cause: dmFkZTE2lBvkgiNL2ATTdX5mmuQMIgkvxqRNJsz/O/t4BhtsCbPdToHsQEtNg5auet71r6
    BC9ee8ERIpoud5AtONR+1p2Eucn/fF2mL8F4kd97QKfKSv+19Yq/C2Ri8wtXyErVvh9K9W
    18tm3uUeG9jt2a1njHO+xDjGuIJgwt6eMxH9YcoqpsOhAVG281rLYLINgEul13ETYY7dG1
    LRzck7QkFrTBGRF8OXeCxfpEh2m6G5Rjj73JH8Mafn/lvX8g62o3Z9M3a0J0/AosAWje8s
    LN6G+Ft7Ea/WCNdR7+Eh9qUSgmMU9sGTtB0o+x9jtkvNDElODMSQjlUS8rzObNdc489nCH
    iaBm8IigPPKpsh5Zu0426DaQN5yauvUGVBviIhFxWN+CmcBzX9hM+3eP9hOcxjoEvQ8s7V
    8DFB6fKBbnH+W1130c496SFPH2e+Bwq00LWqAZLVsyP6oKm1xuRu/WijAGfn6bci9qhIFz
    CtC/gpkyaFMIq2v0aMQPbjEBtcd74NGDaSJFu0CSNS8gaAyFY2ICdb7iUGxNeKotbprr0N
    uPmxu144LrejXf/K8MxY6cBMbfTn2bALVpuhG//6hFu2A/a5U0HijHALiGfTGlAXSMJEVx
    GvbuhHDIVf7auwkNR+2Jw/ZeBxitHrkTPbqzM1ZZ90nKQq4DAEFwVek+Sfhw
X-ME-Proxy: <xmx:cJlSapDtKfsCeYSyW5rqJe9OqxFV-G2EeVbOGzmKskDO5rvTagRfXg>
    <xmx:cJlSalBp9_Yjn2iLdbdwpW_Y7lhKxtgyh2SX3tfXfGJrQR8e6m1DFA>
    <xmx:cJlSanOqe4Nr5qdSR05egwyLDcBjI9UEGUhHyrWqq-z7FrPDmK0jqA>
    <xmx:cJlSapMyRrpdYeBpDj0NCzKxqKrNi3kY43ddeSLavpSJlC25hF4irQ>
    <xmx:cJlSasEWT2Ex_U5x0iYnMSWIiSNCmkyX_ESgQFBL1_KdTuUzA7v_hfkw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Jul 2026 15:28:47 -0400 (EDT)
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
Subject: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Date: Sat, 11 Jul 2026 14:28:25 -0500
Message-ID: <20260711192842.845048-2-samuel@sholland.org>
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
	TAGGED_FROM(0.00)[bounces-9035-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 29C24742AFB

The "gpio" trigger is used to control LEDs by the level of a GPIO input
referenced by the trigger-sources property. This is already documented
in the trigger-sources property description and is used in at least one
devicetree (am335x-regor.dtsi). Document it so validation of those and
future DTs will pass.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f4e44b33f56d..e148b4277a6f 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -106,6 +106,8 @@ properties:
           - bluetooth-power
             # LED indicates camera flash state
           - flash
+            # LED indicates level of GPIO input referenced by trigger-sources
+          - gpio
             # LED indicated keyboard capslock
           - kbd-capslock
             # LED indicates MTD memory activity
-- 
2.54.0


