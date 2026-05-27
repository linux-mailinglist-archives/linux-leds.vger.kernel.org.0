Return-Path: <linux-leds+bounces-8322-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IkCKOo3FmqCjQcAu9opvQ
	(envelope-from <linux-leds+bounces-8322-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 02:16:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0E5DDE81
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 02:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA3A730014AC
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 00:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6443A1684B0;
	Wed, 27 May 2026 00:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pK70rG0+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A8A248F57;
	Wed, 27 May 2026 00:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779840880; cv=none; b=LtpC+UCiVoczCPOfcJUxWveODFxZQUOn9x/InU4CjJWvJlq1vOtJohypt3g/LCHBkb/hLfEd7C1wYg9ugjFknrZqRUH/SdRxoHk7v54eMXB6N/QINatIYdX2rGasB8w/oB6avnW3sCe/uMd/fsJ+aUocEGR0rlm9/1/43yHp5AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779840880; c=relaxed/simple;
	bh=y6s0mxffU7JMfCzuDehPJF0Y7f/k6m54/Hwzu0a34yM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jfDB1kYvRnhgDGrJxqUoo/rfOQoxvW+YOkWujwyw6KufhLZms5R4qytxbzvrLD8H/EwgKxuEw8vTre0Ry9bPrGHhH8DL2K+myQTcyccvrvtV2ve3uyqtk2gltZYpinFk1fGTouiST9BAwdXAmKGKSt5NxKA1CX61xGJzbSoSOsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pK70rG0+; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779840865; x=1780445665; i=w_armin@gmx.de;
	bh=CiwEY8Cg9fdQUSUSpTLJD45NxC92uMePiAobePSkSLg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pK70rG0+hBLxiOv/DFYY6dxVCO/QIVW5he8PAd64pgySkB66AvfP5iGAz1s9yZ2A
	 xl5FSYojD4jmqtbrT1T+cfahQVSvzeQzYVxgGhTWK71diKWfrWsAgItRuasdXNx0f
	 ZNBdvZE4Hwsj2pECiVWULw8iohikw4w/x54JZDweDaMuO6igZmfLkGEt4ia69Ep6s
	 qv9IgyiSic7fHCnCXr/WvWg5agDGOqWz0392m4Jc46RQTIN+VqPn7u5bFmReF3tE4
	 7ONHnO6w1QJlLp4+SFB0bhmxBltStTAlPYcLZkfirtpgUq/vfpzsfEJFISTNMzAnm
	 p75HSN3Q93NkANyhhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKUp-1wkWVT3pAl-00NuXO; Wed, 27
 May 2026 02:14:24 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] leds: Fix sysfs ABI date
Date: Wed, 27 May 2026 02:14:22 +0200
Message-Id: <20260527001422.51111-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2oKsnWDpnG4NeLqP0PvWRd2NBnhXjRNVEELyntsPAUnnEM1fia1
 I0zzW0yK4kIOPqwfXA/BbfQDyn7BEWRQBr7Sx1eH+9kVi0cLN6ToaDm1W7Vas96V9OCy03f
 4OTgJ4enEg0JZ+yBKDRYN76kow97Mnv51dfeAdVV14Kdw0ghC53I4IbMIj3hn0tVBwsXCrG
 DYyZyT30e9daGyO30cC/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RqwQk79IlNs=;ChrOyAnqYTOA65FE2TsTp9yUAkZ
 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
 zNEsUI9HlTK13B5lgvIV6QYX4jk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-8322-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 12B0E5DDE81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "multi_max_intensity" sysfs attribute was not included
in kernel 7.1, so update the KernelVersion and Date tags
accordingly.

Fixes: b1a9b7a904af ("leds: Introduce the multi_max_intensity sysfs attrib=
ute")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/ABI/testing/sysfs-class-led-multicolor | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docume=
ntation/ABI/testing/sysfs-class-led-multicolor
index 197da3e775b4..62ce58f393d6 100644
=2D-- a/Documentation/ABI/testing/sysfs-class-led-multicolor
+++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
@@ -26,8 +26,8 @@ Description:	read/write
 		Documentation/leds/leds-class-multicolor.rst.
=20
 What:		/sys/class/leds/<led>/multi_max_intensity
-Date:		March 2026
-KernelVersion:	7.1
+Date:		May 2026
+KernelVersion:	7.2
 Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:	read
 		This file contains an array of integers describing the maximum
=2D-=20
2.39.5


