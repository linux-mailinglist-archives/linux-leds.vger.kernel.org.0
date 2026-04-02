Return-Path: <linux-leds+bounces-7623-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALR2EZXqzmnXrwYAu9opvQ
	(envelope-from <linux-leds+bounces-7623-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Apr 2026 00:15:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4638EAD0
	for <lists+linux-leds@lfdr.de>; Fri, 03 Apr 2026 00:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E84230221DF
	for <lists+linux-leds@lfdr.de>; Thu,  2 Apr 2026 22:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C871B3C3457;
	Thu,  2 Apr 2026 22:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="R42sQtxK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084313BD25E;
	Thu,  2 Apr 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168119; cv=none; b=q3nPjotpi5Oq89biCAvS8eIHNzo7gFdYjIuoXAMoDKQ5/jmUTLYH1o12fFnbYjSM9yqIGlZGvDvUTZars7E9fe16snehDUK65IuJ8SmhyuBnq7LVEdznLkiCTufR9gxOIvq4mVjR6cklDke7iRvv1f7Q8aZk8swsf5yjiTlboeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168119; c=relaxed/simple;
	bh=yCfQJn7TKmHqJ9epb4QyddRqq1oRxDASserdzmjUDpk=;
	h=From:To:Cc:Date:Subject:MIME-Version:Content-Type:Message-Id; b=NDzYMUZlVaruDg+rxf67eYTRK+PALTpNGLB8mCCq0QWOMtKrxfmWcGvB7qu9VyyGTmjwsBWDfkQ5qDGqXhInqk8Bl79nh0ldGjMgb4K68wPJM7KRuyjnIyuQIMtUrIw8NF2p+GvMyySSXZY3dYBVJcfGbdZUGHZ6Bg5Hh8vTyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=R42sQtxK; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1775167691; bh=yCfQJn7TKmHqJ9epb4QyddRqq1oRxDASserdzmjUDpk=;
	h=From:To:Cc:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:From:Sender:Reply-To:
	 Original-From:Organization:To:CC:Subject:Original-Subject:Date:
	 Message-ID:In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=R42sQtxKX8fJPbBI8NxWjpMcMepEzy/fRXhi9ribURp5BNoUTY/ZZUk6c7B1rDQ2z
	 OoxHD5/WQbR1nB8eIe3VB+JdgZ6sjOTENaGjYI0Cj8X+C/Ml60nQKCjDv4yrZP/kjL
	 Y37ANMjEyds7oGJZ+Hlk41SnIhzPURSBDgaarxfjoLPlPX7Pvf6qqyNfsMidKia3Ax
	 pTvDdxPTbDj3sk8FJkOiJk5a5d8Dgxp7XPsQ4iO8EkZ6b9nOp4Cjs8o4EdvZGaUbiW
	 NaLB7UTSboU1F5OP76BPS0nFBFRdddGf3egbEq/o61LuGQyF2Vvl8x5dNcKlgqXkvB
	 Shpk7SfHL4zcg==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPS id 66F6C407E8F7;
	Fri,  3 Apr 2026 00:08:11 +0200 (CEST)
Received: by tag.xn--rombobjrn-67a.se (Postfix, from userid 1000)
	id 4804DD8F722; Fri, 03 Apr 2026 00:08:11 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Persson?= <Bjorn@xn--rombobjrn-67a.se>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 2 Apr 2026 22:27:48 +0200
Subject: [PATCH] docs: leds: uleds: Make the documentation match the code.
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[xn--rombobjrn-67a.se:s=a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[xn--rombobjrn-67a.se:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7623-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[xn--rombobjrn-67a.se];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bjorn@xn--rombobjrn-67a.se,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xn--rombobjrn-67a.se:dkim,rombobj=?UTF-8?Q?=C3=B6?=rn.se:email,tag.xn--rombobjrn-67a.se:mid]
X-Rspamd-Queue-Id: BEA4638EAD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Björn Persson <Bjorn@Rombobjörn.se>

· max_brightness must be set. Leaving it uninitialized or just omitting it
  won't work.

· The maximum brightness is not 255 but the value given to max_brightness.

· Brightness values must be read as ints, not bytes.

· The ints are signed, so the word "unsigned" is misleading.

Signed-off-by: Björn Persson <Bjorn@Rombobjörn.se>
---
 Documentation/leds/uleds.rst | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/leds/uleds.rst b/Documentation/leds/uleds.rst
index 83221098009c..9875a0fa4185 100644
--- a/Documentation/leds/uleds.rst
+++ b/Documentation/leds/uleds.rst
@@ -17,16 +17,20 @@ structure to it (found in kernel public header file linux/uleds.h)::
 
     struct uleds_user_dev {
 	char name[LED_MAX_NAME_SIZE];
+	int max_brightness;
     };
 
-A new LED class device will be created with the name given. The name can be
-any valid sysfs device node name, but consider using the LED class naming
-convention of "devicename:color:function".
+A new LED class device will be created with the given name and maximum
+brightness. The name can be any valid sysfs device node name, but consider
+using the LED class naming convention of "devicename:color:function".
 
-The current brightness is found by reading a single byte from the character
-device. Values are unsigned: 0 to 255. Reading will block until the brightness
-changes. The device node can also be polled to notify when the brightness value
-changes.
+Although max_brightness is a signed int, only positive values are valid:
+1 to INT_MAX.
+
+The current brightness is found by reading a whole int from the character
+device. The possible values are 0 to max_brightness. Reading will block until
+the brightness changes. The device node can also be polled to notify when the
+brightness value changes.
 
 The LED class device will be removed when the open file handle to /dev/uleds
 is closed.
-- 
2.53.0


