Return-Path: <linux-leds+bounces-8307-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i0xBKxmQE2ofDgcAu9opvQ
	(envelope-from <linux-leds+bounces-8307-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 01:56:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2ED5C4D44
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 01:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0739230075F5
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 23:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5973B3B3C0A;
	Sun, 24 May 2026 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e0FB8IU8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7082C08AC;
	Sun, 24 May 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779666966; cv=none; b=tfe1J3shkBRQhwy1yFAkFMLs2ymX7gmkouwhd/lThFBZAIQeuRfZSaX37UArwo+AV3NPHXSzHmZihs8AMN8W9km+sYZbYW1odLLVLepMaoOe0X92C2bH7qd5z4Ql8WQKy23/IvrOlmqcJ/HjedEi7PkZ9ly5oehPMWfJY0S0ZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779666966; c=relaxed/simple;
	bh=1GS9J34T0IrwzYq3QhcjuzMU4D7KHOn05hsKDv1eKBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J46eKqYqECNITdDgwWRuKPuxK4Wk90XecGq7E90g3h2qI5GXe8+rgKdmILWg092mBlix1nCu5pnUi4kXFsj79IhS1eP2eWtfDD5i86GlBUFUZz2p//isIq2g1Eo5+6c2QTcWq/3k+ONp55nHM43aMclaWxRvtVA5W9B5R7FQwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e0FB8IU8; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779666958; x=1780271758; i=w_armin@gmx.de;
	bh=DNVuB+M4SGGZEuS8nQVvzlAAQKla81JLqrODNCiqOiI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=e0FB8IU8qmpUMxLcHL3RGUW6Bj/8I/gvyz7hIVdf6fDiG8EA6HXldRbk5lu73N77
	 tTH7N24oyyJClwljvJMAaV9sgg8ad4OGqDVoCHU7f3sH0tP7QoZcpuzxrY7QUujEU
	 s6+006/QyNkmvaF/7WJqgwhoo7fGxhcR8TkO9j52PP4d+u7JilWR+tUUrsV4B64Jz
	 Q07vTmfBEJDoAjYoLeiJKMJIwjS8fGmPxSEH70sNhwpNG9yjTY5Ml96Wk2uphbSeV
	 P8HW379SsOfuEEoFB26oerfnMMt+FT1Xfa+qNmW+1dMdaFzVvMSYoiJVNe3b25mc7
	 x3PUrIsO1fQnEFyHdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwwZX-1xEzyv24eh-00rSmf; Mon, 25
 May 2026 01:55:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] leds: uleds: Fix potential buffer overread
Date: Mon, 25 May 2026 01:55:53 +0200
Message-Id: <20260524235553.189134-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xYCGS+ys/Q9IZIU294lezJM/mKC4CDVLXBpnL/sbs0ypa2FBjZJ
 bqdWFWgtxxcIgB2w3IKJsDH8Ma1d5xcFGnTPwEbz48bVsPR8HilK1uV68z+nX4NJuSqa0P5
 c2eurQWZsZUPKzG+uBjobIjKCzYfPYYT9PJT0iiKiIflRsDxdXiMYVBl/SxTgoTKxbqqE6S
 ARDLZk6Bi9x6FvtWg9Stw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ii4/uqF+9FE=;naiKTQo78VWavdEmLpHTZsgUc2p
 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
 UNt4gF5HK+V1UBIDtRYbmFN60uo=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-8307-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 0A2ED5C4D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The name string supplied by userspace is not guaranteed to be
null-terminated, so using strchr() on it might result in a buffer
overread. The same thing will happen when said string is used by
the LED class device.

Fix this by using strnchr() instead and explicitly check that
the name string is properly null-terminated.

Cc: stable@vger.kernel.org
Fixes: e381322b0190 ("leds: Introduce userspace LED class driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/uleds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index ace71ffc0591..41942cfca705 100644
=2D-- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -102,7 +102,8 @@ static ssize_t uleds_write(struct file *file, const ch=
ar __user *buffer,
=20
 	name =3D udev->user_dev.name;
 	if (!name[0] || !strcmp(name, ".") || !strcmp(name, "..") ||
-	    strchr(name, '/')) {
+	    strnchr(name, sizeof(udev->user_dev.name), '/') ||
+	    !strnchr(name, sizeof(udev->user_dev.name), '\0')) {
 		ret =3D -EINVAL;
 		goto out;
 	}
=2D-=20
2.39.5


