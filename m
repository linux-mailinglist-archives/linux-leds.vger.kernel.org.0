Return-Path: <linux-leds+bounces-8978-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2BDMKW3TTmp/UwIAu9opvQ
	(envelope-from <linux-leds+bounces-8978-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:47:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A585772AF08
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 00:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.net header.s=s31663417 header.b=sus+gBk6;
	dmarc=pass (policy=quarantine) header.from=gmx.net;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8978-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8978-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4F963014257
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jul 2026 22:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BF6393DE2;
	Wed,  8 Jul 2026 22:47:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B427A907;
	Wed,  8 Jul 2026 22:46:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550821; cv=none; b=PVjHPNWIJiqZVi1fj+Hog7twZ5tqryiHThwEHl8ZyutEhR9up7FtiVbbNfpjKIzIKgDbrbkRwuFQCaAOasqD/5aqdnMsfSR54XPIeETwjnKyDCcdJOogwKJEu3pTV0TeDhEs386AT8RfKEgqWUCeZa2UN7ER97dSq0OC70YttLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550821; c=relaxed/simple;
	bh=kex10PjN+79SXqA11pcXmhWqDRI0YVDKDmNnwKAgYDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ul/953L3wBqssjA/piR34H0TjT/e/syRvnV+Sasa6IAB2tnBlGsYDAuP3jOV5/vkt+OtTnmiUotfCOphN8rDIRxlbJhPJb4yaUR7KCufzsr2LWHiEj1PuuBvmioK1A+zdnImMAhZaj4ZeDl7SqCmpnWACbWoRfyxPw1RzgEx1Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=sus+gBk6; arc=none smtp.client-ip=212.227.17.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1783550816; x=1784155616; i=wahrenst@gmx.net;
	bh=nNZvHaim9j98bnngEBk54lS2lI2e5PsCzVa6DnGsY1g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sus+gBk6YNas9BL9VRKeNZWuePQOuRByfmKlV4cc62fOa2NYC4GkQuVyDRdvKK4y
	 i8KgxE0HDzW2IF3RN6+v5T33qccQo4kUuLYmNeoXWQpRKlw8SiWwJu3jWIYfjHxyC
	 3CiC+CDN+IwyFcDIRnscuHucKPHWlwRmf60AOA47shrVDR5LjRFdv32tSAvmaZz/1
	 KPQAFvmrc3lzWTB39Y72Dh95x3w17QiD2AIzZGoIW7/TMX8FeJHABAHTR+hzoaIiq
	 fasJv8IidnlQt8sZKBsx2MAXlWA+U7STDKleA6rlxnQgF1dIL9qRrLhFvM0CuihWL
	 SI23tpD+HHg1WSKkAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs0X-1xU9Cb17ZZ-00lnUs; Thu, 09
 Jul 2026 00:46:56 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 1/2] dt-bindings: leds-group-multicolor: Introduce default-intensity
Date: Thu,  9 Jul 2026 00:46:51 +0200
Message-ID: <20260708224652.106632-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708224652.106632-1-wahrenst@gmx.net>
References: <20260708224652.106632-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lqdWkk+TIWwd4Zg65Ya/y8C2f3wRIlm+8lApyszYyhI9q+xQB4S
 F2wnuHuHt0JFy51TDxHEJQDz8Do3I2NV/tUogGQB6SiPB2nj7T3cheP2tpIk6RbjblWM5dG
 cvZsKqUSCjmYE6efDRCi/iEC+8TM1phibuweGmuts3pnvZb0eNIwN6Jvq5YC3Iig77lRTTW
 7+wvMVqsuDcuUhr3lDPSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nWDksJ+ZYEQ=;fuV2GUbrnKBO14zuo+0lN/z5AH3
 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
 mUjexBgjg=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.net,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.net:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8978-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jjhiblot@traphandler.com,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:wahrenst@gmx.net,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[traphandler.com,vger.kernel.org,gmx.net];
	DKIM_TRACE(0.00)[gmx.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wahrenst@gmx.net,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmx.net];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A585772AF08

Currently it's not possible to specify the initial color of a LED group
during boot. So introduce a new property similar to default-brightness,
which specifies the intensity of each LED in the group.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../devicetree/bindings/leds/leds-group-multicolor.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.=
yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 5c9cfa39396b..18b722b807ba 100644
=2D-- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -19,6 +19,12 @@ properties:
=20
   leds: true
=20
+  default-intensity:
+    description:
+      Intensity to be set for each individual LED. Used only during
+      initialization. If the property is not set then max intensity is us=
ed.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - leds
=20
@@ -56,6 +62,7 @@ examples:
         color =3D <LED_COLOR_ID_RGB>;
         function =3D LED_FUNCTION_INDICATOR;
         leds =3D <&led0>, <&led1>, <&led2>;
+        default-intensity =3D <1 0 0>;
     };
=20
 ...
=2D-=20
2.43.0


