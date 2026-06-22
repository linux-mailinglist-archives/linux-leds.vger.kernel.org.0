Return-Path: <linux-leds+bounces-8698-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHZYBL4wOWrUoAcAu9opvQ
	(envelope-from <linux-leds+bounces-8698-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 14:55:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972C6AF981
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 14:55:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xn--rombobjrn-67a.se header.s=a header.b=kjL6eW66;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8698-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8698-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED51301E9AB
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 12:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AB13ADB89;
	Mon, 22 Jun 2026 12:55:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3444399D08;
	Mon, 22 Jun 2026 12:55:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132921; cv=none; b=OyjLULm0XQ+15YUndWzv3MioNp0QcU5+U8GnPojfsNcgPMo/1mnFyL1hIgXN3LFlcWS7rtzrPhInZOjqscPTKpOteaWdrvw1VpvWBflVIbAPxX/ziLFhbRnemO1pjc2N1EZ15txMjr/sAG6/72Ko61WiR+SHdZsUc6fn0OLdAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132921; c=relaxed/simple;
	bh=sOYVThblm3r8If7SaQV5HS7IxRPlp/h8bhOODGRdbRU=;
	h=From:To:Cc:Date:Subject:MIME-Version:Content-Type:Message-Id; b=V5T3n4Z+Qj/CUpNMoGYWf0Bo3cLHzNvZ8WgE3UxuHE1vLBQDktyDLuRnwaq2WiSzRqy0j1DVV3jK2LU7bPdiAbo580qkOrlWZHdFsG50tsC7KTLfVHpD4cHXZkQsQ1FSdtcXPbMkFuqK/Und2TKW0FLWTm5VEW2p6MAWvFjKiCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=kjL6eW66; arc=none smtp.client-ip=188.126.83.49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1782132916; bh=sOYVThblm3r8If7SaQV5HS7IxRPlp/h8bhOODGRdbRU=;
	h=From:To:Cc:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:From:Sender:Reply-To:
	 Original-From:Organization:To:CC:Subject:Original-Subject:Date:
	 Message-ID:In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=kjL6eW66KU1PrDm5Y6a1E5CmIxFx/s49pPjP3vaYtiTyUlSi8KeuQYxTq1N64SN3w
	 ZIuupx4fbTyK3vDPkrXlWAR28oNAIMdH86cC543jeIuAjO3pTDAh/4LgkJAjZSTFLS
	 bIJ6S1Rl6rZ5BR04v3ImPUZ+q6xDzRJRhXuvyyn2wv15H+I7SqmaYoFlWpBtmFArwZ
	 jxulTJqSAag40Wikra4HhPyx8BzQxOhxjguY6aPO1gpSOZ2E+laGkGMsExqxK4gmrf
	 XANeuTP2CLvHqKnvQHD+LYgJpD98aE5HkXA8DbbnPG5FfkuCF/l64SJ1G1/o5ML7go
	 50nx4gZPC3MHQ==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPS id 40E69407E8F5;
	Mon, 22 Jun 2026 14:55:16 +0200 (CEST)
Received: by tag.xn--rombobjrn-67a.se (Postfix, from userid 1000)
	id 25EC8F47BE9; Mon, 22 Jun 2026 14:55:16 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Persson?= <Bjorn@xn--rombobjrn-67a.se>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 13:18:07 +0200
Subject: [PATCH v2] docs: leds: uleds: Make the documentation match the code.
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <20260622125516.25EC8F47BE9@tag.xn--rombobjrn-67a.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8698-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-leds@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,tag.xn--rombobjrn-67a.se:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5972C6AF981

From: Björn Persson <Bjorn@Rombobjörn.se>

The description in uleds.rst omits the field max_brightness and claims
falsely that the maximum brightness is always 255. Leaving max_brightness
uninitialized or omitting it when writing to /dev/uleds won't work. It
must be given a value, and that value becomes the maximum brightness.

The document is also wrong about the type of brightness values. It says
that a single byte shall be read at a time. That's actually not allowed.
Then the word "unsigned" gives the impression that the type is unsigned.
In fact a signed type is used even though the values are never negative.

Change the document to describe the true API.

Signed-off-by: Björn Persson <Bjorn@Rombobjörn.se>
---
Changes in v2:
Replaced "given" with "specified" to prevent misinterpretation of "given name", avoided mentioning a type name outside of C code fragments, and rewrote the commit message to read more like speech, as requested.

 Documentation/leds/uleds.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
index 83221098009c..f985048c641f 100644
--- a/Documentation/leds/uleds.rst
+++ b/Documentation/leds/uleds.rst
@@ -17,16 +17,23 @@ structure to it (found in kernel public header file linux/uleds.h)::
 
     struct uleds_user_dev {
 	char name[LED_MAX_NAME_SIZE];
+	int max_brightness;
     };
 
-A new LED class device will be created with the name given. The name can be
-any valid sysfs device node name, but consider using the LED class naming
-convention of "devicename:color:function".
+A new LED class device will be created with the specified name and maximum
+brightness. The name can be any valid sysfs device node name, but consider
+using the LED class naming convention of "devicename:color:function".
 
-The current brightness is found by reading a single byte from the character
-device. Values are unsigned: 0 to 255. Reading will block until the brightness
-changes. The device node can also be polled to notify when the brightness value
-changes.
+Although max_brightness is signed, only positive values are valid: 1 to INT_MAX.
+
+The current brightness shall be read from the character device like so::
+
+    int brightness;
+    result = read(file, &brightness, sizeof(brightness));
+
+The possible values are 0 to max_brightness. Reading will block until the
+brightness changes. The device node can also be polled to notify when the
+brightness value changes.
 
 The LED class device will be removed when the open file handle to /dev/uleds
 is closed.
-- 
2.54.0


