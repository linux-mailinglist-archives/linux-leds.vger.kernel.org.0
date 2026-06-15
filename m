Return-Path: <linux-leds+bounces-8598-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id whxAHDLrL2oRJAUAu9opvQ
	(envelope-from <linux-leds+bounces-8598-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F7685FD1
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 14:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siemens.com header.s=fm2 header.b=Sdtzkth+;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8598-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8598-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=siemens.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F409D304168C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7EA3E638E;
	Mon, 15 Jun 2026 12:04:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4293E5ECF
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 12:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525053; cv=none; b=knuXGoOgITO9DjHnfR2g7xSsiDgBqsMqAxz42ryAv0jngffKvdTzrWT/uyRWYwc3h4Xiz2+1Cf8IP0b35wju7rF3TRuAWFThFEzfvjmzTdRXGUo2GGSjjxCEx6jwCZxLlsFIzh8wOUXLpO+KvA7iR+Aj/OjWNCa2dMlohrx70h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525053; c=relaxed/simple;
	bh=kW2MuBzQP8piNXrIbgiOCi153JlolpWgeimcqvEypos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwjy0ItfaW/0ob7htZvaYA1kPu6WYT5gBUk0kjCbFDvPf4/K2zQTLyQQR3INNE4Yy2cg4ahZS/0tBhrQ7fU3S3Yt6dUdyI5iWX2qARKZ5mGHFJD8FKzXnp1YW4Nytc5jm2ymifgALPfQX3nlskRHnMMQQIS8M4PSSZ/prrKeuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Sdtzkth+; arc=none smtp.client-ip=185.136.64.225
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260615120358ce475955b700020703
        for <linux-leds@vger.kernel.org>;
        Mon, 15 Jun 2026 14:03:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Xz6nCVPweiRhv904vuI6Sdj8uMkOdjwCRi1d8097nvw=;
 b=Sdtzkth+3PIHjyY2UXv2FeZV0gnPita2a3sykTGPaSIBNta968LbZmEaA4nmrUTcy0/wMp
 q6t+fzXVizcDmEbSwVf2WuYZomYaAoOHYYJomCmzPwY3lQU+Ff45k9eA4QSpMOx4muTyihPY
 Vr1RnCIaRGB+TKU3otTUbredSgsw8Rr3eOLttGbVP5XvewKRsrWtaQhayQVHpagrAMx6R+h/
 n3R6d5LyyQvCPsenONGLWFyPErOBcf7mLZoQozffUIqmKHh7sJ0Xw3fBzeCwOfguTeOMvOX0
 vGkxMz2CXB9sHoPepUExwKo4zV8yzyI5PoRDbn5LjMyuEhS8Az5vnyEA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: backlight: ti,lp8864: Add backlight class properties
Date: Mon, 15 Jun 2026 14:03:47 +0200
Message-ID: <20260615120353.3409035-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
References: <20260615120353.3409035-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8598-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[siemens.com,kernel.org,gmail.com,gmx.de,ti.com,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-leds@vger.kernel.org,m:alexander.sverdlin@siemens.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:deller@gmx.de,m:afd@ti.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:url,ti.com:email,vger.kernel.org:from_smtp,siemens.com:dkim,siemens.com:email,siemens.com:mid,siemens.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C4F7685FD1

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Extend the TI LP8864/LP8866 device-tree binding to support backlight
class properties alongside the existing LED class child node.

This is a preparatory change for converting the LP8864 driver from a
pure LED class driver to additionally register a backlight class device,
motivated by a use case on a hot-pluggable segment of an I2C bus. The
generic led-backlight driver (led_bl.c) is a platform driver and thus
inherently non-hotpluggable, which makes it unsuitable for hardware
topologies where the backlight controller resides on a hot-pluggable I2C
bus segment. By making the LP8864 driver itself register a backlight
class device, it becomes a native I2C driver that properly supports
hot-plug/unplug events.

The binding is updated to:
- Reference backlight common.yaml at the top level, making
  default-brightness and max-brightness valid optional properties
- Make the "led" child node optional rather than required, since the
  backlight class device is now the primary interface
- Use unevaluatedProperties instead of additionalProperties to properly
  allow properties inherited from the referenced common schema

The LED child node is preserved for backward compatibility with existing
device-trees. No in-tree device-trees reference this binding, so this
change has no impact on existing mainline users.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../bindings/leds/backlight/ti,lp8864.yaml       | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
index d44232d462bde..11d7e3840c6fb 100644
--- a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/backlight/ti,lp8864.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments - LP8864/LP8866 4/6-Channel LED Driver family
+title: Texas Instruments - LP8864/LP8866 4/6-Channel LED Backlight Driver family
 
 maintainers:
   - Andrew Davis <afd@ti.com>
@@ -21,6 +21,9 @@ description: |
     https://www.ti.com/product/LP8866-Q1
     https://www.ti.com/product/LP8866S-Q1
 
+allOf:
+  - $ref: common.yaml#
+
 properties:
   compatible:
     const: ti,lp8864
@@ -36,9 +39,15 @@ properties:
   vled-supply:
     description: LED supply
 
+  default-brightness:
+    maximum: 65535
+
+  max-brightness:
+    maximum: 65535
+
   led:
     type: object
-    $ref: common.yaml#
+    $ref: /schemas/leds/common.yaml#
     properties:
       function: true
       color: true
@@ -50,9 +59,8 @@ properties:
 required:
   - compatible
   - reg
-  - led
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.54.0


